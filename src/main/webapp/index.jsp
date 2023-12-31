<%@page import="com.entity.Note"%>
<%@page import="java.util.List"%>
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
            <a class="navbar-brand" href="index.jsp">Notes Making</a>
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
    <div class="container mx-auto"><h3 >Create Note</h3></div>
    
    <div class="container mx-auto mt-2"  >
        <form action="addNote" method="post">
            <div class="mb-3">
              <label for="exampleInputEmail1" name="title" class="form-label"><h5>Title</h5></label>
              <input type="text" class="form-control" name="title" placeholder="Write title" id="exampleInputEmail1" aria-describedby="emailHelp">
             
            <div class="mb-3">
              <label for="exampleInputPassword1" name="description" class="form-label"><h5>Description</h5></label>
              
              <input type="text" class="form-control" name="description" placeholder="Write Description" id="exampleInputPassword1">
            </div>
            <button type="submit" class="btn btn-primary "  >Submit</button>
          </form>
    </div>
    <div class="container" class="mt-3">
        <table class="table">
            <thead>
              <tr>
                <th scope="col">S No</th>
                <th scope="col">Title</th>
                <th scope="col">Description</th>
                <th scope="col">Date & Time</th>
                <th scope="col">Actions</th>
              </tr>
            </thead>
           
            <%
            GetNoteDao getNote=new GetNoteDao(DbConnection.getConnection());
            
            List<Note> list=getNote.getNote();
            for(int i=0;i<list.size();i++){
            	Note note=list.get(i);
            	%>
            	<tr>
            	 <td ><%=i+1%></td>
                <td ><%=note.getNote_title() %></td>
                <td><%=note.getNote_description() %></td>
                <td><%=note.getNote_time() %></td>
                <td><a href ="delete?id=<%=note.getId()%>"><button type="button" class="btn btn-outline-danger btn-sm mx-1">Delete</button></a>
                    <a href ="update.jsp?id=<%=note.getId()%>"><button type="button" class="btn btn-outline-warning btn-sm mx-1">Update</button></a>
                </td>
                </tr>
            	
            	
            	<%
            }
            
            
            %>
          
          

        </tbody>
          </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</body>
</html>