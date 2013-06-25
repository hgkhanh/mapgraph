package vnu.mapgraph.data;
import java.util.ArrayList;
import java.util.Arrays;


public class Answer {
	private String answer_id;
	private String age_id;
	private String gender;
	private String job_id;
	
	private String street_id;
	private String district_id;
	
	private String always_online;
	private String dependency_id;
	
	private ArrayList<String> devices;
	private ArrayList<String> categories;	
	
	private String[][] datatype =  new String[ProcessSurveyDB.DATATYPE_ROW_RANGE][ProcessSurveyDB.DATATYPE_COL_RANGE];
	
	
	public Answer(String answer_id, String age_id, String gender,
			String job_id, String street_id, String district_id,
			String always_online, String dependency_id,
			ArrayList<String> devices, ArrayList<String> categories,
			String[][] datatype) {
		super();
		this.answer_id = answer_id;
		this.age_id = age_id;
		this.gender = gender;
		this.job_id = job_id;
		this.street_id = street_id;
		this.district_id = district_id;
		this.always_online = always_online;
		this.dependency_id = dependency_id;
		this.devices = devices;
		this.categories = categories;
		this.datatype = datatype;
	}
	
	

	public String toString(){
		return new String("answer_id: "+ answer_id 
				+ "\nStreet_id: " + street_id 
				+ "\ndistrict_id: " + district_id 
				+ "\njob_id: "	+ job_id + "\nage_id: " + age_id 
				+ "\ngender: "	+ gender + "\ndependency_id: "+ dependency_id
				+ "\nAlways online: "+always_online
				+ "\ndevices: " + devices.toString()
				+ "\ncategory: " + categories.toString()
				+ "\ndatatype: " + Arrays.deepToString(datatype));
	}
	// SETTER GETTER
	public String getAnswer_id() {
		return answer_id;
	}

	public void setAnswer_id(String answer_id) {
		this.answer_id = answer_id;
	}

	public String getAge_id() {
		return age_id;
	}

	public void setAge_id(String age_id) {
		this.age_id = age_id;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getJob_id() {
		return job_id;
	}

	public void setJob_id(String job_id) {
		this.job_id = job_id;
	}

	public String getStreet_id() {
		return street_id;
	}

	public void setStreet_id(String street_id) {
		this.street_id = street_id;
	}

	public String getDistrict_id() {
		return district_id;
	}

	public void setDistrict_id(String district_id) {
		this.district_id = district_id;
	}

	public String getAlways_online() {
		return always_online;
	}

	public void setAlways_online(String always_online) {
		this.always_online = always_online;
	}

	public String getDependency_id() {
		return dependency_id;
	}

	public void setDependency_id(String dependency_id) {
		this.dependency_id = dependency_id;
	}

	public ArrayList<String> getDevices() {
		return devices;
	}

	public void setDevices(ArrayList<String> devices) {
		this.devices = devices;
	}

	public ArrayList<String> getCategories() {
		return categories;
	}

	public void setCategories(ArrayList<String> categories) {
		this.categories = categories;
	}

	public String[][] getDatatype() {
		return datatype;
	}

	public void setDatatype(String[][] datatype) {
		this.datatype = datatype;
	}




	

}
