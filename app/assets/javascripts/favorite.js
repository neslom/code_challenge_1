$(document).ready(function() {
  var $itemFavorite = $(".itemFavorite");
  $itemFavorite.click(function() {
    var $item = $(this);
    var itemId = $item.data('id');
    $.ajax({
      method: "POST",
      url: "items/" + itemId + "/favorite",
      success: function(data) {
        alert(data.name + " favorited!");
        $item.replaceWith('<a href="#" class="itemUnfavorite" data-id=' + itemId + '>Remove from Favorites</a>');
        $('.itemUnfavorite').click(function() {
          $item = $(this);
          itemId = $(this).data('id');
          $.ajax({
            method: "GET",
            url: "items/" + itemId + "/unfavorite",
            success: function(data) {
              alert(data.name + " unfavorited!");
              $item.replaceWith('<a href="#" class="itemFavorite" data-id=' + itemId + '>Add to Favorites</a>');
            }
          });
        })
      }
    });
  });
});
