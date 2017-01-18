/*** Subtle border ***********************************/

.buttons:before,
.mini-cart-total:before,
.content:not(.ui-widget-content) + h2:before,
fieldset + fieldset legend:before,
:not([class*="tb_listing"]) + .pagination:before,
[class*="table"] + .pagination:before,
.tb_listing > .tb_review:not(:first-child):before,
.account-account .tb_system_page_content .list-unstyled + h2:before,
.affiliate-account .tb_system_page_content .list-unstyled + h2:before
{
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  display: flex;
  width: 100%;
  border-top: 1px solid;
  opacity: 0.2;
}

<?php echo $global_colors_css; ?>