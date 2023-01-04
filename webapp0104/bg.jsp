<%@ page contentType="text/html;charset=utf-8" %>
    <!-- 문서 파일이야/ html 형식이야 / 다국어를 지원하는 utf-8이야
   윗 부분은 헤드 부분, 밑에서 부터는 몸체로 들어감 -->
<%
        //색상 배열 선언
        String[] bgArray={"red", "orange", "yellow","green", "blue","navy", "purple"};
      
        // 클라이언트의 파라미터 넘겨받기
        // 웹상으로 전송된 모든 파라미터(숫자형도!!)는 문자열이다
        String bg = request.getParameter("bg");
        out.print("넘어온 bg 값 : " + bg);
%>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <script>
            //서버에 bg.jsp라는 jsp에 파라미터 전송
            //Get(얻는다) 방식으로 보내도 된다. 보안상 중요하지 않고, 양이 맣ㅇ지 않기 때문에..
            //마치 편지봉투에 간단한 메시지를 적는 것과 같다 (봉투는 노출되므로)
            //header 타고 전송한다고 표현함
            //get ->서버에 있는 정보를 달라고 요청하는 것. 전송용이 아님
           
            function setBg(){
                //선택한 셀렉트 박스의 값
                let sel = document.querySelector("select");
                location.href="/bg.jsp?bg="+sel.value;
            }

        </script>
    </head>

    <body bgcolor="<%=bg%>">
        <select name="" id="">
            <%for(int i=0; i<bgArray.length; i++){%>
            <option value="<%=bgArray[i]%>"><%=bgArray[i]%></option>
            <%}%>
        </select>
        <button onclick="setBg()">배경변경</button>
    </body>

    </html>