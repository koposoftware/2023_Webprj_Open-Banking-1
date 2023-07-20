package com.kopo.openbankapiserver.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;


@Data // Lombok - getter/setter 자동생성
//@RequiredArgsConstructor // Lombok - 초기화 되지 않은 final 필드 생성자 생성
@NoArgsConstructor
//@AllArgsConstructor
public class ApiKeyDto {
//    String a = UUID.randomUUID().toString();

//    private final String apikey;
//    @JsonProperty(value="apikey")
    private String apikey;
//    private final String bank1Id;
//    private final String bank2Id;
//    private final String bank3Id;
//    private final String bank4Id;
    private String bank1Id;
    private String bank2Id;
    private String bank3Id;
    private String bank4Id;



}
