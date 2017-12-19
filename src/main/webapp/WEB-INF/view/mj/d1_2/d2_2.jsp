<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/resources/common/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/resources/js/mj/common.js"></script>
<%
	String d1 = request.getParameter("d1");
	String d2 = request.getParameter("d2");
%>
<script type="text/javascript">

</script>
<%--<jsp:include page="/jsp/lab/manager/include/header.jsp"></jsp:include>--%>
	<!-- 2단 메뉴 -->
	<div class="aside_second">
		<a href="/lab/manager/d1_2/d2_1.do?d1=2&d2=1"<%if("1".equals(d2)){ %> class="on"<%} %>>연구사업 개요</a>
		<a href="/lab/manager/d1_2/d2_2.do?d1=2&d2=2"<%if("2".equals(d2)){ %> class="on"<%} %>>한국학 기초 및 중점연구</a>
		<a href="/lab/manager/d1_2/d2_3.do?d1=2&d2=3"<%if("3".equals(d2)){ %> class="on"<%} %>>고전자료의 현대화연구</a>
		<a href="/lab/manager/d1_2/d2_4.do?d1=2&d2=4"<%if("4".equals(d2)){ %> class="on"<%} %>>한국의 인문정신문화 스토리텔링연구</a>
	</div>
	<!-- 본문 -->
	<div class="view-contents">
		<div class="top-tit">
			<h1><i class="fa fa-pencil-square-o" aria-hidden="true"></i>한국학 기초 및 중점연구</h1>
			<ul class="nav-tab">
				<li>홈</li>
				<li>연구사업</li>
				<li>한국학 기초 및 중점연구</li>
			</ul>
		</div>
		<!-- 3단 메뉴 -->
		<div class="tab-menu">
			<ul id="categoryUl">
				<li><a href="">공통연구과제</a></li>
				<li><a href="">한국학번역 과제</a></li>
				<li><a href="">모노그래프 과제</a></li>
				<li><a href="">한국인의 가치변화 감정양식</a></li>
				<li><a href="">연구교육연계사업</a></li>
			</ul>
			<a href='/lab/manager/d1_2/m_cate_insert.do' class="plus-cate2"><i class="fa fa-plus" aria-hidden="true"></i> 카테고리 추가</a>
		</div>

		<div class="view-area">
			<div class="article">
				<h2><i class="fa fa-list-ol" aria-hidden="true"></i> 카테고리 관리</h2>
				<table>
					<colgroup>
							<col width="120">
							<col width="*">
					</colgroup>
					<tr>
						<th>카테고리 순서</th>
						<td><input type="text" size="3" value="1"><span>* 작은 숫자부터 정렬됩니다.</span></td>
					</tr>
					<tr>
						<th>카테고리 명</th>
						<td><input type="text" size="20" value="공통연구과제" ></td>
					</tr>

				</table>
				<div class="btn-area">
					<button type="submit" class="red-btn">확인</button>
				</div>

			</div>
			<%-- 저장폼 --%>
			<jsp:include page="/WEB-INF/view/mj/d1_2/d2_detail.jsp"></jsp:include>

			<%-- 목록 --%>
			<jsp:include page="/WEB-INF/view/mj/d1_2/d2_list.jsp"></jsp:include>
			<input type="hidden" id="boardType" value="2" />

		</div>

	</div>
<%--<jsp:include page="/jsp/lab/manager/include/footer.jsp"></jsp:include>--%>