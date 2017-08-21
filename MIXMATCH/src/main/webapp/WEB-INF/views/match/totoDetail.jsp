<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/match/match.js"></script>
<div class="match-div">
   <h3 style="text-align:left;font-weight:bold;">베팅하기</h3>
   <hr class="match-hr"><br>
   
   <div class="match-form">
      <table class="detail-table"> 
         <tr>
             <td>
               <c:if test="${!empty t_name.t_logo_name}">
                  <img src="matchImageView.do?t_name=${match.t_name}" width="80">
               </c:if>
               <c:if test="${empty t_name.t_logo_name}">
                  <c:if test="${match.m_type eq '축구'}"><img src="${pageContext.request.contextPath}/resources/images/football.png" style="width:80px;height:80px;"></c:if>
                  <c:if test="${match.m_type eq '야구'}"><img src="${pageContext.request.contextPath}/resources/images/baseball.png" style="width:80px;height:80px;"></c:if>
                  <c:if test="${match.m_type eq '농구'}"><img src="${pageContext.request.contextPath}/resources/images/basketball.png" style="width:80px;height:80px;"></c:if>
               </c:if>
            <td><span style="font-size:25px;color:blue;font-weight:bold;">?</span><br>${match.t_name}<br><input type="button" value="팀정보" class="team-btn" onclick="location.href='${pageContext.request.contextPath}/team/teamInfo.do?t_name=${match.t_name}'"></td>
            <td><img src="${pageContext.request.contextPath}/resources/images/versus.png" width="80"></td>
            <td><span style="font-size:25px;color:red;font-weight:bold;">?</span><br>${match.m_challenger}<br><input type="button" value="팀정보" class="team-btn" onclick="location.href='${pageContext.request.contextPath}/team   /teamInfo.do?t_name=${match.m_challenger}'"></td>
            <td>
               <c:if test="${!empty m_challenger.t_logo_name}">
                  <img src="matchImageView.do?t_name=${match.m_challenger}" width="80">
               </c:if>
               <c:if test="${empty m_challenger.t_logo_name}">
                  <c:if test="${match.m_type eq '축구'}"><img src="${pageContext.request.contextPath}/resources/images/football.png" style="width:80px;height:80px;"></c:if>
                  <c:if test="${match.m_type eq '야구'}"><img src="${pageContext.request.contextPath}/resources/images/baseball.png" style="width:80px;height:80px;"></c:if>
                  <c:if test="${match.m_type eq '농구'}"><img src="${pageContext.request.contextPath}/resources/images/basketball.png" style="width:80px;height:80px;"></c:if>
               </c:if>
            </td>
         </tr>
         <tr>
            <td colspan="2"><strong>승:</strong>${t_name.t_win} <strong>패:</strong>${t_name.t_lose} <strong>무:</strong>${t_name.t_draw}<br>
                        <strong>경기수:</strong>${home} <strong>팀승률:</strong>
               <c:if test="${home eq 0}">
                  0
               </c:if>
               <c:if test="${home ne 0}">
                  <fmt:formatNumber value="${t_name.t_win/(home) * 100}" pattern="0"/>
               </c:if>%
            </td>
            <td></td>
            <td colspan="2"><strong>승:</strong>${m_challenger.t_win} <strong>패:</strong>${m_challenger.t_lose} <strong>무:</strong>${m_challenger.t_draw}<br>
                        <strong>경기수:</strong>${away} <strong>팀승률:</strong>
               <c:if test="${away eq 0}">
                  0
               </c:if>
               <c:if test="${away ne 0}">
                  <fmt:formatNumber value="${m_challenger.t_win/(away) * 100}" pattern="0"/>
               </c:if>%
            </td>
         </tr>
         <tr>
            <td colspan="2" style="color:blue;">승률:
               <c:if test="${home eq 0}">
                0%
               </c:if>
               <c:if test="${home ne 0}">
                  <fmt:formatNumber value="${home/(home+away) * 100}" pattern="0"/>%
               </c:if>
             </td>
            <td></td>
            <td colspan="2" style="color:red;">승률:
               <c:if test="${away eq 0}">
                0%
               </c:if>
               <c:if test="${away ne 0}">
                  <fmt:formatNumber value="${away/(home+away) * 100}" pattern="0"/>%
               </c:if>
            </td>
         </tr>
         <tr>
            <td colspan="2"style="color:blue;">배당률: 
         
         <c:if test="${(home+away) eq 0}">
            2<input type="hidden" id="t1_rate" value="2">
         </c:if>
         <c:if test="${(home+away) ne 0}">
         <c:if test="${(home/(home+away) * 100) <= 2}">
            50<input type="hidden" id="t1_rate" value="50">
         </c:if>
         <c:if test="${(home/(home+away) * 100) > 2}">
            <fmt:formatNumber value="${1/(home/(home+away))}" pattern="0.0"/>
            <input type="hidden" id="t1_rate" value="${1/(home/(home+away))}">
         </c:if></c:if>배</td>
            <td></td> 
            <td colspan="2" style="color:red;">배당률: 
         
         <c:if test="${(home+away) eq 0}">
            2<input type="hidden" id="t2_rate" value="2">
         </c:if>
         <c:if test="${(home+away) ne 0}">
         <c:if test="${(away/(home+away) * 100) <= 2}">
            50<input type="hidden" id="t2_rate" value="50">
         </c:if>
         <c:if test="${(away/(home+away) * 100) > 2}">
            <fmt:formatNumber value="${1/(away/(home+away))}" pattern="0.0"/>
            <input type="hidden" id="t2_rate" value="${1/(away/(home+away))}">
         </c:if></c:if>배</td>
         </tr>
      </table>
      <br>
      
      <form:form commandName="toto" action="totoInsert.do" enctype="multipart/form-data" id="toto_form">
         <form:hidden path="m_seq" value="${match.m_seq}"/>
         <form:hidden path="id" value="${user_id}"/>
      
         <c:if test="${!fn:contains(myteam,match.t_name) && !fn:contains(myteam,match.m_challenger) && !empty user_id && point >= 100}">
            예상승리팀: <select id="t_winteam" name="t_winteam" class="option-box">
               <option value="${match.t_name}">${match.t_name}</option>
               <option value="${match.m_challenger}">${match.m_challenger}</option>
            </select><br>
            <c:if test="${t_winteam.value eq match.t_name}"><form:hidden path="t_rate" value="10"/></c:if>
            예상 점수 : <input type="number" name="t_score" id="t_score" class="option-box" value="0"><br>
            베팅포인트: 
            <input type="number" name="t_point" id="t_point" class="option-box"  value="100" min="100" max="${point}" step="100">
            <input type="hidden" id="final_rate" name="t_rate">
            <br><br><input type="submit" id="betting-btn" value="베팅하기" class="match-btn">
         </c:if>
         <c:if test="${!fn:contains(myteam,match.t_name) && !fn:contains(myteam,match.m_challenger) && !empty user_id && point < 100}">
            <span>포인트가 부족하여 베팅할 수 없습니다.</span><br><br>
         </c:if>
         <c:if test="${fn:contains(myteam,match.t_name) || fn:contains(myteam,match.m_challenger)}">
            <span>본인이 속한 팀에는 베팅할 수 없습니다.</span><br><br>
         </c:if>
         <input type="button" value="목록으로" class="match-btn" onclick="location.href='sportsToto.do'">
      </form:form>
   </div>
   <br><hr>
   <div align="center">
      <h4 style="font-weight:bold;">&lt; 베팅한 회원 &gt;</h4>
      <table class="detail-list">
         <tr style="background:#EAEAEA;">
            <th>아이디</th>
            <th>예상승리팀</th>
            <th>예상점수</th>
            <th>베팅포인트</th>
            <th>배당률</th>
         </tr>
         <c:if test="${!empty list}">
            <c:forEach var="list" items="${list}">
               <tr>
                  <td>${list.id}</td>
                  <td>${list.t_winteam}</td>
                  <td>${list.t_score}</td>
                  <td>${list.t_point}</td>
                  <td>${list.t_rate}</td>
               </tr>
            </c:forEach>
         </c:if>
         <c:if test="${empty list}">
            <tr>
               <td colspan="5">베팅한 회원이 없습니다.</td>
            </tr>
         </c:if>
      </table>
   </div>
</div>