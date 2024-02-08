package kr.co.project.recipe.model.dto;

import java.sql.Date;

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

public class RecipeDTO {
	private int rno;
	private String title;
	private String introduction;
	private String uploadPath;
	private String uploadName;
	private String uploadOriginName;
	private String foodCategory;
	private String situationCategory;
	private String howCategory;
	private String ingredientCategory;
	private String person;
	private String time;
	private String difficulty;
	private String tip;
	private String tag;
	private int views;
	private String indate;
	private String updateDate;
	private int mno;
	private String memberNickName;
	private int rino;
	private String ingredient;
	private String ingredientWeight;
	private int rsno;
	private int rpno;
	private String rsSequence;	
	private String filePath;
	private String fileName;
	private String fileOrigin;
	private String multiFile;
	private String deleteDate;
	private int rcno;
	private String comment;
	private int commentCount;
	private String comname;	
	private String rcInDate;
	private double star;
	private String searchText = "";
	private String searchCategory = "";
	private int frno;
	private int saveCount;
	private String scrapDate;

	
	
	
	
	
}
