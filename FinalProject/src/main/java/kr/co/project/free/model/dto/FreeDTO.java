package kr.co.project.free.model.dto;

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
public class FreeDTO {
	
	private int flno;
	private int mno;
	private String title;
	private String contents;
	private String filePath;
	private String fileName;
	private String fileOrigin;
	private String indate;
	private String updateDate;
	private String deleteDate;
	private String writer;
	private int views;
	
	private int fcno;
	private String comment;
	private String fcwriter;
	private String fcIndate;

}
