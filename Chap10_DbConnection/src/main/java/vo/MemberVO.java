package vo;

public class MemberVO {
	// 멤버변수 = DB 테이블의 컬렴명과 같은 이름, 같은 데이터 타입으로 정의해야 함
	private String id;
	private String pwd;
	private String name;
	private String email;
	// 디폴트 생성자
	public MemberVO() {
		System.out.println("MemberVO 생성자 호출");
	}
	// getter, setter
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
