/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var usuario = document.getElementById("usuario");
var password = document.getElementById("password");
var error = document.getElementById("error");
var form = document.getElementById("formulario");
//error.style.color = "red";



function verificar(){
    var usuario = document.getElementById("usuario");
    var password = document.getElementById("password");
    var error = document.getElementById("error");
    
    console.log(usuario.value);
    
    var mensajesError = [];
    
    if(usuario.value === null || usuario.value === ""){
       mensajesError.push("Ingresa tu usuario"); 
    }
    
    if(password.value === null || password.value === ""){
       mensajesError.push("Ingresa tu password"); 
    }
    
    
    if(mensajesError.length > 0){
        error.innerHtml = mensajesError.join(", ");
    }else{
        document.getElementById("formulario").submit();
    }
    
    
    
    return false;
}

