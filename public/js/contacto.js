window.onload= function(){
    document.getElementById("#realizar").onclick = validar;
    document.getElementById("3").onkeypress = soloNumeros;
    document.getElementById("borrar").onclick = borrar;
    setInterval(muestraReloj,1000); 
}

function validar(event){
    var nombre = document.getElementById("1");
    var apellido = document.getElementById("2");
    var dni = document.getElementById("4");
    var telefono = document.getElementById("3");
    var pedido = document.getElementById("pedidos");
    if(dni.value == ""){
        alert("Hay campos obligatorios vacios");
        event.preventDefault();
    }else{
        alert("[Pedido enviado correctamente]" +"\n" +"¡PORFAVOR! Revise su pedido:"+ "\n" +"Su nombre es ->" + nombre.value 
        + "\n" + "Su apellido es ->" + apellido.value + "\n" +"Su dni es ->" + dni.value + "\n" +"Su telefono es ->" + telefono.value +
        "\n" +"Ha elegido ->" + pedido.value);
    }
}

function muestraReloj() {
  

    var fechaHora = new Date();
    var horas = fechaHora.getHours();
    var minutos = fechaHora.getMinutes();
    var segundos = fechaHora.getSeconds();
    
    
    
    if(horas < 10) { horas = '0' + horas;}
    if(minutos < 10) { minutos = '0' + minutos;}
    if(segundos < 10) { segundos = '0' + segundos;}
    
    
    document.getElementById("reloj").innerHTML = horas+':'+minutos+':'+segundos;
    }
      
function soloNumeros (event){
    let code = event.keyCode;

    if (code<= 47 || code >= 58){
      event.preventDefault();
    }
    
}

function borrar(){
    document.getElementById("form").reset();
   }