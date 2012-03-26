
$(function (){
  $('.suggestionInput').attr('onKeyPress', 'return event.keyCode != 13;');
  $('.suggestionInput').keyup(function (event) {
    if(event.keyCode == 38 || event.keyCode == 40){
      if($('#suggestionsBox').children().length > 0){
        activeSug = $('#suggestionsBox > li.active');
        if(activeSug.length == 0){
          // no active suggestions found. mark the first one active
          $($('#suggestionsBox > li')[0]).addClass('active');
        } else {
          activeSug.removeClass('active');
          switch(event.keyCode){
            case 38: // UP arrow
              sug2Activate = activeSug[0].previousSibling;
              if(sug2Activate == null){
                sugs = $('#suggestionsBox > li');
                sug2Activate = sugs[sugs.length-1];
              }
              break;
            case 40: // DOWN arrow
              sug2Activate = activeSug[0].nextSibling;
              if(sug2Activate == null) {
                sug2Activate = $('#suggestionsBox > li')[0];
              }
              break;
          }
          $(sug2Activate).addClass('active');
        }
      }
    } else if(event.keyCode == 13) { // ENTER key
      activeSug = $('#suggestionsBox > li.active');
      if(activeSug.length != 0){
        $(event.target).attr('value', activeSug.text());
        $('#suggestionsBox').hide();
        event.preventDefault();
      }
    } else {
      getSuggestions('/locations/by_prefix/', event.target);
    }
  });
  
  // comment for dev purposes
  $('.suggestionInput').blur(function (event){
    $('#suggestionsBox').hide();
  });
  $('.suggestionInput').focus(function (event){
    getSuggestions('/locations/by_prefix/', event.target);
  });
  $('.suggestionInput').attr('autocomplete', 'off');
  $('body').append('<ul id="suggestionsBox" style="display: none; position: absolute;" class="suggestions"/>');
  $('.datepicker').datepicker();
});

/**
 *  Retrieve the suggestion list for locations starting with the given prefix
 */
function getSuggestions(address, inputTextField, data){
  if(inputTextField.value.length > 1) {
    $.get(address+inputTextField.value, data,
      function (response) {
        children = $('#suggestionsBox').children();
        n = children.length;
        for(i = 0; i < n; ++i){
          $(children[i]).remove();
        }
        n = response.length;
        if(n > 1 || ( n>0 && response[0] != inputTextField.value)){
          for(i = 0; i < n; ++i) {
            $('#suggestionsBox').append('<li>'+response[i].name+'</li>');
          }
          $('#suggestionsBox').css('left', $(inputTextField).offset().left);
          $('#suggestionsBox').css('top', $(inputTextField).offset().top + $(inputTextField).height()+8);
          $('#suggestionsBox').css('width', $(inputTextField).width()+8);
          $('#suggestionsBox').show();
          $('#suggestionsBox > li').hover(function(event){
              $('#suggestionsBox > li.active').removeClass('active');
              $(event.target).addClass('active')
            }
          );
          $('#suggestionsBox > li').click(function (event){
            $(inputTextField).attr('value',$(event.target).text());
            $('#suggestionsBox').hide();
          });
        }
      },
      'json');
  }
}
