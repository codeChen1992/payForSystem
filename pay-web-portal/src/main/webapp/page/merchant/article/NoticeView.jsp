<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告</title>
<%@include file="/page/include/headScript.jsp"%>
</head>
<jsp:include page="/page/include/TopMenuLogged.jsp"></jsp:include>
<div class="NewsMain">
	<div class="left">
		<div class="conection1">
			<div class="NewsTile">客服热线</div>
			<div class="conIMG"></div>
			<div class="cont">
				<p>客服电话：${COMPANY_TEL }</p>
				<p class="word-break">客服邮箱：${COMPANY_EMAIL }</p>
			</div>
			<br style="clear:both;" />
		</div>
		<div class="ht"></div>
		<div class="conection1">
			<div class="NewsTile">联系地址</div>
			<div class="conIMG2"></div>
			<div class="cont">
				<p>地址：${COMPANY_ADDRESS }</p>
				<p>邮编：510050</p>
			</div>
			<br style="clear:both;" />
		</div>
		<br style="clear: both" />
	</div>
	<div class="right">
		<div class="article">
			<div class="title">
				<div class="NoticeTit">${article.title }</div>
				<div class="NoticeTime">
					<fmt:formatDate value="${article.createTime}" pattern="yyyy-MM-dd" />
				</div>
			</div>
			<div class="content">${article.content}</div>
			<br style="clear: both;" />
		</div>
		<br style="clear: both" />
	</div>
	<br style="clear: both" />
</div>

<div class="ht1"></div>
<jsp:include page="../../foot.jsp" />
</body>
</html>
