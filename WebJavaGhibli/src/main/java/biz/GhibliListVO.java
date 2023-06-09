package biz;
/* 지브리 스튜디오 영화 정보 리스트 자바빈 = DB에 이미 data 정보가 들어있음 */
public class GhibliListVO {
	// 멤버변수
	private int no;
	private String name;
	private int category;
	private int price;
	private int usepeople;
	private String company;
	private String img;
	private String info;
	
	// 디폴트 생성자
	public GhibliListVO() {}
	
	// getter, setter
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getUsepeople() {
		return usepeople;
	}
	public void setUsepeople(int usepeople) {
		this.usepeople = usepeople;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
}
