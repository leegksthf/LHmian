<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/js/cubeportfolio/cubeportfolio.min.css">
<!-- Style Customizer's stylesheets -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/js/style-customizer/css/spectrum.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/js/style-customizer/css/style-customizer.css">
<link rel="stylesheet/less" type="text/css"
	href="${pageContext.request.contextPath}/less/skin.less">
<script
	src="${pageContext.request.contextPath}/resources/js/style-customizer/js/spectrum.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/cubeportfolio/jquery.cubeportfolio.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/cubeportfolio/masonry.js"></script> --%>

<style>
.cbp-caption-defaultWrap, .cbp-caption-activeWrap {
	-webkit-transition: -webkit-transform 0.6s
		cubic-bezier(0.19, 1, 0.22, 1);
	transition: transform 0.6s cubic-bezier(0.19, 1, 0.22, 1);
}

.cbp-caption-defaultWrap {
	position: relative;
}

.statusDone {
	-webkit-filter: grayscale(80%);
}

.cbp-item:hover .cbp-caption-defaultWrap {
	-webkit-transform: translateY(-30px);
	transform: translateY(-30px);
}

.cbp-item:hover .cbp-caption-activeWrap {
	-webkit-transform: translateY(-57px);
	transform: translateY(-57px);
}



.cbp-item {
	margin-bottom:30px;
	width: 300px;
	height: 300px;
	overflow: hidden;
}

.status {
	display: inline-block;
}

.void {
	white-space: pre-wrap;
	height:135px;
	overflow:hidden
}

h4 {
margin : 0 0 0;
}


.pl-title-line-1 {
	margin: 10px auto 10px auto;
}


.bg2-featurebox-3 .postinfo-box{
	padding: 35px !important;
	height: 300px;
	position: relative;
}

.img-responsive{
	width:100%
}

button{
	padding: 4px 13px !important;
	border-radius: 4px !important;
}

.update-btn{
	position: absolute;
	bottom:0;
	left:50%;
	margin-bottom:20px;
}

.img-gray {
	-webkit-filter: grayscale(100%);
	filter: gray;
	position:relative;
	
}

.image-gray .text {
  position:absolute;
  top:40px;
  left:80px;
}


.trans-15 {
	background-color: rgba(0, 0, 0, 0.15) !important;
}
.text-in {
/* 	padding: 5px 10px; */
	background-color: black;
	text-align: center;
	position: absolute;
	color: white;
	font-size: 20px;
	font-weight: 400;
	top: 90%;
	width: 100%;
}
.img-box {
	position: relative;
}

</style>

<div class="header-inner-tmargin">
	<section class="section-side-image clearfix">
		<div class="img-holder col-md-12 col-sm-12 col-xs-12">
			<div class="background-imgholder" style="background: url(${pageContext.request.contextPath }/resources/images/header/헤더푸터2.jpg);">
				<img class="nodisplay-image" src="${pageContext.request.contextPath }/resources/images/header/헤더푸터2.jpg" alt="" />
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12 clearfix nopadding">
					<div class="header-inner trans-15">
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class=" clearfix"></div>
</div>
	<section>
		<div class="pagenation-holder">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<ol class="breadcrumb-gray">
							<li><a href="${pageContext.request.contextPath}/">Home</a></li>
							<li><a href="${pageContext.request.contextPath}/office/office">관리 사무소</a></li>
							<li class="current"><a href="${pageContext.request.contextPath}/itemLost/lostList">분실물 보관소</a></li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="sec-padding section-light">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 nopadding">
					<div class="sec-title-container-padding-topbottom text-center">
						<div class="pl-title-line-1"></div>
						<h4 class="uppercase font-weight-7 less-mar-1">분실물 보관소</h4>
						<div class="clearfix"></div>
						<p class="by-sub-title" style="font-size: 13px;">주인을 기다리고 있어요. <br>분실물은 관리사무소에서 찾아가세요~~!</p>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>

    <section class="section-light">
      <div class="container">
        <div class="row">
        <c:forEach items="${lost}" var="item">
			<c:if test="${item.lostStatus eq '수령전'}">
          <div class="col-md-4 col-sm-6 col-xs-12"> 
           <div class="bg2-featurebox-3">
              <div class="img-box">
               <img src="${pageContext.request.contextPath}/lost_img/${item.lostFile}" alt="" class="img-responsive"/> </div>
              <div class="postinfo-box">
                <!-- <h4 class="dosis uppercase title"><a href="#">Aliquam Rhoncus</a></h4> -->
                <div class="blog-post-info"><span><i class="fas fa-map-marker-alt"></i>&nbsp 습득장소: </span></div>
                <div class="blog-post-info"><span><i class="bi bi-calendar-check"></i> 습득일자: ${item.lostDate}</span></div>
                <br/>
                <p class="void">${item.lostContent}</p>
            </div>
            </div>
            </div>
            </c:if>
            </c:forEach>
            <br>
                   <c:forEach items="${lost}" var="item">
			<c:if test="${item.lostStatus eq '수령완료'}">
          <div class="col-md-4 col-sm-6 col-xs-12"> 
           <div class="bg2-featurebox-3">
              <div class="img-box">
               <img src="${pageContext.request.contextPath}/lost_img/${item.lostFile}" alt="" class="img-responsive img-gray"/> 
               	<div class="text-in"><p>수령완료</p></div>
               </div>
              <div class="postinfo-box">
                <!-- <h4 class="dosis uppercase title"><a href="#">Aliquam Rhoncus</a></h4> -->
                 <div class="blog-post-info"><span><i class="fas fa-map-marker-alt"></i>&nbsp 습득장소: </span></div>
                <div class="blog-post-info"><span><i class="bi bi-calendar-check"></i> 습득일자: ${item.lostDate}</span></div>
                <br/>
                 <p class="void">${item.lostContent}</p>
            </div>
            </div>
            </div>
            </c:if>
            </c:forEach>
          </div>
        </div>
    </section>
    <div class="clearfix"></div>
    <!-- end section -->
