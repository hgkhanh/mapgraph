package vnu.mapgraph.data;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class ProcessSurveyDB {
	private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
	private static final String DB_CONNECTION = "jdbc:mysql://localhost:3306/mapgraph?useUnicode=true&characterEncoding=UTF-8";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "";
	private static Connection surveyDbConnection = null;

	public static final String SURVEY_TABLE_NAME = "lime_survey_863796";
	public static final String QUESTION_TABLE_NAME = "lime_questions";
	public static final String STREET_Q_STRING = "%Bạn đang sống ở đường, phố nào%";
	public static final String DISTRICT_Q_STRING = "%Bạn đang sống ở quận nào%";
	public static final String JOB_Q_STRING = "%Nghề nghiệp của bạn%";
	public static final String AGE_Q_STRING = "%Bạn bao nhiêu tuổi%";
	public static final String GENDER_Q_STRING = "%Giới tính của bạn%";
	public static final String CATEG_Q_STRING = "%Bạn thường xem thể loại tin tức gì%";
	public static final String DEPEND_Q_STRING = "%Công việc của bạn có phụ thuộc hoàn toàn vào mạng không%";
	public static final String ALWS_ONL_Q_STRING = "%Bạn có hay truy cập mạng mọi nơi không%";
	public static final String DEVICES_Q_STRING = "%Bạn sử dụng thiết bị gì để truy cập mạng%";

	public static final String DATATYPE_Q_STRING = "%Bạn hay vào mạng vào giờ nào và thường xem loại thông tin gì%";
	public static final String DATATYPE_SQ1_STRING = "%Văn bản%";
	public static final String DATATYPE_SQ2_STRING = "%Hình ảnh%";
	public static final String DATATYPE_SQ3_STRING = "%Audio%";
	public static final String DATATYPE_SQ4_STRING = "%Video%";
	public static final int DATATYPE_COL_RANGE = 11;
	public static final int DATATYPE_ROW_RANGE = 4;

	public static void main(String[] args) {
		System.out.println("Connect Db");
		surveyDbConnection = getDbConnection();
		System.out.println("querying Survey Db...");
		ArrayList<Answer> answer_set = querySurveyDb();
		System.out.println("Populating MapGraph Db...");
		populateMapGraphDb(answer_set);
		System.out.println("Done!");
	}

	private static void populateMapGraphDb(ArrayList<Answer> answer_set) {
		System.out.println("inserting Street Table ...");
		insertStreetTable(answer_set);
		System.out.println("inserting Answer Table ...");
		insertAnswerTable(answer_set);
		insertRelationTable(answer_set);
	}

	private static ArrayList<Answer> querySurveyDb() {
		ArrayList<Answer> answer_set = new ArrayList<Answer>();
		PreparedStatement surveyQueryStatement = null;

		String surveyQuerySQL = "SELECT * FROM " + SURVEY_TABLE_NAME
				+ " WHERE submitdate IS NOT NULL";
		try {

			surveyQueryStatement = surveyDbConnection
					.prepareStatement(surveyQuerySQL);

			// read from survey DB
			ResultSet results = surveyQueryStatement.executeQuery();
			// query Question code
			String STREET_COL_NAME = queryQuestionCode(STREET_Q_STRING);
			String DISTRICT_COL_NAME = queryQuestionCode(DISTRICT_Q_STRING);
			String JOB_COL_NAME = queryQuestionCode(JOB_Q_STRING);
			String AGE_COL_NAME = queryQuestionCode(AGE_Q_STRING);
			String GENDER_COL_NAME = queryQuestionCode(GENDER_Q_STRING);
			String DEPEND_COL_NAME = queryQuestionCode(DEPEND_Q_STRING);
			String ALWS_ONL_COL_NAME = queryQuestionCode(ALWS_ONL_Q_STRING);
			ArrayList<String> DEVICES_COL_NAMES = queryMultiChoiceQuestionCode(DEVICES_Q_STRING);
			ArrayList<String> CATEG_COL_NAMES = queryMultiChoiceQuestionCode(CATEG_Q_STRING);
			String DATATYPE_COL_NAMES[][] = queryDataTypeQuestionCode();
			// read results
			while (results.next()) {
				String answer_id = results.getString("id");
				// Street
				String street = results.getString(STREET_COL_NAME);
				// district

				String district_id = results.getString(DISTRICT_COL_NAME);
				// job
				String job_id = results.getString(JOB_COL_NAME);
				if (job_id != null && job_id.equals("-oth-")) {
					job_id = null;
				}
				// age
				String age_id = results.getString(AGE_COL_NAME);
				// gender
				String gender = results.getString(GENDER_COL_NAME);
				// dependency
				String dependency_id = results.getString(DEPEND_COL_NAME);
				// always online
				String always_online = results.getString(ALWS_ONL_COL_NAME);
				// devices using
				ArrayList<String> devices = new ArrayList<String>();

				for (int i = 0; i < DEVICES_COL_NAMES.size(); i++) {
					devices.add(results.getString(DEVICES_COL_NAMES.get(i)));
				}
				// category
				ArrayList<String> categories = new ArrayList<String>();

				for (int i = 0; i < CATEG_COL_NAMES.size(); i++) {
					categories.add(results.getString(CATEG_COL_NAMES.get(i)));
				}

				// datatype
				String datatype[][] = new String[DATATYPE_ROW_RANGE][DATATYPE_COL_RANGE];

				for (int i = 0; i < DATATYPE_ROW_RANGE; i++) {
					for (int j = 0; j < DATATYPE_COL_RANGE; j++) {
						datatype[i][j] = results
								.getString(DATATYPE_COL_NAMES[i][j]);
					}
				}
				// log read result
				Answer mAnswer = new Answer(answer_id, age_id, gender, job_id,
						street, district_id, always_online, dependency_id,
						devices, categories, datatype);
				System.out.println("===mAnswer.toString()===\n"
						+ mAnswer.toString());
				answer_set.add(mAnswer);
				// System.out.println("district_id: " + district_id
				// + "\njob_id: " + job_id + "\nage_id: " + age_id
				// + "\ngender: " + gender + "\ndependency_id: "+ dependency_id
				// + "\nAlways online: "+always_online
				// + "\ndevices: " + devices.toString()
				// + "\ncategory: " + categories.toString());
			}
			// insert result into 'answer' table

			return answer_set;
			// System.out.println(count+"");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return answer_set;
	}

	// loop through all answer_set , read answer.street_string ,
	// check if that street is in 'street' table,
	// if yes : use this street_id ( answert.street_id = this.street_id
	// else : Google that street_string, insert new record to 'street' table ,
	// assign that id to answer.street_id
	private static void insertStreetTable(ArrayList<Answer> answer_set) {

		/*
		 * Loop through answer_set , for each street_name of an answer Item
		 * check if there is a record in 'street' table with the same 'name' ->
		 * yes : assign that record ID to the answer item. -> no : 'google' that
		 * name if result = null : create a record with street name , without
		 * lat,lng & ggPlaceID else : check again if there is a record in
		 * 'street' table with the same 'ggPlaceID' ( because
		 * "select 'name' LIKe" query sometimes miss ) -> yes : assign that
		 * record ID to the answer item. -> no : create a record with
		 * street_name, lat,lng,ggPlaceID as given by Google.
		 */

		PreparedStatement insertTableNameOnlyStatement = null;
		PreparedStatement insertTableStatement = null;
		PreparedStatement deleteRecordStatement = null;
		PreparedStatement checkNameStatement = null;
		PreparedStatement checkNameOnlyStatement = null;
		PreparedStatement checkIDStatement = null;
		String insertTableSQL = "INSERT street ( name, latitude, longitude,formatted_address) VALUES"
				+ "(?,?,?,?) ON DUPLICATE KEY UPDATE name=? ,latitude=?, longitude=?,formatted_address=?";
		String insertTableNameOnlySQL = "INSERT STREET ( name) VALUES" + "(?) ";
		String checkNameSQL = "SELECT * FROM STREET WHERE name LIKE ? AND formatted_address IS NOT NULL";
		String checkNameOnlySQL = "SELECT * FROM STREET WHERE name LIKE ?";
		String checkIDSQL = "SELECT * FROM STREET WHERE formatted_address = ?";
		try {

			insertTableStatement = surveyDbConnection.prepareStatement(
					insertTableSQL, PreparedStatement.RETURN_GENERATED_KEYS);
			insertTableNameOnlyStatement = surveyDbConnection.prepareStatement(
					insertTableNameOnlySQL,
					PreparedStatement.RETURN_GENERATED_KEYS);
			deleteRecordStatement = surveyDbConnection
					.prepareStatement(insertTableNameOnlySQL);
			checkNameStatement = surveyDbConnection
					.prepareStatement(checkNameSQL);
			checkNameOnlyStatement = surveyDbConnection
					.prepareStatement(checkNameOnlySQL);
			checkIDStatement = surveyDbConnection.prepareStatement(checkIDSQL);
			// for each answer
			for (int i = 0; i < answer_set.size(); i++) {
				System.out.println("=========");
				// if street field not null,
				// check if street_string are already in 'street' table
				if ((answer_set.get(i).getStreet_id() != null)
						&& (answer_set.get(i).getStreet_id() != "")) {
					System.out.println("answer_id:"
							+ answer_set.get(i).getAnswer_id());
					System.out.println("street:"
							+ answer_set.get(i).getStreet_id());
					// check existed by street name
					checkNameStatement.setString(
							1,
							"%"
									+ answer_set.get(i).getStreet_id()
											.replace("\\s", "%") + "%");
					System.out
							.println(" check if street_string are already in 'street' table:"
									+ checkNameStatement.toString());

					ResultSet rs = checkNameStatement.executeQuery();
					if (!rs.next()) { // if no similar street found in table,
										// Google that one
						if (i % 8 == 4) {
							try {
								Thread.sleep(2000);
							} catch (InterruptedException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
						StreetItem mStreetItem = queryGgPlaceAPI(answer_set
								.get(i).getStreet_id());

						if (mStreetItem != null) {// if google result not null
							// check existed again by street ggPlace ID
							checkIDStatement.setString(1, mStreetItem.getId());
							System.out
									.println("Search by string not found, now search by ID!"
											+ checkIDStatement.toString());
							rs = checkIDStatement.executeQuery();
							if (!rs.next()) {// if not street not existed in
												// table
								// check if a name-only-record already exist
								System.out.println("cannot Google street:"
										+ answer_set.get(i).getStreet_id());
								checkNameOnlyStatement.setString(1, "%"
										+ answer_set.get(i).getStreet_id()
												.replace("\\s", "*") + "%");
								ResultSet tmp_rs = checkNameOnlyStatement
										.executeQuery();
								if (tmp_rs.next()) {
									// if yes ( a name-only record existed)
									// delete that one.
									// insert new record
									deleteRecordStatement.setString(1,
											tmp_rs.getString("street_id"));
								}
							
								// insert
								insertTableStatement.setString(1,
										answer_set.get(i).getStreet_id());
								insertTableStatement.setString(2,
										mStreetItem.getLat());
								insertTableStatement.setString(3,
										mStreetItem.getLng());
								insertTableStatement.setString(4,
										mStreetItem.getId());
								// on duplicate
								insertTableStatement.setString(5,
										answer_set.get(i).getStreet_id());
								insertTableStatement.setString(6,
										mStreetItem.getLat());
								insertTableStatement.setString(7,
										mStreetItem.getLng());
								insertTableStatement.setString(8,
										mStreetItem.getId());
								// execute insert SQL statement
								System.out
								.println("not existed in table! Now inserting..."
										+ insertTableStatement.toString());
								insertTableStatement.executeUpdate();
								// get id of that new record
								System.out.println("get Generated key");
								ResultSet tmp = insertTableStatement
										.getGeneratedKeys();
								System.out.println("tmp.next");
								tmp.next();
								System.out.println("auto_id = tmp.getString");
								String auto_id = tmp.getString(1);
								System.out.println("Street record created, id:"
										+ tmp.getString(1));
								// change answer.street_id to that new
								// record's
								// id
								answer_set.get(i).setStreet_id(auto_id);
							
							} else { // street found in table, by ggplace id
										// search
								System.out.println("Street record existed, id:"
										+ rs.getString("street_id"));
								answer_set.get(i).setStreet_id(
										rs.getString("street_id"));
							}
						} else { // Google Place API return no results, insert
									// street with name only
							// check if a name-only record already exist
							System.out.println("cannot Google street:"
									+ answer_set.get(i).getStreet_id());

							checkNameOnlyStatement.setString(1,
									"%"
											+ answer_set.get(i).getStreet_id()
													.replace("\\s", "*") + "%");
							System.out.println("check for Name-Only record:"
									+ checkNameOnlyStatement.toString());
							ResultSet tmp_rs = checkNameOnlyStatement
									.executeQuery();
							if (!tmp_rs.next()) {
								System.out.println("no record :"
										+ answer_set.get(i).getStreet_id()
										+ ".Now insert a Name only record!");
								// insert record with only 'name'
								insertTableNameOnlyStatement.setString(1,
										answer_set.get(i).getStreet_id());
								// execute insert
								insertTableNameOnlyStatement.executeUpdate();
								// get id of that new record
								System.out.println("get Generated key");
								ResultSet tmp = insertTableNameOnlyStatement
										.getGeneratedKeys();
								System.out.println("tmp.next");
								tmp.next();
								System.out.println("auto_id = tmp.getString");
								String auto_id = tmp.getString(1);
								System.out.println("Street record created, id:"
										+ tmp.getString(1));
								// change answer.street_id to that new record's
								// id
								answer_set.get(i).setStreet_id(auto_id);

							}
							else{
								
								answer_set.get(i).setStreet_id(tmp_rs.getString("street_id"));
							}
						}
					} else { // street found in table (by search name)
						System.out.println("Street record existed, id:"
								+ rs.getString("street_id"));
						answer_set.get(i).setStreet_id(
								rs.getString("street_id"));
					}
				}
			}

		} catch (SQLException e) {

			System.out.println(e.getMessage());

		}
	}

	private static void insertRelationTable(ArrayList<Answer> answer_set) {
		PreparedStatement preparedStatement = null;

		try {
			// answer_device table;
			System.out.println("inserting ANSWER_DEVICE Table ...");
			String insertTableAns_Device = "INSERT IGNORE INTO ANSWER_DEVICE (answer_id, device_id) VALUES"
					+ "(?,?)";
			preparedStatement = surveyDbConnection
					.prepareStatement(insertTableAns_Device);
			for (int i = 0; i < answer_set.size(); i++) {
				for (int j = 0; j < answer_set.get(i).getDevices().size(); j++) {
					String temp_boolean = answer_set.get(i).getDevices().get(j);
					if (temp_boolean != null && temp_boolean.equals("Y")) {
						// System.out.println(i + ":" + j + ":"
						// + answer_set.get(i).getAnswer_id());
						preparedStatement.setString(1, answer_set.get(i)
								.getAnswer_id());
						preparedStatement.setInt(2, j + 1);
						preparedStatement.executeUpdate();
					}
				}
			}

			// answer_categ table;
			System.out.println("inserting ANSWER_CATEGORY Table ...");
			String insertTableAns_Categ = "INSERT IGNORE INTO ANSWER_CATEGORY (answer_id, category_id) VALUES"
					+ "(?,?)";
			preparedStatement = surveyDbConnection
					.prepareStatement(insertTableAns_Categ);
			for (int i = 0; i < answer_set.size(); i++) {
				for (int j = 0; j < answer_set.get(i).getCategories().size(); j++) {
					String temp_boolean = answer_set.get(i).getCategories()
							.get(j);
					if (temp_boolean != null && temp_boolean.equals("Y")) {
						preparedStatement.setString(1, answer_set.get(i)
								.getAnswer_id());
						preparedStatement.setInt(2, j + 1);
						// System.out.println(i + ":" + j + ":"
						// + answer_set.get(i).getAnswer_id());
						preparedStatement.executeUpdate();
					}
				}
			}

			// answer_categ table;
			System.out.println("inserting ANSWER_DATATYPE_TIME Table ...");
			String insertTableAns_Data = "INSERT IGNORE INTO ANSWER_DATATYPE_TIME (answer_id, datatype_id,time_id) VALUES"
					+ "(?,?,?)";
			preparedStatement = surveyDbConnection
					.prepareStatement(insertTableAns_Data);
			for (int index = 0; index < answer_set.size(); index++) {
				for (int i = 0; i < DATATYPE_ROW_RANGE; i++) {
					for (int j = 0; j < DATATYPE_COL_RANGE; j++) {
						String[][] mDataType = answer_set.get(index)
								.getDatatype();
						if (mDataType[i][j] != null
								&& mDataType[i][j].equals("1")) {
							preparedStatement.setString(1, answer_set
									.get(index).getAnswer_id());
							preparedStatement.setInt(2, i + 1);
							preparedStatement.setInt(3, j + 1);
							// System.out.println(i + ":" + j + ":"
							// + answer_set.get(i).getAnswer_id());
							preparedStatement.executeUpdate();
						}
					}
				}
			}
		} catch (SQLException e) {

			System.out.println(e.getMessage());

		}
	}

	private static void insertAnswerTable(ArrayList<Answer> answer_set) {
		PreparedStatement preparedStatement = null;
		String insertTableSQL = "INSERT INTO ANSWER (answer_id, age_id, gender, district_living_id,street_living_id"
				+ ",job_id,always_online,dependence_id) VALUES"
				+ "(?,?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE answer_id=?, age_id=?, gender=?, district_living_id=?,street_living_id=?"
				+ ",job_id=?,always_online=?,dependence_id=?";


		try {

			preparedStatement = surveyDbConnection
					.prepareStatement(insertTableSQL);
			for (int i = 0; i < answer_set.size(); i++) {
				// insert
				preparedStatement
						.setString(1, answer_set.get(i).getAnswer_id());
				preparedStatement.setString(2,
						(answer_set.get(i).getAge_id() == "") ? null
								: answer_set.get(i).getAge_id());
				preparedStatement.setString(3,
						(answer_set.get(i).getGender() == "") ? null
								: answer_set.get(i).getGender());
				preparedStatement.setString(4, (answer_set.get(i)
						.getDistrict_id() == "") ? null : answer_set.get(i)
						.getDistrict_id());
				preparedStatement.setString(5, (answer_set.get(i)
						.getStreet_id() == "") ? null : answer_set.get(i)
						.getStreet_id());

				preparedStatement.setString(6,
						(answer_set.get(i).getJob_id() == "") ? null
								: answer_set.get(i).getJob_id());
				preparedStatement.setString(7, (answer_set.get(i)
						.getAlways_online() == "") ? null : answer_set.get(i)
						.getAlways_online());
				preparedStatement.setString(8, (answer_set.get(i)
						.getDependency_id() == "") ? null : answer_set.get(i)
						.getDependency_id());
				// on duplicate
				preparedStatement
						.setString(9, answer_set.get(i).getAnswer_id());
				preparedStatement.setString(10,
						(answer_set.get(i).getAge_id() == "") ? null
								: answer_set.get(i).getAge_id());
				preparedStatement.setString(11,
						(answer_set.get(i).getGender() == "") ? null
								: answer_set.get(i).getGender());
				preparedStatement.setString(12, (answer_set.get(i)
						.getDistrict_id() == "") ? null : answer_set.get(i)
						.getDistrict_id());
				// street
				preparedStatement.setString(13, (answer_set.get(i)
						.getStreet_id() == "") ? null : answer_set.get(i)
						.getStreet_id());

				preparedStatement.setString(14,
						(answer_set.get(i).getJob_id() == "") ? null
								: answer_set.get(i).getJob_id());
				preparedStatement.setString(15, (answer_set.get(i)
						.getAlways_online() == "") ? null : answer_set.get(i)
						.getAlways_online());
				preparedStatement.setString(16, (answer_set.get(i)
						.getDependency_id() == "") ? null : answer_set.get(i)
						.getDependency_id());
				// execute insert SQL stetement
				preparedStatement.executeUpdate();

			}

		} catch (SQLException e) {

			System.out.println(e.getMessage());

		}
	}

	private static String queryQuestionCode(String questionString) {
		String question_code = "";

		PreparedStatement surveyQueryStatement = null;

		String surveyQuerySQL = "SELECT * FROM " + QUESTION_TABLE_NAME
				+ " WHERE question LIKE ?";
		try {
			surveyQueryStatement = surveyDbConnection
					.prepareStatement(surveyQuerySQL);
			// surveyQueryStatement.setString(1, QUESTION_TABLE_NAME);
			surveyQueryStatement.setString(1, questionString);
			// System.out.println(surveyQueryStatement.toString());
			// execute SQL
			ResultSet results = surveyQueryStatement.executeQuery();
			// read results
			if (results.next()) {
				question_code = results.getString("sid");
				question_code += "X" + results.getInt("gid");
				question_code += "X" + results.getInt("qid");
			}
			// System.out.println(questionString+":"+question_code);
			return question_code;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return question_code;
	}

	private static ArrayList<String> queryMultiChoiceQuestionCode(
			String questionString) {
		ArrayList<String> code_list = new ArrayList<String>();
		String question_code = "";
		PreparedStatement qcodeStatement = null;
		PreparedStatement countAnswerStatement = null;

		String surveyQuerySQL = "SELECT * FROM " + QUESTION_TABLE_NAME
				+ " WHERE question LIKE ?";
		String countAnswerSQL = "SELECT COUNT(*) FROM " + QUESTION_TABLE_NAME
				+ " WHERE gid=? AND parent_qid=?";
		try {
			qcodeStatement = surveyDbConnection
					.prepareStatement(surveyQuerySQL);
			// surveyQueryStatement.setString(1, QUESTION_TABLE_NAME);
			qcodeStatement.setString(1, questionString);
			// System.out.println(surveyQueryStatement.toString());
			// execute SQL
			ResultSet results = qcodeStatement.executeQuery();
			// read 1st results
			if (results.next()) {
				question_code = results.getString("sid");
				question_code += "X" + results.getString("gid");
				question_code += "X" + results.getString("qid");

				// count choices in answer
				countAnswerStatement = surveyDbConnection
						.prepareStatement(countAnswerSQL);
				countAnswerStatement.setString(1, results.getString("gid"));
				countAnswerStatement.setString(2, results.getString("qid"));
				ResultSet countResult = countAnswerStatement.executeQuery();
				countResult.next();
				int answer_count = countResult.getInt("COUNT(*)");
				for (int i = 1; i <= answer_count; i++) {
					code_list.add(question_code + i);
				}
			}
			// System.out.println(code_list.toString());
			return code_list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return code_list;
	}

	private static String[][] queryDataTypeQuestionCode() {
		String datatype_column_names[][] = new String[DATATYPE_ROW_RANGE][DATATYPE_COL_RANGE];
		String question_code = "";
		PreparedStatement qcodeStatement = null;

		String surveyQuerySQL = "SELECT * FROM " + QUESTION_TABLE_NAME
				+ " WHERE question LIKE ?";
		try {
			qcodeStatement = surveyDbConnection
					.prepareStatement(surveyQuerySQL);
			// surveyQueryStatement.setString(1, QUESTION_TABLE_NAME);
			qcodeStatement.setString(1, DATATYPE_Q_STRING);
			// System.out.println(surveyQueryStatement.toString());
			// execute SQL
			ResultSet results = qcodeStatement.executeQuery();
			// read 1st results
			if (results.next()) {
				question_code = results.getString("sid");
				question_code += "X" + results.getString("gid");
				question_code += "X" + results.getString("qid");

				for (int i = 0; i < DATATYPE_ROW_RANGE; i++) {
					for (int j = 0; j < DATATYPE_COL_RANGE; j++)
						datatype_column_names[i][j] = question_code + "SQ"
								+ String.format("%03d", i + 1) + "_SQ"
								+ String.format("%03d", j + 1);
				}
			}
			// System.out.println("datatype_column_names"
			// + Arrays.deepToString(datatype_column_names));
			return datatype_column_names;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return datatype_column_names;
	}

	// query google place API
	// input String: name of the street
	// output StreetItem: result from google place api
	private static StreetItem queryGgPlaceAPI(String searchString) {
		StreetItem mStreetItem = null;
		JSONParser parser = new JSONParser();
		String type="blank";
		// String ggPlaceUrlStr =
		// "https://maps.googleapis.com/maps/api/place/textsearch/json?query="
		// + searchString.replaceAll("\\s", "+")
		// +
		// "&types=route|sublocality&lang=vi&location=21.026,105.831&radius=5000&sensor=true"
		// + "&key=AIzaSyDwjSVZUk7D3LgeLPHMurDHm5Z-u39IeY0";
		String ggPlaceUrlStr = "http://maps.googleapis.com/maps/api/geocode/json?address="
				+ searchString.replaceAll("\\s", "+")
				+ "+,Hà+Nội+,Vietnam&sensor=true";
		try {
			URL ggPlaceUrl = new URL(ggPlaceUrlStr);
			BufferedReader bReader = new BufferedReader(new InputStreamReader(
					ggPlaceUrl.openStream()));
			String inputLine;
			String ggPlaceResultStr = "";
			while ((inputLine = bReader.readLine()) != null) {
				ggPlaceResultStr += inputLine + "\n";
			}
			bReader.close();
			// System.out.println(ggPlaceResultStr);
			Object obj = parser.parse(ggPlaceResultStr);

			JSONObject jsonObject = (JSONObject) obj;
			JSONArray resultSet = (JSONArray) jsonObject.get("results");
			if (resultSet.isEmpty()) {
				System.out.println(jsonObject.get("status"));
				return null;
			}

			for (int i = 0; i < resultSet.size(); i++) {
				JSONObject result = (JSONObject) resultSet.get(i);
				JSONArray types = (JSONArray)result.get("types");
				type= (String)types.get(0);
				if (type.equals("route")
						|| type.equals("sublocality")) {
					// name
					String name = (String) result.get("name");

					// id
					String id = (String) result.get("formatted_address");

					// lat & lng
					JSONObject tmp = (JSONObject) result.get("geometry");
					JSONObject coord = (JSONObject) tmp.get("location");
					String lat = (coord.get("lat")).toString();
					String lng = (coord.get("lng")).toString();
					// create StreetItem
					mStreetItem = new StreetItem(id, name, lat, lng);
					// // loop array
					// JSONArray msg = (JSONArray) jsonObject.get("messages");
					// Iterator<String> iterator = msg.iterator();
					// while (iterator.hasNext()) {
					// System.out.println(iterator.next());
					// }
					// System.out.println("-+-mStreetItem.toString()-+-\n"
					// + mStreetItem);
					return mStreetItem;
				}
			}
			System.out.println("ggPlaceUrlStr:" + ggPlaceUrlStr);
			System.out.println("type:" + type);
			return mStreetItem;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}

	private static Connection getDbConnection() {
		Connection dbConnection = null;
		try {
			Class.forName(DB_DRIVER);
			dbConnection = DriverManager.getConnection(DB_CONNECTION, DB_USER,
					DB_PASSWORD);
			return dbConnection;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dbConnection;
	}
}
