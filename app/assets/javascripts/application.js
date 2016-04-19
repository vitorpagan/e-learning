// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sass
//= require chosen
//= require slider/js/jssor.slider.mini
//= require jQuery-Mask-Plugin
//= require i18n.js
//= require i18n/translations
//= require page
//= require handlebars
//= require mediator
//= require_tree ./modules
//= require_tree ./pages

window.app = window.app || {};

String.prototype.interpolate = function (o) {
  return this.replace(/{([^{}]*)}/g,
  function (a, b) {
    var r = o[b];
    return typeof r === 'string' || typeof r === 'number' ? r : a;
  }
  );
};

$(function() {
  $('.chosen-select').chosen({
      disable_search_threshold: 10
  });
});

Handlebars.registerHelper('format-currency', function(value, options) {
  return I18n.toCurrency(value, options.hash);
});

Handlebars.registerHelper('greater-than', function(v1, v2, options) {
  if(v1 > v2) return options.fn(this);
});

Handlebars.registerHelper('format-date', function(dateString, format) {
  var date = moment(dateString, moment.ISO_8601),
      formats = {
        date: 'DD/MM/YY',
        fulldate: 'DD/MM/YYYY',
        time: 'HH:mm',
        datetime: 'DD/MM/YY HH:mm'
      };

  return date.format(formats[format]);
});

$(function($) {
  page.dispatch();
  //new app.ShoppingCart($('[data-shopping-cart]'));
  $('body').on('show.bs.tab', function(e){
    var payment_method_id = $(e.target).attr('aria-controls');
    $('[name="order[payment_method_id]"]').val(payment_method_id);
  });

  new window.app.Address("[data-zipcode]");
});
