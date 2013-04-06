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
 * Servlet implementation class FieldsGet
 */
@WebServlet("/FieldsGet")
public class FieldsGet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/*
	 * JDBC
	 */
	private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
	// private static final String DB_CONNECTION =
	// "jdbc:mysql://localhost:3306/limesurvey";
	// private static final String DB_USER = "root";
	// private static final String DB_PASSWORD = "abc123";
//	private static final String DB_CONNECTION = "jdbc:mysql://sql2.freesqldatabase.com:3306/sql24921";
//	private static final String DB_USER = "sql24921";
//	private static final String DB_PASSWORD = "wR5!bE3*";
	private static final String DB_CONNECTION = "jdbc:mysql://10.10.131.17:3306/mapgraph";
	private static final String DB_USER = "mapgraph";
	private static final String DB_PASSWORD = "abc123";
	private static Connection dbConnection = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FieldsGet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("FieldsGet");
			PrintWriter pwriter = new PrintWriter(response.getOutputStream());
			ArrayList<FieldName> fieldName = queryFieldName();
			JSONObject obj = new JSONObject();
			JSONArray jsonArray = new JSONArray();
			for (int i = 0; i < fieldName.size(); i++) {
				jsonArray.add(fieldName.get(i));
			}

			obj.put("fieldNames", jsonArray);
			pwriter.println(obj);
			pwriter.flush();
			dbConnection.close();
			System.out.println("Resposne: "+obj.toJSONString());
			System.out.println("dbConnection close");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private static ArrayList<FieldName> queryFieldName() throws SQLException {
		ArrayList<FieldName> results = new ArrayList<FieldName>();
		PreparedStatement preparedStatement = null;
		String selectDistrict = "SELECT * FROM district WHERE latitude IS NOT NULL";
		String selectCategory = "SELECT * FROM category";
		try {
			dbConnection = getDBConnection();
			System.out.println("query District Name");
			// selectDistrict SQL stetement
			preparedStatement = dbConnection.prepareStatement(selectDistrict);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				FieldName mFieldName = new FieldName(FieldName.DISTRICT_TYPE, rs.getString("district_id"), rs.getString("name"));
				results.add(mFieldName);
			}
			System.out.println("query Category Name");
			// selectCategory SQL statement
			preparedStatement = dbConnection.prepareStatement(selectCategory);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				FieldName mFieldName = new FieldName(FieldName.CATEGORY_TYPE, rs.getString("category_id"),  rs.getString("name"));
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
		// TODO Auto-generated method stub
	}

	private static Connection getDBConnection() {
		Connection dbConnection = null;
		System.out.println("Connecting to DB...");
		try {

			Class.forName(DB_DRIVER);
			dbConnection = DriverManager.getConnection(DB_CONNECTION, DB_USER,
					DB_PASSWORD);
			System.out.println("Connected!");
			return dbConnection;

		} catch (ClassNotFoundException e) {

			System.out.println(e.getMessage());
		} catch (SQLException e) {

			System.out.println(e.getMessage());

		}
		System.out.println("Connected!");
		return dbConnection;

	}
}
