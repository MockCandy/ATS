package jobja.util.collection;

public class Student extends People{

	private int hak; // 학년
	private int ban; // 반
	private int no;	 // 번호
	
	public Student() {};
	public Student(String peopelId
				, String name
				, String sex
				, int age
				, int hak
				, int ban
				, int no) {
		this.peopleId = peopelId;
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.ban = ban;
		this.hak = hak;
		this.no = no;
	}
	
	public int getHak() {
		return hak;
	}
	public void setHak(int hak) {
		this.hak = hak;
	}
	public int getBan() {
		return ban;
	}
	public void setBan(int ban) {
		this.ban = ban;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	@Override
	public String toString() {
		return super.toString() + " Student [hak=" + hak + ", ban=" + ban + ", no=" + no + "]";
	}
	
}
