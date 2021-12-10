package utills;

//게시판 목록 하단에 페이지 번호를 출력하기 위한 클래스
public class BoardPage {
	
	//매개변수(전체 게시물 갯수, 한페이지출력갯수, 한블럭당 출력 페이지수, 페이지 번호, 현재 페이지 명)
	public static String pagingStr(int totalCount, int pageSize,
			int blockPage, int pageNum, String reqUrl) {
		String pagingStr="";
	
		//전체 페이지수 계산
		int totalPages = (int)(Math.ceil(((double)totalCount/pageSize)));
		
		//페이지 블럭의 첫번째 수를 계산 
		int pageTemp = (((pageNum-1)/blockPage)*blockPage)+1; //1
		//이전블럭으로 바로가기 링크(첫번째 블럭에는 숨김처리)
		if(pageTemp!=1) {
			pagingStr += "<a href='" + reqUrl + "?pageNum=1'>[첫페이지]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='" + reqUrl + "?pageNum=" + (pageTemp-1)
					+"'>[이전블록]</a>";
			
		}
		
		//각페이지로 바로가기 링크(blockPage수 만큼 출력됨)
		int blockCount=1;
		while(blockCount<=blockPage && pageTemp<=totalPages) {
			if(pageTemp==pageNum) {
				pagingStr += "&nbsp;"+ pageTemp + "&nbsp;";
			}
			else {
				pagingStr += "&nbsp;<a href='"+ reqUrl + "?pageNum="
						+pageTemp +"'>"+pageTemp+"</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
		}
		//다음 블럭으로 바로가기 링크
		if(pageTemp<=totalPages) {
			pagingStr += "<a href='"+reqUrl+"?pageNum="+ pageTemp
					+"'>[다음블록]</a>";
			pagingStr += "&nbsp;";
			pagingStr +="<a href='"+reqUrl+"?pageNum="+ totalPages
					+"'>[마지막페이지]</a>";
		}
		
		return pagingStr;
	}
}
