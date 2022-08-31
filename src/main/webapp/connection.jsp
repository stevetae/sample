<HTML>
<HEAD>
  <TITLE>Testing Connection Pools</TITLE>
</HEAD>

<BODY>

<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<FONT SIZE="5" COLOR="navy">
<table>
<tr><td><CENTER><b>JDBC Testing Center</b></CENTER></td></tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td><LEFT><b>POD NAME : <%=System.getenv("HOSTNAME")%></LEFT></td></tr>
<tr><td><LEFT><b>Node NAME : <%=System.getenv("MY_NODE_NAME")%></LEFT></td></tr>

</table>


<FORM NAME="testCP" ACTION="connection.jsp" METHOD="POST">
<TABLE WIDTH="50%" ALIGN="left" BGCOLOR="silver">
        <TR><TD ALIGN="right">Table Name</TD>
                <TD><INPUT TYPE="text" NAME="txtTableName" VALUE='<%= ( request.getParameter("txtTableName") == null ) ? "kftp.csi_site" : request.getParameter("txtTableName") %>'></TD>
        </TR>
        <TR><TD ALIGN="center" COLSPAN="2">
                        <INPUT TYPE="submit" NAME="btnSubmit" VALUE="Test Data Source">
                </TD>
        </TR>

</TABLE>
</FORM>
</FONT>
<%
        String url = "jdbc:oracle:thin:@<ip>:<port>:<db name>";
        String table = request.getParameter("txtTableName");
	String username = "<username>";
	String password = "<password>";


        if ((table != null) && (!table.equals(""))) {

                Connection connection = null;

                try {

                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        connection = DriverManager.getConnection(url, username, password);


                        System.out.println("Getting the connection from the database.");

                        Statement statement = connection.createStatement();
                        String sql = "SELECT * FROM " + table;

                        ResultSet rs = statement.executeQuery(sql);
                        System.out.println("Querying the database.");
                        ResultSetMetaData meta = rs.getMetaData();
                        int numColumns = meta.getColumnCount();
%>

                        <BR>
                        <BR>
                        <BR>
                        <BR>
                        <BR>
                        <BR>
                        <p>
                        <TABLE WIDTH="670" BGCOLOR="wheat" ALIGN="left">

<%
                                out.print("<TR>");
                                for (int j=1; j<numColumns; j++) {
                                        out.print("<TD>" + meta.getColumnName(j) + "</TD>");
                                }
                                out.print("</TR>");
                                while (rs.next()) {
                                        out.print("<TR>");
                                        for (int i=1; i<numColumns; i++) {
                                                out.print("<TD>" + rs.getString(i) + "</TD>");
                                        }
                                        out.print("</TR>");
                                }
%>
                                </TABLE>
                                </p>
<%
                                if (statement != null)
                                        statement.close();
                                if (connection != null)
                                        connection.close();

                        } catch (SQLException sqle) {
%>

                                <FONT SIZE="4" COLOR="navy">
                                Error: <%= sqle.getMessage() %><BR><BR>
<%
                        }catch (Exception e) {out.print("error: " + e); }

        }


%>
</FONT>


<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
</BODY>
</HTML>

