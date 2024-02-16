<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="recentlyContainer">
		<div class="recently-div">
		<p class="main-Title">최근에 본 레시피</p>
		<ul class="recentlyList">
			<c:forEach var="item" items="${recentRecipe }">
				<li class="recently-li">
					<div class="recently-img">
						<a>
							<img src="/resources/uploads/recipe/${item.uploadName }" class="recently-image" onclick="location.href='/recipe/detail.do?rno=${item.rno}'">
						</a>
					</div>
					<div class="recentlyTitle">${item.title }</div>
					<div class="recentlyTitle">${item.memberNickName }</div>
					
				</li>
			</c:forEach>
		</ul>
		</div>
	</div>
<script>
window.onload = function() {
  adjustVisibleItems();
  window.addEventListener('resize', adjustVisibleItems);
}

function adjustVisibleItems() {
  var listItems = document.querySelectorAll('.recently-li');
  var itemCount;

  if (window.innerWidth <= 1300) {
    itemCount = 3;  // 화면 너비가 600px 이하일 때는 3개만 보여줍니다.
  } else if (window.innerWidth <= 1800) {
    itemCount = 4;  // 화면 너비가 900px 이하일 때는 4개만 보여줍니다.
  } else {
    itemCount = 5;  // 그 이상일 때는 5개를 보여줍니다.
  }

  for (var i = 0; i < listItems.length; i++) {
    if (i < itemCount) {
      listItems[i].style.display = 'block';
    } else {
      listItems[i].style.display = 'none';
    }
  }
}
</script>