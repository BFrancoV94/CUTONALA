/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * toChangePass
 */

$(document).ready(function(){
    $("#formChngePsw").submit(function(){
            var url = "http://localhost:8080/CUTONALA/changePassword";
            $.ajax({
                type:"POST",
                url:url,
                data: $("#formChngePsw").serialize(),
                success: function(data){ 
                  $("#resultChngePssw").html(data);
                  document.getElementById("passwordNwe").value = "";
                  document.getElementById("confPassw").value = "";
                }
            });
            return false;
	});
        
        
        //Methods for change views with jquery 
        $(".passw").click(function(){
		$("#sectCdesClass").css("display","none");
		$("#sectCdesClass").hide("slow");
                    $("#sectChngePass").show("slow");
                    $("#sectChngePass").css("display","block");
                    $("#sectChngePass").slideDown();
	});
        
        $(".cdesClss").click(function(){
		$("#sectChngePass").css("display","none");
		$("#sectChngePass").hide("slow");
                    $("#sectCdesClass").show("slow");
                    $("#sectCdesClass").css("display","block");
                    $("#sectCdesClass").slideDown();
	});
});
