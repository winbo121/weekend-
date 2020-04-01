package mysns.sns;

import java.util.ArrayList;


public class MessageSet {
	
	private Message message;
	

	private ArrayList<Reply> rlist = new ArrayList<Reply>();
	
	private ArrayList<Goods> glist =new ArrayList<Goods>();
	
	
	
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	public ArrayList<Reply> getRlist() {
		return rlist;
	}
	public void setRlist(ArrayList<Reply> rlist) {
		this.rlist = rlist;
	}
	public ArrayList<Goods> getGlist() {
		return glist;
	}
	public void setGlist(ArrayList<Goods> glist) {
		this.glist = glist;
	}
	
}
