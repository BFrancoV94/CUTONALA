/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor. registroMaterias
 * http://localhost:8080/CUTONALA/docentes/formats/getCarrers.jsp
 */

$(document).ready(function(){
   $("#optionCarrera").click(function(){
       var url = "http://localhost:8080/CUTONALA/docentes/formats/getCarrers.jsp";
            $.ajax({
                type:"GET",
                url:url,
                data: $("#optionCarrera").val(),
                success: function(data){ 
                  $("#resOptionCarrs").html(data);
                }
            });
        return false;
   });
    
    
    
});