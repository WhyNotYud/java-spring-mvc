<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Create Course</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#avatarPreview").attr("src", imgURL);
                $("#avatarPreview").css({ "display": "block" });
            });
        });
    </script>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp" />
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp" />
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
                        <div class="col-md-6 col-12 mx-auto">
                            <h3>Create A Course</h3>
                            <hr />
                            <%--@elvariable id="newCourse" type=""--%>
                            <form:form method="post" action="/admin/course/create" class="row"
                                       enctype="multipart/form-data" modelAttribute="newCourse">
                                <div class="mb-3 col-12 col-md-6">
                                    <c:set var="errorName">
                                        <form:errors path="name" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Name:</label>
                                    <form:input type="text"
                                                class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                                                path="name"/>
                                        ${errorName}
                                </div>
                                <div class="mb-3 col-12 col-md-6">
                                    <c:set var="errorPrice">
                                        <form:errors path="price" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Price:</label>
                                    <form:input type="number"
                                                step="0.01"
                                                class="form-control ${not empty errorPrice ? 'is-invalid' : ''}"
                                                path="price"/>
                                        ${errorPrice}
                                </div>
                                <div class="mb-3 col-12">
                                    <c:set var="errorTitle">
                                        <form:errors path="title" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Title:</label>
                                    <form:textarea type="text"
                                                class="form-control ${not empty errorTitle ? 'is-invalid' : ''}"
                                                path="title"/>
                                        ${errorTitle}
                                </div>
                                <div class="mb-3 col-12">
                                    <c:set var="errorDescription">
                                        <form:errors path="description" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Description:</label>
                                    <form:textarea type="text"
                                                class="form-control ${not empty errorDescription ? 'is-invalid' : ''}"
                                                path="description"/>
                                        ${errorDescription}
                                </div>
                                <div class="mb-3 col-12">
                                    <c:set var="errorAuthor">
                                        <form:errors path="author" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Author:</label>
                                    <form:input type="text"
                                                class="form-control ${not empty errorAuthor ? 'is-invalid' : ''}"
                                                path="author"/>
                                        ${errorAuthor}
                                </div>
                                <div class="mb-3 col-12 col-md-6">
                                    <c:set var="errorHour">
                                        <form:errors path="hour" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Hour:</label>
                                    <form:input type="number"
                                                step="0.1"
                                                class="form-control ${not empty errorHour ? 'is-invalid' : ''}"
                                                path="hour"/>
                                        ${errorHour}
                                </div>
                                <div class="mb-3 col-12 col-md-6">
                                    <label for="avatarFile" class="form-label">Image:</label>
                                    <input class="form-control" type="file" id="avatarFile"
                                           accept=".png, .jpg, .jpeg" name="file" />
                                </div>
                                <div class="col-12 mb-3">
                                    <img style="max-height: 250px; display: none;" alt="avatar preview"
                                         id="avatarPreview" />
                                </div>
                                <div class="col-12 mb-5">
                                    <button type="submit" class="btn btn-primary">Create</button>
                                </div>
                            </form:form>

                        </div>

                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp" />
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>

</body>

</html>