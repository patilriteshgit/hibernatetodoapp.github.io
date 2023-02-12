<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="com.mycompany.todoapp.*" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.SessionFactory" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Todo List</title>
</head>
<body>
  <h1>Todo List</h1>
  <table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Title</th>
      <th scope="col">Description</th>
      <th scope="col">Date Added</th>
      <th scope="col">Operation</th>
    </tr>
  </thead>
  <tbody>
  <%
    SessionFactory factory=new Configuration().configure().buildSessionFactory();
    Session seshion = factory.openSession();
    seshion.beginTransaction();
    Query query = seshion.createQuery("FROM Task");
    List<Task> tasks = query.list();
    for (Task task : tasks) {
  %>
      <tr>
        <td><%= task.getTitle()+" : " %></td>
        <td><%= task.getDescription() %></td>
        <td><%= task.getAddeddate() %></td>
        <td><a href="deljsp.jsp?note_id=<%=task.getId()%>" class="btn btn-danger">DELETE</a></td>
      <br>
      </tr>
  <%
    }
    seshion.getTransaction().commit();
    seshion.close();
  %>
</tbody>
</table>
</body>
</html>