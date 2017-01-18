.row-wrap {
  -webkit-background-origin: border-box !important;
          background-origin: border-box !important;
}

#header {
  position: relative;
  z-index: 50;
}
#header.tb_header_visible {
  margin-bottom: 0;
}
#header.tb_header_overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
}
#header.tb_header_transparent:not(.tbSticky),
#header.tb_header_transparent:not(.tbSticky) > .row-wrap,
#header.tb_header_transparent:not(.tbSticky) > .row-wrap > .row,
#header.tb_header_transparent:not(.tbSticky) > .row-wrap > .row > [class*="col"]
{
  background: transparent none !important;
}
#bottom > .row,
#bottom > .row > [class*="tb_col"],
#bottom > .row > [class*="tb_col"] > .row-wrap
{
  border-bottom-left-radius: inherit;
  border-bottom-right-radius: inherit;
}


.tb_grid_view .price .tb_decimal_point,
.tb_list_view .price .tb_decimal_point,
.tb_price.tb_fancy .tb_decimal_point,
.price.custom .tb_decimal_point
{
  display: none;
}
.tb_grid_view .price .tb_decimal,
.tb_price.tb_fancy .tb_decimal,
.price.custom .tb_decimal
{
  position: relative;
  top: -0.25em;
  <?php if ($lang_dir == 'ltr'): ?>
  margin-left: 1px;
  <?php else: ?>
  margin-right: 1px;
  <?php endif; ?>
  font-size: 0.6em;
  vertical-align: top;
}

.main > .row > [class*="col-"],
.sidebar > .row > [class*="col-"]
{
  display: block;
}

/*** Content Wrap ***/

#content > .row > [class*="col-"] {
  display: block;
}
@media (min-width: <?php echo $screen_sm; ?>px) {
  .main {
    order: 2;
  }
  #left_col {
    order: 1;
  }
  #right_col {
    order: 3;
  }
}
.row.tb_separate_columns > #left_col {
  border-left: 0 none;
  border-right-style: solid;
  border-right-width: 1px;
}
.row.tb_separate_columns > #right_col {
  border-right: 0 none;
  border-left-style: solid;
  border-left-width: 1px;
}

/*  -----------------------------------------------------------------------------------------
    B O T T O M   A R E A   ( S T A T I C   F O O T E R )
-----------------------------------------------------------------------------------------  */

#copy {
  font-size: 11px;
}
#payment_images {
  <?php if ($lang_dir == 'ltr'): ?>
  text-align: right;
  <?php else: ?>
  text-align: left;
  <?php endif; ?>
  word-spacing: -0.25em;
}
#payment_images .tb_payment {
  display: inline-block;
  word-spacing: normal;
  vertical-align: middle;
}
#payment_images .tb_payment img {
  display: inline-block;
  vertical-align: top;
}
#payment_images .tb_payment table {
  width: auto;
}
#payment_images .tb_payment + .tb_payment {
  <?php if ($lang_dir == 'ltr'): ?>
  margin-left: <?php echo $base * 0.5; ?>px;
  <?php else: ?>
  margin-right: <?php echo $base * 0.5; ?>px;
  <?php endif; ?>
}


/*  -------------------------------------------------------------------------------------  */
/*  ---  Mobile Layout                          -----------------------------------------  */
/*  -------------------------------------------------------------------------------------  */
/*  ---  Max width: 767px                       -----------------------------------------  */

@media (max-width: <?php echo ($screen_sm - 1) . 'px'; ?>) {

  #copy,
  #payment_images
  {
    display: block;
    width: 100%;
    text-align: center;
  }
}

/*  -----------------------------------------------------------------------------------------
    L A Z Y   L O A D I N G
-----------------------------------------------------------------------------------------  */

img[data-src] {
  -webkit-transition: opacity 0.3s;
  transition: opacity 0.3s;
}
img[data-src]:not(.lazyloaded) {
  opacity: 0;
}

/*  -----------------------------------------------------------------------------------------
    M E N U
-----------------------------------------------------------------------------------------  */

body.is_logged .tb_menu_system_account_login,
body:not(.is_logged) .tb_menu_system_account_logout,
body.is_affiliate_logged .tb_menu_system_affiliate_login,
body:not(.is_affiliate_logged) .tb_menu_system_affiliate_logout
{
  display: none;
}

