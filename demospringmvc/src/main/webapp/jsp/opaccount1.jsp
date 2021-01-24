<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery.form/4.3.0/jquery.form.js"></script>
</head>
<body>
<%--JSP实现--%>
<%
    String title = request.getParameter("mytitle");
%>
<p ><%=title%></p>
<%if(title.equals("开户")){%>
<script>
    document.myform.action="http://localhost:8080/springmvc/openaccount";
</script>
<%}else{%>
<script>
    document.myform.action="http://localhost:8080/springmvc/closeaccount";
</script>
<%}%>

<%--等效JS实现--%>
<%--<input type="hidden" id="data" value="<%=request.getParameter("mytitle")%>"/>--%>
<%--<script>--%>
<%--    var title = $("#data").val();--%>
<%--    alert(title)--%>
<%--    if (title=="开户")--%>
<%--    document.myform.action="http://localhost:8080/springmvc/openaccount";--%>
<%--    else--%>
<%--    document.myform.action="http://localhost:8080/springmvc/closeaccount";--%>
<%--    document.getElementById("pt").innerHTML = title;--%>
<%--</script>--%>
<%--<p id="pt">title</p>--%>


<form name="myform" id="myform" action="">
    Name: <input type="text" name="name" ><br>
    Age:&ensp;&nbsp; <input type="number" name="age"><br>
    <input type="submit" value="提交">
</form>
<script>
$(function () {
    // $('form').ajaxForm({
    //     success: function(responseText){
    //         alert(responseText);
    //     }
    // });
    // alert("haha")
    // $("#myform").ajaxForm().summit(function (data, status) {
    //     alert("提交成功" + data);
    //     return false;
    // });

        // inside event callbacks 'this' is the DOM element so we first
        // wrap it in a jQuery object and then invoke ajaxSubmit
        // alert("haha")
    $("#myform").submit(function () {
        $("#myform").ajaxSubmit(function (data, status)
        {
            alert("提交成功" + data);
           $("#result, window.parent.parent.document").html(data)

        })
        return false;
    });
        // !!! Important !!!
        // always return false to prevent standard browser submit and page navigation
});
</script>
</body>
</html>