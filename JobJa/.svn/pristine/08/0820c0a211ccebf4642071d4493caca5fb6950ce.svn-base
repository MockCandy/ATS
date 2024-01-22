$(document).ready(function(){
	

	console.log("ㅎㅇㅎㅇ");
	
	$('.mem-ul li').hide();
	$(".sub-title").click(function(e){
		 var $this = $(this);
         var $parent = $this.closest('ul');
         
         $('.mem-ul').not($parent).find('li').hide();
         
         $this.nextAll('li').toggle();
         $(this).siblings().removeClass('memActive');
         
	});
	

	$(".my-title").click(function(e){
        var $this = $(this);
        
         if ($this.hasClass('memActive')) {
	        $this.removeClass('memActive');
	        $this.prev('.fa-check').removeClass('memActive');
    	} else {
       	 $this.addClass('memActive');
	        $this.prev('.fa-check').addClass('memActive');
	        $(".my-title").not($this).removeClass('memActive');
	        $(".fa-check").not($this.prev('.fa-check')).removeClass('memActive');
  		 }
    });
	
	
});