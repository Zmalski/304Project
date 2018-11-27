<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page
	import="java.sql.*, data.loginDetails, java.util.concurrent.TimeUnit"%>
	
<%@ include file="jdbc.jsp" %>   
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search for Books</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div id="header">
		<jsp:include page="header.jsp" />
	</div>
	<h2>Search for the books you want to bit:</h2>

<form method="get" action="listAuction.jsp">
  <p align="left">
  <select size="1" name="subject">
  <option>All</option>
  
  
  <option>Anthropology</option>
  <option>Applied Science Professional Platform</option>
  <option>Applied Science </option>
  <option>Art History and Visual Culture</option>
  <option>Astronomy</option>
  <option>Biochemistry</option>       
  <option>Biology</option>
  <option>Creative and Critical Studies</option>
  <option>Chemistry</option>
  <option>Computer Science</option>
  <option>Creative Writing</option>
  <option>Cultural Studies</option>
  <option>Curriculum Studies</option>
  <option>Data Science</option>
  <option>Digital Humanities</option>
  <option>Educational Administration</option>
  <option>Early Childhood Education</option>
  <option>Economics</option> 
  <option>Educational Studies</option>
  <option>Earth and Environmental Sciences</option>
  <option>English</option>
  <option>Engineering</option>
  <option>Educational Psychology and Special Education</option>
  <option>Educational Technology</option>
  <option>Film</option>
  <option>French</option>
  <option>Geography</option>
  <option>German</option>
  <option>Health Studies</option>
  <option>Health-Interprofessional</option>
  <option>History</option>
  <option>Human Kinetics</option>
  <option>Indigenous Studies</option>
  <option>Japanese Studies </option>
  <option>Language and Literacy Education</option>
  <option>Mathematics</option>
  <option>Media Studies</option>
  <option>Management</option>
  <option>Nursing</option>
  <option>Philosophy</option>
  <option>Physics</option>
  <option>Political Science</option>
  <option>Psychology</option>
  <option>Sociology</option>
  <option>Spanish</option>
  <option>Statistics</option>
  <option>Theatre</option>
  <option>World Literature</option>
  </select>
  <input type="text" name="title" size="50">
  <input type="submit" value="Submit"><input type="reset" value="Reset"></p>
</form>

<%
// Colors for different item categories
HashMap<String,String> colors = new HashMap<String,String>();	

colors.put("Anthropology", "#762020");
colors.put("Applied Science Professional Platform", "#983737");
colors.put("Applied Science", "#C34545");
colors.put("Art History and Visual Culture", "#D02A2A");
colors.put("Astronomy", "#C35030");
colors.put("Biochemistry", "#EE5D32");
colors.put("Biology", "#FF3800");
colors.put("Creative and Critical Studies", "#A85412");
colors.put("Chemistry", "#C65700");
colors.put("Computer Science", "#E47A26");
colors.put("Creative Writing", "#FF7100");
colors.put("Cultural Studies", "#FFD800");
colors.put("Curriculum Studies", "#B39C1F");
colors.put("Data Science", "#699411");
colors.put("Digital Humanities", "#80DF00");
colors.put("Educational Administration", "#9EEB00");
colors.put("Early Childhood Education", "#2F8414");
colors.put("Economics", "#4BAD2B");
colors.put("Educational Studies", "#64EF36");
colors.put("Earth & Environmental Sciences", "#057225");
colors.put("English", "#346C44");
colors.put("Engineering", "#25B64E");
colors.put("Educational Psychology and Special Education", "#277C5A");
colors.put("Educational Technology", "#20BE7F");
colors.put("Film", "#0DC3CA");
colors.put("French", "#0C87CD");
colors.put("Geography", "#1E54AA");
colors.put("German", "#1662DA");
colors.put("Health Studies", "#3C3ED5");
colors.put("Health-Interprofessional", "#0004FF");
colors.put("History", "#5D3BDD");
colors.put("Human Kinetics", "#571A90");
colors.put("Indigenous Studies", "#7F5BA0");
colors.put("Japanese Studies", "#7A2EC0");
colors.put("Language and Literacy Education", "#89309B");
colors.put("Mathematics", "#8D1A89");
colors.put("Media Studies", "#A852A5");
colors.put("Management", "#E627DF");
colors.put("Nursing", "#F269D5");
colors.put("Philosophy", "#7B0E40");
colors.put("Physics", "#993965");
colors.put("Political Science", "#E43987");
colors.put("Psychology", "#FF0074");
colors.put("Sociology", "#770B22");
colors.put("Spanish", "#B5435B");
colors.put("Statistics", "#B54343");
colors.put("Theatre", "#CA313D");
colors.put("World Literature", "#020000");
%>

