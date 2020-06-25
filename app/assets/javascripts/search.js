$(function(){
  var search_list = $('.result')
  function builtHTML(item){
    var html =`
              <li>
                 ${item.item_name}
              </li>`
    search_list.append(html);
  }
  
  
  $('.search__input-box__text').on('keyup', function(e){ 
    e.preventDefault();
    var input =  $.trim($(this).val());
    $.ajax({
      type: 'GET',
      url: '/items/search',
      data: { keyword: input},
      dataType: 'json'
    })
    .done(function(items){
      search_list.empty();
      if (items.length !== 0) {
        items.forEach(function(item){
          builtHTML(item);
        });
      }
      // else  {
      //   appendErrMsgToHTML("一致するツイートがありません");
      // }
    })
  });
});