<%
    session.setAttribute("logado", "false");
    session.invalidate();
    response.sendRedirect("index.jsp");
    
%>
