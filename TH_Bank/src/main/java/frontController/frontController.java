package frontController;

import java.io.IOException;
import java.io.PrintWriter;
import Command.Command;
import Command.ErrorCommnad;
import Command.MainCommand;
import Command.accounts.AccountManageCommand;
import Command.accounts.BankInsertCommand;
import Command.accounts.BankTimeDepositCommand;
import Command.accounts.accountInputCommand;
import Command.accounts.accountSelectCommand;
import Command.accounts.change.AccTransOkCommand;
import Command.accounts.change.AccTransSelectCommand;
import Command.accounts.pw.PwCheckInputCommand;
import Command.accounts.pw.PwCheckOkCommand;
import Command.accounts.pw.PwUpdateInputCommand;
import Command.accounts.pw.PwUpdateOkCommand;
import Command.join.joinCommand;
import Command.join.joinInputCommand;
import Command.login.loginCommand;
import Command.login.loginInputCommand;
import Command.login.logoutMember;
import Command.manage.users.checkMemberByIdCommand;
import Command.manage.users.deleteMember;
import Command.manage.users.manageMember;
import Command.manage.users.manageMemberInput;
import Command.openapi.ApiAccountListCommand;
import Command.openapi.ApiAccountTransferCommand;
import dataControl.about.member.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import naver.login.naverLoginCommand;
import suyoung.dwCommand.TradeSelectCommand;

/**
 * Servlet implementation class frontController
 */

@WebServlet("*.bank")
public class frontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public frontController() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        actionDo(request, response);

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        actionDo(request, response);
    }

    private void actionDo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uri = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = uri.substring(contextPath.length());
        // Command 객체 생성
        Command Command = null;
        System.out.println(command);
        if (command.equals("/join.bank")) {
            Command = new joinCommand();
        } else if (command.equals("/Main.bank")) {
            Command = new MainCommand();
        } else if (command.equals("/joinInput.bank")) {
            Command = new joinInputCommand();
        }
        else if (command.equals("/Main.bank")) {
            Command = new MainCommand();
        }
        else if (command.equals("/loginInput.bank")) {
            Command = new loginInputCommand();
        }
        else if (command.equals("/login.bank")) {
            Command = new loginCommand();
        } 
        else if (command.equals("/timeDepositSelect.bank")) {   
            Command = new BankTimeDepositCommand();
        }
        else if (command.equals("/naverLogin.bank")) {
            Command = new naverLoginCommand();
        }
        else if (command.equals("/accountInput.bank")) {
            Command = new accountInputCommand();
        }
        else if (command.equals("/insertAccount.bank")) {
            Command = new BankInsertCommand();
        }
        else if (command.equals("/checkMemberById.bank")) {
            Command = new checkMemberByIdCommand();
        }
        else if (command.equals("/manageMemberInput.bank")) {
            Command = new manageMemberInput();
        }
        else if (command.equals("/manageMember.bank")) {
            Command = new manageMember();
        }
        else if (command.equals("/deleteMember.bank")) {
            Command = new deleteMember();
        }        
        else if (command.equals("/logout.bank")) {
            Command = new logoutMember();
        }
        else if (command.equals("/accountSelect.bank")) {
            Command = new accountSelectCommand();
        }
        else if (command.equals("/accountManage.bank")) {
            Command = new AccountManageCommand();
        }
        else if (command.equals("/pwUpdateInput.bank")) {
            Command = new PwUpdateInputCommand();
        }
        else if (command.equals("/pwUpdateOk.bank")) {
            Command = new PwUpdateOkCommand();
        }
        else if (command.equals("/pwCheckInput.bank")) {
            Command = new PwCheckInputCommand();
        }
        else if (command.equals("/pwCheckOk.bank")) {
            Command = new PwCheckOkCommand();
        }
        else if (command.equals("/checkDuplicateId.bank")) {
            DAO dao = DAO.getInstance();
            String uId = request.getParameter("id");
            System.out.println(uId);

            boolean ckResult = dao.isIdDuplicated(uId);
            System.out.println(ckResult + ": id 중복체크 실행");
            // request.setAttribute("ckResult", ckResult);

            // AJAX 응답 처리
            response.setContentType("text/plain"); // JSON 혹은 다른 형태의 응답을 반환하려면 콘텐트 타입을 적절히 변경
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print(ckResult); // boolean 값 반환. 필요에 따라 String 으로 변환할 수 있음.
            out.flush();
          }
        // 관리하기 (다른 상품으로 전환) 
        else if (command.equals("/accTransSelect.bank")) {
            Command = new AccTransSelectCommand();
        }
        else if (command.equals("/accTransOk.bank")) {
            Command = new AccTransOkCommand();
        }
        else if (command.equals("/mail.bank")) {
            String email = request.getParameter("email");
            HttpSession session = request.getSession();
            PrintWriter out;
            // TODO Auto-generated method stub
            DAO service = DAO.getInstance();

            String verifyCode = service.mailSend(email);
            System.out.println(verifyCode);
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            out = response.getWriter();
            out.print(verifyCode);
            out.flush();
        }
        else if (command.equals("/apiAccountListPage.bank")) {
            Command = new ApiAccountListCommand();
        }
        else if (command.equals("/apiAccountTransferPage.bank")) {
            Command = new ApiAccountTransferCommand();
        }
        else if (command.equals("/tradeSelect.bank")) {
            Command = new TradeSelectCommand();
        }
        else {
            System.out.println("Invaild Command!!!!!!");
            Command = new ErrorCommnad();
        }

        // Command 실행
        if (Command != null) {  
            Command.execute(request, response);
            String viewPage = Command.getViewPage();
            System.out.println(viewPage);
            request.getRequestDispatcher(viewPage).forward(request, response); // 뷰 페이지로 포워딩

        } else {
            // 유효하지 않은 command 처리에 대한 예외 처리
            // 예: response.sendRedirect("error.jsp");
        }
    }
}

