package com.kopo.openbankapiserver.suyong.Command;

import com.kopo.openbankapiserver.suyong.DAODTO.OpenBankingDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TransferCommand implements Command {
    private String wBankCode;
    private String wAccountNumber;
    private String wName;
    private String transferAmount;
    private String dBankCode;
    private String dAccountNumber;
    private String dName;

    public void setParameters(String wBankCode, String wAccountNumber, String wName, String transferAmount,
                              String dBankCode, String dAccountNumber, String dName) {
        this.wBankCode = wBankCode;
        this.wAccountNumber = wAccountNumber;
        this.wName = wName;
        this.transferAmount = transferAmount;
        this.dBankCode = dBankCode;
        this.dAccountNumber = dAccountNumber;
        this.dName = dName;
    }

    @Override
    public boolean execute(HttpServletRequest request, HttpServletResponse response) {
        OpenBankingDAO dao = new OpenBankingDAO();
        boolean result = false;

        switch (dBankCode) {
            case "TH":
                result = dao.withdrawToBank01(dAccountNumber, transferAmount, wAccountNumber, wBankCode);
                break;
            case "ZERO":
                result = dao.withdrawToBank02(dAccountNumber, transferAmount, wAccountNumber, wBankCode);
                break;
            case "HI":
                result = dao.withdrawToBank03(dAccountNumber, transferAmount, wAccountNumber, wBankCode);
                break;
            case "ALMOND":
                result = dao.withdrawToBank04(dAccountNumber, transferAmount, wAccountNumber, wBankCode);
                break;
            default:
                // handle error
                break;
        }
        /* boolean result를 OpenBankingFrontController에 반환하도록 코드 주석처리
        try {
            // Send response
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(new Gson().toJson(result));
        } catch (IOException e) {
            e.printStackTrace();
        }
        */
        return result;  // 결과 반환
    }
}
