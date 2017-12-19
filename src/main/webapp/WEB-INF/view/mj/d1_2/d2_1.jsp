<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="charm.util.*, java.util.*;" %>
<%
String d1 = request.getParameter("d1");
String d2 = request.getParameter("d2");
%>
<jsp:include page="/jsp/lab/manager/include/header.jsp"></jsp:include>
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
						<h1><i class="fa fa-pencil-square-o" aria-hidden="true"></i>연구사업 개요</h1>
						<ul class="nav-tab">
							<li>홈</li>
							<li>연구사업</li>	
							<li>연구사업 개요</li>
						</ul>
					</div>
					<div class="view-area">
						<div class="article">
						<h2><i class="fa fa-cogs" aria-hidden="true"></i> 컨텐츠 관리[사업목적 및 구성]</h2>
							<table>
							<colgroup>
									<col width="150">
									<col width="*">
								</colgroup>
								<tr>
									<th>사업목적</th>
									<td>
										<textarea style="height:300px;"></textarea> 
										
									
									</td>
								</tr>
								<tr>
									<th>사업구성</th>
									<td>
										<textarea style="height:300px;"></textarea> 
										
									
									</td>
								</tr>
								
							</table>
							<div class="btn-area">
								<button type="submit" class="red-btn">등록하기</button>
							</div>
						</div>

						<div class="article">
						<h2><i class="fa fa-cogs" aria-hidden="true"></i> 컨텐츠 관리[지원과제목록]</h2>
							<table>
							<colgroup>
										<col width="120">
									<col width="*">
								</colgroup>
								<tbody><tr>
									<th>노출순서</th>
									<td><input type="text" size="3"><span>* 작은 숫자부터 정렬됩니다.</span></td>
								</tr>
								<tr>
									<th>연구기관</th>
									<td><input type="text" size="20"></td>
								</tr>	
								<tr>
									<th>과제명</th>
									<td><input type="text" size="40"></td>
								</tr>
								<tr>
									<th>연구책임자</th>
									<td><input type="text" size="20"></td>
								</tr>
								<tr>
									<th>주관기간</th>
									<td><input type="text" size="20"></td>
								</tr>
								<tr>
									<th>분야</th>
									<td><input type="text" size="20"></td>
								</tr>
								<tr>
									<th>비고</th>
									<td><input type="text" size="20"></td>
								</tr>
								
							</tbody></table>
							<h2><i class="fa fa-cogs" aria-hidden="true"></i> 컨텐츠 관리[지원과제내용]</h2>
							<table>
							<colgroup>
										<col width="120">
									<col width="*">
								</colgroup>
								<tbody><tr>
									<th>연구요약</th>
									<td><textarea style="height:300px;"></textarea></td>
								</tr>
								<tr>
									<th>기타사항</th>
									<td><textarea style="height:300px;"></textarea></td>
								</tr>	
								<tr>
									<th>사진등록</th>
									<td><input value="" disabled="disabled"> <button type="submit" class="red-btn file">파일첨부</button></td>
								</tr>
								
							</tbody></table>
							<div class="btn-area">
								<button type="submit"  class="red-btn">등록하기</button>
								<button type="submit"  class="blue-btn">목록추가</button>
							</div>
						
						</div>
						<div class="article">
							<table class="center">
								
								<tbody><tr>
									<th>노출순서</th>
									<th>연구기관</th>
									<th>과제명</th>
									<th>연구책임자</th>
									<th>주관기관</th>
									<th>분야</th>
									<th>비고</th>
									<th>관리</th>
								
								</tr>
								<tr>
									<td>1</td>
									<td>공동연구과제</td>
									<td>장서각소장 한글필사본 자료역주연구</td>
									<td>황문환</td>
									<td>한국학중앙연구원</td>
									<td>인문학</td>
									<td>-</td>
									<td>
										<button class="blue-btn">수정</button>
										<button>삭제</button>
									</td>
									
								</tr>
								
							</tbody></table>
						</div>
						
						<!--div class="btn-area">
							<button type="submit">목록으로</button>
						</div-->

					</div>
				</div>
<jsp:include page="/jsp/lab/manager/include/footer.jsp"></jsp:include>