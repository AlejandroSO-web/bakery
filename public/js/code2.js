window.onload = function(){
    if (window.XMLHttpRequest) {
         XMLHttpRequestObject = new XMLHttpRequest();
        } else if (window.ActiveXObject) {
                XMLHttpRequestObject = new ActiveXObject("Microsoft.XMLHTTP");
 }
    document.getElementById("boton").onclick = sacardatos;

}

function sacardatos(){
    if(XMLHttpRequestObject) {
    XMLHttpRequestObject.open("GET","imagen.txt");
    XMLHttpRequestObject.onreadystatechange = function(){
    if (XMLHttpRequestObject.readyState == 4 && XMLHttpRequestObject.status == 200) {
    document.getElementById("mix").src = XMLHttpRequestObject.responseText;
        }      
            }
    XMLHttpRequestObject.send(null);
    }
}