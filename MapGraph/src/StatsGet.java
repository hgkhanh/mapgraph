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
import org.json.simple.JSONAware;
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
	// private static final String DB_CONNECTION =
	// "jdbc:mysql://localhost:3306/limesurvey";
	// private static final String DB_USER = "root";
	// private static final String DB_PASSWORD = "abc123";
	private static final String DB_CONNECTION = "jdbc:mysql://sql2.freesqldatabase.com:3306/sql24921";
	private static final String DB_USER = "sql24921";
	private static final String DB_PASSWORD = "wR5!bE3*";
	private static Connection dbConnection = null;
	// constants
	private static final String DISTRICT_TABLE_ID_COL = "district_id";
	private static final String DISTRICT_TABLE_LAT_COL = "latitude";
	private static final String DISTRICT_TABLE_LNG_COL = "longitude";

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
			System.out.println("doGet");
			PrintWriter pwriter = new PrintWriter(response.getOutputStream());
			System.out.println("queryDistrict");
			ArrayList<DistrictStatsItem> countDistrict = queryDistrict();
			JSONObject obj = new JSONObject();
			JSONArray jsonArray = new JSONArray();
			/*
			 * // query District info System.out.println("query Dist info");
			 * PreparedStatement getDtrInfoStatement = null; String
			 * getDtrInfoSQL = "SELECT * FROM district"; getDtrInfoStatement =
			 * dbConnection.prepareStatement(getDtrInfoSQL); ResultSet rs =
			 * getDtrInfoStatement.executeQuery(); //
			 * getDtrInfoStatement.setInt(1, i + 1); while (rs.next()) {
			 * System.out.println(rs.getInt(DISTRICT_TABLE_ID_COL)); for (int i
			 * = 0; i < countDistrict.size(); i++) {
			 * if(rs.getInt(DISTRICT_TABLE_ID_COL
			 * )==countDistrict.get(i).getDistrict_id()){
			 * countDistrict.get(i).setLat(
			 * rs.getString(DISTRICT_TABLE_LAT_COL));
			 * countDistrict.get(i).setLng(
			 * rs.getString(DISTRICT_TABLE_LNG_COL)); // attach info with count
			 * 
			 * } } } System.out.println("query Dist info done");
			 */
			for (int i = 0; i < countDistrict.size(); i++) {
				jsonArray.add(countDistrict.get(i));
			}

			obj.put("districtStats", jsonArray);
			pwriter.println(obj);
			pwriter.flush();
			dbConnection.close();
			System.out.println("dbConnection close");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	private static ArrayList<DistrictStatsItem> queryDistrict()
			throws SQLException {
		ArrayList<DistrictStatsItem> countResult = new ArrayList<DistrictStatsItem>();
		PreparedStatement countDistrictStatement = null;

		String countDistrictSQL = "SELECT 863796X1X6,latitude,longitude,COUNT(863796X1X6)  AS total_survey FROM lime_survey_863796  JOIN district ON district.district_id=lime_survey_863796.863796X1X6 GROUP BY 863796X1X6 ;";

		try {
			System.out.println("queryDistrict DB connecting...");
			dbConnection = getDBConnection();
			System.out.println("queryDistrict querying...");
			countDistrictStatement = dbConnection
					.prepareStatement(countDistrictSQL);
			ResultSet rs = countDistrictStatement.executeQuery();
			while (rs.next()) {
				System.out.print(rs.getInt("863796X1X6") + ":"
						+ rs.getInt("total_survey") + " ");
				countResult.add(new DistrictStatsItem(rs.getInt("863796X1X6"),
						rs.getInt("total_survey"), rs.getString("latitude"), rs
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

	private static String queryName(String district_id, String cat_id)
			throws SQLException {
		PreparedStatement preparedStatement = null;
		String result = "";
		String selectDistrict = "SELECT * FROM DISTRICT WHERE DISTRICT_ID = ?";
		String selectCategory = "SELECT * FROM CATEGORY WHERE CATEGORY_ID = ?";
		try {
			dbConnection = getDBConnection();
			System.out.println("queryName getDBConnection");
			// selectDistrict SQL stetement
			preparedStatement = dbConnection.prepareStatement(selectDistrict);
			preparedStatement.setInt(1, Integer.parseInt(district_id));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				String id = rs.getString("DISTRICT_ID");
				String name = rs.getString("NAME");
				result = id + ":" + name + "\n";
			}
			System.out.println("queryName read all name");
			// selectCategory SQL stetement
			preparedStatement = dbConnection.prepareStatement(selectCategory);
			preparedStatement.setInt(1, Integer.parseInt(cat_id));
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				String id = rs.getString("CATEGORY_ID");
				String name = rs.getString("NAME");
				result += id + ":" + name;
			}
		} catch (SQLException e) {

			System.out.println(e.getMessage());

		} finally {

			if (preparedStatement != null) {
				preparedStatement.close();
			}
		}
		return result;
	}

	private static Connection getDBConnection() {
		Connection dbConnection = null;

		try {

			Class.forName(DB_DRIVER);
			dbConnection = DriverManager.getConnection(DB_CONNECTION, DB_USER,
					DB_PASSWORD);
			return dbConnection;

		} catch (ClassNotFoundException e) {

			System.out.println(e.getMessage());
		} catch (SQLException e) {

			System.out.println(e.getMessage());

		}

		return dbConnection;

	}

}
