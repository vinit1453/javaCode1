package com.nt.service;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nt.Employee.Employee;
import com.nt.Employee.EmployeeDao;

/**
 * Servlet implementation class ModalData
 */
@WebServlet("/modal")
public class ModalData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModalData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String id=request.getParameter("id");
		if( id!=null) {
	     try {
			List<Employee> emp=(List<Employee>)new EmployeeDao().Display_Emp_By_id(Integer.parseInt(id));
			session.setAttribute("emp", emp);
			response.sendRedirect("Modal.jsp");
			System.out.println(emp.size());
			for(Employee e:emp) {
				System.out.println(e.getEid()+""+e.getEname());
//				 System.out.println("Date 2:"+LocalDateTime.now().toLocalDate());

			}
		    
		} catch (SQLException e) {
			System.out.println("Noo Record with given id..Pls...select valid id..");
		}
		}else {
			/*
			 * System.out.println("Modal is open"); response.sendRedirect("Modal.jsp");
			 */
			try {
			List<Employee> emp=(List<Employee>)new EmployeeDao().Display_Emp_By_id(12);
			/*
			 * session.setAttribute("emp", emp); response.sendRedirect("Modal.jsp");
			 */
			for(Employee e:emp) {
				System.out.println(e.getEid()+""+e.getEname());
//				 System.out.println("Date 2:"+LocalDateTime.now().toLocalDate());

			}
			session.setAttribute("emp", emp);
			response.sendRedirect("Modal.jsp");
		    
		} catch (SQLException e) {
			System.out.println("Noo Record with given id..Pls...select valid id..");
		}
	}

}
}
