package com.kopo.openbankapiserver.suyong.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonSyntaxException;
import com.kopo.openbankapiserver.suyong.Command.TransferCommand;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

@WebServlet("/OpenBankingAPI")
//@RestController()
//@RequestMapping("/OpenBankingAPI")
//@CrossOrigin(origins = "http://test.com")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class OpenBankingFrontController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("get으로는 들어오나?");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("요청이 도착했습니다."); // 요청 응답을 하기 위해서 넣은 코드

        // CORS 헤더 설정
//        setAccessControlHeaders(response);

        BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
        String json = reader.readLine();
        reader.close();

        Gson gson = new Gson();
        JsonObject jsonObj = null;

        try {
            jsonObj = gson.fromJson(json, JsonObject.class);
        } catch (JsonSyntaxException e) {
            e.printStackTrace();
        }

        if (jsonObj != null) {
            String wBankCode = jsonObj.get("wBankCode").getAsString();
            String wAccountNumber = jsonObj.get("wAccountNumber").getAsString();
            String wName = jsonObj.get("wName").getAsString();
            String transferAmount = jsonObj.get("transferAmount").getAsString();
            String dBankCode = jsonObj.get("dBankCode").getAsString();
            String dAccountNumber = jsonObj.get("dAccountNumber").getAsString();
            String dName = jsonObj.get("dName").getAsString();

            TransferCommand transferCommand = new TransferCommand();
            transferCommand.setParameters(wBankCode, wAccountNumber, wName, transferAmount, dBankCode, dAccountNumber, dName);
            boolean result = transferCommand.execute(request, response);  // 결과 받기

            JsonObject responseJson = new JsonObject();
            responseJson.addProperty("result", result ? "success" : "fail");

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(new Gson().toJson(responseJson));  //응답 바디에 JSON 데이터를 쓰는 코드
            System.out.println("dwCheck.jsp에 응답 : " + responseJson); //responseJson은 이체의 성공 여부를 나타내는 JSON 객체
        }
    }

//    //여기서부터는 CORS문제때문에 추가한 코드, 클라우드 구현시 삭제
//    //preflight 요청을 처리하기 위한 doOptions 메소드 추가
//    @Override
//    protected void doOptions(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        setAccessControlHeaders(resp);
//        resp.setStatus(HttpServletResponse.SC_OK);
//    }
//
//    // CORS 설정을 위한 메소드
//    private void setAccessControlHeaders(HttpServletResponse response) {
//        response.addHeader("Access-Control-Allow-Origin", "*");
//        response.addHeader("Access-Control-Allow-Methods", "GET, POST, DELETE, PUT, PATCH, HEAD");
//        response.addHeader("Access-Control-Allow-Headers", "Content-Type");
//        response.addHeader("Access-Control-Expose-Headers", "Access-Control-*");
//        response.addHeader("Access-Control-Allow-Credentials", "true");
//        response.addHeader("Access-Control-Max-Age", "60");
//    }
}











