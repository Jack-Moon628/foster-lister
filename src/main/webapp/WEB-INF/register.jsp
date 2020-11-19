<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For An Account" />
    </jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>

    <c:choose>
        <c:when test = "${sessionScope.user == null}">
            <jsp:include page="/WEB-INF/partials/guest-navbar.jsp" />
            <% request.setAttribute("admin", false); %>
        </c:when>
        <c:when test = "${sessionScope.user.admin == true}">
            <jsp:include page="/WEB-INF/partials/admin-navbar.jsp" />
            <% request.setAttribute("admin", true); %>
        </c:when>
    </c:choose>

        <div class="container">
            <div class="card">
                <div class="card-body">
                    <form action="/register" method="post">
                        <c:choose>
                            <c:when test="${sessionScope.user == null}">
                                <div>
                                    <h1 class="text-center">Register for an account</h1>
                                </div>
                            </c:when>
                            <c:when test="${sessionScope.user.admin == true}">
                                <div>
                                    <h1 class="text-center">Create a New User</h1>
                                </div>
                            </c:when>
                        </c:choose>
                        <div class="form-row">
                            <div class="form-group col-md-6 mb-3">
                                <input id="firstname" name="firstname" class="form-control" type="text" placeholder="First Name" required>
                            </div>
                            <div class="form-group col-md-6 mb-3">
                                <input id="lastname" name="lastname" class="form-control" type="text" placeholder="Last Name" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6 mb-3">
                                <input id="email" name="email" class="form-control" type="text" placeholder="Email" required>
                            </div>
                            <div class="form-group col-md-6 mb-3">
                                <input id="phonenumber" name="phonenumber" class="form-control" type="text" placeholder="Phone Number" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6 mb-3">
                                <input id="password" name="password" class="form-control" type="password" placeholder="Password" required>
                            </div>
                            <div class="form-group col-md-6 mb-3">
                                <input id="confirm_password" name="confirm_password" class="form-control" type="password" placeholder="Confirm Password" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6 mb-3">
                                <input id="address" name="address" class="form-control" type="text" placeholder="Address" required>
                            </div>
                            <div class="form-group col-md-6 mb-3">
                                <input id="pets" name="pets" class="form-control" type="text" placeholder="Number of Pets" required>
                            </div>
                        </div>
                        <c:choose>
                            <c:when test="${sessionScope.user.admin == true}">
                                <div class="form-row mx-auto">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="is-admin" id="is-admin-true" value="true" required>
                                        <label class="form-check-label" for="is-admin-true">User is an Admin</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="is-admin" id="is-admin-false" value="false">
                                        <label class="form-check-label" for="is-admin-false">User is not an Admin</label>
                                    </div>
                                </div>
                            </c:when>
                        </c:choose>
                        <input type="submit" class="btn btn-primary btn-block">
                    </form>
                </div>
            </div>
         </div>

    <jsp:include page="partials/footer.jsp" />
    <jsp:include page="partials/bootstrap-script.jsp" />
</body>
</html>
