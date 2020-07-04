  document.addEventListener("turbolinks:load", function() {
  const buildImg = (url)=> {
    const html = `
    <div class= "image">
    <img src="${url}" width="100px" height="100px">
    </div>
    `;
    return html;
  }
  $('.image_icon').on('change',function(e) {
    // const element = $('.box-image__icon').children.length;
    // console.log(element);
    const file = e.target.files[0];
    const Url = window.URL.createObjectURL(file);
    if ($('.image')){
      $('.image').remove();
    }
    $('.box-image__icon').append(buildImg(Url));
    
  //   if (element > 1) {
  //     $('.box-image__icon').children.remove();
  //     console.log('ok');
  // } 
})




});