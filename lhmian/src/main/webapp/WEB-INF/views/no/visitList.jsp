 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.visitList {
margin : 30px;
padding : 10px;
height : 500px;
}

table {
width : 900px;
}

textarea {
width : 900px;
}

.insert {
float : right;
}
</style>
<div class="visitList">
	<button class="write">방명록작성</button>
	<br>
	<br>
	<div>
		<table border="1">
			<tr>
				<th>방명록번호</th>
				<th>세대정보</th>
				<th>방명록내용</th>
				<th>방명록작성일</th>
				<th>방명록수정일</th>
				<th>방명록작성자</th>
				<th>방명록작성세대</th>
			</tr>
			<c:forEach items="${list}" var="list">
				<tr onclick="update(${list.visitNo})">
					<td>${list.visitNo}</td>
					<td>${list.houseInfo}</td>
					<td>${list.visitContent}</td>
					<td>${list.visitDate}</td>
					<td>${list.visitUpdate}</td>
					<td>${list.visitWriter}</td>
					<td>${list.writerInfo}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<br>
	<div class="vContent">
		<textarea id="visitContent"
			placeholder="우리는 서로 이웃입니다. 가는 말이 고와야 오는 말이 곱습니다."></textarea>
			<br>
		<button class="insert">등록</button>
	</div>
	<div class="vUpdate">
		<textarea id="visitUpdate"></textarea>
			<br>
		<button class="update">수정</button>
	</div>
</div>
<script>
	//페이지 로드 시 등록창은 숨겨놓음
	$(document).ready(function() {
		$('.vContent').hide();
	});

	//작성버튼을 누르면 등록창이 나옴
	$('.write').on('click', function() {
		$('.vContent').show();

		//등록버튼을 누르면 작동
		$('.insert').on('click', function() {
			let csrfHeaderName = "${_csrf.headerName}";
			let csrfTokenValue = "${_csrf.token}";
			if (confirm('방명록을 등록하시겠습니까?')) {
				$.ajax({
					url : "visitInsert",
					method : "post",
					beforeSend : function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					data : {
						visitContent : $('#visitContent').val(),
						houseInfo : ${list[0].houseInfo}
					},
					success : function() {
						alert(" 방명록이 등록되었습니다.");
						location.reload();
					}
				});
			}
			;
		});
	});
	
	function update(n) {
		if (confirm('수정하시겠습니까?')) {
		$('.vUpdate').show();
		//$('#visitUpdate').attr("placeholder", "");
		}	
	};
</script>