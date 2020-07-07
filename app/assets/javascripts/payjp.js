
// DOM読み込みが完了したら実行
document.addEventListener( "turbolinks:load", (e) => {
  // payjp.jsの初期化
  Payjp.setPublicKey('pk_test_6e50c95aa928084014009d42');
  
  // ボタンのイベントハンドリング
  const btn = document.getElementById("token");
  btn.addEventListener("click", (e) => {
    e.preventDefault();
    // カード情報生成
    const card = {// cardに入力された値をハッシュで格納
      number: document.getElementById("card_number").value,
      cvc: document.getElementById("cvv").value,
      exp_month: document.getElementById("exp_month").value,
      exp_year: document.getElementById("exp_year").value
    };
    // トークン生成
    Payjp.createToken(card, (status, response) => {      // カード情報をpayjpに送りカードトークン(response.id)を受け取る。
      if (status === 200) {                               // 200は通信できている意味  console.log(status);で確認できる。
        
        // 出力（本来はサーバへ送信）
        // document.getElementById("card_token").innerHTML = response.card.id;
        $(this).find('#card_number').val('');
        $("#card_number").val("");
        $("#cvv").val("");
        $("#exp_month").val("");
        $("#exp_year").val("");           // name属性を削除することにより、dataベースに送るのを防ぐ。
        $("#card_token").append(
          $('<input type="hidden" name="payjp-token">').val(response.id)
            ); 
            alert("登録が完了しました");
            $("#charge-form")[0].submit() 
            n.removeAttr('disabled')
          }else {
            alert("カード情報が正しくありません。"); 
          }
        });
      });
    }, false);