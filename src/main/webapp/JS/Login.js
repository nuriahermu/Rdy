/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function ValidarDatos(){
var formulario = document.getElementById("formlogin");
var errorMensaje = document.getElementById("error");

formulario.addEventListener('submit', function (e) {

    e.preventDefault();
    console.log("le has dado a enviar")

    var datos = new FormData(formulario);
    console.log(datos)
    console.log(datos.get('usuario'));
    console.log(datos.get('clave'));

        fetch('postLogin.php', {
            method: 'POST',
            body: datos
        })
    .then(data => {
                if (data === 'camposVacios') {
                    errorMensaje.innerHTML = `
                        < div class="alert alert-danger" role = "alert" >
                            Debe rellenar todos los campos
                        </div > 
                    `
                }
            }) 
    if (datos.get('usuario') === "" || datos.get('clave') === "") {
        errorMensaje.innerHTML = `
                         Debe rellenar todos los campos
                     ` 
   }else{

   }

});


}
