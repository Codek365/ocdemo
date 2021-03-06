.tbToggleButtons,
.tbMobileMenuOverlay
{
  display: none;
}

/*  -----------------------------------------------------------------------------------------
    M O B I L E   max-width: 767px
-----------------------------------------------------------------------------------------  */

@media only screen and (max-width: <?php echo ($screen_sm - 1) . 'px'; ?>) {
  html.tbMobile {
    overflow: hidden;
  }
  #header .tbMobileDisplayBlock,
  .tbMobileMenu .tbMobileMenuDisplayBlock
  {
    display: block !important;
  }

  .tbMobileMenu {
    position: fixed;
    z-index: 1001;
    top: 0;
    <?php if ($lang_dir == 'ltr'): ?>
    left: 0;
    <?php else: ?>
    right: 0;
    <?php endif; ?>
    overflow: auto;
    overflow-x: hidden;
    width: calc(100% - 60px);
    height: 100%;
    padding: <?php echo $mobile_menu_padding; ?>;
    -webkit-transform: translate3d(-100%, 0, 0);
        -ms-transform: translate3d(-100%, 0, 0);
            transform: translate3d(-100%, 0, 0);
    -webkit-transition: all 0.5s;
            transition: all 0.5s;
  }
  html.tbMobile .tbMobileMenu {
    -webkit-transform: translate3d(0, 0, 0);
        -ms-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);

  }
  .tbMobileMenuOverlay {
    position: fixed;
    z-index: 1000;
    top: -10000px;
    right: 0;
    bottom: auto;
    left: 0;
    display: block;
    cursor: pointer;
  }
  .tbMobileMenuOverlay.tbActive {
    top: 0;
    bottom: 0;
  }
  .tbMobileMenuOverlay .tb_bg {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    opacity: 0;
    background: #000;
    /*
    -webkit-transition: opacity 0.5s;
            transition: opacity 0.5s;
    */
  }
  .tbMobileMenuOverlay.tbActive .tb_bg {
    opacity: 0.6;
  }
  .tbMobileMenuOverlay svg {
    position: absolute;
    z-index: 1;
    top: 17px;
    <?php if ($lang_dir == 'ltr'): ?>
    right: 17px;
    <?php else: ?>
    left: 17px;
    <?php endif; ?>
    width: 24px;
    height: 24px;
    color: #fff;
  }

  /*** Mobile header rows / blocks ***/

  #header .tb_widget_header_logo_system,
  #header .tbToggleButtons
  {
    display: inline-block !important;
    min-width: 0 !important;
  }
  #site_logo {
    display: inline-block;
    vertical-align: top;
  }
  #header .row-wrap:not(.tbMobileShow),
  #header [class*="col-"]:not(.tbMobileShow),
  #header [class*="tb_widget"]:not(.tbMobileShow)
  {
    display: none !important;
  }
  #header .row-wrap.tbMobileShow > .row > .tbLogoCol {
    display: -ms-flexbox !important;
    display: -webkit-flex !important;
    display: flex !important;
  }
  #header .tbMobileDisplayBlock {
    -ms-flex: 1 1 100%;
    -webkit-flex: 1 1 100%;
    flex: 1 1 100%;
  }
  #header .tbLogoCol {
              -ms-flex-pack: justify;
    -webkit-justify-content: space-between;
            justify-content: space-between;
  }
  #header .tb_widget_header_logo_system {
        -ms-flex: 0 1 auto;
    -webkit-flex: 0 1 auto;
            flex: 0 1 auto;
  }
  #header .tbToggleButtons
  {
    margin-right: -10px;
    opacity: 0;
    -webkit-transition: opacity 0.3s;
            transition: opacity 0.3s;
  }
  #header .tbToggleButtons > * {
    margin-right: 10px;
  }
  #header .tbLogoCol > .tbToggleButtons
  {
    opacity: 1
  }

  /*** Mobile menu rows / blocks ***/

  .tbMobileMenu > .row {
    height: 100%;
  }
  .tbMobileMenu > .row > .col-xs-12 {
              -ms-flex-pack: center;
    -webkit-justify-content: center;
            justify-content: center;
  }
  .tbMobileMenu .tbMobileMenuCenter {
    text-align: center;
  }
  .tbMobileMenu .tbMobileMenuDisplayBlock {
    -ms-flex: 1 1 100%;
    -webkit-flex: 1 1 100%;
    flex: 1 1 100%;
    margin-left: 0 !important;
    margin-right: 0 !important;
  }
  .tbMobileMenu [class].tbMobileMenuDisplayInline {
    -ms-flex: 0 1 auto;
    -webkit-flex: 0 1 auto;
    flex: 0 1 auto;
    margin-left: 10px;
    margin-right: 10px;
  }
  .tbMobileMenu [class*="tb_widget"] {
    margin-bottom: <?php echo $base * 0.5; ?>px !important;
    margin-top: <?php echo $base; ?>px;
  }
  .tbMobileMenu [class*="tb_widget"].tbMobileMenuDisplayBlock,
  .tbMobileMenu [class*="tb_widget"]:not(.tbMobileMenuDisplayInline)
  {
    padding-left: 0;
    padding-right: 0;
  }
  .tbMobileMenu .tbMainNavigation + .tbMainNavigation,
  .tbMobileMenu [class*="tb_widget"].display-inline-block:not(.tbMobileMenuDisplayBlock),
  .tbMobileMenu [class*="tb_widget"].tbMobileMenuDisplayInline,
  .tbMobileMenu [class*="tb_widget"]:first-child
  {
    margin-top: 0 !important;
  }
  .tbToggleButtons .tb_toggle:before {
    font-size: 18px;
  }
  .tbMobileMenu .tb_widget_header_logo_system {
    text-align: center;
  }
  .tbMobileMenu .tb_widget_header_search_system .tb_search_wrap {
    width: auto !important;
    max-width: none !important;
    min-width: 0;
  }
  .tbMobileMenu .tb_widget_header_search_system.tb_style_4 .tb_search_wrap > input,
  .tbMobileMenu .tb_widget_header_search_system.tb_style_4 .tb_search_wrap > .twitter-typeahead
  {
    position: static !important;
    width: 100% !important;
    opacity: 1;
  }
  .tbMobileMenu .tb_widget_header_search_system.tb_style_4 .tb_search_button
  {
    position: absolute;
    top: 0;
    <?php if ($lang_dir == 'ltr'): ?>
    right: 0;
    <?php else: ?>
    left: 0;
    <?php endif; ?>
  }

  /*** Cart menu ***/

  .tbMobileCartMenu .tb_widget_header_cart_menu_system {
    -ms-flex: 1 1 100%;
    -webkit-flex: 1 1 100%;
    flex: 1 1 100%;
  }
  .tbMobileCartMenu .tb_widget_header_cart_menu_system .heading,
  .tbMobileCartMenu .tb_widget_header_cart_menu_system .tbStickyOnly
  {
    display: none !important;
  }
  .tbMobileCartMenu .tb_widget_header_cart_menu_system,
  .tbMobileCartMenu .tb_widget_header_cart_menu_system .dropdown-menu
  {
    display: block !important;
    margin: 0 !important;
  }
  .tbMobileCartMenu .tb_widget_header_cart_menu_system .dropdown-menu {
    width: auto !important;
    margin: 0 !important;
    -webkit-box-shadow: none;
            box-shadow: none;
  }

}

