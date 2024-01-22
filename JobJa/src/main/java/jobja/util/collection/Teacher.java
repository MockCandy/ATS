package jobja.util.collection;

public class Teacher extends People {

	public static final String OPERATE_TYPE_A = "정교사";
	public static final String OPERATE_TYPE_B = "기간제";
	
	public static final String MANAGE_TYPE_A = "담임교사";
	public static final String MANAGE_TYPE_B = "일반교사";
	
	
	private String operateType; // 정교사, 기간제
	private String managerType; // 담임교사, 일반교사
	
	public Teacher(String peopelId
			, String name
			, String sex
			, int age
			, String operateType
			, String manageType) {
		this.peopleId = peopelId;
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.operateType = operateType;
		this.managerType = manageType;
		
	}
	
	public String getOperateType() {
		return operateType;
	}
	public void setOperateType(String operateType) {
		this.operateType = operateType;
	}
	public String getManagerType() {
		return managerType;
	}
	public void setManagerType(String managerType) {
		this.managerType = managerType;
	}
	@Override
	public String toString() {
		return super.toString() + " Teacher [operateType=" + operateType + ", managerType=" + managerType + "]";
	}
	
	
	
}
