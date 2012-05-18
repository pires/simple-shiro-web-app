<%@ include file="include.jsp"%>

<html>
<head>
<link type="text/css" rel="stylesheet"
	href="<c:url value="/style.css"/>" />
<title>Auth</title>
</head>
<body>

	<h1>Simple Shiro Web App</h1>

	<p>
		Hi
		<shiro:guest>Guest</shiro:guest>
		<shiro:user>
			<shiro:principal />
		</shiro:user>
		! (
		<shiro:user>
			<a href="<c:url value="/logout"/>">Log out</a>
		</shiro:user>
		<shiro:guest>
			<a href="<c:url value="/login.jsp"/>">Log in</a></shiro:guest>
		)
	</p>

	<shiro:user>
		<p>
			Visit your <a href="<c:url value="/account"/>">account page</a>.
		</p>
	</shiro:user>
	<shiro:guest>
		<p>
			If you want to access the user-only <a
				href="<c:url value="/account"/>">account page</a>, you will need to
			log-in first.
		</p>
	</shiro:guest>

	<h2>Roles</h2>

	<p>To show some taglibs, here are the roles you have and don't
		have. Log out and log back in under different user accounts to see
		different roles.</p>

	<h3>Roles you have</h3>

	<p>
		<shiro:hasRole name="ADMIN">Administrator<br />
		</shiro:hasRole>
		<shiro:hasRole name="USER_P1">Perfil 1<br />
		</shiro:hasRole>
		<shiro:hasRole name="USER_P2">Perfil 2<br />
		</shiro:hasRole>
	</p>

	<h3>Roles you DON'T have</h3>

	<p>
		<shiro:lacksRole name="ADMIN">Administrator<br />
		</shiro:lacksRole>
		<shiro:lacksRole name="USER_P1">Perfil 1<br />
		</shiro:lacksRole>
		<shiro:lacksRole name="USER_P2">Perfil 2<br />
		</shiro:lacksRole>
	</p>


</body>
</html>
