package kr.co.project.chef.model.dto;

import kr.co.project.member.model.dto.MemberDTO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChefDTO {
	private int cno;
	private int recipeCount;
	private int subcriber;
	private String uploadPath;
	private String uploadName;
	private String uploadOriginName;
	
	
	private MemberDTO memberDto;
	
	public ChefDTO() {
		super();
	}
}
