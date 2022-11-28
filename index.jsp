<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- --link for jsp core tags -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"
	import="java.util.*,com.nt.service.*,com.nt.Employee.*,java.text.*"%>

<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Emp</title>
<style>
* {
	margin: auto;
	padding: auto;
}

button {
	cursor: pointer;
}

#frm1 {
	
	display: flex;
	
	align-items: center;
	height: 50px;
	width: 100%;
	margin-top: 10px;
}

nav {
	background-color: rgb(160, 234, 247);
	border-radius: 20px;
	display: flex;
	justify-content:center;
	align-items: center;
	
}


#searchBtn {
	background-color: rgb(255, 198, 9);
	border-radius: 30px;
	color: black;
	text-align: center;
	margin-left: 5px;
	padding: 1px;
}

#addBtn {
    margin-right:170px;
	background-color: rgb(58, 47, 255);
	padding: 1px;
}

main {
	margin-top: 30px;
}

.table {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 5px;
}

#table, #th, .td {
	border: 1px solid black;
}

#table .tableHead {
	background-color: black;
	color: aliceblue;
	padding: auto;
	text-align: center;
}

#tBody .td {
	padding: 5px;
	text-align: center;
}

#modal {
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
}

#modalClsBtn {
	cursor: pointer;
}

/* 
        Modal styles */
#modal {
	background-color: rgb(125, 248, 248);
	width: fit-content;
	height: fit-content;
	padding: 25px;
	margin: auto;
	border-radius: 25%;
	z-index: 4;
}

#modal {
	display: none;
	position: absolute;
	right: 400px;
	top: 100px;
}

.modalhead {
	display: flex;
	justify-content: center;
	align-items: center;
}

#clsBtn {
	background-color: rgb(235, 235, 248);
	cursor: pointer;
	border-radius: 50%;
	padding: 5px;
	margin-left: 35px;
	color: #aaaaaa;
	float: right;
	font-size: 18px;
	font-weight: bold;
}

.input {
	width: 100%;
}

#modalAddBtn {
	margin: 5px;
	cursor: pointer;
}

footer {
	display: flex;
	align-items: center;
	justify-content: center;
}

@media only screen and (max-width:900px){
#searchField{
display:flex;
flex-direction:column;
}
#searchBtn{
margin-top:2px;
}
#addBtn{
margin-right:10px;
}
}


</style>
</head>

<body>
	<nav>
		<form action="emp" method="get" id="frm1">
			<div class="navitem" id="searchField">
				<input type=text id="search" name="search" class=""
					style="width: 100px;" placeholder="search Emp Details" />
				<button type=submit id="searchBtn" class="">Search</button>
			</div>
			<div class="navitem">
				<h3>Emp Table</h3>
			</div>

			<input type=submit value="AllEmps" />
			</div>
		</form>
		<div class="navitem">
			<button id="addBtn" onclick="clsPopup()">Add</button>
	</nav>
	<main>
		<div class="table">
			<h3>Emp's Table</h3>
		</div>
		<%
		List<Employee> list = (List<Employee>) session.getAttribute("list");
		%>
		<table id="table">
			<thead class="tableHead">
				<tr>
					<th>Uid</th>
					<th>Name</th>
					<th>Doj</th>
					<th>Experience<br>(Years)
					</th>
					<th>Desg</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody id="tBody">
				<tr id="tr">
					<%
					for (int i = 0; i < list.size(); i++) {
						Employee emp = (list).get(i);
					%>
					<td class="td"><%=emp.getEid()%></td>
					<td class="td"><%=emp.getEname()%></td>
					<td class="td"><%=new SimpleDateFormat("dd-MM-YYYY").format(emp.getDoj())%></td>
					<td class="td"><%=emp.getExp()%></td>
					<td class="td"><%=emp.getDesg()%></td>
					<td class="td"><button>Delete</button></td>
				</tr>

				<%
				}
				%>

			</tbody>
		</table>



		<div id="modal" class="modal">
			 <div class="">
            <header class="modalhead">
                <h2>Add Employee Details</h2>
                <span id="clsBtn" onclick="clsPopup()" class="w3-closebtn" id="modalClsBtn">&times;</span>
            </header>
            <div class="w3-container">
              <table>
                <tbody>
                
                      
                    <tr><td>Employee Id:</td><td><select>
                        <option>select Id</option>
                        <option name="add">Add New Record</option>
                       <%List<Id> id=(List<Id>)session.getAttribute("ids");
                       for(Id e:id){                      	                    
                            %>
                        <option><%=e.getId()%></option>
                        <%} %>
                        </select></td></tr>
                        
                    <tr>
                        <td>Emp Name:</td>
                        <td><input  class="input" type=text readonly></td>
                    </tr>
                    <tr>
                        <td>Date of Join:</td>
                        <td><input class="input" type=date></td>
                    </tr>
                    <tr>
                        <td>Experience</td>
                        <td><input  class="input" type=number min=0></td>
                    </tr>
                    <tr>
                        <td>Designation</td>
                        <td><input class="input" type=text></td>
                    </tr>
                </tbody>
              </table>
    
            </div>
            <footer class="modalFooter">
                <button  id="modalAddBtn" class="">update</button>
                <button  id="modalAddBtn" onclick="clsPopup()" class="">Cancel</button>
            </footer>
        </div>
			<%--  <jsp:include page="Modal.jsp"/> --%>
			<!-- <h1>Hekllo</h1> -->
		</div>

	</main>
	<script>
		function clsPopup() {

			var x = document.getElementById("modal");

			if (x.style.display === "none") {
				document.getElementById("addBtn").innerHTML = 'Close';
				x.style.display = "block";
				x.style.transition = ""
			} else {
				document.getElementById("addBtn").innerHTML = 'Add';
				x.style.display = "none";
			}

		}
	</script>
</body>

</html>














