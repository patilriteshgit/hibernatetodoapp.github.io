package com.mycompany.todoapp;

import jakarta.servlet.http.*;
import jakarta.servlet.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.cfg.Configuration;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import java.io.IOException;
import java.util.Date;


public class AddTaskServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
        response.setContentType("text/HTML");
        PrintWriter out =response.getWriter();
//    int id =Integer.parseInt(request.getParameter("intid"));
    String tit = request.getParameter("title");
    String descri = request.getParameter("description");
SessionFactory factory=new Configuration().configure().buildSessionFactory();
Session session=factory.openSession();
    Task task = new Task();
    Date date=new Date();
//    task.setId(id);
    task.setTitle(tit);
    task.setDescription(descri);
    task.setAddeddate(date);
//
//   out.println(date);
    out.println("<h1>inserting into db</h1>"+task.getTitle());
    session.beginTransaction();
    session.save(task);
    session.getTransaction().commit();
    session.close();
    out.println("<h1>Your Data is inserted</h1>");
//   response.sendRedirect("todo.jsp");
  }

}
