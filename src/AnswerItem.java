/* Result of a District Statistics query
 * */
import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

public class AnswerItem implements JSONAware {
	private int age;
	private int devices;
	private int job;
	private static final int DATA_TYPE_TXT=1;
	private static final int DATA_TYPE_IMG=2;
	private static final int DATA_TYPE_AUD=3;
	private static final int DATA_TYPE_VID=4;
	private static final int TIME_6_8=1;
	private static final int TIME_8_10=2;
	private static final int TIME_10_12=3;
	private static final int TIME_12_13=4;
	private static final int TIME_13_15=5;
	private static final int TIME_15_17=6;
	private static final int TIME_17_20=7;
	private static final int TIME_20_22=8;
	private static final int TIME_22_24=9;
	private static final int TIME_0_3=10;
	private static final int TIME_3_6=11;
	@Override
	public String toJSONString() {
		// TODO Auto-generated method stub
		return null;
	}

//	public String toJSONString() {
//		JSONObject obj = new JSONObject();
//		obj.put("district_id", district_id);
//		obj.put("data", data);
//		obj.put("datatype_id", datatype_id);
//		obj.put("time_id", time_id);
//		obj.put("lat", lat);
//		obj.put("lng", lng);
//		return obj.toString();
//	}

}