</section>


<script>
	var amount = 0;
	var lostCount = 0;
	var pageNum = 0;
	
	$(function() {
		
		lostList();
		
		$.ajax({
			url : "lostCount",
			method : "get",
			success : function(data) {
				lostCount = data;
			}
		});
	});
</script>





<%-- 		<div class="container" align="center">
			<div class="text-box white padding-4 col-7">
		<c:forEach items="${lost}" var="item">
			<c:if test="${item.lostStatus eq '수령전'}">
				<div class="status">
					<div class="cbp-item web-design">
						<div class="cbp-caption-defaultWrap">
							<img src="${pageContext.request.contextPath}/lost_img/${item.lostFile}" alt="">
						</div>
						<div class="cbp-caption-activeWrap">
							<div class="cbp-l-caption-alignCenter">
								<div class="cbp-l-caption-body">
									<div class="cbp-l-caption-title void">${item.lostContent}</div>
									<div class="cbp-l-caption-desc">작성일자 : ${item.lostDate}</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12">
					<button type="button" class="btn btn-border light" onclick="lostModify(${item.lostNo})">수정</button>
					</div>
				</div>
			</c:if>
		</c:forEach>
		<br>
		<c:forEach items="${lost}" var="item">
			<c:if test="${item.lostStatus eq '수령완료'}">
				<div class="status">
					<div class="cbp-item web-design statusDone">
						<div class="cbp-caption-defaultWrap">
							<img src="${pageContext.request.contextPath}/lost_img/${item.lostFile}" alt="">
						</div>
						<div class="cbp-caption-activeWrap">
							<div class="cbp-l-caption-alignCenter">
								<div class="cbp-l-caption-body">
									<div class="cbp-l-caption-title void">${item.lostContent}</div>
									<div class="cbp-l-caption-desc">작성일자 : ${item.lostDate} / 수정일자 : ${item.lostUpdate}</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
		<div class="col-sm-12" align="center">
	<button type="button" id="register" class="btn btn-default">등록</button>
		</div>
	</div>
	</div>
	</section>
	<section class="sec-padding section-light"> --%>
	
	

	
	
<!-- Template's stylesheets -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/megamenu/stylesheets/screen.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme-default.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/loaders/stylesheets/screen.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/blog2.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/font-awesome/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/Simple-Line-Icons-Webfont/simple-line-icons.css" media="screen" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/et-line-font/et-line-font.css">
<link href="${pageContext.request.contextPath}/resources/js/owl-carousel/owl.carousel.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/js/tabs/css/responsive-tabs.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/js/cubeportfolio/cubeportfolio.min.css">
<!-- Scripts --> 
<script src="${pageContext.request.contextPath}/resources/js/jquery/jquery.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/less/less.min.js" data-env="development"></script> 
<script src="${pageContext.request.contextPath}/resources/js/sticky/js/jquery.sticky.js"></script> 
<!-- Scripts END --> 
<script src="${pageContext.request.contextPath}/resources/js/functions/functions.js"></script>