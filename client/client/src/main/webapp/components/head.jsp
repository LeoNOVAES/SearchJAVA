<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.LinkedHashMap"%>
<!DOCTYPE html>
<%@page import="java.net.MalformedURLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%
    Object login = session.getAttribute("logado");
    Object nome = session.getAttribute("nome"); 
    Object pass = session.getAttribute("pass");
    Object email = session.getAttribute("email");
    String upnome = request.getParameter("upname");
    String newPassword = request.getParameter("newPassword");
   
%>

<html>
    <head>
        <title>Search Any</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script  src="./js/jquery-3.4.0.min.js"></script>
         <script  src="./js/cicle.js"></script>
         

    </head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-success" style="margin-bottom:2%">
        <a class="navbar-brand" ><img src="./components/Search.jpg" width="50px" height="50px"></a>
           <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
              <span class="navbar-toggler-icon"></span>
           </button>
        <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
            <ul class="navbar-nav mr-auto">
            <% if(login.equals("true")){%>
              <li class="nav-item active">
                <a class="nav-link" href="home.jsp"> Home <span class="sr-only">(página atual)</span></a>
              </li>
            <% }else{ %>
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp"> Login <span class="sr-only">(página atual)</span></a>
                </li>
            <% } %>
              <li>
                  <a class="nav-link" href="cadastro.jsp"> Sobre nós <span class="sr-only">(página atual)</span></a>
              </li>
            </ul>
            <% if(login.equals("true")){%>
            
            <div class="dropdown">
                <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <% out.println(nome); %>
                </button>
                <div class="dropdown-menu dropdown-menu-right">
                  <button class="dropdown-item" type="button" data-toggle="modal" data-target="#ExemploModalCentralizado" >Editar Dados</button>
                  
                  <a class="dropdown-item" href="logoff.jsp" type="button">Sair</a>
                </div>
            </div>
            <% }else{ %>
            <div class="">
                <a href="cadastro.jsp" class="btn btn-secondary">
                  Cadastre-se
                </a>
                
            </div>
            <%}%>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="ExemploModalCentralizado" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="TituloModalCentralizado">Edite seus Dados</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <form>
                    <div class="form-group">
                      <label for="exampleInputEmail1">Nome</label>
                      <input type="text" name="upname" class="form-control" value="<%= nome %>" id="nomeEdit"  placeholder="Nome">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Nova Senha</label>
                      <input type="password" name="newPassword" class="form-control" id="senhaNew" placeholder="Nova Senha">
                    </div>
                     <div style="display:none" class="form-group">
                      <label for="exampleInputPassword1"></label>
                      <input type="password" name="oldPassword" value="<%= pass %>"  class="form-control" id="oldpass">
                    </div>
                     <div style="display:none" class="form-group">
                      <label for="exampleInputPassword1"></label>
                      <input type="text" name="emailEd" value="<%= email %>"  class="form-control" id="emailEd">
                    </div>
                    
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                <a href="#" id="formEdit" class="btn btn-success">Salvar mudanças</a>
                
              </div>
              </form>  
            </div>
          </div>
        </div>
    </nav>
      