package vnu.mapgraph.data;

public class StreetItem {
	private String id;
	private String name;
	private String lat;
	private String lng;
	private String district_id;
	public StreetItem(String id, String name, String lat, String lng,String district_id) {
		super();
		this.id = id;
		this.name = name;
		this.lat = lat;
		this.lng = lng;
		this.district_id=district_id;
	}
	
	public StreetItem(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public StreetItem(String id, String name, String lat, String lng) {
		super();
		this.id = id;
		this.name = name;
		this.lat = lat;
		this.lng = lng;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	
	public String getDistrict_id() {
		return district_id;
	}
	public void setDistrict_id(String district_id) {
		this.district_id = district_id;
	}
	public String toString(){
		return "name:"+name+"\nid:"+id+"\nlat:"+lat+"\nlng:"+lng+"\nDistrict_id:"+district_id;
	}
	

}
