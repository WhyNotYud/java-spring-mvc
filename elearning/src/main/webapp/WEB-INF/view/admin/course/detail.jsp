<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="HaUI-Elearning"/>
    <meta name="author" content="Mai Tat Duy"/>
    <title>Course Detail</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Manage Courses</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active">Courses</li>
                </ol>


                <div class="mt-5">
                    <div class="row">
                        <div class="col-12 mx-auto" items="course">
                            <div class="d-flex justify-content-between">
                                <h3>Course Detail With ID: ${course.id}</h3>
                            </div>

                            <hr/>
                            <div class="card" style="width: 60%;">
                                <div class="card-header">
                                    Course Information
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">ID: ${course.id}</li>
                                    <li class="list-group-item">Name: ${course.name}</li>
                                    <li class="list-group-item">Price: ${course.price}</li>
                                    <li class="list-group-item">Hour: ${course.hour}</li>
                                    <li class="list-group-item">Author: ${course.author}</li>
                                    <li class="list-group-item">Title: ${course.title}</li>
                                    <li class="list-group-item">Description: ${course.description}</li>
                                    <li class="list-group-item">Created At: ${createdAt}</li>
                                    <li class="list-group-item">Image: <img src="/images/course/${course.image}" alt="" style="max-width: 100px; display: inline"/></li>
                                </ul>
                            </div>
                            <a href="/admin/course" class="btn btn-success mt-3">Back</a>
                        </div>

                    </div>

                </div>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
</body>

</html>