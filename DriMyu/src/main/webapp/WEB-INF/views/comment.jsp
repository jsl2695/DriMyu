<%-- <%@ page language="java" import="java.net.*,java.io.*,java.sql.*, java.lang.*,java.util.*,javax.naming.*,javax.sql.DataSource" 
contentType="text/html;charset=euc-kr" pageEncoding="EUC-KR" %>
<html>
<head>
    <title>댓글 작성</title>
    <script language='javascript'>
        function load() {
            document.form.id.focus();
        }

        function writeComment() {
            // 댓글 작성 액션을 호출하도록 수정
            document.form.action='comment_write.jsp?boardIdx=<%=request.getParameter("boardIdx")%>&commentNum=<%=request.getParameter("commentNum")%>';
            document.form.submit();
        }

        // 기타 함수들은 필요에 따라 수정
    </script>
</head>

<body onload='load()'>
    <center>
        <p align="center">&nbsp;</p>
        <h1>댓글 작성</h1>
        <hr>
        <p><p>
        <form method="post" name="form">
            <center>
                <table border="1" cellspacing="3" cellpadding="0" width="500" bgcolor="#FFCCFF">
                    <tr>
                        <th width="90" height="20">이 름</th>
                        <td width="300" height="20"><input type="text" name="id" size="10" maxlength="5"></td>
                    </tr>
                    <tr>
                        <th width="90" height="20">댓글 내용</th>
                        <td width="300" height="20">
                            <textarea cols="50" rows="10" name="commentContent" style="border-width:1; border-style:solid; background-image: url(line.gif); "></textarea>
                        </td>
                    </tr>
                </table>
            </center>
        </form>
        <P><P>&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="hidden" name="boardIdx" value="<%=request.getParameter("boardIdx")%>">
        <input type="hidden" name="commentNum" value="<%=request.getParameter("commentNum")%>">
        <input type="button" value="댓글 작성" onclick="writeComment()">
        <!-- 필요한 버튼 등을 추가하고 함수 호출 부분 수정 -->
    </center>
</body>
</html>
 --%>