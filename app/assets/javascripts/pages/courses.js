page.at('courses#show', function() {
  $('[data-buy-course]').on('click', function(){
    mediator.trigger('shopping_cart:course:add', { course_id: $(this).data('course-id')});
  });
});
page.at('courses#index', function() {
  $('body').on('ajax:success', '.sidebar form', function(ev, response){
    var coursesHTML = Handlebars.compile($('#courses-template').html());
    var sidebarHTML = coursesHTML({ courses: response.courses });
    $('[data-courses-container]').html(sidebarHTML);
    refreshUI();
  });

  $('li.category input').on('click', function(e){
    var checked = this.checked;
    $.each($('.sidebar').find('[data-parent-category-id="'+ $(this).val() +'"]'), function(){
      this.checked = checked;
    });
  });

  function refreshUI(){
    //var windowHeight = $(window).height();
    var containerHeight = $('[data-courses-container]').height();
    var sidebarHeight = $('.sidebar').height();

    $('.sidebar').height(Math.max(containerHeight, sidebarHeight));
  };

  refreshUI();
});
