import org.json.simple.JSONAware;
import org.json.simple.JSONObject;


public class FieldName implements JSONAware{
	private int type;
	private String id;
	private String name;
	public static final int DISTRICT_TYPE=1;
	public static final int CATEGORY_TYPE=2;
	public static final int DATA_TYPE=3;
	public static final int TIME_TYPE=4;
	public FieldName(int type, String id, String name) {
		super();
		this.type = type;
		this.id = id;
		this.name = name;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String toJSONString() {
		JSONObject obj = new JSONObject();
		obj.put("type", type);
		obj.put("id", id);
		obj.put("name", name);
		return obj.toString();
	}
}
