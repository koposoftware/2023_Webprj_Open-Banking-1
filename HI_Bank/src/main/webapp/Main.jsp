<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dataControl.about.member.DAO"%>
<%@ page import="dataControl.about.member.DTO"%>

<!DOCTYPE html>
<html>
<head>
    <title>하이뱅크</title>
    <link rel="stylesheet" href="static/css/main.css">
    <link rel="stylesheet" href="static/css/styles.css?2">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Mr+Dafoe" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@700&family=Vollkorn&display=swap" rel="stylesheet">
    <style>
        @font-face {
            src: url("https://www.axis-praxis.org/fonts/webfonts/MetaVariableDemo-Set.woff2")
            format("woff2");
            font-family: "Meta";
            font-style: normal;
            font-weight: normal;
        }
        @import 'https://fonts.googleapis.com/css?family=Baloo+Paaji';
        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap');
        @import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');

        html, body {
            display: block;
            width: 100%;
            height: 100%;
            margin: 0;

        }
    </style>
    <script>
        window.addEventListener("wheel", function(e){
            e.preventDefault();
        },{passive : false});

        var mHtml = $("html");
        var page = 1;

        mHtml.animate({scrollTop : 0}, 10);

        $(window).on("wheel", function(e) {
            if (mHtml.is(":animated")) return;
            if (e.originalEvent.deltaY > 0) {
                if (page == 7) return;
                page++;
            } else if (e.originalEvent.deltaY < 0) {
                if (page == 1) return;
                page--;
            }
            var posTop = (page - 1) * $(window).height();
            mHtml.animate({ scrollTop: posTop });
        });

    </script>
</head>
<body>
<header class="header-fixed">
    <jsp:include page="include/mainHeader.jsp"></jsp:include>
</header>
<br><br><br><br><br>

<div id ="main_wrap">
    <div class ="section" id="section1">
        <div id="main_color">
            <div id="main_body2">
                <div id=hi-container>
                    HI BANK
                    <div id=flip>
                        <div><div>HIGH IMPACT</div></div>
                        <div><div>HIGH INTELLIGENT</div></div>
                        <div><div>HIGH INSIGHTFUL</div></div>
                    </div>
                    HI BANK
                </div>

            </div>
        </div>
    </div>
    <div class="section" id="section2">
        <br><br><br><br><br><br><br><br><br>
        <hr>
        <br><br><br><br><br>

        <br><br><br><br><br><br><br><br><br>
        <br><br>
        <h1>HI뱅크만의 HI카드</h1><br>
        <h3>쓸수록 돈이 들어오는 이벤트</h3>
        <h3>놀라운 경험을 하게 될거에요.</h3>
        <br><br>
        <img src="https://i.pinimg.com/originals/30/82/dd/3082dd40cdbe3ce2a85c3d8ad661ddc0.gif" style="margin: 0 auto; text-align: center;">
        <br><br>
        <br><br><br><br><br><br><br><br><br>
        <br><br>
        <h1>HI뱅크만의 HI카드</h1><br>
        <h3>처음 만나는 HI 카드의 놀라운 혜택</h3>
        <h3>매 순간 소중한 순간을 함께</h3>
        <br>
        <img src="static/img/card.jpg" width="500px" style="margin: 0 auto; text-align: center;">
        <br><br><div id="menu-button2-1" style="margin: 0 auto; text-align: center;">더보기</div><br><br>

        <br><br><br><br><br><br><br><br><br><br><br><br>
        <h1>high결제</h1><br>
        <h3>수수료 없는 high 결제,</h3>
        <h3>소비의 새로운 경험을 시작해보세요</h3><br>
        <img src="https://payco-cdn.cdn.toastoven.net/PAYCO_CONTENTS/payco/www/img/main_gif/img_service_01.gif?1689057071830"><br><br>




        <br><br><br><br><br><br><br><br><br>
        <h1>Hime 카드</h1><br>
        <h3>소중한 시간을 지켜주는 자동 결제 시스템</h3>
        <h3>HI뱅크 HIME카드</h3>
        <img src="static/img/gift-box-y.jpg" width="500px" style="margin: 0 auto; text-align: center;">
        <div id="menu-button2" style="margin: 0 auto; text-align: center;">시작하기</div><br><br>
    </div>
</div>

<div>
    <jsp:include page="include/mainFooter.jsp"></jsp:include>
</div>
</body>
</html>