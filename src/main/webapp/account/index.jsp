<%@ include file="../include.jsp" %>

<html>
<head>
    <link type="text/css" rel="stylesheet" href="<c:url value="/style.css"/>"/>
</head>
<body>

<h2>Users only</h2>

<p>Hello, <shiro:principal/>.</p>

<p><a href="<c:url value="/home.jsp"/>">Return to the home page.</a></p>

<p><a href="<c:url value="/logout"/>">Log out.</a></p>

</body>
</html>