/*  Megamenu   --------------------------------------------------------------------------  */

.tb_text > .tb_icon {
  -webkit-transition: all 0.3s;
          transition: all 0.3s;
}

.dropdown ul.tb_grid_view > li,
.tb_menu_all_categories .tb_subcategories > .tb_listing > .tb_menu_category > a
{
  display: block;
}
.dropdown .tb_menu_category > .thumbnail,
.dropdown .tb_subcategories > ul > li > .thumbnail
{
  <?php if ($lang_dir == 'ltr'): ?>
  float: right;
  <?php else: ?>
  float: left;
  <?php endif; ?>
  margin-bottom: 0;
}
.dropdown .tb_subcategories > .tb_multicolumn {
  -webkit-column-width: 180px;
     -moz-column-width: 180px;
          column-width: 180px;
  margin-top: -<?php echo $base; ?>px;
}
.dropdown .tb_subcategories > .tb_multicolumn > * {
  display: table;
  width: 100%;
  margin-top: 0;
  padding-top: <?php echo $base; ?>px;
}
.dropdown .tb_subcategories > .tb_multicolumn > *:after {
  content: '';
  display: table;
  clear: both;
}
.dropdown .tb_subcategories > .tb_multicolumn > * > :last-child {
  margin-bottom: 0 !important;
}
@media (max-width: <?php echo ($screen_sm) . 'px'; ?>) {
  .nav-responsive .dropdown .tb_subcategories > .tb_multicolumn > :first-child {
    padding-top: 0;
  }
}
.dropdown .tb_subcategories .tb_multicolumn .h4,
.dropdown .tb_subcategories .tb_multicolumn .h4 .tb_text
{
  display: block;
}
.dropdown-menu .col-md-fill .tb_category_brands {
  margin: 0 -<?php echo $base; ?>px;
  padding: <?php echo $base; ?>px <?php echo $base; ?>px 0 <?php echo $base; ?>px;
}
.dropdown-menu .col-md-fill .tb_category_brands .tb_list_1 {
  margin-bottom: ;
}
.tb_images {
  text-align: center;
  margin-top: -10px;
  margin-left: -20px;
}
.tb_images > * {
  display: inline-block;
  margin-top: 10px;
  margin-left: 20px;
}
.tb_multicolumn {
  -webkit-column-width: 140px;
  -moz-column-width: 140px;
  column-width: 140px;
}
.tb_multicolumn *,
.tb_menu_brands .tb_letter
{
  -webkit-column-break-inside: avoid;
            page-break-inside: avoid;
                 break-inside: avoid;
}
.tb_multicolumn > * + * {
  margin-top: <?php echo $base; ?>px;
}
.tb_menu_brands .tb_letter + .tb_letter {
  margin-top: <?php echo $base * 0.5; ?>px;
}
.tb_menu_brands .tb_grid_view .tb_letter ul {
  margin-bottom: 0;
}
.tb_category_info_col * {
  color: inherit !important;
}
.tb_category_info_col .tb_desc {
  opacity: 0.9;
}
@media (max-width: <?php echo ($screen_sm - 1) . 'px'; ?>) {
  .tb_category_info_col {
    display: none;
  }
}

/*  Dropdown tabs   ---------------------------------------------------------------------  */

