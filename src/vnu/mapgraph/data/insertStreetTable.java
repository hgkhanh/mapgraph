package vnu.mapgraph.data;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class insertStreetTable {
	private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
	private static final String DB_CONNECTION = "jdbc:mysql://localhost:3306/mapgraph?useUnicode=true&characterEncoding=UTF-8";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "abc123";
	private static final String STREET_TABLE_NAME = "street_test";

	public static void main(String[] args) {
		ArrayList<StreetItem> streetList = readStreetListJson();
		insertStreet(streetList);
	}

	private static ArrayList<StreetItem> readStreetListJson() {
		try {
			ArrayList<StreetItem> street_list = new ArrayList<>();
			JSONParser parser = new JSONParser();
			BufferedReader bReader = new BufferedReader(new FileReader(
					"D:\\Dropbox\\MapGraph\\street_list.json"));
			String inputLine;
			String street_json = "";
			while ((inputLine = bReader.readLine()) != null) {
				street_json += inputLine + "\n";
			}
			 System.out.println(street_json);

			// read json
			JSONObject obj = (JSONObject) parser.parse(street_json);
			JSONArray resultSet = (JSONArray) obj.get("street_list");
			System.out.println("resultSet.size():"+resultSet.size());

			for (int i =0; i < 1 ; i++) {
				JSONObject result = (JSONObject) resultSet.get(i);
				String district = (String) result.get("district");
				int district_id = 0;
				switch (district) {
				case "Ba Đình":
					district_id = 2;
					break;
				case "Hoàn Kiếm":
					district_id = 1;
					break;
				case "Đống Đa":
					district_id = 3;
					break;
				case "Cầu Giấy":
					district_id = 4;
					break;
				case "Tây Hồ":
					district_id = 7;
					break;
				case "Hai Bà Trưng":
					district_id = 6;
					break;
				case "Thanh Xuân":
					district_id = 5;
					break;
				case "Long Biên":
					district_id = 8;
					break;
				case "Hoàng Mai":
					district_id = 9;
					break;
				default:
					break;
				}
				JSONArray streetList = (JSONArray) result.get("streets");
				// for each street , google street Name
				for (int j = 0; j < 5; j++) {

					String streetName = (String) streetList.get(j);
					System.out.println("-+Street read from Json-+-\n"
							+ "district:" + district + "\ndistrict_id:"
							+ district_id + "\nstreetName:" + streetName);
					// StreetItem mStreetItem = queryGgGeocodingAPI(streetName,
					// district,district_id);
					StreetItem mStreetItem = queryGgGeocodingAPI(streetName,
							district, district_id);
					if (mStreetItem != null) { // street Name found
						mStreetItem.setDistrict_id(district_id + "");
						mStreetItem.toString();
						street_list.add(mStreetItem);
					}
/*
					// sleep
					try {
						System.out.println("Sleep 5s...");
						Thread.sleep(5000);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					if (j % 10 == 5) {
						// sleep
						try {
							System.out.println("Sleep 15s...");
							Thread.sleep(15000);
						} catch (InterruptedException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					*/
				}
				/*
				try {
					System.out.println("Sleep 60s...");
					Thread.sleep(60000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				*/
			}

			bReader.close();

			return street_list;
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	// Using Google Geocoding API to
	// search for the 1st match with given streetNam and districtName
	private static StreetItem queryGgGeocodingAPI(String searchString,
			String districtInput, int districtId) {
		StreetItem mStreetItem = null;
		JSONParser parser = new JSONParser();
		String ggPlaceUrlStr = "http://maps.googleapis.com/maps/api/geocode/json?address="
				+ searchString.replaceAll("\\s", "+")
				+ "+,"
				+ districtInput.replaceAll("\\s", "+")
				+ ",Hà+Nội+,Vietnam&sensor=true";
		System.out.println("ggPlaceUrlStr:" + ggPlaceUrlStr);
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
			// System.out.println("ggPlaceResultStr:\n"+ggPlaceResultStr);

			JSONObject jsonObject = (JSONObject) parser.parse(ggPlaceResultStr);
			JSONArray resultSet = (JSONArray) jsonObject.get("results");
			if (resultSet.isEmpty()) {
				System.out.println(jsonObject.get("status"));
				return null;
			}

			for (int i = 0; i < resultSet.size(); i++) {
				JSONObject result = (JSONObject) resultSet.get(i);

				// check for district of the result address
				/*
				 * JSONArray address_components = (JSONArray) result
				 * .get("address_components"); for (int j = 0; j <
				 * address_components.size(); j++) { JSONObject address =
				 * (JSONObject) address_components.get(j); JSONArray types =
				 * (JSONArray) address.get("types"); if (((String) types.get(0))
				 * .equals("administrative_area_level_2")) { //
				 * administrative_area_level_2 = district level district =
				 * (String) address.get("long_name"); }
				 * System.out.println("administrative_area_level_2:" +
				 * district); }
				 */

				// address type must be 'route'
				String type = "0";
				if (((JSONArray) result.get("types")).size() > 0) {
					type = (String) ((JSONArray) result.get("types")).get(0);
				}
				// search for 'route' only!
				if (type.equals("route")) {

					// name
					JSONArray address_components = (JSONArray) result
							.get("address_components");
					JSONObject address = (JSONObject) address_components.get(0);
					String name = (String) address.get("long_name");

					// id
					String id = (String) result.get("formatted_address");

					// lat & lng
					JSONObject tmp = (JSONObject) result.get("geometry");
					JSONObject coord = (JSONObject) tmp.get("location");
					String lat = (coord.get("lat")).toString();
					String lng = (coord.get("lng")).toString();
					// create StreetItem
					mStreetItem = new StreetItem(id, name, lat, lng, districtId
							+ "");
					// // loop array
					// JSONArray msg = (JSONArray) jsonObject.get("messages");
					// Iterator<String> iterator = msg.iterator();
					// while (iterator.hasNext()) {
					// System.out.println(iterator.next());
					// }
					System.out.println("-+-mStreetItem.toString()-+-\n"
							+ mStreetItem);
					return mStreetItem;
				}
			}
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

	
	private static void insertStreet(ArrayList<StreetItem> streetList) {

		Connection surveyDbConnection = getDbConnection();
		PreparedStatement insertTableStatement = null;
		String insertTableSQL = "INSERT INTO "+STREET_TABLE_NAME+" ( name, latitude, longitude,formatted_address,district_id) VALUES"
				+ "(?,?,?,?,?) ON DUPLICATE KEY UPDATE name=? ,latitude=?, longitude=?,formatted_address=?,district_id=?";
		try {
			insertTableStatement = surveyDbConnection
					.prepareStatement(insertTableSQL);
			for (int i = 0; i < streetList.size(); i++) {
				insertTableStatement.setString(1, streetList.get(i).getName());
				insertTableStatement.setString(2, streetList.get(i).getLat());
				insertTableStatement.setString(3, streetList.get(i).getLng());
				insertTableStatement.setString(4, streetList.get(i).getId());
				insertTableStatement.setString(5, streetList.get(i)
						.getDistrict_id());
				// on duplicate
				insertTableStatement.setString(6, streetList.get(i).getName());
				insertTableStatement.setString(7, streetList.get(i).getLat());
				insertTableStatement.setString(8, streetList.get(i).getLng());
				insertTableStatement.setString(9, streetList.get(i).getId());
				insertTableStatement.setString(10, streetList.get(i)
						.getDistrict_id());
				// execute
				System.out.println("===Insert to Street table===\n"
						+ insertTableStatement.toString());
				insertTableStatement.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
