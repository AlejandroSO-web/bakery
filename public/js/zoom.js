//estructura pluggin

$(document).ready(function () {
    jQuery.fn.zoom = function(){
        this.each(function(){
        elem  = $(this);
        elem.css("transform","scale(1.2)")
    });
    return this;
    };

    //función a realizar

   $("#copa").click(function(){
       $("#copa").zoom();

   })
});