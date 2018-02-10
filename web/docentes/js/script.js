(function(){
	$(document).ready(function(){
		$(".menu li:has(ul)").click(function(e){
			e.preventDefault();
			if($(this).hasClass('activo')){
                               
                                $(this).removeClass('activo');
				$(this).children('ul').slideUp();
                                
			}else{
                                $("#btnForm").css("display", "none");
				$('.menu li ul').slideUp();
				$('.menu li').removeClass('activo');
				$(this).addClass('activo');
				$(this).children('ul').slideDown();
			}
		});
	});
        $("#btnForm").click(function(e){
            $(".add-btn-alumno").hide(1000);
            $(".contenedor-menu").hide("slow");
            $(".contenedor-form").show(1000);
        });
}());