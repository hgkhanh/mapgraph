import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.util.ArrayList;
import java.util.Scanner;

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
	private static final boolean accents_flag = true;
	/*
	 * JDBC
	 */
	private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
	private File file;
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
	}

	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.file = new File(this.getServletContext().getRealPath("/")
				+ File.separator + "db.conf");
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
			dbConnection = getDBConnection(file);
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
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
			String jsonArrayResponse = new String(
					obj.toJSONString().getBytes(), "UTF-8");
			pwriter.println(jsonArrayResponse);
			pwriter.flush();
			dbConnection.close();
			System.out.println(jsonArrayResponse);
			System.out.println("dbConnection close");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

	}

	private ArrayList<DistrictStatsItem> queryDataTypeStats()
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

	private ArrayList<FieldName> queryFieldName() throws SQLException {
		ArrayList<FieldName> results = new ArrayList<FieldName>();
		PreparedStatement preparedStatement = null;
		String selectDistrict = "SELECT * FROM district WHERE latitude IS NOT NULL";
		String selectCategory = "SELECT * FROM category";
		String selectDatatype = "SELECT * FROM datatype";
		String selectTime = "SELECT * FROM time";
		try {
			System.out.println("query District Name");
			// selectDistrict SQL stetement
			preparedStatement = dbConnection.prepareStatement(selectDistrict);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				FieldName mFieldName = null;
				if (accents_flag) {
					mFieldName = new FieldName(FieldName.DISTRICT_TYPE,
							rs.getString("district_id"), removeAccents(rs.getString("name")));
				} else {
					mFieldName = new FieldName(FieldName.DISTRICT_TYPE,
							rs.getString("district_id"), rs.getString("name"));
				}
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
				FieldName mFieldName = null;
				if (accents_flag) {
					mFieldName = new FieldName(FieldName.DATA_TYPE,
							rs.getString("datatype_id"),
							removeAccents(rs.getString("name")));
				} else {
					mFieldName = new FieldName(FieldName.DATA_TYPE,
							rs.getString("datatype_id"), rs.getString("name"));
				}
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

		String countStreetSQL = "SELECT street_id,district_id,formatted_address,street.name,"
				+ "latitude,longitude,COUNT(street_id)  AS total_survey "
				+ "FROM answer  JOIN street ON street.street_id=answer.street_living_id "
				+ "WHERE latitude IS NOT NULL GROUP BY street_id ;";

		String countDatatypeStreetSQL = "SELECT street_living_id,age_id,gender,"
				+ "district_living_id,job_id,datatype_id,time_id,COUNT(*) AS count "
				+ "FROM answer JOIN answer_datatype_time ON "
				+ "answer.answer_id=answer_datatype_time.answer_id "
				+ "WHERE answer.street_living_id IS NOT NULL "
				+ "GROUP BY street_living_id,datatype_id,time_id;";

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

				if (accents_flag) {
					countResult.add(new StreetStatsItem(rs.getInt("street_id"),
							rs.getInt("district_id"), removeAccents(rs
									.getString("formatted_address")),
							removeAccents(rs.getString("name")), rs
									.getString("latitude"), rs
									.getString("longitude"), rs
									.getInt("total_survey")));
				} else {
					countResult.add(new StreetStatsItem(rs.getInt("street_id"),
							rs.getInt("district_id"), rs
									.getString("formatted_address"), rs
									.getString("name"), rs
									.getString("latitude"), rs
									.getString("longitude"), rs
									.getInt("total_survey")));
				}
			}

			// read datatype_time
			rs = countDatatypeStreetStatement.executeQuery();
			while (rs.next()) {
				/*
				 * System.out.print("\nstreet_id" + ":" +
				 * rs.getInt("street_living_id") + " datatype_id" + ":" +
				 * rs.getInt("datatype_id") + " time_id" + ":" +
				 * rs.getInt("time_id") + " count" + ":" + rs.getInt("count"));
				 */
				// loop through countResult to find item w/ that street_id
				for (int i = 0; i < countResult.size(); i++) {
					if (countResult.get(i).getStreet_id() == rs
							.getInt("street_living_id")) {
						// System.out.print("street_id:"+rs.getInt("street_living_id")+" matched!");
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

	public static String removeAccents(String text) {
		System.out.println(text);	
		String output = text.replace('đ', 'd');
		output = text.replace('Đ', 'D');
		return Normalizer.normalize(output, Form.NFD).replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
		
	}

	private static Connection getDBConnection(File file) {
		System.out.println("DB connecting...");
		Connection dbConnection = null;

		try {

			Class.forName(DB_DRIVER);
			Scanner scanner = new Scanner(file);
			dbConnection = DriverManager.getConnection(scanner.nextLine(),
					scanner.nextLine(), scanner.nextLine());
			System.out.println("DB connected!");
			scanner.close();
			return dbConnection;

		} catch (ClassNotFoundException e) {

			System.out.println(e.getMessage());
		} catch (SQLException e) {

			System.out.println(e.getMessage());

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("DB connected!");
		return dbConnection;

	}

}
