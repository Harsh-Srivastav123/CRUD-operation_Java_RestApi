<%@page import="com.entity.Note"%>
<%@page import="com.connection.DbConnection"%>
<%@page import="com.dao.GetNoteDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-body-tertiary" class="navbar bg-primary" data-bs-theme="dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">Notes Making</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            Dropdown
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled">Disabled</a>
                    </li>
                </ul>
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
    <div class="container mx-auto"><h3 >Update Note</h3></div>
    
    <div class="container mx-auto mt-2"  >
    
      
        <%
        
        int id=Integer.parseInt(request.getParameter("id"));
        GetNoteDao getNote=new GetNoteDao(DbConnection.getConnection());
        Note note=getNote.getNoteById(id);
  
        
        %>
        <form action="update?id=<%=note.getId() %>" method="post">
        
      
        
        
            <div class="mb-3">
              <label for="exampleInputEmail1" class="form-label"><h5>Title</h5></label>
              <input type="text" class="form-control" value="<%=note.getNote_title() %>" name="title" placeholder="Write title" id="exampleInputEmail1" aria-describedby="emailHelp">
             
            <div class="mb-3">
              <label for="exampleInputPassword1" class="form-label"><h5>Description</h5></label>
              <input type="text" class="form-control" value="<%=note.getNote_description() %>" name="description" placeholder="Write Description" id="exampleInputPassword1">
            </div>
            <button type="submit" class="btn btn-primary " >Update</button>
          </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</body>

</html>