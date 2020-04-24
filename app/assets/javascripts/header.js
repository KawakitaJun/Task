$(function(){
  $('.header-text').hover(
    function(){
      $(this).css(
        {
          color: 'rgba(216,216,216,0.8)',
        }
      )
    },
    function(){
      $(this).css(
        {
          color: 'white',
          fontWeight: 'normal',
          border: 'none'
        }
      )
    }
  );

  $('.header-logo').hover(
    function(){
      $(this).css(
        {
          color: 'rgba(216,216,216,0.8)',
        }
      )
    },
    function(){
      $(this).css(
        {
          color: 'white',
        }
      )
    }
  );
});