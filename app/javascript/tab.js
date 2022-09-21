const tab = () => {
  let tabs = $(".tab");
  $(".tab").on("click", function() {
    $(".tab-active").removeClass("tab-active");
    $(this).addClass("tab-active");
    const index = tabs.index(this);
    $(".tabbox").removeClass("box-show").eq(index).addClass("box-show");
  });
};

window.addEventListener('DOMContentLoaded',tab)