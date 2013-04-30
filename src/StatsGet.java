import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class StatsGet
 */
@WebServlet("/StatsGet")
public class StatsGet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/*
	 * JDBC
	 */
	private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
	private static final String DB_CONNECTION = "jdbc:mysql://localhost:3306/mapgraph";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "abc123";
	// private static final String DB_CONNECTION =
	// "jdbc:mysql://sql2.freesqldatabase.com:3306/sql24921";
	// private static final String DB_USER = "sql24921";
	// private static final String DB_PASSWORD = "wR5!bE3*";
	// private static final String DB_CONNECTION =
	// "jdbc:mysql://10.10.131.17:3306/mapgraph";
	// private static final String DB_USER = "mapgraph";
	// private static final String DB_PASSWORD = "abc123";
	private static Connection dbConnection = null;

	// constants
	// private static final String DISTRICT_TABLE_ID_COL = "district_id";
	// private static final String DISTRICT_TABLE_LAT_COL = "latitude";
	// private static final String DISTRICT_TABLE_LNG_COL = "longitude";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StatsGet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// int num1=Integer.parseInt(request.getParameter("num1"));
		// int num2=Integer.parseInt(request.getParameter("num2"));
		// PrintWriter pwriter= new PrintWriter(response.getOutputStream());
		// System.out.println(num1);
		// System.out.println(num2);
		// pwriter.println(num1+num2);
		// pwriter.flush();
		// try {
		// pwriter.println(queryName(request.getParameter("num1"),request.getParameter("num2")));
		// pwriter.flush();
		// } catch (SQLException e) {
		//
		// System.out.println(e.getMessage());
		//
		// }

		try {
			System.out.println("StatsGet");
			dbConnection = getDBConnection();
			PrintWriter pwriter = new PrintWriter(response.getOutputStream());
			JSONObject obj = new JSONObject();
			JSONArray jsonArray = new JSONArray();
			// query field name
			ArrayList<FieldName> fieldName = queryFieldName();
			for (int i = 0; i < fieldName.size(); i++) {
				jsonArray.add(fieldName.get(i));
			}

			obj.put("fieldNames", jsonArray);

			// Query survey count by district
			jsonArray = new JSONArray();
			ArrayList<DistrictStatsItem> countDistrict = queryDistrict();
			for (int i = 0; i < countDistrict.size(); i++) {
				jsonArray.add(countDistrict.get(i));
			}
			obj.put("districtStats", jsonArray);
			// Query survey count by street
			jsonArray = new JSONArray();
			ArrayList<StreetStatsItem> countStreet = queryStreet();
			for (int i = 0; i < countStreet.size(); i++) {
				jsonArray.add(countStreet.get(i));
			}
			obj.put("streetStats", jsonArray);
			// Query datatype stats
			jsonArray = new JSONArray();
			ArrayList<DistrictStatsItem> resultDataTypeStats = queryDataTypeStats();
			for (int i = 0; i < resultDataTypeStats.size(); i++) {
				jsonArray.add(resultDataTypeStats.get(i));
			}
			obj.put("dataTypeStats", jsonArray);
			pwriter.println(obj);
			pwriter.flush();
			dbConnection.close();
			System.out.println("dbConnection close");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

	}

	private static ArrayList<DistrictStatsItem> queryDataTypeStats()
			throws SQLException {
		ArrayList<DistrictStatsItem> results = new ArrayList<DistrictStatsItem>();
		PreparedStatement preparedStatement = null;
		String selectDatatypeStats = "SELECT answer.district_living_id,district.latitude,"
				+ "district.longitude,answer_datatype_time.datatype_id,"
				+ "answer_datatype_time.time_id,count(*) as total_survey "
				+ "FROM answer_datatype_time JOIN answer "
				+ "ON answer.answer_id=answer_datatype_time.answer_id JOIN district "
				+ "ON answer.district_living_id=district.district_id "
				+ "WHERE district.latitude IS NOT NULL "
				+ "GROUP BY answer.district_living_id,answer_datatype_time.datatype_id,"
				+ "answer_datatype_time.time_id;";
		try {
			dbConnection = getDBConnection();
			System.out.println("query datatype stats");
			preparedStatement = dbConnection
					.prepareStatement(selectDatatypeStats);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				results.add(new DistrictStatsItem("datatype_stats", rs
						.getInt("district_living_id"), rs
						.getInt("total_survey"), rs.getInt("datatype_id"), rs
						.getInt("time_id"), rs.getString("latitude"), rs
						.getString("longitude")));
			}
			System.out.println("\nqueryDataTypeStats done");
			return results;

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (preparedStatement != null) {
				preparedStatement.close();
			}
		}
		return results;
	}

	private static ArrayList<FieldName> queryFieldName() throws SQLException {
		ArrayList<FieldName> results = new ArrayList<FieldName>();
		PreparedStatement preparedStatement = null;
		String selectDistrict = "SELECT * FROM district WHERE latitude IS NOT NULL";
		String selectCategory = "SELECT * FROM category";
		String selectDatatype = "SELECT * FROM datatype";
		String selectTime = "SELECT * FROM time";
		try {
			dbConnection = getDBConnection();
			System.out.println("query District Name");
			// selectDistrict SQL stetement
			preparedStatement = dbConnection.prepareStatement(selectDistrict);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				FieldName mFieldName = new FieldName(FieldName.DISTRICT_TYPE,
						rs.getString("district_id"), rs.getString("name"));
				results.add(mFieldName);
			}
			System.out.println("query Category Name");
			// selectCategory SQL statement
			preparedStatement = dbConnection.prepareStatement(selectCategory);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				FieldName mFieldName = new FieldName(FieldName.CATEGORY_TYPE,
						rs.getString("category_id"), rs.getString("name"));
				results.add(mFieldName);
			}
			System.out.println("query datatye Name");
			// selectDatatype SQL statement
			preparedStatement = dbConnection.prepareStatement(selectDatatype);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				FieldName mFieldName = new FieldName(FieldName.DATA_TYPE,
						rs.getString("datatype_id"), rs.getString("name"));
				results.add(mFieldName);
			}
			// selectTime SQL statement
			preparedStatement = dbConnection.prepareStatement(selectTime);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				FieldName mFieldName = new FieldName(FieldName.TIME_TYPE,
						rs.getString("time_id"), rs.getString("from") + "-"
								+ rs.getString("to") + "h");
				results.add(mFieldName);
			}
		} catch (SQLException e) {

			System.out.println(e.getMessage());

		} finally {

			if (preparedStatement != null) {
				preparedStatement.close();
			}
		}
		return results;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

	private static ArrayList<DistrictStatsItem> queryDistrict()
			throws SQLException {
		ArrayList<DistrictStatsItem> countResult = new ArrayList<DistrictStatsItem>();
		PreparedStatement countDistrictStatement = null;

		String countDistrictSQL = "SELECT district_living_id,latitude,longitude,COUNT(district_living_id)  AS total_survey "
				+ "FROM answer  JOIN district ON district.district_id=answer.district_living_id GROUP BY district_living_id ;";

		try {
			System.out.println("queryDistrict querying...");
			countDistrictStatement = dbConnection
					.prepareStatement(countDistrictSQL);
			ResultSet rs = countDistrictStatement.executeQuery();
			while (rs.next()) {
				System.out.print(rs.getInt("district_living_id") + ":"
						+ rs.getInt("total_survey") + " ");
				countResult.add(new DistrictStatsItem("district_total_survey",
						rs.getInt("district_living_id"), rs
								.getInt("total_survey"), rs
								.getString("latitude"), rs
								.getString("longitude")));
			}
			System.out.println("\nqueryDistrict done");
			return countResult;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (countDistrictStatement != null) {
				countDistrictStatement.close();
			}
		}
		return countResult;
	}

	// Query Database to get Street Statistic
	private static ArrayList<StreetStatsItem> queryStreet() throws SQLException {
		ArrayList<StreetStatsItem> countResult = new ArrayList<StreetStatsItem>();
		PreparedStatement countStreetStatement = null;
		PreparedStatement countDatatypeStreetStatement = null;

		String countStreetSQL = "SELECT street_id,district_id,formatted_address,"
				+ "latitude,longitude,COUNT(street_id)  AS total_survey "
				+ "FROM answer  JOIN street ON street.street_id=answer.street_living_id "
				+ "WHERE latitude IS NOT NULL GROUP BY street_id ;";

		String countDatatypeStreetSQL = "SELECT street_living_id,age_id,gender," +
				"district_living_id,job_id,datatype_id,time_id,COUNT(*) AS count " +
				"FROM answer JOIN answer_datatype_time ON " +
				"answer.answer_id=answer_datatype_time.answer_id " +
				"WHERE answer.street_living_id IS NOT NULL " +
				"GROUP BY street_living_id,datatype_id,time_id;";

		try {
			System.out.println("queryStreet querying...");
			countStreetStatement = dbConnection
					.prepareStatement(countStreetSQL);
			countDatatypeStreetStatement = dbConnection
					.prepareStatement(countDatatypeStreetSQL);
			// read from db (datatype_time not read)
			ResultSet rs = countStreetStatement.executeQuery();
			while (rs.next()) {
				System.out.print("\nstreet_id" + ":" + rs.getInt("street_id")
						+ " total_survey" + ":" + rs.getInt("total_survey")
						+ " ");
				countResult.add(new StreetStatsItem(rs.getInt("street_id"), rs
						.getInt("district_id"), rs
						.getString("formatted_address"), rs
						.getString("latitude"), rs.getString("longitude"), rs
						.getInt("total_survey")));
			}

			// read datatype_time
			rs = countDatatypeStreetStatement.executeQuery();
			while (rs.next()) {
				System.out.print("\nstreet_id" + ":" + rs.getInt("street_living_id")
						+ " datatype_id" + ":" + rs.getInt("datatype_id")
						+ " time_id" + ":" + rs.getInt("time_id") + " count"
						+ ":" + rs.getInt("count"));
				// loop through countResult to find item w/ that street_id
				for (int i = 0; i < countResult.size(); i++) {
					if (countResult.get(i).getStreet_id() == rs
							.getInt("street_living_id")) {
						System.out.print("street_id:"+rs.getInt("street_living_id")+" matched!");
						// if found, insert count data at corresponding position
						// in the Datatype_count Array
						countResult.get(i).insertDatatype_countAt(
								rs.getInt("datatype_id"), rs.getInt("time_id"),
								rs.getInt("count"));
					}
				}

			}

			System.out.println("\nqueryStreet done");
			return countResult;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (countStreetStatement != null) {
				countStreetStatement.close();
			}
		}
		return countResult;
	}

	// private static String queryName(String district_id, String cat_id)
	// throws SQLException {
	// PreparedStatement preparedStatement = null;
	// String result = "";
	// String selectDistrict = "SELECT * FROM DISTRICT WHERE DISTRICT_ID = ?";
	// String selectCategory = "SELECT * FROM CATEGORY WHERE CATEGORY_ID = ?";
	// try {
	// System.out.println("queryName getDBConnection");
	// // selectDistrict SQL stetement
	// preparedStatement = dbConnection.prepareStatement(selectDistrict);
	// preparedStatement.setInt(1, Integer.parseInt(district_id));
	// ResultSet rs = preparedStatement.executeQuery();
	// while (rs.next()) {
	// String id = rs.getString("DISTRICT_ID");
	// String name = rs.getString("NAME");
	// result = id + ":" + name + "\n";
	// }
	// System.out.println("queryName read all name");
	// // selectCategory SQL stetement
	// preparedStatement = dbConnection.prepareStatement(selectCategory);
	// preparedStatement.setInt(1, Integer.parseInt(cat_id));
	// rs = preparedStatement.executeQuery();
	// while (rs.next()) {
	// String id = rs.getString("CATEGORY_ID");
	// String name = rs.getString("NAME");
	// result += id + ":" + name;
	// }
	// } catch (SQLException e) {
	//
	// System.out.println(e.getMessage());
	//
	// } finally {
	//
	// if (preparedStatement != null) {
	// preparedStatement.close();
	// }
	// }
	// return result;
	// }

	private static Connection getDBConnection() {
		System.out.println("DB connecting...");
		Connection dbConnection = null;

		try {

			Class.forName(DB_DRIVER);
			dbConnection = DriverManager.getConnection(DB_CONNECTION, DB_USER,
					DB_PASSWORD);
			System.out.println("DB connected!");
			return dbConnection;

		} catch (ClassNotFoundException e) {

			System.out.println(e.getMessage());
		} catch (SQLException e) {

			System.out.println(e.getMessage());

		}
		System.out.println("DB connected!");
		return dbConnection;

	}

}
