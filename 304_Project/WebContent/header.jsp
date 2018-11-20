<!-- ZACH




ZACH -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home Page</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	margin: 0;
}

/* Style the header */
.header {
	padding: 80px;
	text-align: center;
	background: #6FBEE7;
	color: white;
}

.header h1 {
	font-size: 40px;
	font-weight: bolder;
}

nav {
	width: 100%;
	height: 40px;
	background-color: #0D2038;
	overflow: hidden;
}

nav a {
	display: block;
	float: left;
	font-family: sans-serif;
	font-size: 17px;
	color: white;
	padding-top: 11px;
	padding-right: 12px;
	padding-bottom: 11px;
	padding-left: 10px;
	text-decoration: none;
}

nav a:hover {
	background-color: gray;
}

nav a:active {
	background-color: #133054;
}

nav input[type=text] {
	float: center;
	padding: 6px;
	border: none;
	margin-top: 4px;
	margin-bottom: 4px;
	margin-right: 16px;
	font-size: 17px;
	margin-bottom: 4px;
}

nav .search-container button {
	float: center;
	padding: 6px 10px;
	margin-top: 4px;
	margin-bottom: 5px;
	margin-right: 14px;
	background: #e1612f;
	font-size: 17px;
	border: none;
	cursor: pointer;
}

nav .search-container button:hover {
	background: #ccc;
}

#outer {
	width: 600px;
}

#inner {
	width: 450px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<!-- HEADER -->
	<div class="header">
		<h1>BookBids</h1>
		<p>Watch the bids start rolling in.</p>
	</div>

	<nav>
		<a class="active" href="homepage.jsp">Home</a> <a
			href="listAuctions.jsp">Auctions</a> <a href="login.jsp">Login</a> <a
			href="register.jsp">Register</a>

		<div id="inner" class="search-container">
			<form action="/action_page.php">
				<input type="text" placeholder="Author, Title, ISBN..."
					name="search">
				<button type="submit">Submit</button>
			</form>

		</div>
	</nav>
	<!-- /HEADER -->
</body>
</html>