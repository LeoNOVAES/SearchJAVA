<%-- 
    Document   : cadastro
    Created on : 26/04/2019, 18:23:42
    Author     : leandro
--%>
<jsp:include page="components/head.jsp" />    

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <script  src="./js/jquery-3.4.0.min.js"></script>
        <script type="text/javascript" src="js/cicle.js"></script>
<%  
    
    if(!session.getAttribute("logado").equals("true")){
           response.sendRedirect("index.jsp");
           out.println("aqui");
    }
%>
<style>
    *{
        margin:0;
        padding:0;
    }
    
    #images{
        width: 615px;
        height:317px;
        margin:0 auto;
        overflow-y: hidden !important;
    overflow-x: hidden !important;
        }
</style>
<script>
          
    
          $(document).ready(function(){
                 $("#formEdit").click(async function(){
                        let nome = document.getElementById("nomeEdit").value;
                        let senhaNew = document.getElementById("senhaNew").value;
                        let senhaOld = document.getElementById("oldpass").value;
                        let emailEd = document.getElementById("emailEd").value;
                        
                    
                        
                        let dados;
                        
                     
                        if(senhaNew.length > 0){     
                     
                            dados = {
                                nome:nome,
                                email:emailEd,
                                senha:senhaNew
                            };
                        }else{
                                dados = {
                                nome:nome,
                                email:emailEd,
                                senha:senhaOld
                            };
                        }   
                        
                        const req = await fetch("http://localhost:9000/users/user/update/"+emailEd,{
                             method:"PUT",
                             headers: { 
                                 'Content-Type': 'application/json',
                                 'Access-Control-Allow-Origin' : '*',
                                 'Access-Control-Allow-Methods' : 'GET, POST, PUT, DELETE',
                                 'X-Requested-With': 'XMLHttpRequest',
                                 'Access-Control-Allow-Headers' : 'Origin, X-Requested-With, Content-Type, Accept'  
                             },
                             body:JSON.stringify(dados)
                         });
                         
                         req.status == 500 ? swal({title:"Atenção!", text:"erro inesperado!", icon:"warning"}) : swal({title:"Usuario", text:"Alterado com sucesso", icon:"success"});
                       
                     
                  });
              });
              
              
</script>    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa</title>
        
        <script  src="js/jquery-3.4.0.min.js"></script>
        <script>
            
        async function getText(term){
                async function  getT(){
                        let req = await fetch("http://localhost:9000/text/"+term);
                        let res = await req.json();
                        let text={};
                            
                        console.log(term);
                        
                        text.title = res[1];
                        text.content = res[0];
                        
                        return text;
                }
                    
                    let text = await getT();
                    let textFinal = {};
                    text.content = text.content.split("\n");
                    
                    textFinal.content = text.content.filter(function(line){
                        if(line.length === 0 || line.startsWith("=")){
                            return false;
                        }else{
                            return true;
                        }
                    });
                    
                   textFinal.content = (textFinal.content[0].replace("content","=").replace("{", "").replace(":",""));
                   
                   textFinal.title = text.title;
                   return textFinal;
                   
           }
           
        async function getImages(term){
                 
            let req = await fetch("https://www.googleapis.com/customsearch/v1?key=AIzaSyDyOfhAOonKI65696E1qrBX7hVCVyTGyLQ&cx=011093756734311461617:2x5y_zdnz_8&q="+term+"&searchType=image&num=4");
            let res = await req.json();
            return res.items;
            
        }
        
        async function getYoutube(term){
             let req = await fetch("https://www.googleapis.com/customsearch/v1?key=AIzaSyDyOfhAOonKI65696E1qrBX7hVCVyTGyLQ&cx=011093756734311461617:2x5y_zdnz_8&q="+term+"&exactTerms=www.youtube.com/watch?v=&num=1");
            let res = await req.json();
            return res.items;
        }
            
           $(document).ready(function(){
              $("#btn").click(async function(){
                   
                    
                    let term = document.getElementById("term").value;
                    let text = await getText(term);
                    let images = await getImages(term);
                    let videos = await getYoutube(term);
                    
                    
                    
                    $("#images").html(
                                    '<div id="slide">'+    
                                        '<ul>'+
                                            '<li><img src="'+images[0].image.thumbnailLink+'"  alt=""></li>'+
                                            '<li><img src="'+images[1].image.thumbnailLink+'"alt=""></li>'+
                                            '<li><img src="'+images[2].image.thumbnailLink+'"  alt=""></li>'+
                                            '<li><img src="'+images[3].image.thumbnailLink+'" w alt=""></li>'+
                                        '</ul>'+
                                      '</div>'  
                    );  
                    $("#video").html("<iframe width='1110' height='400' src='"+videos[0].link.replace('watch?v=','embed/')+"' frameborder='0' allowfullscreen></iframe>");
                    $("#text").html("<h2>"+text.title+"</h2>"+"<p>"+text.content+"</p>");
              });
           });
           
          
        </script>    
        
    </head>
    <body>
        <div class="container">
                <div class="row">    
                    <div class="col-6">
                        <h1 class="display-4">Seja Bem Vindo <%= session.getAttribute("nome") %>!</h1>
                        <p class="lead">Escolha seu tema</p>
                        <hr class="my-4">
                        <p>Escreva Estritamente correto para que o resultado seja satisfatório!</p>
                        <div class="row">    
                          <input type="text" id="term" class="col-8 form-control"/>
                          <button class="btn btn-dark" id="btn" href="#" style="margin-left:10px" @click="getText">Buscar</button>
                        </div>
                    </div>
                    <div class="col-6"><img src="./components/Search.jpg" width="400px" height="300px"></div>
                  
                </div>
                    
                    <div id="images">
                      
                    </div>    
                    <div  id="video">

                    </div>
                    <div id="text">

                    </div>
        </div>
    </body>
<jsp:include page="components/footer.jsp" />    
