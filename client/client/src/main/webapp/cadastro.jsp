<jsp:include page="components/head.jsp" />    

    <body>
         <script>
             
              
              $(document).ready(function(){
                 $("#sub").click(async function(){
                        
                        let nome = document.getElementById("nombre").value;
                        let email = document.getElementById("email").value;
                        let senha = document.getElementById("password").value;
                        let senhaConf = document.getElementById("passwordConf").value;
                        console.log(senha); 
                        console.log(email);
                        console.log(senhaConf);
                        console.log(nome)
                    if(nome.length > 0 && email.length > 0 && senha.length > 0 && senhaConf.length > 0){
                        
                        let dados;
                        if(senhaConf != senha){
                             return swal("Senhas não conferem");
                        }else{
                            dados = {
                            nome:nome,
                            email:email,
                            senha:senha
                        };
                         const req = await fetch("http://localhost:9000/users/cadastro",{
                             method:"POST",
                             headers: { 
                                 'Content-Type': 'application/json',
                                 'Access-Control-Allow-Origin' : '*',
                                 'Access-Control-Allow-Methods' : 'GET, POST, PUT, DELETE',
                                 'X-Requested-With': 'XMLHttpRequest',
                                 'Access-Control-Allow-Headers' : 'Origin, X-Requested-With, Content-Type, Accept'  
                             },
                             body:JSON.stringify(dados)
                         });
                             req.status == 500 ? swal({title:"Atenção!", text:"Usuário já cadastrado tente novamente com um email diferente!", icon:"warning"}) : swal({title:"Parabéns", text:"você Será redirecionado para pagina de login!", icon:"success", buttons:false}).then(setTimeout(function(){window.location.href="index.jsp";},5000));
                         }
                        }else{
                            swal({title:"Atenção!", text:"Todos os campos devem estar preenchidos!", icon:"warning"});
                        }
                     
                  });
              });
          </script>  
          
<div class="container">
    <h1>Cadastre-se!</h1>
    <div class="card">
        <div class="card-header ">
        </div>
        <div class="card-body">
          <blockquote class="blockquote mb-0">
            <div class="container">
                <form id="formCadastro" class="row">
                    <div class="form-group col-6" >
                        <label for="email">Nome</label>
                        <input type="text" class="form-control" name="nome" id="nombre"  placeholder="Enter nome">
                    </div>
                    <div class="form-group col-6" >
                        <label for="email">Email</label>
                        <input type="email" class="form-control" name="email" id="email"  placeholder="Enter email">
                    </div>
                    <div class="form-group col-6" >
                        <label for="senha">Senha</label>
                        <input type="password" name="senha" class="form-control" id="password" placeholder="Senha">
                    </div>
                    <div class="form-group col-6">
                        <label for="passwordConf">Confirme sua Senha</label>
                        <input type="password" senha="passoerdConf" class="form-control" id="passwordConf" >
                    </div>  
                   
                </form>
                 <a href="#" id="sub" class="btn btn-primary" ><b>Cadastrar</b></a>
            </div>
      
          </blockquote>
        </div>
    </div>
</div>
    </body>
<jsp:include page="components/footer.jsp" /> 