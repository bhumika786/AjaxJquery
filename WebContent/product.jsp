<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show All Users</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	

	
<script type="text/javascript">
jQuery(window).load(function () {
    alert('page is loaded');

    
});
function savefun()
{
	
	$.ajax
	({
		type:"GET",
		url:"AddController",
		data :	 {
    		name : $('#name').val(),
    		 price : $('#price').val() 
			 },
			 success : function(data)
				{
					if(data.flag1==true)
						{
							console.debug("true");
						}
					else
						{
						
						}
				}
	
	
	});
}

</script>
	
<script type="text/javascript">

$(document).ready(function()
		{

				 $.ajax({
        					url: 'DisplayController',
        					type: 'GET',
       						success: function(response) {
            				var trHTML = '';
           					$.each(response, function(i, item) {
               				trHTML += '<tr><td>' + item.name + '</td><td>' + item.id + '</td><td>' + item.price +
                    		'</td><td>' + '<button id="' + item.id + '" class="btn">Delete</button>'
                			'</td></tr>';
            			});
            			$('#delTable').append(trHTML);
            			$('button').click(function() {
               			var val = $(this).attr("id");
               			console.debug("saurabh userid", val);
               			var rowElement = $(this).parent().parent();
               			
               	$.ajax({
               				type: "POST",
                    		data: {
                    				productid: val
                				  },
                			url: "DisplayController",
                			success: function(result) {
                    		rowElement.find('td').fadeOut('3000',
                       		function() {
                            rowElement.remove();
                       });
                }
            });
        });
        }
    });

});

</script>


</head>
<body>
    <%-- <table id="delTable" border=1 align="center" height="150" width="200">
        <thead>
            <tr>
                <th width="100">Product Name</th>
                <th width="100">Price</th>
                <th width="100">Id</th>
                <th width="100">Delete</th>
               	
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${products}" var="products">
                <tr id="trid">
                    <td align="center"><c:out value="${products.name}" /></td>
                    <td align="center"><c:out value="${products.price}" /></td>
                    <td align="center"><c:out value="${products.id}" /></td>
                    <td ><button id="${products.id}">Delete</button></td>
                   
                 </tr>
            </c:forEach>
        </tbody>
    </table> --%>
    <table id="delTable" border=1 align="center" height="150" width="200">
    <thead>
            <tr>
                <th width="100">Product Name</th>
                <th width="100">Price</th>
                <th width="100">Id</th>
                <th width="100">Delete</th>
               	
            </tr>
        </thead>
        
  
        </tbody>
    </table>
    
   <h3 align="center">Add a New Product</h3>
   <form>
   Product Name : <input id="name" type="text" name="name">
  	Product Price : <input id="price" type="number" name="price">
   <input type="submit" value="Save" align="middle" onclick="savefun()">
   </form>
</body>
</html>