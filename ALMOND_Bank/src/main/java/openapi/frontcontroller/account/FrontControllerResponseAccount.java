package openapi.frontcontroller.account;

import com.google.gson.Gson;
import dataControl.account.dto.AccountDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import openapi.service.account.ApiAccountService;
import openapi.service.account.ApiAccountServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet("/response/account")
public class FrontControllerResponseAccount extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final Gson gson = new Gson();
    private final ApiAccountService apiAccountService = new ApiAccountServiceImpl();

    public FrontControllerResponseAccount() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String identityNum = request.getParameter("identityNum");
        System.out.println("controller > identityNum: " + identityNum);

        List<AccountDTO> accountInfos = apiAccountService.listAccount(identityNum);
        System.out.println("controller > accountInfos: " + accountInfos);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(gson.toJson(accountInfos));
        System.out.println("controller > response: " + response);
    }

}
