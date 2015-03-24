
$(document).on("ready page:load",function(){
   $('.img-popup').on('click',function(){
        var url = $(this).attr('data');
        var src = $(this).attr('src');
        var img = '<img src="' + url + '" class="img-responsive"/>';
        $('#myModal').modal();
        $('#myModal').on('shown.bs.modal', function(){
            $('#myModal .modal-body').html(img);
        });
        $('#myModal').on('hidden.bs.modal', function(){
            $('#myModal .modal-body').html('');
        });
   });  
})