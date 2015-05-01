$(document).ready(function(){
  $('.upvote').on('click', function(event){
    event.preventDefault();
    var route = $(event.target).closest('form').attr('action')
    var voteCount = $(event.target).closest('form').siblings('.vote-count')
    $.ajax({
      url: route,
      method: "put"
    })
    .success(function(data) {
      $(voteCount).text(data);
    })
  })
  $('.downvote').on('click', function(event){
    event.preventDefault();
    var route = $(event.target).closest('form').attr('action')
    var voteCount =$(event.target).closest('form').siblings('.vote-count')
    $.ajax({
      url: route,
      method: "put"
    })
    .success(function(data){
      $(voteCount).text(data);
    })
  })
})
