<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  ~ Copyright (c) 2013 Les Hazlewood and contributors
  ~
  ~ Licensed under the Apache License, Version 2.0 (the "License");
  ~ you may not use this file except in compliance with the License.
  ~ You may obtain a copy of the License at
  ~
  ~     http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing, software
  ~ distributed under the License is distributed on an "AS IS" BASIS,
  ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~ See the License for the specific language governing permissions and
  ~ limitations under the License.
  --%>
<jsp:include page="include.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>Apache Shiro Tutorial Webapp</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Add some nice styling and functionality.  We'll just use Twitter Bootstrap -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap-theme.min.css">
</head>
<body>
<h1>Hello, world!</h1>

<p>
    Hi <shiro:guest>Guest</shiro:guest><shiro:user>
    <%
        // this should never be done in a normal page and should exist in a
        // proper mvn controller of some sort, but for this tutorial, we will
        // just pull out stormpath account data from shiro's principal collection
        // to reference in the <c:out> tag next:

        request.setAttribute("account", SecurityUtils.getSubject().getPrincipals().oneByType(Map.class));
    %>
    <c:out value="${account.givenName}"/></shiro:user>!(
    <shiro:user><a href="<c:url value="/logout"/>">Log out</a></shiro:user>
    <shiro:guest><a href="<c:url value="/login.jsp"/>">Log in</a></shiro:guest>
    )

</p>

<p>
    <shiro:authenticated>

<p>Visit your <a href="<c:url value="/account"/>">account page</a></p>
</shiro:authenticated>
<shiro:notAuthenticated>
    <p>If you want to access the authentication-only <a href="<c:url value="/account"/>">account page</a> you will need
        to login first</p>
</shiro:notAuthenticated>
</p>


<h2>Roles:</h2>

<p>Here are the roles that you have and you don't have. Logout and log back in under different user account to see
    different roles.</p>

<h3>Roles you have:</h3>
<shiro:hasRole name="Captions">Captions<br/></shiro:hasRole>
<shiro:hasRole name="Officers">Bad guys<br/></shiro:hasRole>
<shiro:hasRole name="Enlisted">Enlisted<br/></shiro:hasRole>

<h3>Roles you don't have</h3>
<shiro:lacksRole name="Captions">Captions<br/></shiro:lacksRole>
<shiro:lacksRole name="Officers">Bad guys<br/></shiro:lacksRole>
<shiro:lacksRole name="Enlisted">Enlisted<br/></shiro:lacksRole>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://code.jquery.com/jquery.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
</body>
</html>