package kr.co.project.member.model.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDTO {

	private int mno = 0;
	private String email;
	private String pwd;
	private String name;
	private String nickname;
	private String phone;
	private int age = 0;
	private String gender;
	private String address;
	private String detailAddress;
	private Date removeDate;
	private Date indate;
	private int type = 0;
	private int recipeCount =0;
	private int subscriber =0;
	private int purchaseAmount = 0;
	private String uploadPath;
	private String uploadName;
	private String uploadOrigin;
	private String grade;
	private String introduce;
	
	public MemberDTO() {
		super();
	}
}
