<%
    session.setAttribute("logado","false");
%>
<%@page import="java.net.MalformedURLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<jsp:include page="components/head.jsp" />    
<body>
   
<div class="container">
     <%  
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String cond = getLogin(email,senha);
     
        if(cond.equals("true")){
            
             session.setAttribute("logado","true");
             session.setAttribute("email",email);
             session.setAttribute("nome",getNomeUser(email));
             session.setAttribute("pass",getPass(email));
             session.setAttribute("id", getIdUser(email));
             
             response.sendRedirect("home.jsp");
           
        }else{  
                session.setAttribute("logado","false");
        }
      %>
    
    <%!
        
        
       public String getIdUser(String email) throws MalformedURLException, IOException{
            
            
            URL url = new URL("http://localhost:9000/users/user/getid/"+email);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Content-Type", 
            "application/x-www-form-urlencoded");
            InputStream is = connection.getInputStream();
            BufferedReader rd = new BufferedReader(new InputStreamReader(is));
            StringBuilder res = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
              res.append(line);
              
            }
            rd.close();
            return res.toString();
       } 

       
       
       public String getNomeUser(String email) throws MalformedURLException, IOException{
            
            
            URL url = new URL("http://localhost:9000/users/user/getnome/"+email);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Content-Type", 
            "application/x-www-form-urlencoded");
            InputStream is = connection.getInputStream();
            BufferedReader rd = new BufferedReader(new InputStreamReader(is));
            StringBuilder res = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
              res.append(line);
              
            }
            rd.close();
            return res.toString();
       } 

        
       public String getLogin(String email, String senha) throws MalformedURLException, IOException{
         
       boolean cond = true;
       if(email == null || senha == null || email.length() == 0 || senha.length() == 0){
            cond = true;
       }else{
            cond=false;
       }
       System.out.println(cond);
       if(cond == true){
            email = "vazio";
            senha="vazio";
       }
        URL url = new URL("http://localhost:9000/users/user/login/"+email+"/"+senha);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
         connection.setRequestMethod("GET");
            connection.setRequestProperty("Content-Type", 
            "application/x-www-form-urlencoded");
            InputStream is = connection.getInputStream();
            BufferedReader rd = new BufferedReader(new InputStreamReader(is));
            StringBuilder res = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
              res.append(line);
              
            }
            rd.close();
            return res.toString();
       }

         public String getPass(String email) throws MalformedURLException, IOException{
            
            
            URL url = new URL("http://localhost:9000/users/user/getPass/"+email);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Content-Type", 
            "application/x-www-form-urlencoded");
            InputStream is = connection.getInputStream();
            BufferedReader rd = new BufferedReader(new InputStreamReader(is));
            StringBuilder res = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
              res.append(line);
              
            }
            rd.close();
            return res.toString();
       } 
  
       
    %>
    
    
    <h1>Login</h1>
    <div class="card">
        <div class="card-header ">
        </div>
        <div class="card-body">
          <blockquote class="blockquote mb-0">
            <div class="container">
                <div class="row">
                    <div class="col" style="margin-right: 10px; border-right: 1px solid #dddddd">
                      <h6 style="text-align:center">Para Usuarios!</h6>
                      <form method="POST" action="./index.jsp" style="padding:10px">
                        <div class="form-group" style="margin-bottom:30px">
                          <label for="email">Email</label>
                          <input type="email" class="form-control" name="email" id="email" placeholder="Enter email">
                        </div>
                        <div class="form-group" style="margin-bottom:30px">
                          <label for="senha">Senha</label>
                          <input type="password" name="senha" class="form-control" id="senha" placeholder="Senha">
                        </div>
                      
                        <button type="submit" id="sub" class="btn btn-success" style="width:100%; padding: 10px; margin-bottom:10px"><b>Entrar</b></button>
                      </form>
                      <p style="font-size: 10pt; color:#a0a0a0">Ao clicar em "cadastrar", você concorda com nossos Termos de Serviço e Declaração de Privacidade.</p>
                    </div>
                    <div class="col">
                      <h6 style="text-align:center">Ainda não tem cadastro?</h6>
                      <h5 style="text-align:center; margin-bottom: 10px"><b>Search Any</b></h5>
                      <div class="container" style="padding:10px; margin-bottom:22px">
                        <p style="font-size:13pt;  text-align: justify; text-indent: 16px">remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>
                      </div>
                      <a   class="btn btn-primary" style="width:100%; padding: 10px; margin-bottom:10px" href="cadastro.jsp"><b>Cadastrar</b></a>
                    </div>
                </div>
            </div>
      
          </blockquote>
        </div>
    </div>
</div>
</body>


<jsp:include page="components/footer.jsp" />    