package co.kr.khaki.common.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MultiplePhotoUpload {
	
    // 다중파일업로드
    @RequestMapping(value = "/file_uploader_html5.do",
                  method = RequestMethod.POST)
    @ResponseBody
    public String multiplePhotoUpload(HttpServletRequest request) {
        // 파일정보
        StringBuffer sb = new StringBuffer();
        try {
            // 파일명을 받는다 - 일반 원본파일명
            String oldName = request.getHeader("file-name");
            // 파일 기본경로 _ 상세경로
            //String filePath = "D:/min/project3/khaki/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/khaki/resources/photoUpload/";	//종합본에서의 filepath
            String filePath = "D:/projectKHAKI/egit/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/khaki/resources/photoUpload/";	//노트북시 서버경로

            //String filePath = "D:/jeongds/ffinal/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/khaki/resources/photoUpload/";	// 다솔 파일 업로더

            //String filePath = "D:/jeongds/final/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/khaki/resources/photoUpload/";	// 다솔 파일 업로더
            //String filePath = "C:/park_egov/eGovFrameDev-3.8.0-64bit/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/khaki/resources/photoUpload/";	// 준영 파일 업로더

            
            //서버경로로 설정
            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
                          .format(System.currentTimeMillis()))
                          .append(UUID.randomUUID().toString())
                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
            InputStream is = request.getInputStream();
            OutputStream os = new FileOutputStream(filePath + saveName);
            int numRead;
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            while ((numRead = is.read(b, 0, b.length)) != -1) {
                os.write(b, 0, numRead);
            }
            os.flush();
            os.close();
            // 정보 출력
            sb = new StringBuffer();
            sb.append("&bNewLine=true")
              .append("&sFileName=").append(oldName)
              .append("&sFileURL=").append("/khaki/resources/photoUpload/")
        .append(saveName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
	
}
