// function appendOption(category){
//   let html = `<option value="${category.id}" >${category.name}</option>`;
//   return html;
// }

// function appendCheckbox(category){
//   let html =`
//               <div class="sc-side__detail__field__form--checkbox">
//                 <div class="sc-side__detail__field__form--checkbox__btn js_search_checkbox">
//                   <input type="checkbox" value="${category.id}" name="q[category_id_in][]" id="q_category_id_in_${category.id}" >
//                 </div>
//                 <div class="sc-side__detail__field__form--checkbox__label">
//                   <label for="q_category_id_in_${category.id}">${category.name}</label>
//                 </div>
//               </div>
//               `
//   return html;
// }

// // 子カテゴリーの表示作成
// function appendChildrenBox(insertHTML){
//   const childSelectHtml = `<li>
//                             <select id="children_category_search" name="q[category_id]">
//                               <option value="">選択してください</option>
//                               ${insertHTML}
//                             </select>
//                           </li>`;
//   $('.field__input--category_search').append(childSelectHtml);
// }
// // 孫カテゴリーの表示作成
// function appendGrandchildrenBox(insertHTML){
//   const grandchildSelectHtml =`
//                                 <li id="grandchildren_category_checkboxes" class="checkbox-list">
//                                   <div class="sc-side__detail__field__form--checkbox js_search_checkbox-all">
//                                     <div class="sc-side__detail__field__form--checkbox__btn">
//                                       <input class="js-checkbox-all" id="grandchildren_category_all" type="checkbox">
//                                     </div>
//                                     <div class="sc-side__detail__field__form--checkbox__label">
//                                       <label for="grandchildren_category_all">すべて</label>
//                                     </div>
//                                   </div>
//                                   ${insertHTML}
//                                 </li>`;
//     $('.field__input--category_search').append(grandchildSelectHtml);
//   }
//   // 親カテゴリー選択後のイベント
//   $('#parent_category_search').on('change', function(){
//     //選択された親カテゴリーの名前を取得
//     const parentName =$(this).val();
//     if (parentName != ""){
//       //親カテゴリーが初期値でないことを確認
//       $.ajax({
//         url: '/items/category_children',
//         type: 'GET',
//         data: { parent_name: parentName },
//         dataType: 'json'
//       })
//       .done(function(children){
//          //親が変更された時、子以下を削除する
//         $('#children_category_search').remove();
//         $('#grandchildren_category_checkboxes').remove();
//         let insertHTML = '';
//         children.forEach(function(child){
//           insertHTML += appendOption(child);
//         });
//         appendChildrenBox(insertHTML);
//       })
//       .fail(function(){
//         alert('カテゴリー取得に失敗しました');
//       })
//     }else{
//       //親カテゴリーが初期値になった時、子以下を削除する
//       $('#children_category_search').remove();
//       $('#grandchildren_category_checkboxes').remove();
//     }
//   });
//   // 子カテゴリー選択後のイベント
//   $('.field__input--category_search').on('change', '#children_category_search', function(){
//     const childId = $(this).val();
//     //選択された子カテゴリーのidを取得
//     if (childId != ""){
//       //子カテゴリーが初期値でないことを確認
//       $.ajax({
//         url: '/items/category_grandchildren',
//         type: 'GET',
//         data: { child_id:  childId},
//         dataType: 'json'
//       })
//       .done(function(grandchildren){
//         if (grandchildren.length != 0) {
//           //子が変更された時、孫以下を削除する
//           $('#grandchildren_category_checkboxes').remove();
//           let insertHTML = '';
//           grandchildren.forEach(function(grandchild){
//             insertHTML += appendCheckbox(grandchild);
//           });
//           appendGrandchildrenBox(insertHTML);
//         }
//       })
//       .fail(function(){
//         alert('カテゴリー取得に失敗しました');
//       })
//     }else{
//       $('#grandchildren_category_checkboxes').remove();
//     }
//   });