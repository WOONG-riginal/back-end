package expression;
/*
	자바 빈 = Java 프로그래밍 시 여러 객체를 거치면서 만들어지는 데이터를 저장하거나 전달하는데 사용
	          => getter, setter 이용
	          => 자바의 VO와 비슷한 개념
	
	자바 빈의 특징/규칙
	  a. 각 속성(=멤버변수) 접근제어자 = private
	  b. 각 속성(=멤버변수)은 getter, setter를 가져야 함
	  c. getter, setter의 첫글자는 반드시 소문자
	  d. 디폴트 생성자는 반드시 있어야 함
 */
public class MemberVO {
	// 멤버변수 = DB
	private String id;
	private String pwd;
	private String name;
	private String email;
	// 디폴트 생성자
	public MemberVO() {}
	// 생성자 오버로딩
	public MemberVO(String id, String pwd, String name, String email) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
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
