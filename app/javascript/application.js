// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

$(document).on('turbolinks:load', function () {
    // Initialize the last activity timestamp
    let lastActivity = new Date();
  
    // Function to update the last activity timestamp
    function updateLastActivity() {
      lastActivity = new Date();
    }
  
    // Send an AJAX request to update the last activity timestamp
    function sendActivityUpdate() {
      $.ajax({
        url: '/update_activity',
        type: 'POST',
        data: {},
        success: function () {
          // Success callback
        },
        error: function () {
          // Error callback
        },
      });
    }
  
    // Set up event listeners to track user activity
    $(document).on('mousemove keydown', function () {
      updateLastActivity();
    });
  
    // Periodically send an AJAX request to update the last activity
    setInterval(function () {
      sendActivityUpdate();
    }, 60000); // Update every minute (adjust as needed)
});  