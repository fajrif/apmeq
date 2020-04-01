// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery-ui
//= require rails-ujs
//= require popper.min.js
//= require jquery.blockui.min.js
//= require jquery.slimscroll.js
//= require bootstrap.min.js
//= require bootstrap-switch.min.js
//= require jquery.sparkline.js
//= require sparkline-data.js
//= require app2.js
//= require layout.js
//= require material.min.js
//= require moment-with-locales.min.js
//= require bootstrap-material-datetimepicker.js


jQuery(document).ready(function($){
  if (history && history.pushState) {
    // handle index sort and pagination using ajax
    $("#index_table th a, #index_table .pagination a").on("click", function(e) {
      $.getScript(this.href);
      history.pushState({module:"leave"}, document.title, this.href);
      e.preventDefault();
    });

    $(".filter_checkbox").click(function(e) {
      $.get($("#index_search").attr("action"), $("#index_search").serialize(), {module:"leave"}, "script");
      history.replaceState({module:"leave"}, document.title, $("#index_search").attr("action") + "?" + $("#index_search").serialize());
      e.preventDefault();
    });

    $(".filter_select").change(function(e) {
      $.get($("#index_search").attr("action"), $("#index_search").serialize(), {module:"leave"}, "script");
      history.replaceState({module:"leave"}, document.title, $("#index_search").attr("action") + "?" + $("#index_search").serialize());
      e.preventDefault();
    });

    // handle index input search keyup using ajax
    $("#index_search input").keyup(function(e) {
      $.get($("#index_search").attr("action"), $("#index_search").serialize(), {module:"leave"}, "script");
      history.replaceState({module:"leave"}, document.title, $("#index_search").attr("action") + "?" + $("#index_search").serialize());
      e.preventDefault();
    });

    // bind window for popstate
    $(window).bind("popstate", function(evt) {
      var state = evt.originalEvent.state;
      if (state && state.module === "leave"){
        $.getScript(location.href);
      }
    });
  }
});
