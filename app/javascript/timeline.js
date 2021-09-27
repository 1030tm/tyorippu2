// 参照URL https://coco-factory.jp/ugokuweb/move01/9-1-6/

// 線が伸びるための設定
function ScrollTimelineAnime(){
  $('.timeline li').each(function(){

    // 値を取得
    const elemPos = $(this).offset().top; // li要素の上からの高さ取得
    const scroll = $(window).scrollTop(); // スクロール値を取得
    const windowHeight = $(window).height(); // windowの高さ取得
    const startPoint = 100; // 線のスタート位置指定
    
    // 関数
    if(scroll >= elemPos - windowHeight - startPoint){
      const H = $(this).outerHeight(true) // liの余白と高さを含めた数値取得
      // スクロール値から要素までの高さを引いた値を、liの高さの半分の％で出す
      var percent = (scroll+startPoint-elemPos)/(H/2)*100; // liの余白と高さの半分で線を100％に伸ばす

      // 100%を超えたらずっと100%を入れ続ける
      if(percent > 100){
        percent = 100;
      }

      // ボーダーの長さをセット
      $(this).children('.border-line').css({
        height:percent+"%", //cssでパーセント指定
      });
    }
  });
}

// 画面をスクロールすると線が伸びるようにする
// $(window).on('scroll', function(){
//   ScrollTimelineAnime();
// });

$(window).on('load', function(){
  ScrollTimelineAnime();
});