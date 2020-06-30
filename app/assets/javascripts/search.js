//いんるリメンタルリサーチ は放棄します、通常検索は可能
// $(function(){
//   var search_list = $('.result')
//   function builtHTML(item){
//     if (item.id == item.id ){
//       var html =`
//                 <ul class="result_lists">
//                   <li class="result_lists_list">
//                     <a class="result_lists_list_link" href= /items/${item.id}>${item.item_name}</a>
//                   </li>
//                 </ul>`
//       search_list.append(html);
//     }else{
//       var html = ""
//     }
//   }  
//   function appendErrMsgToHTML(msg){
//     var html =  `<div class='name'>${ msg }</div>`
//     search_list.append(html);
//   }
  
//   $('.search__input-box__text').on('keyup', function(e){ 
//     e.preventDefault();
//     var input =  $.trim($(this).val());
//     $.ajax({
//       type: 'GET',
//       url: '/items/search',
//       data: { keyword: input},
//       dataType: 'json'
//     })
//     .done(function(items){
//       search_list.empty();
//       if (items.length !== 0) {
//         items.forEach(function(item){
//           builtHTML(item);
//         });
//       }else  {
//         appendErrMsgToHTML("商品はございません");
//       }
//     })
//   });
// });