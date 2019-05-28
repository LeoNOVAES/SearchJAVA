/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$("#formCadastro").validate({
    debug:true,
    rules:{
        nome:{
            minlength:3,
            maxlength:10
        },
        senha:{
           minlength:6,
           maxlength:15
        },
        passwordConf:{
           minlength:6,
           maxlength:15  
        }
        
    }
});