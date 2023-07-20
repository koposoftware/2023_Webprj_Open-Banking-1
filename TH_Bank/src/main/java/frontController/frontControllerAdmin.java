package frontController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import Command.Command;
import Command.MainCommand;
import Command.admin.CheckAllMemberCommand;
import Command.join.joinCommand;

/**
 * Servlet implementation class frontControllerAdmin
 */

@WebServlet("*.bankadmin")
public class frontControllerAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public frontControllerAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uri = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = uri.substring(contextPath.length());
        // Command 객체 생성
        Command Command = null;
        System.out.println(command);
        if (command.equals("/manageAdmin.bankadmin")) {
            Command = new CheckAllMemberCommand();
        } else if (command.equals("/checkAllmember.bank")) {
            Command = new MainCommand();
        } else if (command.equals("/logout.bank")) {
            Command = new MainCommand();
        } else {
            
        }
        if (Command != null) {  
            Command.execute(request, response);
            String viewPage = Command.getViewPage();
            request.getRequestDispatcher(viewPage).forward(request, response); 
        } else {

        }
    }
	} 

