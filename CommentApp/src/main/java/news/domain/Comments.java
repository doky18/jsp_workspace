package news.domain;

import lombok.Data;

@Data
public class Comments {
	private int comments_idx;
	private String msg;
	private String writer;
	private String regdate;
	private News news;
}
