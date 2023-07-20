package com.kopo.openbankapiserver.controller;

import com.google.gson.*;
import com.google.gson.reflect.TypeToken;
import com.kopo.openbankapiserver.dto.AccountDto;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Type;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController()
@RequestMapping("/openapi/v2")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class AccountController extends HttpServlet {

    // OkHttpClient와 Gson 객체 생성
    private final OkHttpClient client = new OkHttpClient();
    private final Gson gson =
            new GsonBuilder().registerTypeAdapter(Date.class, new JsonDeserializer() {
                DateFormat df = new SimpleDateFormat("MMM dd, yyyy", Locale.ENGLISH);

                @Override
                public Date deserialize(final JsonElement json, final Type typeOfT,
                                        final JsonDeserializationContext context) throws JsonParseException {
                    try {
                        return df.parse(json.getAsString());
                    } catch (ParseException e) {
                        throw new JsonParseException(e);
                    }
                }
            }).create();


    @GetMapping("/account/{identityNum}")
    public String accountMenu(@PathVariable String identityNum, HttpServletResponse response) throws IOException {
        System.out.println("은행A->OpenApi서버 GET으로 요청 도착 완료");
        System.out.println("identityNum: " + identityNum);
        // 아이디 조회한 계좌정보들을 담을 List
        List<AccountDto> accountInfos = new ArrayList<>();

        List<String> bankApiUrls =
                List.of("http://144.24.75.25:8081", "http://144.24.75.25:8082",
                        "http://144.24.91.101:8083", "http://144.24.91.101:8084");
//                List.of("http://144.24.75.25:8080", "http://144.24.75.25:8082",
//                        "http://144.24.75.25:8083", "http://144.24.75.25:8084",
//                        "http://144.24.75.25:8085");

        // 각 은행의 API로 요청을 보내고 응답 받아와 List에 추가
        for (String bankApiUrl : bankApiUrls) {
            String bankResponse = sendGetRequest(bankApiUrl, identityNum);
            System.out.println("bankResponse: " + bankResponse);
            Type listType = new TypeToken<ArrayList<AccountDto>>() {}.getType();
            List<AccountDto> bankAccountInfos = gson.fromJson(bankResponse, listType);
            accountInfos.addAll(bankAccountInfos);
            System.out.println("accountInfos: " + accountInfos);
        }

        // C서버에서 받은 데이터를 JSON 형태로 변환
        String jsonResponse = gson.toJson(accountInfos);

        // JSON 형태의 응답을 클라이언트에게 반환
        return jsonResponse;

//        // JSON 형태로 변환 후 응답
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//        response.getWriter().write(gson.toJson(accountInfos));
    }

    // 은행 API에 Get 요청을 보내고 응답 받는 메소드
    private String sendGetRequest(String bankApiUrl, String identityNum) throws IOException {
        // OkHttp를 이용해 Get 요청
        Request request = new Request.Builder()
                .url(bankApiUrl + "/response/account?identityNum=" + identityNum).get().build();

        System.out.println("오픈API->은행B");
        System.out.println("은행B->오픈API");
        // 요청 보내고 응답 받기
        try (Response response = client.newCall(request).execute()) {
            if (response.isSuccessful() && response.body() != null) {
                return response.body().string();
            } else {
                throw new IOException("Unexpected code " + response);
            }
        }
    }
}
