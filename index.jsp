<%@ page contentType="text/html" %>
<center>
<h1>Travel Easy</h1>
<h3>- A Smarter way to travel</h3>
<b>Enter your Details</b>
<form action="AirlineList.jsp" method="post">
<table cellpadding="6">
<tr><td>From</td><td><input name="txt_from"></td></tr>
<tr><td>To</td><td><input name="txt_to"></td></tr>
<tr><td>Date</td><td><input name="txt_depart"></td></tr>
<tr><td>Passengers</td><td><input name="txt_no"></td></tr>
<tr><td>Flight Type</td><td>
<input type="radio" name="group1" value="domestic">Domestic
<input type="radio" name="group1" value="international">International
</td></tr>
<tr><td>Airline</td><td>
<select name="airline">
<option>Kingfisher</option><option>SpiceJet</option>
</select></td></tr>
</table>
<input type="submit" value="Find Flights">
</form></center>