.dropdown-menu > .tb_tabs > .nav-tabs {
  -ms-flex: 0 1 auto;
  -webkit-flex: 0 1 auto;
  flex: 0 1 auto;
}
.dropdown-menu > .tb_tabs > .nav-tabs > li {
  border-color: transparent !important;
}
.dropdown-menu > .tb_tabs > .nav-tabs > li {
  border-radius: 0;
}
.dropdown-menu > .tb_tabs.tabs-left > .nav-tabs {
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
}
.dropdown-menu > .tb_tabs.tabs-right > .nav-tabs {
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
}
.dropdown-menu > .tb_tabs.tabs-left > .nav-tabs > li:first-child {
  border-top-left-radius: inherit;
}
.dropdown-menu > .tb_tabs.tabs-left > .nav-tabs > li:last-child {
  border-bottom-left-radius: inherit;
}
.dropdown-menu > .tb_tabs.tabs-right > .nav-tabs > li:first-child {
  border-top-right-radius: inherit;
}
.dropdown-menu > .tb_tabs.tabs-right > .nav-tabs > li:last-child {
  border-top-bottom-radius: inherit;
}
.dropdown-menu > .tb_tabs > .nav-tabs > .dropdown.tb_hovered {
  margin-bottom: 0;
  padding-bottom: 0;
}
.dropdown-menu > .tb_tabs > .nav-tabs > .dropdown:after,
.dropdown-menu > .tb_tabs > .tab-content > .dropdown:after
{
  content: none;
}
.dropdown-menu > .tb_tabs > .tab-content {
  border: none !important;
}
.dropdown-menu > .tb_tabs > .tab-content > * {
  display: none;
}
.dropdown-menu > .tb_tabs > .nav-tabs > .dropdown > a,
.dropdown-menu > .tb_tabs > .tab-content,
.dropdown-menu > .tb_tabs > .tab-content [class*="col-"]
{
  display: -ms-flexbox !important;
  display: -webkit-flex !important;
  display: flex !important;
}
.dropdown-menu > .tb_tabs > .tab-content > .dropdown > .dropdown-menu {
  display: block;
  padding: 20px;
}
.dropdown-menu > .tb_tabs > .tab-content > .tb_megamenu[style*="list-item"],
.dropdown-menu > .tb_tabs > .tab-content > .tb_megamenu[style*="block"],
.dropdown-menu > .tb_tabs > .tab-content > .tb_megamenu[style*="flex"],
.dropdown-menu > .tb_tabs > .tab-content > .tb_megamenu > .row,
.dropdown-menu > .tb_tabs > .tab-content > .tb_megamenu > .dropdown-menu,
.dropdown-menu > .tb_tabs > .tab-content > .tb_megamenu > .dropdown-menu > .row
{
  display: -ms-flexbox !important;
  display: -webkit-flex !important;
  display: flex !important;
      -ms-flex: 1 1 auto;
  -webkit-flex: 1 1 auto;
          flex: 1 1 auto;
}
.tb_tabbed_menu > .dropdown-menu,
.dropdown-menu > .tb_tabs > .tab-content > .tb_megamenu > .dropdown-menu
{
  padding: 0 !important;
}
.dropdown-menu > .tb_tabs > .tab-content > .tb_megamenu > .dropdown-menu > .tb_ip_20 {
  margin: 0;
}
.dropdown-menu > .tb_tabs > .tab-content > .dropdown > .dropdown-menu,
.dropdown-menu > .tb_tabs > .tab-content > .dropdown:hover > .dropdown-menu,
.dropdown-menu > .tb_tabs > .tab-content > .dropdown.tb_hovered > .dropdown-menu
{
  position: static;
  width: auto !important;
  margin: 0 !important;
  box-shadow: none;
  opacity: 1 !important;
}
.dropdown-menu > .tb_tabs > .tab-content [class*="col-"] {
      -ms-flex-direction: column;
  -webkit-flex-direction: column;
          flex-direction: column;
}
.dropdown-menu > .tb_tabs > .tab-content .tb_subcategories,
.dropdown-menu > .tb_tabs > .tab-content .tb_subcategories + .border,
.dropdown-menu > .tb_tabs > .tab-content .tb_category_brands,
.dropdown-menu > .tb_tabs > .tab-content .tb_category_info
{
      -ms-flex: 1 1 0px;
  -webkit-flex: 1 1 0px;
          flex: 1 1 0px;
  width: 100%;
}
.dropdown-menu > .tb_tabs > .tab-content .tb_subcategories {
  -ms-flex: 0 0 auto;
}
.dropdown-menu > .tb_tabs > .tab-content .tb_subcategories ~ .border,
.dropdown-menu > .tb_tabs > .tab-content .tb_subcategories ~ .tb_category_brands
{
      -ms-flex: 0 1 auto;
  -webkit-flex: 0 1 auto;
          flex: 0 1 auto;
  width: 100%;
  width: calc(100% + 40px);
}
.dropdown-menu > .tb_tabs > .tab-content .tb_subcategories ~ .tb_category_brands {
  width: calc(100% + <?php echo $base * 2; ?>px);
}
.tb_megamenu .tb_images {
  margin-top: 0;
}
@media (max-width: <?php echo ($screen_sm - 1) . 'px'; ?>) {
  .dropdown .tb_subcategories ~ .tb_category_brands {
    padding-bottom: <?php echo $base; ?>px;
  }
}

