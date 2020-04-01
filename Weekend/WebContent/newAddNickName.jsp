<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">





var retVal = prompt("닉네임 만들기 : ", "");

if(retVal==""){
	
	alert("닉네임를 입력하세요")
	location.href="newAddNickName.jsp";	
}
else if(retVal==null){
	location.href="login.jsp";	
}


else{

var request =new XMLHttpRequest();

	
	request.open("Post","./Usercheck.bo?userName="+encodeURIComponent(retVal),true);
	request.onreadystatechange=searchProcess;
	request.send(null);

	
	

function searchProcess(){
	var a=retVal;
	

	if(request.readyState==4 && request.status==200){
		
		var object = eval('('+request.responseText+')');
		var result = object.result;
		aa:
		for(var i =0; i<result.length; i++){
			
			for(var j=0; j<result[i].length; j++){
				
				
				if(a==result[i][j].value){
					
			
					alert("이미 사용중 닉네임 입니다");
					location.href="newAddNickName.jsp";	
					break aa;
				}
				else{
					
					alert("사용 가능한닉네임 입니다");
					
				    location.href="user_control.jsp?uid=${id}&site=${site}&nickname="+retVal+"&action=new";	
				}
						
			}
		
		}
		
	}
	
}

}

</script>

</body>
</html>