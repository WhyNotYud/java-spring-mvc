<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="HaUI-Elearning"/>
    <meta name="author" content="Mai Tat Duy"/>
    <title>Information User</title>
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
            rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/client/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script>
        $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#avatarPreview").attr("src", imgURL);
                $("#avatarPreview").css({"display": "block"});
            });
        });
    </script>
</head>

<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <div class="mt-5">
                    <div class="row">
                        <div class="col-md-6 col-12 mx-auto">
                            <h3>User information</h3>
                            <hr/>
                            <%--@elvariable id="newUser" type=""--%>
                            <form:form method="post" enctype="multipart/form-data" action="/client/user/manage"
                                       modelAttribute="newUser">
                                <div class="mb-3" style="display: none;">
                                    <label class="form-label">ID:</label>
                                    <form:input type="text" class="form-control" path="id"/>
                                </div>
                                <div class="mb-3">
                                    <c:set var="errorEmail">
                                        <form:errors path="email" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Email:</label>
                                    <form:input type="email"
                                                class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                path="email"/>
                                        ${errorEmail}
                                </div>
                                <div class="mb-3">
                                    <c:set var="errorUsername">
                                        <form:errors path="username" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Username:</label>
                                    <form:input type="text"
                                                class="form-control ${not empty errorUsername ? 'is-invalid' : ''}"
                                                path="username"/>
                                        ${errorUsername}
                                </div>
                                <div class="mb-3">
                                    <c:set var="errorPassword">
                                        <form:errors path="password" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Password:</label>
                                    <form:input type="password"
                                                class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                path="password"/>
                                        ${errorPassword}
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Phone Number:</label>
                                    <form:input type="text"
                                                class="form-control"
                                                path="phoneNumber"/>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-12 col-md-6">
                                        <label for="avatarFile" class="form-label">Avatar:</label>
                                        <input class="form-control" type="file" id="avatarFile"
                                               accept=".png, .jpg, .jpeg" name="file">
                                    </div>
                                </div>

                                <div class="col-12 mb-3">
                                    <img style="max-height: 250px; display: none;" alt="avatar preview"
                                         id="avatarPreview"/>
                                </div>

                                <button type="submit" class="btn btn-primary">Update</button>
                            </form:form>
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