.nav:not(.nav-responsive) > li > .dropdown-menu > .tb_tabs > .tab-content > li > a {
  display: none;
}
@media (min-width: <?php echo $screen_sm . 'px'; ?>) {
  .nav.nav-responsive > li > .dropdown-menu > .tb_tabs > .tab-content > li > a {
    display: none;
  }
}
@media (max-width: <?php echo ($screen_sm - 1) . 'px'; ?>) {
  .nav.nav-responsive > li > .dropdown-menu > .tb_tabs > .nav-tabs {
    display: none;
  }
  .nav.nav-responsive > li > .dropdown-menu > .tb_tabs > .tab-content,
  .nav.nav-responsive > li > .dropdown-menu > .tb_tabs > .tab-content > li
  {
    display: block !important;
  }
  .nav.nav-responsive > li > .dropdown-menu > .tb_tabs > .tab-content > li:not(.tb_active) > .dropdown-menu,
  .nav.nav-responsive > li > .dropdown-menu > .tb_tabs > .tab-content .tb_category_info_col
  {
    display: none !important;
  }
  .nav.nav-responsive .dropdown .tb_subcategories > .tb_multicolumn {
    margin-top: 0;
  }
}

/*  -----------------------------------------------------------------------------------------
    U N S O R T E D
-----------------------------------------------------------------------------------------  */

.tb_vsep_0  > li { padding-top: 0;  padding-bottom: 0; }
.tb_vsep_xs > li, .tb_vsep_xs > li > a { padding-top: <?php echo $base * 0.1;  ?>px; padding-bottom: <?php echo $base * 0.1;  ?>px; }
.tb_vsep_sm > li, .tb_vsep_sm > li > a { padding-top: <?php echo $base * 0.25; ?>px; padding-bottom: <?php echo $base * 0.25; ?>px; }
.tb_vsep_md > li, .tb_vsep_md > li > a { padding-top: <?php echo $base * 0.5;  ?>px; padding-bottom: <?php echo $base * 0.5;  ?>px; }
.tb_vsep_lg > li, .tb_vsep_lg > li > a { padding-top: <?php echo $base * 0.75; ?>px; padding-bottom: <?php echo $base * 0.75; ?>px; }
.tb_vsep_xs > li > a { margin-top: -<?php echo $base * 0.1;  ?>px; margin-bottom: -<?php echo $base * 0.1;  ?>px; }
.tb_vsep_sm > li > a { margin-top: -<?php echo $base * 0.25; ?>px; margin-bottom: -<?php echo $base * 0.25; ?>px; }
.tb_vsep_md > li > a { margin-top: -<?php echo $base * 0.5;  ?>px; margin-bottom: -<?php echo $base * 0.5;  ?>px; }
.tb_vsep_lg > li > a { margin-top: -<?php echo $base * 0.75; ?>px; margin-bottom: -<?php echo $base * 0.75; ?>px; }
[class*="tb_list_"].tb_vsep_xs > li:before { top: 12px; }
[class*="tb_list_"].tb_vsep_sm > li:before { top: 15px; }
[class*="tb_list_"].tb_vsep_md > li:before { top: 20px; }
[class*="tb_list_"].tb_vsep_lg > li:before { top: 25px; }

/*  -----------------------------------------------------------------------------------------
    L A Z Y L O A D
-----------------------------------------------------------------------------------------  */

.container.lazyload,
.container-fluid.lazyload,
.row-wrap.lazyload,
.row-wrap.lazyload > .row,
.row-wrap.lazyload > .row > [class*="col"],
.row-wrap.lazyload [class*="tb_widget"],
.row-wrap.lazyload .tb_banner .tb_image
{
  background-image: none !important;
}

/*  -----------------------------------------------------------------------------------------
    S T I C K Y   S I D E B A R
-----------------------------------------------------------------------------------------  */

.col-sticky,
.col-sticky.is_stuck
{
  min-width: 0;
  margin-left:  0;
  margin-right: 0;
}
