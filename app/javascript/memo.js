function memo() {
 const submit = document.getElementById("submit");//フォームのidを取得しボタンの情報を取得
 submit.addEventListener("click", (e) => {//クリックイベント発生させる
   const formData = new FormData(document.getElementById("form"));//フォームに書かれた内容を取得しformDataに代入
   const XHR = new XMLHttpRequest();//XHRを定義
   XHR.open("POST", "/posts", true);//XHRの初期化
   XHR.responseType = "json";//レスポンスの形式を定義
   XHR.send(formData);//送信する４行目のこと
   XHR.onload = () => {
     if (XHR.status != 200) {//200以外のHttpステータスだった場合
       alert(`Error ${XHR.status}: ${XHR.statusText}`);
       return null;
     }
     const item = XHR.response.post;//レスポンスとして返却されたメモのレコードを取得している
     const list = document.getElementById("list");//HTMLの描画する場所を指定する際にリストの要素取得している
     const formText = document.getElementById("content");//入力フォームの内容をリセットするため
     const HTML = `
       <div class="post" data-id=${item.id}>
         <div class="post-date">
           投稿日時：${item.created_at}
         </div>
         <div class="post-content">
         ${item.content}
         </div>
       </div>`;//１７〜２５までがメモとして描画する部分のHTMLを定義している
     list.insertAdjacentHTML("afterend", HTML);//リストの要素の直前に対してHTMLを追加
     formText.value = "";//入力後のフォームテキスト欄が空欄になる
   };
   e.preventDefault();
 });
}
window.addEventListener("load", memo);