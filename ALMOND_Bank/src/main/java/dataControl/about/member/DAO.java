package dataControl.about.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import jakarta.servlet.http.HttpSession;



public class DAO {
    private static DAO instance;
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    public DAO() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws Exception {
        Context context = new InitialContext();
        DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
        return dataSource.getConnection();
    }



    private void closeResources(Connection conn, Statement stmt, ResultSet rs) {
        try {
            if (rs != null)
                rs.close();
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static DAO getInstance() {
        if (instance == null) {
            instance = new DAO();
        }
        return instance;
    }

    public ArrayList<DTO> getLoggedInMember(String loggedInId) {
        ArrayList<DTO> dtos = new ArrayList<DTO>();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {

            conn = getConnection();
            String query = "SELECT * FROM customerr WHERE id = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, loggedInId);

            rs = stmt.executeQuery();
            while (rs.next()) {

                String id = rs.getString("id");
                String bankCode = rs.getString("bankCode");
                String name = rs.getString("name");
                String password = rs.getString("password");
                String identityNum = rs.getString("identityNum");
                String phoneNum = rs.getString("phoneNum");
                String email = rs.getString("email");
                String postalCode = rs.getString("postalCode");
                String address = rs.getString("address");
                String detailAddress = rs.getString("detailaddress");
                String jibunAddress = rs.getString("jibunaddress");
                String extraAddress = rs.getString("extraaddress");
                String status = rs.getString("status");
                String grade = rs.getString("grade");
                DTO dto = new DTO(id, bankCode, name, password, identityNum, phoneNum, email,
                        postalCode, address, detailAddress, jibunAddress, extraAddress, grade,
                        status);
                dtos.add(dto);

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return dtos;
    }

    public List<DTO> getViewAll() {
        List<DTO> dtos = new ArrayList<>();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();
            stmt = conn.prepareStatement("SELECT * FROM customerr");
            rs = stmt.executeQuery();

            while (rs.next()) {
                String id = rs.getString("id");
                String bankCode = rs.getString("bankCode");
                String name = rs.getString("name");
                String password = rs.getString("password");
                String identityNum = rs.getString("identityNum");
                String phoneNum = rs.getString("phoneNum");
                String email = rs.getString("email");
                String postalCode = rs.getString("postalCode");
                String address = rs.getString("address");
                String detailAddress = rs.getString("detailaddress");
                String jibunAddress = rs.getString("jibunaddress");
                String extraAddress = rs.getString("extraaddress");
                String status = rs.getString("status");
                String grade = rs.getString("grade");
                DTO dto = new DTO(id, bankCode, name, password, identityNum, phoneNum, email,
                        postalCode, address, detailAddress, jibunAddress, extraAddress, grade,
                        status);
                dtos.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }

        return dtos;
    }
    public String mailSend(String email) {
        String verificationCode = "";
        String host = "smtp.naver.com"; // 네이버 SMTP 서버
        String user = "goathp@naver.com"; // 네이버 계정
        String password = "tlqkf1!@"; // 네이버 계정 비밀번호

        // SMTP 서버 정보를 설정한다.
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.trust", "smtp.naver.com");

        props.put("mail.smtp.ssl.protocols", "TLSv1.2");


        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

            // 메일 제목
            message.setSubject("SMTP TEST");

            // 인증 번호 생성
            verificationCode = generateVerificationCode();

            // 메일 내용에 인증 번호 추가
            String mailContent = "TEST MAIL \n인증 번호는 " + verificationCode + "입니다.";
            message.setText(mailContent);

            // 메일 전송
            Transport.send(message);
            System.out.println("Success Message Sent");

        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return verificationCode;
    }

    public String generateVerificationCode() {
        Random random = new Random();
        StringBuilder sb = new StringBuilder();

        // 6자리의 난수 생성
        for (int i = 0; i < 6; i++) {
            int digit = random.nextInt(10);
            sb.append(digit);
        }

        return sb.toString();
    }
    public void increaseCount(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = getConnection();
            stmt = conn.prepareStatement("UPDATE customerr SET count = count + 1 WHERE id = ?");
            stmt.setInt(1, id);

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Count increased successfully.");
            } else {
                System.out.println("Failed to increase count.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, null);
        }
    }

    public DTO checkMemberById(String id) {
        DTO dto = null;

        try {
            conn = getConnection();
            stmt = conn.prepareStatement("SELECT * FROM customerr WHERE id = ?");
            stmt.setString(1, id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String phoneNum = rs.getString("phoneNum");
                String email = rs.getString("email");
                String identityNum = rs.getString("identityNum");
                String postalCode = rs.getString("PostalCode");
                String address = rs.getString("Address");
                String jibunAddress = rs.getString("JibunAddress");
                String detailAddress = rs.getString("DetailAddress");
                String extraAddress = rs.getString("ExtraAddress");
                String grade = rs.getString("grade");

                dto = new DTO(name, phoneNum, identityNum, email, postalCode, address, jibunAddress,
                        detailAddress, extraAddress, grade);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }

        return dto;
    }

    /*
     * public void createReply(DTO replyDto) { Connection conn = null; PreparedStatement stmt =
     * null; ResultSet rs = null;
     * 
     * try { conn = getConnection(); String insertQuery =
     * "INSERT INTO customerr (title, content, writer, groups, step, indent) " +
     * "VALUES (?, ?, ?, ?, ?, ?)"; stmt = conn.prepareStatement(insertQuery, new String[] { "ID"
     * });
     * 
     * stmt.setString(1, replyDto.getTitle()); stmt.setString(2, replyDto.getContent());
     * stmt.setString(3, replyDto.getWriter()); stmt.setInt(4, replyDto.getGroups()); stmt.setInt(5,
     * replyDto.getStep()); stmt.setInt(6, replyDto.getIndent()); stmt.executeUpdate(); rs =
     * stmt.getGeneratedKeys(); if (rs.next()) { int id = rs.getInt(1); replyDto.setId(id); }
     * 
     * System.out.println("----------------------------------------");
     * System.out.println("답변 작성 성공"); System.out.println(replyDto.getId() + replyDto.getGroups());
     * } catch (Exception e) { e.printStackTrace(); } finally { closeResources(conn, stmt, null); }
     * }
     */
    public boolean checkNaverLogin(String cp) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        boolean exists = false; // 기본값을 false

        try {
            conn = getConnection(); // DB 연결

            String sql = "SELECT * FROM customerr WHERE PHONENUM = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, cp);
            rs = stmt.executeQuery();

            if (rs.next()) {
                exists = true; // 결과가 존재하면 true로 설정, 로그인 성공 페이지로ㄱㄱ
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return exists;
    }
    public List<String> checkDuplicates(DTO dto) {
        List<String> duplicateFields = new ArrayList<>();

        try {
            conn = getConnection();
            String duplicateCheckQuery =
                    "SELECT " +
                    "    CASE WHEN EXISTS (SELECT 1 FROM customerr WHERE phoneNum = ?) THEN 'PhoneNumber' ELSE NULL END AS phoneNum_duplicate, " +
                    "    CASE WHEN EXISTS (SELECT 1 FROM customerr WHERE identityNum = ?) THEN 'IdentityNumber' ELSE NULL END AS identityNum_duplicate, " +
                    "    CASE WHEN EXISTS (SELECT 1 FROM customerr WHERE id = ?) THEN 'ID' ELSE NULL END AS id_duplicate, " +
                    "    CASE WHEN EXISTS (SELECT 1 FROM customerr WHERE email = ?) THEN 'Email' ELSE NULL END AS email_duplicate " +
                    "FROM dual";
            stmt = conn.prepareStatement(duplicateCheckQuery);
            stmt.setString(1, dto.getPhoneNum());
            stmt.setString(2, dto.getIdentityNum());
            stmt.setString(3, dto.getId());
            stmt.setString(4, dto.getEmail());
            rs = stmt.executeQuery();

            if (rs.next()) {
                String phoneNumDuplicate = rs.getString("phoneNum_duplicate");
                String identityNumDuplicate = rs.getString("identityNum_duplicate");
                String idDuplicate = rs.getString("id_duplicate");
                String emailDuplicate = rs.getString("email_duplicate");

                if (phoneNumDuplicate != null) {
                    duplicateFields.add(phoneNumDuplicate);
                }
                if (identityNumDuplicate != null) {
                    duplicateFields.add(identityNumDuplicate);
                }
                if (idDuplicate != null) {
                    duplicateFields.add(idDuplicate);
                }
                if (emailDuplicate != null) {
                    duplicateFields.add(emailDuplicate);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }

        return duplicateFields;
    }



    public boolean insertMember(DTO dto) {
        try {
            conn = getConnection();
            // 중복이 없는 경우, INSERT 쿼리 실행

            
            String insertQuery =
                    "INSERT INTO customerr (id, bankCode, password, name, identityNum, phoneNum, email, postalCode, address, jibunAddress, detailAddress, extraAddress) "
                            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(insertQuery, new String[] {"ID"});

            stmt.setString(1, dto.getId());
            stmt.setString(2, dto.getBankCode());
            stmt.setString(3, dto.getPassword());
            stmt.setString(4, dto.getName());
            stmt.setString(5, dto.getIdentityNum());
            stmt.setString(6, dto.getPhoneNum());
            stmt.setString(7, dto.getEmail());
            stmt.setString(8, dto.getPostalCode());
            stmt.setString(9, dto.getAddress());
            stmt.setString(10, dto.getJibunAddress());
            stmt.setString(11, dto.getDetailAddress());
            stmt.setString(12, dto.getExtraAddress());

            int rowsAffected = stmt.executeUpdate();

            return rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return false;
    }


    public boolean updateMember(DTO dto) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = getConnection();
            stmt = conn.prepareStatement(
                    "UPDATE customerr SET password = NVL(?, password), name = NVL(?, name), "
                            + "phoneNum = NVL(?, phoneNum), email = NVL(?, email), address = NVL(?, address), "
                            + "jibunaddress = NVL(?, jibunaddress), detailaddress = NVL(?, detailaddress), "
                            + "extraaddress = NVL(?, extraaddress), postalcode = NVL(?, postalcode), "
                            + "grade = NVL(?, grade), status = NVL(?, status) WHERE id = ?");
            stmt.setString(1, dto.getPassword());
            stmt.setString(2, dto.getName());
            stmt.setString(3, dto.getPhoneNum());
            stmt.setString(4, dto.getEmail());
            stmt.setString(5, dto.getAddress());
            stmt.setString(6, dto.getJibunAddress());
            stmt.setString(7, dto.getDetailAddress());
            stmt.setString(8, dto.getExtraAddress());
            stmt.setString(9, dto.getPostalCode());
            stmt.setString(10, dto.getGrade());
            stmt.setString(11, dto.getStatus());
            stmt.setString(12, dto.getId());

            int rowsAffected = stmt.executeUpdate();

            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, null);
        }

        return false;
    }



    public boolean deleteMember(String id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = getConnection();
            stmt = conn.prepareStatement("DELETE FROM customerr WHERE id = ?");
            stmt.setString(1, id);
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Post deleted successfully.");
                return true;
            } else {
                System.out.println("Failed to delete post. Post not found.");
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            closeResources(conn, stmt, null);
        }
    }

    public ArrayList<DTO> getLoggedInAdmin(String loggedInId) {
        ArrayList<DTO> dtos = new ArrayList<DTO>();

        try {
            conn = getConnection();
            String query = "SELECT * FROM admin WHERE adid = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, loggedInId);

            rs = stmt.executeQuery();
            while (rs.next()) {

                String id = rs.getString("adid");
                String name = rs.getString("adname");
                String password = rs.getString("adpassword");
                String email = rs.getString("ademail");

                DTO dto = new DTO(id, name, password, email);
                dtos.add(dto);

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return dtos;
    }
    public boolean isIdDuplicated(String id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean isDuplicated = false;
       
       try {
           conn = getConnection();
           String query = "SELECT COUNT(*) FROM customerr WHERE id = ?";
           pstmt = conn.prepareStatement(query);
           pstmt.setString(1, id);
           rs = pstmt.executeQuery();

           if (rs.next()) {
               int count = rs.getInt(1);
               isDuplicated = count > 0;
           }
       } catch (Exception e) {
           e.printStackTrace();
           return false;
       } finally {
           closeResources(conn, pstmt, null);
       }

       return isDuplicated;
   }
}