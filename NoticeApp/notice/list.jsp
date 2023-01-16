<!--아래와 같이 DOCTYPE 붙으면 html5를 의미하고, html5 차세대 html로써 스마트폰 등의 다양한 디바이스에 호환되도록 지원-->
<%@ page contentType="text/html;charset=utf-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
      table {
        border-collapse: collapse;
        border-spacing: 0;
        width: 100%;
        border: 1px solid #ddd;
      }

      th,
      td {
        text-align: left;
        padding: 16px;
      }

      tr:nth-child(even) {
        background-color: #f2f2f2;
      }

      table {
        position: relative;
        left: -500px;
      }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script>
      $(document).ready(functon(){
        //("css의 선택자").()메서드
        $("table").animate({ left: '0px' });

      });

    </script>
  </head>

  <body>


    <table>
      <tr>
        <th>No</th>
        <th>제목</th>
        <th>작성자</th>
        <th>등록일</th>
        <th>조회수</th>
      </tr>
      <tr>
        <td>Jill</td>
        <td>Smith</td>
        <td>50</td>
      </tr>
      <tr>
        <td>Eve</td>
        <td>Jackson</td>
        <td>94</td>
      </tr>
      <tr>
        <td>Adam</td>
        <td>Johnson</td>
        <td>67</td>
      </tr>
    </table>

  </body>

  </html>