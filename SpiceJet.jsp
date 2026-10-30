<%@ page import="java.sql.*" %>
<h1><center>SpiceJet Airlines</h1>
<h3>- Have a nice trip!!!</h3></center>
Your Booking Details
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection c=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/airdb","root","1234");
String f=request.getParameter("flight_no");
int n=Integer.parseInt(request.getParameter("no"));
PreparedStatement p=c.prepareStatement("SELECT * FROM stable WHERE FlightNo=?");
p.setString(1,f); ResultSet r=p.executeQuery();

if(r.next()){
int seats=r.getInt(8);
out.print("<table border=1><tr><th>Name</th><th>Age</th><th>Sex</th><th>Flight No</th><th>From</th><th>To</th><th>Departure</th><th>Arrival</th><th>Start</th><th>Reach</th><th>Seat No</th></tr>");
for(int i=1;i<=n;i++){
out.print("<tr><td>"+request.getParameter("pas"+i+"_name")+"</td><td>"+request.getParameter("pas"+i+"_age")+"</td><td>"+request.getParameter("pas"+i+"_sex")+"</td>");
for(int j=1;j<=7;j++) out.print("<td>"+r.getString(j)+"</td>");
out.print("<td>"+seats--+"</td></tr>");
}
out.print("</table>");
if(seats>=0){
p=c.prepareStatement("UPDATE stable SET SeatCapacity=? WHERE FlightNo=?");
p.setInt(1,seats);p.setString(2,f);p.executeUpdate();
out.print("Update success");
}else out.print("Not enough seats!");
}
c.close();
%>