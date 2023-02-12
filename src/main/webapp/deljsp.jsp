
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="com.mycompany.todoapp.*" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>deleting user</title>
    </head>
    <body>
        <h2>processing to delet Task by hibernate</h2>
        <%
            int noteid= Integer.parseInt(request.getParameter("note_id"));
            out.println(noteid);
    SessionFactory factory=new Configuration().configure().buildSessionFactory();
    Session seshion = factory.openSession();
    seshion.beginTransaction();
         Task tsk= seshion.get(Task.class,noteid);
         seshion.delete(tsk);
         seshion.getTransaction().commit();
         seshion.close();
         response.sendRedirect("todo.jsp");
        %>
        
        <h2>deleted Task in DB </h2>
    </body>
</html>