/* Result of a District Statistics query
 * */
import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

public class StreetStatsItem implements JSONAware {
	private int street_id;
	private int district_id;
	private String fomatted_address;	
	private String lat;
	private String lng;	
	private int count;



	public StreetStatsItem(int street_id, int district_id, String address,
			String lat, String lng, int count) {
		super();
		this.street_id = street_id;
		this.district_id = district_id;
		this.fomatted_address = address;
		this.lat = lat;
		this.lng = lng;
		this.count = count;
	}


	public int getDistrict_id() {
		return district_id;
	}


	public void setDistrict_id(int district_id) {
		this.district_id = district_id;
	}


	public int getStreet_id() {
		return street_id;
	}


	public void setStreet_id(int street_id) {
		this.street_id = street_id;
	}


	public String getAddress() {
		return fomatted_address;
	}


	public void setAddress(String address) {
		this.fomatted_address = address;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public String getLat() {
		return lat;
	}


	public void setLat(String lat) {
		this.lat = lat;
	}


	public String getLng() {
		return lng;
	}


	public void setLng(String lng) {
		this.lng = lng;
	}


	public String toJSONString() {
		JSONObject obj = new JSONObject();
		obj.put("street_id", street_id);
		obj.put("district_id", district_id);
		obj.put("fomatted_address", fomatted_address);
		obj.put("count", count);
		obj.put("lat", lat);
		obj.put("lng", lng);
		return obj.toString();
	}

}