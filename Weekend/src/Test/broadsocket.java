package Test;
import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonWriter;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
@ServerEndpoint("/broadsocket")

public class broadsocket {
	
	static List<Session> sessionUsers = Collections.synchronizedList(new ArrayList<>());

	@OnOpen
	public void handleOpen(Session userSession){
	sessionUsers.add(userSession);
	}

	@OnMessage
	public void handleMessage(String message,Session userSession) throws IOException{
	String username = (String)userSession.getUserProperties().get("username");
	
	Iterator<Session> iterator = sessionUsers.iterator();
	while(iterator.hasNext()){
	iterator.next().getBasicRemote().sendText(buildJsonData(message));
	}
	}
	
	@OnClose
	public void handleClose(Session userSession){
	sessionUsers.remove(userSession);
	}
	
	public String buildJsonData(String message){
	JsonObject jsonObject = Json.createObjectBuilder().add("message", message).build();
	StringWriter stringwriter = new StringWriter();
	try(JsonWriter jsonWriter = Json.createWriter(stringwriter)){
	jsonWriter.write(jsonObject);
	};
	return stringwriter.toString();
	}



	
	
}
