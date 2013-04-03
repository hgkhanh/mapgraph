/* Result of a District Statistics query
 * */
import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

public class DistrictStatsItem implements JSONAware {
	private int district_id;
	private int data;
	private String lat;
	private String lng;

	public DistrictStatsItem(int district_id, int data) {
		super();
		this.district_id = district_id;
		this.data = data;
	}

	public DistrictStatsItem(int district_id, int data, String lat, String lng) {
		super();
		this.district_id = district_id;
		this.data = data;
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

	public String toJSONString() {
		JSONObject obj = new JSONObject();
		obj.put("district_id", district_id);
		obj.put("data", data);
		obj.put("lat", lat);
		obj.put("lng", lng);
		return obj.toString();
	}

}