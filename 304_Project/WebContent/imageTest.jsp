
<%@ page import="java.sql.*, data.loginDetails, java.io.*, java.util.Date, java.text.SimpleDateFormat, javax.imageio.ImageIO, java.awt.image.BufferedImage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Testing Page</title>
</head>
<body>
	<%
	// Currently very broken.  Do not use.
	// Currently very broken.  Do not use.
	// Currently very broken.  Do not use.
	// Currently very broken.  Do not use.
	// Currently very broken.  Do not use.
	// Currently very broken.  Do not use.
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (java.lang.ClassNotFoundException e) {
			out.println("ClassNotFoundException: " + e);
		}
		// Making connection
		loginDetails ld = new loginDetails();
		String url = ld.getUrl();
		String uid = ld.getUid();
		String pw = ld.getPw();

		Connection con = DriverManager.getConnection(url, uid, pw);
		File imgFile = new File("");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		FileInputStream fin = new FileInputStream(imgFile);
		Blob image = null;
		
		String SQL = "INSERT INTO Auction (sellerUserName,buyerUserName,startDate, endDate) VALUES (?,?,?,?)";
		PreparedStatement pstmt2 = con.prepareStatement(SQL , PreparedStatement.RETURN_GENERATED_KEYS);
		pstmt2.setString(1, "user1");
		pstmt2.setString(2, "user1");
		pstmt2.setString(3, "2018-08-08");
		pstmt2.setString(4, "2019-08-08");
		pstmt2.executeUpdate();
		

		SQL = "insert into Book values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = con.prepareStatement(SQL);
		pstmt.setString(1, "3");
		pstmt.setString(2, "3");
		pstmt.setString(3, "1234");
		pstmt.setString(4, "user1");
		pstmt.setString(5, "1234");
		pstmt.setString(6, "1234");
		pstmt.setString(7, "1234");
		pstmt.setString(8, "1234");
		pstmt.setString(9, "1234");
		pstmt.setString(10, "1234");
		pstmt.setBinaryStream(11, (InputStream) fin, (int) imgFile.length());
		pstmt.executeUpdate();

		SQL = "select image from Book where image is not null";
		pstmt = con.prepareStatement(SQL);
		ResultSet rst = pstmt.executeQuery();

		rst.next();
			out.print("image");
			java.sql.Blob blob = rst.getBlob("image");
			InputStream in = blob.getBinaryStream();  
			BufferedImage image1 = ImageIO.read(in);
		
		

		pstmt.close();
		con.close();
	%>
	<img src="<%=image1 %>" width="500" height="500"/>
</body>
</html>