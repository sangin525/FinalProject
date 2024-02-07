package kr.co.project.foodMate.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class FoodMateDTO {

	private int fno;
	private int mno;
	private String writer;
	private String title;
	private String introduction;
	private String food;
	private String time;
	private int personNumber;
	private int ageLimit;
	private int views;
	private String contents;
	private String indate;
	private String deleteDate;
	private String completeCheck;
	private String uploadPath;
	private String uploadName;
	private String uploadOrigin;
}
