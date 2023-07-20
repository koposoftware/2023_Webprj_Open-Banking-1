package com.kopo.openbankapiserver.suyong.Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
    boolean execute(HttpServletRequest request, HttpServletResponse response);
}
