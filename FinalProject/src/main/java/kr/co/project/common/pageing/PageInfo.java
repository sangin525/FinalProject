package kr.co.project.common.pageing;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class PageInfo {
	private int listCount;
	private int cpage;
	private int pageLimit;
	private int boardLimit;
	
	private int maxPage;
	private int startPage;
	private int endPage;
	private int offset;
}
