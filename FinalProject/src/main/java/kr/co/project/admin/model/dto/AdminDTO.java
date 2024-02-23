package kr.co.project.admin.model.dto;

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
public class AdminDTO {

	private int type;
	private int mno;

	// 공지사항
	private int acno;
	private String title;
	private String contents;
	private String filePath;
	private String fileName;
	private String fileOrigin;
	private String indate;
	private String updateDate;
	private String deleteDate;
	private int views;
	
	private int ncno;
	private String ncComment;
	private String ncWriter;
	private String ncIndate;
	
	// 이벤트
	private int eno;
	private String e_title;
	private String e_contents;
	private String e_file_path;
	private String e_file_name;
	private String e_file_origin;
	private String e_indate;
	private String e_updateDate;	
	private String e_deleteDate;
	private int e_views;
	
	private int ecno;
	private String ecComment;
	private String ecWriter;
	private String ecIndate;
	
	private int i_no;
	private int aa_no;
	private String aa_title;
	private String aa_writer;
	private String aa_contents;
	private String aa_answer;
	private String aa_indate;
}
