<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.box1 {
	width: 100%;
	height: 100%;
	position: fixed;
	background: rgba(0, 0, 0, 0.5);
	z-index: 5;
	padding: 30px;
	display: none;
}

.box2 {
	background: white;
	border-radius: 5px;
	padding: 30px;
}

.show {
	display: block;
}
</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>

	$(document).ready(function() {

		//ȸ��Ż�� ��ư Ŭ��
		$("#del_btn").on("click", function() {
			$(".box1").show();
		});

		//ȸ��Ż�� ���� ��޿��� ��ҹ�ư Ŭ��
		$(".box_btn2").on("click", function() {
			$(".box1").hide();
		});
	});

	function selectMypage() {
		if ($("#hiddenUserInfo").val() == '0') { // �ݺ��� ����
			$.ajax({
				method : 'GET',
				url : '/user/userlist',
				headers : {
					'Accept' : 'application/json',
					'Content-Type' : 'application/json'
				},
				data : {
					'userID' : 'est4'
				},
				success : function(response) {
					//console.log( response);
					$("tbody").append("<tr id='userInfo'>"+		
	                        "<td>"+response.userID+"</td>"+
	                        "<td>"+response.userName+"</td>"+
	                        "<td>"+response.email+"</td>"+
	                        "<td>"+response.phoneNumber+"</td>"+
	                    "</tr>");

					$("#hiddenUserInfo").val('1');
					$("#hideUserId").val(response.userID);
					
				},
				error : function(reason) {
					alert("ȸ����������������");
				}
			});
		}
	}
	
	function chatPopupOpen() {
		var popUrl = "/joinus/chat";
        var popOption = "scrollbars=no,resizable=no,status=no,menubar=no,width=550, height=710, top=0,left=0";
        window.open(popUrl,"chatt", popOption);
	}

	/*function test(userid) {
	 alert(userid);*/
</script>
</head>
<body>

	<input type="hidden" id="hiddenUserInfo" value="0">
	<input type="hidden" id="hideUserId" value="0">
	<div class="box1" id="box1">
		<div class="box2">
			<h4>ȸ��Ż�� �ϸ� ���񽺸� �� �̻� �̿��Ҽ� �����ϴ� ȸ��Ż�� �����ϰڽ��ϱ�?</h4>
			<button class="box_btn1" onClick="location.href='/user/delete'">Ȯ��</button>
			<button class="box_btn2">���</button>
		</div>

	</div>
	<button id="mypage_btn" onClick="selectMypage()">����������</button>
	<button id="del_btn">ȸ��Ż��</button>
	<button id="chat_btn" onClick="chatPopupOpen();">ä���ϱ�</button>





	<div>
		<table>
			<h3>�⺻����</h3>
			<thead>
				<tr>
					<td>ID</td>
					<td>NAME</td>
					<td>E-mail</td>
					<td>Phone Number</td>
				</tr>
			</thead>

			<tbody>
			</tbody>

		</table>
	</div>

	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</body>
</html>