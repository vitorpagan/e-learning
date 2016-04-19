window.app = window.app || {};

(function(app, mediator, $) {
  function ShoppingCart(container) {
    this.containerHeader = container;
    this.containerBody = $('[data-shopping-cart-container]');
    this.shoppingCartTemplateHeader = Handlebars.compile($('#shopping-cart-template-header').html());
    this.shoppingCartTemplate = Handlebars.compile($('#shopping-cart-template').html());
    this.bindEvents();
    this.initialize();
  }

  var fn = ShoppingCart.prototype;

  fn.initialize = function() {
    this.getItems();
  };

  fn.bindEvents = function() {
    mediator.on('shopping_cart:course:add', this.addCourse, this);
    mediator.on('shopping_cart:video_class:add', this.addVideoClass, this);
    // this.containerHeader.on('click', 'i', this.toggleShoppingCart.bind(this));
    //$('body').on('click', '[data-remove-course]', this.removeCourse.bind(this));
    //$('body').on('click', '[data-remove-video-class]', this.removeVideoClass.bind(this));
  };

  fn.toggleShoppingCart = function(){
    this.containerBody.css('top', ($('nav').height() + 20) + 'px').toggle();
  };

  fn.removeCourse = function(e){
    var target = $(e.target);
    var self = this;
    return $.ajax({ url: '/carrinho/remove_course', type: 'GET', data: { course_id: target.data('course-id')} }).pipe(function(result){
      self.getItems();
      self.displayMessage('Módulo removido do carrinho.');
      return result.shopping_cart_item;
    });
  };

  fn.removeVideoClass = function(e){
    var target = $(e.target);
    var self = this;
    return $.ajax({ url: '/carrinho/remove_video_class', type: 'GET', data: { video_class_id: target.data('video-class-id')} }).pipe(function(result){
      self.getItems();
      self.displayMessage('Aula removida do carrinho.');
      return result.shopping_cart_item;
    });
  };

  fn.addCourse = function(data){
    var self = this;
    return $.ajax({ url: '/carrinho/add_course', type: 'GET', data: { course_id: data.course_id} }).pipe(function(result){
      self.getItems();
      self.displayMessage('Módulo adicionado ao carrinho.');
      return result.shopping_cart_item;
    });
  };

  fn.displayMessage = function(message) {
    $('[data-shopping-cart-message]')
      .find('[data-shopping-cart-message-content]')
      .html(message);
    $('[data-shopping-cart-message]').slideDown(function() {
        setTimeout(function() {
            $('[data-shopping-cart-message]').slideUp();
        }, 5000);
    });
  };

  fn.addVideoClass = function(data){
    var self = this;
    return $.ajax({ url: '/carrinho/add_video_class', type: 'GET', data: { video_class_id: data.video_class_id} }).pipe(function(result){
      self.getItems();
      self.displayMessage('Aula adicionada ao carrinho.');
      return result.shopping_cart_item;
    });
  };

  fn.fetch = function(url) {
    return $.getJSON(url);
  };

  fn.getItems = function(){
    var self = this;
    return this.fetch('/carrinho/get_items').pipe(function(data){
      self.containerHeader.html(self.shoppingCartTemplateHeader({ 'items-count': data.shopping_carts.length }));
      self.containerBody.html(self.shoppingCartTemplate({ items: data.shopping_carts }));
      return data.shopping_carts;
    });
  };

  app.ShoppingCart = ShoppingCart;
})(window.app, window.mediator, window.jQuery);
