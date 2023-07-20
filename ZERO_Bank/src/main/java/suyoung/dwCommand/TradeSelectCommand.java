package suyoung.dwCommand;

import Command.Command;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class TradeSelectCommand implements Command {
    private String viewPage = null;
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("TradeSelectCommand 들오는것 확인");

//        viewPage = "/openapi/apiAccountTransferPage.jsp";
        viewPage = "/suyoung/tradeSelect.jsp";
    }

    @Override
    public String getViewPage() {
        if (viewPage == null) {
            viewPage = "../error.jsp";
        }
        return viewPage;
    }
}
