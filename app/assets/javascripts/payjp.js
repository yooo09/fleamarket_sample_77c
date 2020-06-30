// DOM読み込みが完了したら実行
document.addEventListener('DOMContentLoaded', (e) => {
  // payjp.jsの初期化
  Payjp.setPublicKey('pk_test_6e50c95aa928084014009d42');
  
  // ボタンのイベントハンドリング
  const btn = document.getElementById("token");
  btn.addEventListener("click", (e) => {
    e.preventDefault();
    
    // カード情報生成
    const card = {
      number: document.getElementById("card_number").value,
      cvc: document.getElementById("cvv").value,
      exp_month: document.getElementById("exp_month").value,
      exp_year: document.getElementById("exp_year").value
    };
    
    // トークン生成
    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        console.log(status);
        // 出力（本来はサーバへ送信）
        document.getElementById("card_token").innerHTML = response.card.id;
        // $(this).find('#card_number').val('');
        $("#card_number").val("");
        $("#cvv").val("");
        $("#exp_month").val("");
        $("#exp_year").val(""); 
        // var token = response.id;
        // $("#card_token").append(`<input type="hidden" name="card_token" value=${token}>`)
        // $("#card_form").get(0).submit();
        $("#card_token").append(
          $('<input type="hidden" name="payjp-token">').val(response.id)
          ); 
          // $("#payjp_token").get(0).submit();
          // $(this).unbind('submit').submit()
          alert("登録が完了しました");
          $("#charge-form")[0].submit()       
          
          // .unbind( [eventType] [, handler(eventObject)] )
          // document.addEventlister('#token').submit();
        
          // <input type="hidden" name="payjp-token" value= response.id>が#card_tokenに追加される。
        
      }else {
        alert("カード情報が正しくありません。"); 
      }
    });
  });
}, false);