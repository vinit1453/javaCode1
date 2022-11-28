<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modal</title>
<style>
#modal {
	background-color: rgb(125, 248, 248);
	width: fit-content;
	height: fit-content;
	padding: 25px;
	margin: auto;
	border-radius: 25%;
}

.modalhead {
	display: flex;
	justify-content: center;
	align-items: center;
}

#clsBtn {
	font-size: 20px;
	font-weight: bolder;
	background-color: rgb(235, 235, 248);
	cursor: pointer;
	border-radius: 50%;
	padding: 5px;
	margin-left: 35px;
}

.input {
	width: 100%;
}

#addBtn {
	margin: 5px;
	cursor: pointer;
}

.modalFooter {
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>
</head>
<body>
	<%@ page import="java.sql.*,java.util.*,com.nt.Employee.*"%>
	<%!Connection con;
	public void jspInit() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emp", "root", "Vinit@2000");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}%>
	<div id="modal" class="modal">
		<div class="">
			<header class="modalhead">
				<h2>Add Employee Details</h2>
				<span id="clsBtn" onclick="clsPopup()" class="w3-closebtn"
					id="modalClsBtn">&times;</span>
			</header>
			<div class="w3-container">
				<table>
					<tbody>
						
						<%
						ResultSet rs;
						PreparedStatement pst;

						pst = con.prepareStatement("select id from emp");
						rs = pst.executeQuery();
						%>
						<tr>

							<form method="post" action="modal">
								<td><select name="id">
										<option>select id</option>
										<%
										while (rs.next()) {
										%>
										<option><%=rs.getInt("id")%></option>
										<%
										}
										%>
								</select></td>
								<td><button type=submit value="Search">check</button></td>
							</form>

							<%
							List<Employee> emp = (List<Employee>) session.getAttribute("emp");
							if (emp.size() > 0) {
								for (Employee e : emp) {
							%>
						
						<tr>
							<td>Emp Id</td>
							<td><input type=number value=<%=e.getEid()%> readonly></td>
						</tr>
						<tr>
							<td>Emp Name:</td>
							<td><input type=text value=<%=e.getEname()%> readonly></td>
						</tr>
						<tr>
							<td>Date of Join:</td>
							<td><input type=date value=<%=e.getDoj()%>></td>
						</tr>
						<tr>
							<td>Experience:</td>
							<td><input class="input" type=number min=0></td>
						</tr>
						<tr>
							<td>Designation:</td>
							<td><input type=text value=<%=e.getDesg()%>></td>
						</tr>
						<%
						}
						} else {
						%>
						<tr>
							<td>Emp Name:</td>
							<td></td>
						</tr>
						<tr>
							<td>Date of Join:</td>
							<td></td>
						</tr>
						<tr>
							<td>Experience:</td>
							<td><input class="input" type=number value=></td>
						</tr>
						<tr>
							<td>Designation:</td>
							<td></td>
						</tr>

						<%
						}
						%>
					</tbody>
				</table>
				<!--             Database Connection Closing -->
				<%!public void jspDestroy() {
		try {
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}%>

			</div>
			<footer class="modalFooter">
				<button id="addBtn" class="">Add</button>
				<button id="addBtn" onclick="clsPopup()" class="">Cancel</button>
			</footer>
		</div>
	</div>
	<script>
		function clsPopup() {
			var x = document.getElementById("modal");
			if (x.style.display === "none") {
				x.style.display = "block";
			} else {
				x.style.display = "none";
			}
			alert()
		}
	</script>
</body>
</html>