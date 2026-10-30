<%@ page import="java.sql.*" %>
<center><h1>Travel Easy</h1>
<h3>- A Smarter way to travel</h3></center>
<%
String f=request.getParameter("txt_from"),
t=request.getParameter("txt_to"),
d=request.getParameter("txt_depart"),
n=request.getParameter("txt_no"),
type=request.getParameter("group1"),
air=request.getParameter("airline");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection c=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/airdb","root","1234");

PreparedStatement p=c.prepareStatement(
"SELECT * FROM stable WHERE Froms=? AND Tos=? AND DepartDate=?");
p.setString(1,f); p.setString(2,t); p.setString(3,d);
ResultSet r=p.executeQuery();
out.print("<h3>"+air+" Flights</h3><table border=1><tr><th>Flight No</th><th>From</th><th>To</th><th>Departure</th><th>Arrival</th><th>Start</th><th>Reach</th><th>Seats</th></tr>");
String flights="";
while(r.next()){
flights+=r.getString(1)+",";
out.print("<tr>");
for(int i=1;i<=8;i++) out.print("<td>"+r.getString(i)+"</td>");
out.print("</tr>");
}
out.print("</table>");
r.close();p.close();

if(flights.isEmpty()) out.print("Sorry!! No flights schedule available");
else {
out.print("<form action='"+air+".jsp' method=post>");
out.print("Select Flight <select name=flight_no>");
for(String x:flights.split(",")) out.print("<option>"+x+"</option>");
out.print("</select><input type=hidden name=no value='"+n+"'><input type=hidden name=air_type value='"+type+"'>");
for(int i=1;i<=Integer.parseInt(n);i++){
out.print("<h3>Passenger "+i+" details</h3>Name <input name=pas"+i+"_name> Age <input name=pas"+i+"_age> Sex <input name=pas"+i+"_sex><br>");
}
out.print("<input type=submit value='Book Now'></form>");
}
c.close();
%>