/* Result of a District Statistics query
 * */
import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

public class DistrictStatsItem implements JSONAware {
	private String dataName;
	private int district_id;
	
	private int data;
	
	private int datatype_id;
	private int time_id;
	
	private String lat;
	private String lng;
//	private static final int DATA_TYPE_TXT=1;
//	private static final int DATA_TYPE_IMG=2;
//	private static final int DATA_TYPE_AUD=3;
//	private static final int DATA_TYPE_VID=4;
//	private static final int TIME_6_8=1;
//	private static final int TIME_8_10=2;
//	private static final int TIME_10_12=3;
//	private static final int TIME_12_13=4;
//	private static final int TIME_13_15=5;
//	private static final int TIME_15_17=6;
//	private static final int TIME_17_20=7;
//	private static final int TIME_20_22=8;
//	private static final int TIME_22_24=9;
//	private static final int TIME_0_3=10;
//	private static final int TIME_3_6=11;

	public DistrictStatsItem(int district_id, int data) {
		super();
		this.district_id = district_id;
		this.data = data;
	}


	public DistrictStatsItem(String dataName,int district_id, int data, String lat, String lng) {
		super();
		this.dataName=dataName;
		this.district_id = district_id;
		this.data = data;
		this.lat = lat;
		this.lng = lng;
	}

	
	public DistrictStatsItem(String dataName,int district_id, int data,
			int datatype_id, int time_id, String lat, String lng) {
		super();
		this.district_id = district_id;
		this.data = data;
		this.datatype_id = datatype_id;
		this.time_id = time_id;
		this.lat = lat;
		this.lng = lng;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public int getDistrict_id() {
		return district_id;
	}

	public void setDistrict_id(int district_id) {
		this.district_id = district_id;
	}

	public int getData() {
		return data;
	}

	public void setData(int data) {
		this.data = data;
	}

	public String getLat() {
		return lat;
	}

	public String getLng() {
		return lng;
	}


	public int getDatatype_id() {
		return datatype_id;
	}




	public void setDatatype_id(int datatype_id) {
		this.datatype_id = datatype_id;
	}




	public int getTime_id() {
		return time_id;
	}




	public void setTime_id(int time_id) {
		this.time_id = time_id;
	}




	public String toJSONString() {
		JSONObject obj = new JSONObject();
		obj.put("district_id", district_id);
		obj.put("data", data);
		obj.put("datatype_id", datatype_id);
		obj.put("time_id", time_id);
		obj.put("lat", lat);
		obj.put("lng", lng);
		return obj.toString();
	}

}