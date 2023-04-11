// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// $(document).ready(function() {
$(document).on('turbo:load', function() {
    $('.alert').delay(2000).fadeOut(2000);
});