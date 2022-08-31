<%
  int sleep = 0;
  try {
    sleep = Integer.parseInt(request.getParameter("sleep"));    
  } catch (Exception e) {
    sleep = 5;
  }
  System.out.println("accordion call=sleep.jsp");
  Thread.sleep(sleep);
%>
sleep...
