$(document).ready(function() {
  $.ajax({
    url: 'http://localhost:3000/',
    dataType: 'json'
  }).done(function(data){
  })


  $('.create_question').on('submit', function(event){
    event.preventDefault();
    var route = $(this).attr('action')
    debugger
    request = $.ajax({
      url: route,
      method: "post",
      data: $(this).serialize(),
      dataType: 'json'
    });
    request.done(function(data){

       console.log(data)

      var source = $('#question-template').html();
      var template = Handlebars.compile(source);
      var placeholder = $('.stackoverflow');
      placeholder.append(template(data));

    });
  });

  $('.question_upvote').on('click', function(event){
    event.preventDefault();
    var route = $(event.target).closest('form').attr('action')
    // var voteCount = $(event.target).closest('form').siblings('.vote-count')
    var $voteCount = $(this).parent().parent().find('p')
    $.ajax({
      url: route,
      method: "put"
    })
    .success(function(data) {
      $voteCount.text(data);
    })
  })
  $('.question_downvote').on('click', function(event){
    event.preventDefault();
    var route = $(event.target).closest('form').attr('action')
    var $voteCount =$(this).parent().parent().find('p')
    $.ajax({
      url: route,
      method: "put"
    })
    .success(function(data){
      $voteCount.text(data);
    })
  })
});
