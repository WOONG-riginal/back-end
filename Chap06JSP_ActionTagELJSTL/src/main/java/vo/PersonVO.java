package vo;

public class PersonVO {
	// 멤버변수
	private String name;
	private int age;
	private String address;
	// 디폴트 생성자
	public PersonVO() {}
	// 생성자 오버로딩
	public PersonVO(String name, int age, String address) {
		super();
		this.name = name;
		this.age = age;
		this.address = address;
	}
	// getter, setter
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}
