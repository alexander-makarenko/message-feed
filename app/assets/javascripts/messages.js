// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function animatePostCommentsToggles() {
  $('.child-list').off().on('show.bs.collapse hide.bs.collapse', function(e) {
    if ($(this).is(e.target))
      $(this).closest('.post').find('.comments-toggle span')
        .toggleClass('glyphicon-chevron-down glyphicon-chevron-up');
  });
}

function activateCommentsControls() {
  var commentsListsSelector = '.post > [id^=child-list]';
  
  $('#show-comments').off().on('click', function() {
    $(commentsListsSelector).collapse('show');
  });
  
  $('#hide-comments').off().on('click', function() {
    $(commentsListsSelector).collapse('hide').on('hidden.bs.collapse', function() {
      $(window).scroll();
    });
  });
}

function activateInfiniteScrolling() {
  function hidePagination() {
    $('div.pagination').hide();
  }
  function toggleAjaxSpinner() {
    $('.ajax-in-progress').toggleClass('hidden');
  }

  $(window).off('scroll');
  hidePagination();

  if ($('div.pagination').length) {
    var ready = true;
    $(window).bindWithDelay('scroll', function() {
      var url = $('.pagination .next:not(.disabled) a').attr('href');
      var isCloseToPageBottom = $(window).scrollTop() > $(document).height() - $(window).height() - 400;
      if (ready && url && isCloseToPageBottom) {
        ready = false;
        toggleAjaxSpinner();
        $.ajax({ url: url, dataType: 'script' })
          .done(hidePagination)
          .done(toggleAjaxSpinner)
          .done(function() { ready = true; })
          .done(function() { $(window).scroll(); })
      }
    }, 200, true);
  }
  $(window).scroll();
};

$(document).on('turbolinks:load', function() {
  animatePostCommentsToggles();
  activateCommentsControls();
  activateInfiniteScrolling();
});