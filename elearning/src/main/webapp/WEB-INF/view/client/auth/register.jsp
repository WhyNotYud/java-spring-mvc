<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register</title>
    <link rel="stylesheet" href="/client/css/register.min.css" />
</head>

<body>
<!--  Body Wrapper -->
<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="fixed" data-header-position="fixed">
    <div
            class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
        <div class="d-flex align-items-center justify-content-center w-100">
            <div class="row justify-content-center w-100">
                <div class="col-md-8 col-lg-6 col-xxl-3">
                    <div class="card mb-0">
                        <div class="card-body">
                            <h2 class="text-center">Sign Up</h2>
                            <%--@elvariable id="registerUser" type=""--%>
                            <form:form method="post" action="/register" modelAttribute="registerUser">
                                <div class="mb-3">
                                    <c:set var="errorUsername">
                                        <form:errors path="username" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label for="username" class="form-label ${not empty errorUsername ? 'is-invalid' : ''}">Username</label>
                                    <form:input type="text" class="form-control" id="username" aria-describedby="textHelp" path="username"/>
                                        ${errorUsername}
                                </div>
                                <div class="mb-3">
                                    <c:set var="errorEmail">
                                        <form:errors path="email" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label for="email" class="form-label ${not empty errorEmail ? 'is-invalid' : ''}">Email</label>
                                    <form:input type="email" class="form-control" id="email" aria-describedby="emailHelp" path="email"/>
                                    ${errorEmail}
                                </div>
                                <div class="mb-4">
                                    <c:set var="errorPassword">
                                        <form:errors path="password" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label for="password" class="form-label ${not empty errorPassword ? 'is-invalid' : ''}">Password</label>
                                    <form:input type="password" class="form-control" id="password" path="password"/>
                                    ${errorPassword}
                                </div>
                                <div class="mb-4">
                                    <c:set var="errorConfirmPassword">
                                        <form:errors path="confirmPassword" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label for="confirm" class="form-label ${not empty errorConfirmPassword ? 'is-invalid' : ''}">Confirm Password</label>
                                    <form:input type="password" class="form-control" id="confirm" path="confirmPassword"/>
<%--                                    <form:errors path="confirmPassword">--%>

<%--                                    </form:errors>--%>
                                        ${errorConfirmPassword}
                                </div>
                                <button class="btn btn-primary w-100 py-8 fs-4 mb-4 rounded-2">Sign Up</button>
                                <div class="d-flex align-items-center justify-content-center">
                                    <p class="fs-4 mb-0 fw-bold">Already have an Account?</p>
                                    <a class="text-primary fw-bold ms-2" href="/login">Sign In</a>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/client/libs/jquery/dist/jquery.min.js"></script>
<script src="/client/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>