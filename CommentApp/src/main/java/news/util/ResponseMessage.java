package news.util;


//jsp가 아닌 서블릿으로 응답데이터를 만드는게 너무 귀찮아서...

public class ResponseMessage {
	public static String getMsgURL(String msg, String url) {
		StringBuilder sb = new StringBuilder();
		sb.append("<script>");
		sb.append("alert('"+msg+"');");
		sb.append("location.href='"+url+"';");
		sb.append("</script>");
		
		return sb.toString();
	}
	
	public static String getMsgBackL(String msg) {
		StringBuilder sb = new StringBuilder();
		sb.append("<script>");
		sb.append("alert('"+msg+"');");
		sb.append("history();");
		sb.append("</script>");
		
		return sb.toString();
	}
}
