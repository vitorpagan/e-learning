page.at('video_classes#show', function() {
  $('[data-buy-course]').on('click', function(){
    mediator.trigger('shopping_cart:course:add', { course_id: $(this).data('course-id')});
  });

  $('[data-buy-video-class]').on('click', function(){
    mediator.trigger('shopping_cart:video_class:add', { video_class_id: $(this).data('video-class-id')});
  });
});