package suyoung.dwCommand;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public interface dwCommand {
    void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
