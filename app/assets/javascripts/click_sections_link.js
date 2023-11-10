$(document).ready(function() {
  $('body').on('click', '#sections_link li:not(.hidden_pt) a', function() {
    if($('#room_calculation_page').length > 0) {
      section_paginate_button = $(`.css-autow ${$(this).data('id')}`);
    } else {
      section_paginate_button = $(`.css-autow .nav-link[href='${$(this).data('click-id')}']`);
    }

    section_paginate_button.click();
    $(`.css-autow .nav-link`).removeClass('active');
    section_paginate_button.addClass('active');
    $('.slick-slide[current=true]').attr('current', false);
    section_paginate_button
      .closest('.slick-slide').not('.slick-cloned').attr('current', true);

    position = section_paginate_button
      .parent().data('index');
    
    slick.slick("slickGoTo", parseInt(position));
  });

  $('body').on('click', '.w-tabscroll-ed .css-autow .nav-link', function() {
    $('div[id^=tabs_section_], .tab-content .tab-pane').removeClass('show active');
    var tab_section_id = $(this).attr('href');
    $(`${tab_section_id}`).addClass('show active');
  });
});