/*** Order elements ***/

.tbMobileMenu .tbMobilePosition-1 {
  -ms-flex-order: 1;
  -webkit-order: 1;
  order: 1;
}
.tbMobileMenu .tbMobilePosition-2 {
  -ms-flex-order: 2;
  -webkit-order: 2;
  order: 2;
}
.tbMobileMenu .tbMobilePosition-3 {
  -ms-flex-order: 4;
  -webkit-order: 3;
  order: 3;
}
.tbMobileMenu .tbMobilePosition-4 {
  -ms-flex-order: 4;
  -webkit-order: 4;
  order: 4;
}
.tbMobileMenu .tbMobilePosition-5 {
  -ms-flex-order: 5;
  -webkit-order: 5;
  order: 5;
}
.tbMobileMenu .tbMobilePosition-6 {
  -ms-flex-order: 6;
  -webkit-order: 6;
  order: 6;
}
.tbMobileMenu .tbMobilePosition-7 {
  -ms-flex-order: 7;
  -webkit-order: 7;
  order: 7;
}
.tbMobileMenu .tbMobilePosition-8 {
  -ms-flex-order: 8;
  -webkit-order: 8;
  order: 8;
}

@media only screen and (min-width: <?php echo $screen_sm . 'px'; ?>) {
  .tbMobileMenu {
    display: none;
  }
}