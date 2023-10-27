package kr.board.entity;
import java.util.Date;

public class UserInfo {
	// 새로운 테이블 생성 후 객체 생성
	// 객체의 설계가 잘 되었는지 확인
	// 1. 정보은닉이 되었는가? private
	private String id;
    private String pw;
    private String name;
    private String phone;
    private String email;
    private String region;
    private char gender;
    private String birthdate;
    private String title;
    private String keyWord;
    
	// 2. 멤버변수에 데이터를 넣고 꺼내주는 메소드를 만들었는지?
	// getter, setter
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public char getGender() {
        return gender;
    }

    public void setGender(char gender) {
        this.gender = gender;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubCategory() {
        return keyWord;
    }

    public void setSubCategory(String keyWord) {
        this.keyWord = keyWord;
    }
	
	
	// 3. 객체가 가지고 있는 데이터 전체를 String으로 리턴해주는 메소드를
	// 만들었는지?? toString() ==> 디버깅 요소
	@Override
	public String toString() {
		return "UserInfo [id=" + id + 
				", pw=" + pw + 
				", name=" + name + 
				", phone=" + phone + 
				",email=" + email + 
				",region=" + region + 
				",gender=" + gender + 
				",birthdate=" + birthdate + 
				",title=" + title +
				",subCategory=" + keyWord + "]";
	}
	
	// 4. 생성자 메소드(선택)
	
	
	
}
