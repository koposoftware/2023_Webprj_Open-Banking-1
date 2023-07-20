package suyoung.dwFrontController;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import suyoung.dwCommand.DTAccountCommand;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/deposit")
public class dwFrontControllerDeposit extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("입금될 은행에 요청이 도착했습니다."); // 요청 응답을 하기 위해서 넣은 코드
        StringBuilder sb = new StringBuilder();
        BufferedReader br = request.getReader();
        String str;
        while( (str = br.readLine()) != null ){
            sb.append(str);
        }
        JsonObject jobj = new Gson().fromJson(sb.toString(), JsonObject.class);
        String dAccountNumber = jobj.get("dAccountNumber").getAsString();
        String transferAmount = jobj.get("transferAmount").getAsString();
        String wAccountNumber = jobj.get("wAccountNumber").getAsString();
        String wBankCode = jobj.get("wBankCode").getAsString();

        boolean result = new DTAccountCommand().execute(dAccountNumber, transferAmount, wBankCode, wAccountNumber);

        // Send response
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new Gson().toJson(result));
    }
}
