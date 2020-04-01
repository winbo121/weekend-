package mysns.sns;

/**
 * File : Message.java
 * Desc : SNS 寃뚯떆湲� Data Object �겢�옒�뒪
 * @author �솴�씗�젙(dinfree@dinfree.com)
 *
 */
public class Message {
	// 寃뚯떆湲� �떆���뒪 id
	private int mid;
	
	// 寃뚯떆湲� �옉�꽦�옄
	private String uid;
	
	// 寃뚯떆湲� �궡�슜
	private String msg;
	
	// 寃뚯떆湲� �옉�꽦�씪, �떆媛�
	private String date;
	
	// 醫뗭븘�슂 �쉶�닔
	private int favcount;
	
	// �뙎湲� 媛��닔
	private int replycount;
	
	private String img;
	
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getFavcount() {
		return favcount;
	}

	public void setFavcount(int favcount) {
		this.favcount = favcount;
	}

	public int getReplycount() {
		return replycount;
	}

	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}
	
}