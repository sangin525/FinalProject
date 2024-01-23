package kr.co.project.member.model.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDTO {

	private int no = 0;
	private String email;
	private String pwd;
	private String name;
	private String nickname;
	private String phone;
	private int age = 0;
	private String gender;
	private String address;
	private Date removeDate;
	private Date indate;
	private int type = 0;
	private int purchaseAmount = 0;
	
	public MemberDTO() {
		super();
	}
}
