package openapi.frontcontroller.account;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import dataControl.account.dto.AccountDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/request/account")
public class FrontControllerRequestAccount extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final OkHttpClient client = new OkHttpClient();
    private final Gson gson = new Gson();

    public FrontControllerRequestAccount() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String identityNum = request.getParameter("identityNum");

        String url = "http://144.24.91.101:8080/openapi/v2/account/" + identityNum;


        Request okHttpRequest = new Request.Builder().url(url).get().build();

        List<AccountDTO> accountInfos = new ArrayList<>();

        try {
            Response okHttpResponse = client.newCall(okHttpRequest).execute();
            if (okHttpResponse.isSuccessful() && okHttpResponse.body() != null) {
                Type listType = new TypeToken<ArrayList<AccountDTO>>() {}.getType();
                accountInfos = gson.fromJson(okHttpResponse.body().string(), listType);

                // Account Information 출력
                System.out.println("Account Information: " + accountInfos);

            } else {
                throw new IOException("Unexpected code " + okHttpResponse);
            }
        } catch (IOException e) {
            // 에러 메시지 출력
            System.out.println("Failed to get account information: " + e.getMessage());
            throw new ServletException("Failed to get account information", e);
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(gson.toJson(accountInfos));
    }
}