<%
	// Get product name to search for
String title = request.getParameter("title");
String category = request.getParameter("subject");

boolean hasNameParam = title != null && !title.equals("");
boolean hasCategoryParam = category != null && !category.equals("") && !category.equals("All");
String filter = "", sql = "";

if (hasNameParam && hasCategoryParam)
{
	filter = "<h3>Books containing '"+title+"' in subject: '"+category+"'</h3>";
	title = '%'+title+'%';
	sql = "SELECT sellerUserName, auctionId,title,author,startPrice, subject FROM Book WHERE title LIKE ? AND subject = ?";
	
}
else if (hasNameParam)
{
	filter = "<h3>Books containing '"+title+"'</h3>";
	title = '%'+title+'%';
	sql = "SELECT auctionId, sellerUserName,title,author,subject,startPrice t FROM Book WHERE title LIKE ?";
}
else if (hasCategoryParam)
{
	filter = "<h3>Books in subject: '"+category+"'</h3>";
	sql = "SELECT auctionId, sellerUserName,title,author,subject,startPrice  FROM Book WHERE subject = ?";
}
else
{
	filter = "<h3>All Products</h3>";
	sql = "SELECT auctionId, sellerUserName,title,author,subject,startPrice FROM Book";
}

out.println(filter);

NumberFormat currFormat = NumberFormat.getCurrencyInstance();

try 
{
	
	
	
	
	
	loginDetails ld = new loginDetails();
	String url = ld.getUrl();
	String uid = ld.getUid();
	String pw = ld.getPw();
	Connection con = DriverManager.getConnection(url, uid, pw);
	
	
	
	
	
	
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	if (hasNameParam)
	{
		pstmt.setString(1, title);	
		if (hasCategoryParam)
		{
			pstmt.setString(2, category);
		}
	}
	else if (hasCategoryParam)
	{
		pstmt.setString(1, category);
	}
	
	ResultSet rst = pstmt.executeQuery();
	
	out.print("<font face=\"Century Gothic\" size=\"2\"><table class=\"table\" border=\"1\"><tr><th class=\"col-md-1\"></th><th></th><th>Auction Id</th><th>Seller</th> <th>Book title</th>");
	out.println("<th>Author</th><th>Subject</th><th>Starting Price</th></tr>");

	while (rst.next()) 
	{
		out.print("dank");
		Double minBid = Double.parseDouble(rst.getString(6));
		minBid += 1.0;
		
		out.print("<td class=\"col-md-1\"><a href=\"bid.jsp?auctionId=" + rst.getString(1) 
				+ "&title=" + URLEncoder.encode(rst.getString(3), "Windows-1252")
				+ "&startingPrice=" + minBid + "\">Place Bid</a></td>");
		%><td> <form method="get" action="saveAuction.jsp">
		<input type="submit" value="Save Auction">
		<input type="hidden" name="auctionId" value="<%out.print(rst.getString(1));%>">
		<input type="hidden" name="value" value="-100">
		<input type ="hidden" name = "startingPrice" value="-100">
		</form></td><%
		String bookCategory = rst.getString(4);
		String color = (String) colors.get(bookCategory);
		if (color == null)
			color = "red";

		out.println("<td><font color=\"" + color + "\">" + rst.getString(1) + "</font></td>"
				+"<td><font color=\"" + color + "\">" + rst.getString(2) + "</font></td>"
				+"<td><font color=\"" + color + "\">" + rst.getString(3) + "</font></td>"
				+"<td><font color=\"" + color + "\">" + rst.getString(4) + "</font></td>"
				+ "<td><font color=\"" + color + "\">" + rst.getString(5) + "</font></td>"
				+ "<td><font color=\"" + color + "\">" + currFormat.format(rst.getDouble(6))
				+ "</font></td></tr>");

			
	}
	out.println("</table></font>");
	closeConnection();
} catch (SQLException ex) {
	out.println(ex);
}

%>
</body>
</html>