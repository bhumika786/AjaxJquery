<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Being Java Guys | User Details</title>
</head>
<body>
	<center>
      <c:if test="${!empty employeeList}">
			<table border="1" bgcolor="black" width="600px">
				<tr
					style="background-color: teal; color: white; text-align: center;"
					height="40px">
						<td>id</td>
					<td>First Name listS</td>
					<td>Last Name</td>
					<td>Email</td>
					<td>Phone</td>
					<td>Edit</td>
					<td>Delete</td>
				</tr>
				<c:forEach items="${employeeList}" var="user">
					<tr
						style="background-color: white; color: black; text-align: center;"
						height="30px">
						<td><c:out value="${user.id}" />
						</td>
						<td><c:out value="${user.firstName}" />
						</td>
						<td><c:out value="${user.lastName}" />
						</td>
						<td><c:out value="${user.email}" />
						</td>
						<td><c:out value="${user.phone}" />
						</td>
						<td><a href="edit?id=${user.id}">Edit</a></td>
						 
						<td><a class="linkDelete" id= ${ user.id }  href="# ${ user.id }">Delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
  <a href="form">Click Here to add new User if</a>
	</center>
	<div align="center">
         <p>hi</p>
        <div id="result"></div>
        <br>
    </div>
</body>
<script type="text/javascript"
    src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript">

jQuery(window).load(function () {
    alert('page is loaded');

    
});

 $(document).ready(function()
		{
$(".linkDelete").click(function(){
	var userid = $(this).attr("id");
	console.debug("saurabh userid",userid);
	var url = "/delete?id="+userid;
    var s= "/SpringHibernateAnnotations";
    console.debug("saurabh url",url);
    var rowElement = $(this).parent().parent(); 
  $.ajax({
	       url : s+"/delete?id="+userid,
            success : function(data) {
             if(data == "deleted "+userid) {
            		  $('#result').html(data);
            		  rowElement.find('td').fadeOut('3000', 
            			        function(){ 
            			  rowElement.remove();                    
            			        }
            			    );
            		 
                  } 
                  else {

                  } 
            }
        });
  
});
		});
</script>
 
 
</html>
