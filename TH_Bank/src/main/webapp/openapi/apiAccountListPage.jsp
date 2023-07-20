<%--<%@page import="dataControl.account.dao.*"%>--%>
<%--<%@page import="dataControl.account.dto.*"%>--%>
<%@ page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오픈뱅킹 조회 계좌</title>
    <link rel="stylesheet" href="/static/css/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Mr+Dafoe" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>

        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap');
        @import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');
        .customer-form{
            text-align: center;
            margin: 20px;
            width: 50%;
            padding: 20px;
            border-radius: 5px;
            font-family: 'NanumSquareRound',  sans-serif;
            margin:0 auto;
            border:none !important;
        }
        .customer-form:active{
            transform: scale(0.95); /* Apply a scale transformation on click */
        }

        .button-form{
            padding: 10px 30px;
            background-color: #fff;
            color: #2a5298;
            border:1px solid #2a5298;
            border-radius: 20px;
            cursor: pointer;
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
    <jsp:include page="/include/mainHeader.jsp"></jsp:include>
</header>
<br><br><br><br><br><br><br><br><br><br>
<div id ="menu_wrap2">
<%
    String name = (String) session.getAttribute("name");
%>

<h1>오픈뱅킹 조회 페이지</h1>
<%
    out.println(name + " 고객님의 타행 은행 계좌 조회 결과입니다.");
%>
<br/>
<%
    String identityNum = (String) session.getAttribute("identityNum");
    String custId = (String) session.getAttribute("loggedInId");
%>
<br/><br/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(document).ready(function(){
        // Search button click event
        $('#search').click(function(){
            fetchData();
        })

        // Load data immediately on page load
        fetchData();
    })

    function fetchData() {
        var identityNum = "<%=identityNum%>";

        $.ajax({
            // url: "http://localhost:8080/openapi/v2/account/111111-1111111",
            url: "http://144.24.91.101:8080/openapi/v2/account/" + identityNum,
            method: "GET",
            data: { identityNum: identityNum },
            dataType: "json",
            success: function(data, status) {
                // alert('성공!!');
                console.log(data);
                console.log(status);

                data.forEach(function(account) {
                    var row = $("<tr>");

                    $("<td>").text(account.bankCode).appendTo(row);
                    $("<td>").text(account.accTypeName).appendTo(row);
                    $("<td>").text(account.accName).appendTo(row);
                    $("<td>").text(account.accNum).appendTo(row);
                    $("<td>").text(account.accBalance).appendTo(row);

                    var formTd = $("<td>");
                    var form1 = $("<form>").attr("action", "accountManage.bank").attr("method", "post").addClass("customer-form").appendTo(formTd);
                    var form2 = $("<form>").attr("action", "apiAccountTransferPage.bank").attr("method", "post").addClass("customer-form").appendTo(formTd);

                    $("<input>").attr("type", "hidden").attr("name", "bankCode").attr("value", account.bankCode).appendTo(form1);
                    $("<input>").attr("type", "hidden").attr("name", "accTypeName").attr("value", account.accTypeName).appendTo(form1);
                    $("<input>").attr("type", "hidden").attr("name", "accName").attr("value", account.accName).appendTo(form1);
                    $("<input>").attr("type", "hidden").attr("name", "accNum").attr("value", account.accNum).appendTo(form1);
                    $("<input>").attr("type", "hidden").attr("name", "accBalance").attr("value", account.accBalance).appendTo(form1);
                    $("<input>").attr("type", "hidden").attr("name", "accPw").attr("value", account.accPw).appendTo(form1);

                    $("<input>").attr("type", "submit").attr("value", "계좌관리").addClass("button-form").appendTo(form1);

                    $("<input>").attr("type", "hidden").attr("name", "bankCode").attr("value", account.bankCode).appendTo(form2);
                    $("<input>").attr("type", "hidden").attr("name", "accTypeName").attr("value", account.accTypeName).appendTo(form2);
                    $("<input>").attr("type", "hidden").attr("name", "accName").attr("value", account.accName).appendTo(form2);
                    $("<input>").attr("type", "hidden").attr("name", "accNum").attr("value", account.accNum).appendTo(form2);
                    $("<input>").attr("type", "hidden").attr("name", "accBalance").attr("value", account.accBalance).appendTo(form2);
                    $("<input>").attr("type", "hidden").attr("name", "accPw").attr("value", account.accPw).appendTo(form2);

                    $("<input>").attr("type", "submit").attr("value", "이체").addClass("button-form").appendTo(form2);

                    formTd.appendTo(row);

                    var tableID = "#" + account.bankCode + "-table"; // 해당 은행코드에 대한 테이블 id 생성
                    $(tableID).append(row); // 테이블에 행 추가
                });
            },
            error: function(){
                alert('실패!!');
            }
        })
    }
</script>

    <h2>타 은행 보유계좌목록</h2>

    <h3>TH은행</h3>
    <table id="TH-table" >
        <tr style="background-color:#2a5298; color:#fff; border: none; padding:10px; height:35px;">
            <th>은행코드</th>
            <th>상품분류</th>
            <th>계좌명</th>
            <th>계좌번호</th>
            <th>잔액</th>
            <th>관리</th>
        </tr>
    </table>

    <h3>ZERO은행</h3>
    <table id="ZERO-table">
        <tr style="background-color:#c69090; color:#fff; border: none; padding:10px; height:35px;">
            <th>은행코드</th>
            <th>상품분류</th>
            <th>계좌명</th>
            <th>계좌번호</th>
            <th>잔액</th>
            <th>관리</th>
        </tr>
    </table>

    <h3>HI은행</h3>
    <table id="HI-table" >
        <tr style="background-color:#666; color:#fff; border: none; padding:20px; height:35px; ">
            <th>은행코드</th>
            <th>상품분류</th>
            <th>계좌명</th>
            <th>계좌번호</th>
            <th>잔액</th>
            <th>관리</th>
        </tr>
    </table>

    <h3>ALMOND은행</h3>
    <table id="ALMOND-table" >
        <tr style="background-color:#413834; color:#fff; border: none; padding:10px; height:35px;">
            <th>은행코드</th>
            <th>상품분류</th>
            <th>계좌명</th>
            <th>계좌번호</th>
            <th>잔액</th>
            <th>관리</th>
        </tr>
    </table>

    <br><br><br>
    <button onclick="window.location.href='./Main.jsp'" class="custom-button">메인으로 돌아가기</button>
</div>
<div>
    <jsp:include page="../include/mainFooter.jsp"></jsp:include>
</div>
</body>
</html>
