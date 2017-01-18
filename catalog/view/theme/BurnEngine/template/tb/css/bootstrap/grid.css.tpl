/*  -----------------------------------------------------------------------------------------
    C O N T A I N E R
-----------------------------------------------------------------------------------------  */

.container,
.container-fluid
{
  clear: both;
  margin-left: auto;
  margin-right: auto;
}
.container:before,
.container:after,
.container-fluid:before,
.container-fluid:after,
.row-wrap:before
{
  content: '';
  display: table;
}
.container:after,
.container-fluid:after
{
  clear: both;
}
@media (max-width: <?php echo ($screen_sm) . 'px'; ?>) {
  .container-fluid {
    overflow-x: hidden;
  }
}

/*  -----------------------------------------------------------------------------------------
    G R I D
-----------------------------------------------------------------------------------------  */

.row,
[class*="col-"]
{
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
      -ms-flex-direction: row;
  -webkit-flex-direction: row;
          flex-direction: row;
      -ms-flex-wrap: wrap;
  -webkit-flex-wrap: wrap;
          flex-wrap: wrap;
}
.row:after {
  content: '';
  display: table;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  clear: both;
}
.row:not([class*="tb_gut_"]):not(.tb_separate_columns) {
  margin-top:   -<?php echo $grid_gutter[$default_grid_gutter]; ?>px;
  margin-left:  -<?php echo $grid_gutter[$default_grid_gutter]; ?>px;
}
.row:not([class*="tb_gut_"]):not(.tb_separate_columns) > [class*="col-"] {
  margin-top:    <?php echo $grid_gutter[$default_grid_gutter]; ?>px;
}
.row:not([class*="tb_gut_"]):not(.tb_separate_columns) + .row:not([class*="tb_gut_"]):not(.tb_separate_columns) {
  margin-top: 0;
}
html[dir="rtl"] .tb_no_rtl_columns {
  direction: ltr;
}
html[dir="rtl"] .tb_no_rtl_columns > [class*="col-"] {
  direction: rtl;
}

[class*="col-"] {
      -ms-flex: 1 1 auto;
  -webkit-flex: 1 1 auto;
          flex: 1 1 auto;
  -ms-flex-align: start;
  -webkit-align-items: flex-start;
  align-items: flex-start;
  <?php if ($lang_dir == 'ltr'): ?>
  float: left;
  <?php else: ?>
  float: right;
  <?php endif; ?>
  max-width: 100%;
  /* min-height: 1px; */
  margin-left: 30px;
}
div:not(.form-group):not([class*="col-align"]):not([class*="col-valign"]) > [class*="col-"]:not([class*="col-align"]):not([class*="col-valign"]) {
  display: block;
}
[class*="col-"][class*="-auto"]:empty {
  display: none;
}
.row.row-reverse,
.row-reverse > .row
{
  -ms-flex-direction: row-reverse;
  -webkit-flex-direction: row-reverse;
  flex-direction: row-reverse;
}
.row.row-reverse > [class*="col-"],
.row-reverse > .row > [class*="col-"]
{
  <?php if ($lang_dir == 'ltr'): ?>
  float: right;
  <?php else: ?>
  float: left;
  <?php endif; ?>
}

.tb_width_<?php echo $width; ?> .container,
.tb_width_<?php echo $width; ?> .tb_width_fixed,
.tb_width_<?php echo $width; ?> #wrapper:not(.container) > .tb_content_fixed > .row-wrap {
  max-width: <?php echo $width; ?>px;
}
@media (min-width: <?php echo $width + 80; ?>px) {
  .tb_width_<?php echo $width; ?> .tb_content_fixed > .row {
    max-width: <?php echo $width + $grid_gutter[$default_grid_gutter] * 2; ?>px;
  }
}
@media (max-width: <?php echo $width + 80; ?>px) {
.tb_width_<?php echo $width; ?> #wrapper.container {
    margin-left: 30px;
    margin-right: 30px;
  }
}

#wrapper:not(.container) > .container,
#wrapper:not(.container) > .tb_width_fixed,
#wrapper:not(.container) > :not(.container):not(.tb_content_fixed):not(.tb_width_fixed) .tb_width_fixed
{
  min-width: 0;
  margin-left: auto;
  margin-right: auto;
}
@media (min-width: <?php echo $width + 80; ?>px) {
  .tb_width_<?php echo $width; ?> #wrapper:not(.container) > .tb_content_fixed > div,
  .tb_width_<?php echo $width; ?> #wrapper:not(.container) > :not(.container):not(.tb_content_fixed):not(.tb_width_fixed) .tb_content_fixed > .row
  {
    min-width: 0;
    margin-left: auto;
    margin-right: auto;
  }
}

/*  -----------------------------------------------------------------------------------------
    G R I D   G U T T E R
-----------------------------------------------------------------------------------------  */

<?php foreach ($grid_gutter as $gutter): ?>
.row.tb_gut_<?php echo $gutter; ?>:not(.tb_separate_columns) {
  margin-left: -<?php echo $gutter; ?>px;
}
.row.tb_gut_<?php echo $gutter; ?>:not(.tb_separate_columns) > [class*="col-"] {
  margin-left: <?php echo $gutter; ?>px;
}
<?php endforeach; ?>

<?php foreach ($breakpoints as $breakpoint): ?>
/*** <?php echo $breakpoint; ?> ***/

<?php foreach ($grid_gutter as $gutter): ?>
.row.tb_gut_<?php echo $breakpoint; ?>_<?php echo $gutter; ?>:not(.tb_separate_columns) {
  margin-top: -<?php echo $gutter; ?>px;
}
.row.tb_gut_<?php echo $breakpoint; ?>_<?php echo $gutter; ?>:not(.tb_separate_columns) > [class*="col-<?php echo $breakpoint; ?>-"] {
  margin-top:  <?php echo $gutter; ?>px;
}
<?php endforeach; ?>

<?php if ($breakpoint != 'xs'): ?>
@media (min-width: <?php echo ${'screen_' . $breakpoint} . 'px'; ?>) {
<?php endif; ?>
  <?php foreach ($grid_gutter as $gutter): ?>
  .row.tb_gut_<?php echo $breakpoint; ?>_<?php echo $gutter; ?> {
    margin-left:  -<?php echo $gutter; ?>px;
    margin-right: -<?php echo $gutter; ?>px;
    padding-right: <?php echo $gutter; ?>px;
  }
  .row.tb_gut_<?php echo $breakpoint; ?>_<?php echo $gutter; ?> > [class*="col-"] {
    margin-left: <?php echo $gutter; ?>px;
  }
  <?php endforeach; ?>
<?php if ($breakpoint != 'xs'): ?>
}
<?php endif; ?>
<?php endforeach; ?>

@media (min-width: <?php echo $width + 80; ?>px) {
  .tb_width_<?php echo $width; ?> .tb_content_fixed > .row:not(.tb_separate_columns) {
    margin-right: -30px;
    padding-right: 30px;
  }
  <?php foreach ($breakpoints as $breakpoint): ?>
  <?php if ($breakpoint < $width + 80): ?>
  <?php foreach ($grid_gutter as $gutter): ?>
  .tb_width_<?php echo $width; ?> .tb_content_fixed > .row.tb_gut_<?php echo $breakpoint; ?>_<?php echo $gutter; ?>  {
    max-width: <?php echo $width + $gutter * 2; ?>px;
    margin-right: -<?php echo $gutter; ?>px;
    padding-right: <?php echo $gutter; ?>px;
  }
  <?php endforeach; ?>
  <?php endif; ?>
  <?php endforeach; ?>
}

/*  -----------------------------------------------------------------------------------------
    G R I D   S I Z E
-----------------------------------------------------------------------------------------  */

@media (max-width: <?php echo ($screen_sm - 1) . 'px'; ?>) {
  [class*="col-xs-"]:empty {
    display: none !important;
  }
}

<?php foreach ($breakpoints as $breakpoint): ?>
/*** <?php echo $breakpoint; ?> ***/

<?php if ($breakpoint != 'xs'): ?>
@media (min-width: <?php echo ${'screen_' . $breakpoint} . 'px'; ?>) {
<?php endif; ?>
.col-<?php echo $breakpoint; ?>-auto,
.col-<?php echo $breakpoint; ?>-fill
{
      width: auto !important;
  max-width: none !important;
}
[class*="col-<?php echo $breakpoint; ?>"],
.col-<?php echo $breakpoint; ?>-auto
{
      -ms-flex: 0 1 auto;
  -webkit-flex: 0 1 auto;
          flex: 0 1 auto;
}
.col-<?php echo $breakpoint; ?>-fill {
      -ms-flex: 1 1 0px;
  -webkit-flex: 1 1 0px;
          flex: 1 1 0px;
  min-width:        0px;
}
<?php for ($column = 1; $column <= $grid_columns; $column++): ?>
<?php $column_width = truncate_float($column * 100 / $grid_columns, 8); ?>
.col-<?php echo $breakpoint; ?>-<?php echo $column; ?> {
      width: calc(<?php echo $column_width; ?>% - <?php echo $grid_gutter[$default_grid_gutter]; ?>px);
  max-width: calc(<?php echo $column_width; ?>% - <?php echo $grid_gutter[$default_grid_gutter]; ?>px);
}
.tb_gut_<?php echo $breakpoint; ?>_0  > .col-<?php echo $breakpoint; ?>-<?php echo $column; ?> {
      width: <?php echo $column_width; ?>%;
  max-width: <?php echo $column_width; ?>%;
}
<?php foreach ($grid_gutter as $gutter): ?>
<?php if ($gutter > 0): ?>
.tb_gut_<?php echo $breakpoint; ?>_<?php echo $gutter; ?> > .col-<?php echo $breakpoint; ?>-<?php echo $column; ?> {
      width: calc(<?php echo $column_width; ?>% - <?php echo $gutter; ?>px);
  max-width: calc(<?php echo $column_width; ?>% - <?php echo $gutter; ?>px);
}
<?php endif; ?>
<?php endforeach; ?>
.tb_separate_columns > .col-<?php echo $breakpoint; ?>-<?php echo $column; ?> {
      width: <?php echo $column_width; ?>%;
  max-width: <?php echo $column_width; ?>%;
}
<?php endfor; ?>
/* 5 columns */
<?php for ($column = 1; $column < 5; $column++): ?>
<?php $column_width = truncate_float($column * 100 / 5, 8); ?>
.col-<?php echo $breakpoint; ?>-<?php echo $column; ?>-5 {
      width: calc(<?php echo $column_width; ?>% - <?php echo $grid_gutter[$default_grid_gutter]; ?>px);
  max-width: calc(<?php echo $column_width; ?>% - <?php echo $grid_gutter[$default_grid_gutter]; ?>px);
}
.tb_gut_<?php echo $breakpoint; ?>_0  > .col-<?php echo $breakpoint; ?>-<?php echo $column; ?>-5 {
      width: <?php echo $column_width; ?>%;
  max-width: <?php echo $column_width; ?>%;
}
<?php foreach ($grid_gutter as $gutter): ?>
<?php if ($gutter > 0): ?>
.tb_gut_<?php echo $breakpoint; ?>_<?php echo $gutter; ?> > .col-<?php echo $breakpoint; ?>-<?php echo $column; ?>-5 {
      width: calc(<?php echo $column_width; ?>% - <?php echo $gutter; ?>px);
  max-width: calc(<?php echo $column_width; ?>% - <?php echo $gutter; ?>px);
}
<?php endif; ?>
<?php endforeach; ?>
.tb_separate_columns > .col-<?php echo $breakpoint; ?>-<?php echo $column; ?>-5 {
      width: <?php echo $column_width; ?>%;
  max-width: <?php echo $column_width; ?>%;
}
<?php endfor; ?>
/* 8 columns */
<?php foreach (array (1, 3, 5, 7) as $column): ?>
<?php $column_width = truncate_float($column * 100 / 8, 8); ?>
.col-<?php echo $breakpoint; ?>-<?php echo $column; ?>-8 {
      width: calc(<?php echo $column_width; ?>% - <?php echo $grid_gutter[$default_grid_gutter]; ?>px);
  max-width: calc(<?php echo $column_width; ?>% - <?php echo $grid_gutter[$default_grid_gutter]; ?>px);
}
.tb_gut_<?php echo $breakpoint; ?>_0  > .col-<?php echo $breakpoint; ?>-<?php echo $column; ?>-8 {
      width: <?php echo $column_width; ?>%;
  max-width: <?php echo $column_width; ?>%;
}
<?php foreach ($grid_gutter as $gutter): ?>
<?php if ($gutter > 0): ?>
.tb_gut_<?php echo $breakpoint; ?>_<?php echo $gutter; ?> > .col-<?php echo $breakpoint; ?>-<?php echo $column; ?>-8 {
      width: calc(<?php echo $column_width; ?>% - <?php echo $gutter; ?>px);
  max-width: calc(<?php echo $column_width; ?>% - <?php echo $gutter; ?>px);
}
<?php endif; ?>
<?php endforeach; ?>
.tb_separate_columns > .col-<?php echo $breakpoint; ?>-<?php echo $column; ?>-8 {
      width: <?php echo $column_width; ?>%;
  max-width: <?php echo $column_width; ?>%;
}
<?php endforeach; ?>
<?php if ($breakpoint != 'xs'): ?>
}
<?php endif; ?>

<?php endforeach; ?>

/*  -----------------------------------------------------------------------------------------
    C O L U M N   A L I G N
-----------------------------------------------------------------------------------------  */

[class*="col-"] > .display-block,
[class*="col-"] > address:not(.display-inline-block),
[class*="col-"] > article:not(.display-inline-block),
[class*="col-"] > aside:not(.display-inline-block),
[class*="col-"] > audio:not(.display-inline-block),
[class*="col-"] > blockquote:not(.display-inline-block),
[class*="col-"] > canvas:not(.display-inline-block),
[class*="col-"] > div:not(.display-inline-block),
[class*="col-"] > dl:not(.display-inline-block),
[class*="col-"] > fieldset:not(.display-inline-block),
[class*="col-"] > figure:not(.display-inline-block),
[class*="col-"] > form:not(.display-inline-block),
[class*="col-"] > h1:not(.display-inline-block),
[class*="col-"] > h1:not(.display-inline-block),
[class*="col-"] > h2:not(.display-inline-block),
[class*="col-"] > h3:not(.display-inline-block),
[class*="col-"] > h4:not(.display-inline-block),
[class*="col-"] > h5:not(.display-inline-block),
[class*="col-"] > h6:not(.display-inline-block),
[class*="col-"] > hr:not(.display-inline-block),
[class*="col-"] > nav:not(.display-inline-block),
[class*="col-"] > ol:not(.display-inline-block),
[class*="col-"] > p:not(.display-inline-block),
[class*="col-"] > pre:not(.display-inline-block),
[class*="col-"] > section:not(.display-inline-block),
[class*="col-"] > table:not(.display-inline-block),
[class*="col-"] > ul:not(.display-inline-block),
[class*="col-"] > video:not(.display-inline-block)
{
      -ms-flex: 1 1 100%;
  -webkit-flex: 1 1 100%;
          flex: 1 1 100%;
}
[class*="col-"][class*="-auto"] > address:not(.display-inline-block),
[class*="col-"][class*="-auto"] > article:not(.display-inline-block),
[class*="col-"][class*="-auto"] > aside:not(.display-inline-block),
[class*="col-"][class*="-auto"] > audio:not(.display-inline-block),
[class*="col-"][class*="-auto"] > blockquote:not(.display-inline-block),
[class*="col-"][class*="-auto"] > canvas:not(.display-inline-block),
[class*="col-"][class*="-auto"] > div:not(.display-inline-block),
[class*="col-"][class*="-auto"] > dl:not(.display-inline-block),
[class*="col-"][class*="-auto"] > fieldset:not(.display-inline-block),
[class*="col-"][class*="-auto"] > figure:not(.display-inline-block),
[class*="col-"][class*="-auto"] > form:not(.display-inline-block),
[class*="col-"][class*="-auto"] > h1:not(.display-inline-block),
[class*="col-"][class*="-auto"] > h1:not(.display-inline-block),
[class*="col-"][class*="-auto"] > h2:not(.display-inline-block),
[class*="col-"][class*="-auto"] > h3:not(.display-inline-block),
[class*="col-"][class*="-auto"] > h4:not(.display-inline-block),
[class*="col-"][class*="-auto"] > h5:not(.display-inline-block),
[class*="col-"][class*="-auto"] > h6:not(.display-inline-block),
[class*="col-"][class*="-auto"] > hr:not(.display-inline-block),
[class*="col-"][class*="-auto"] > nav:not(.display-inline-block),
[class*="col-"][class*="-auto"] > ol:not(.display-inline-block),
[class*="col-"][class*="-auto"] > p:not(.display-inline-block),
[class*="col-"][class*="-auto"] > pre:not(.display-inline-block),
[class*="col-"][class*="-auto"] > section:not(.display-inline-block),
[class*="col-"][class*="-auto"] > table:not(.display-inline-block),
[class*="col-"][class*="-auto"] > ul:not(.display-inline-block),
[class*="col-"][class*="-auto"] > video:not(.display-inline-block)
{
  min-width: 100%;
}
.col-align-start {
            -ms-flex-pack: start;
  -webkit-justify-content: flex-start;
          justify-content: flex-start;
}
.col-align-center {
            -ms-flex-pack: center;
  -webkit-justify-content: center;
          justify-content: center;
}
@media (min-width: <?php echo ($screen_sm) . 'px'; ?>) {
  [class*="col-align"] > * {
        -ms-flex: 0 1 auto;
    -webkit-flex: 0 1 auto;
            flex: 0 1 auto;
  }
  .col-align-end {
              -ms-flex-pack: end;
    -webkit-justify-content: flex-end;
            justify-content: flex-end;
  }
  .col-align-between {
              -ms-flex-pack: justify;
    -webkit-justify-content: space-between;
            justify-content: space-between;
  }
  .col-align-around {
             -ms-flex-pack: justify;
    -webkit-justify-content: space-around;
            justify-content: space-around;
  }
}
.col-valign-top {
     -ms-flex-line-pack: start;
  -webkit-align-content: flex-start;
          align-content: flex-start;
       -ms-flex-align: start;
  -webkit-align-items: flex-start;
          align-items: flex-start;
}
.col-top,
.col-valign-top > *
{
  -ms-flex-item-align: start;
  -webkit-align-self: flex-start;
          align-self: flex-start;
}
.col-valign-middle,
.row.row-valign-middle > [class*="col-"],
.row-valign-middle > .row > [class*="col-"]
{
     -ms-flex-line-pack: center;
  -webkit-align-content: center;
          align-content: center;
       -ms-flex-align: center;
  -webkit-align-items: center;
          align-items: center;
}
.col-middle,
.col-valign-middle > *,
.row.row-valign-middle > [class*="col-"] > *,
.row-valign-middle > .row > [class*="col-"] > *
{
  -ms-flex-item-align: center;
  -webkit-align-self: center;
          align-self: center;
}
.col-valign-bottom,
.row.row-valign-bottom > [class*="col-"],
.row-valign-bottom > .row > [class*="col-"]
{
     -ms-flex-line-pack: end;
  -webkit-align-content: flex-end;
          align-content: flex-end;
       -ms-flex-align: end;
  -webkit-align-items: flex-end;
          align-items: flex-end;
}
.col-bottom,
.col-valign-bottom > *,
.row.row-valign-bottom > [class*="col-"] > *,
.row-valign-bottom > .row > [class*="col-"] > *
{
  -ms-flex-item-align: end;
  -webkit-align-self: flex-end;
          align-self: flex-end;
}

/*  ---   Separate Columns   ------------------------------------------------------------  */

.tb_separate_columns {
  margin-left: 0;
  margin-right: 0;
  padding-right: 0 !important;
}
.tb_separate_columns > [class*="col-"] {
  margin: 0;
  <?php if ($lang_dir == 'ltr'): ?>
  border-left-width: 1px;
  border-left-style: solid;
  <?php else: ?>
  border-right-width: 1px;
  border-right-style: solid;
  <?php endif; ?>
}
.tb_separate_columns > [class*="col-"]:first-child {
  border-style: none;
}
.tb_width_<?php echo $width; ?> .tb_content_fixed > .tb_separate_columns {
  max-width: <?php echo $width; ?>px;
}
@media (max-width: <?php echo ($screen_sm - 1) . 'px'; ?>) {
  .tb_separate_columns > [class*="col-"] {
    border-top-width: 1px;
    border-top-style: solid;
    border-left-width: 0 !important;
    border-right-width: 0 !important;
  }
  html[dir="ltr"] .tb_separate_columns > .tb_pl_0:first-child:not(:last-child) {
    padding-right: 0;
    padding-bottom: 30px;
  }
  html[dir="ltr"] .tb_separate_columns > .tb_pl_0 ~ [class*="col-"]  {
    padding-left: 0;
    padding-top: 30px;
  }
  html[dir="rtl"] .tb_separate_columns > .tb_pr_0:first-child:not(:last-child) {
    padding-left: 0;
    padding-bottom: 30px;
  }
  html[dir="ltr"] .tb_separate_columns > .tb_pr_0 ~ [class*="col-"]  {
    padding-right: 0;
    padding-top: 30px;
  }
}

/*** Inner padding ***/

<?php for ($padding = 0; $padding <= 100; $padding += 5): ?>
.tb_ip_<?php echo $padding; ?> > [class*="col-"]:not([class*="tb_pt_"]) {
  padding: <?php echo $padding; ?>px;
}
<?php endfor; ?>

@media (max-width: <?php echo ($screen_sm) . 'px'; ?>) {
  <?php for ($padding = 45; $padding <= 100; $padding += 5): ?>
  .tb_ip_<?php echo $padding; ?> > [class*="col-"]:not([class*="tb_pt_"]),
  <?php endfor; ?>
  .tb_ip_105 > [class*="col-"]:not([class*="tb_pt_"])
  {
    padding: 40px;
  }
}


/*  -----------------------------------------------------------------------------------------
    S P A C I N G
-----------------------------------------------------------------------------------------  */

/*  ---   Margin   ----------------------------------------------------------------------  */

<?php foreach (array ('top'=>'mt', 'right'=>'mr', 'bottom'=>'mb', 'left'=>'ml') as $property=>$abbrev): ?>
<?php for ($margin = -100; $margin <= 100; $margin += 5): ?>
.tb_<?php echo $abbrev; ?>_<?php echo $margin; ?> {
  margin-<?php echo $property; ?>: <?php echo $margin; ?>px;
}
<?php endfor; ?>
<?php endforeach; ?>

@media (max-width: <?php echo ($screen_sm) . 'px'; ?>) {
  <?php foreach (array ('top'=>'mt', 'right'=>'mr', 'bottom'=>'mb', 'left'=>'ml') as $property=>$abbrev): ?>
  <?php for ($margin = 45; $margin <= 100; $margin += 5): ?>
  .tb_<?php echo $abbrev; ?>_<?php echo $margin; ?>,
  <?php endfor; ?>
  .tb_<?php echo $abbrev; ?>_105
  {
    margin-<?php echo $property; ?>: 40px;
  }
  <?php endforeach; ?>
  <?php foreach (array ('top'=>'mt', 'right'=>'mr', 'bottom'=>'mb', 'left'=>'ml') as $property=>$abbrev): ?>
  <?php for ($margin = -100; $margin <= -45; $margin += 5): ?>
  .tb_<?php echo $abbrev; ?>_<?php echo $margin; ?>,
  <?php endfor; ?>
  .tb_<?php echo $abbrev; ?>_-105
  {
    margin-<?php echo $property; ?>: -40px;
  }
  <?php endforeach; ?>
}

/*  ---   Padding   ---------------------------------------------------------------------  */

<?php for ($padding = 0; $padding <= 100; $padding += 5): ?>
.tb_p_<?php echo $padding; ?> {
  padding: <?php echo $padding; ?>px;
}
<?php endfor; ?>
<?php foreach (array ('top'=>'pt', 'right'=>'pr', 'bottom'=>'pb', 'left'=>'pl') as $property=>$abbrev): ?>
<?php for ($padding = 0; $padding <= 100; $padding += 5): ?>
.tb_<?php echo $abbrev; ?>_<?php echo $padding; ?><?php if ($property == 'top' || $property == 'bottom'): ?>,
.row-wrap.tb_<?php echo $abbrev; ?>_<?php echo $padding; ?>  > .row<?php endif; ?> {
  padding-<?php echo $property; ?>: <?php echo $padding; ?>px;
}
<?php endfor; ?>
<?php endforeach; ?>

@media (max-width: <?php echo ($screen_sm) . 'px'; ?>) {
  <?php foreach (array ('top'=>'pt', 'right'=>'pr', 'bottom'=>'pb', 'left'=>'pl') as $property=>$abbrev): ?>
  <?php for ($padding = 45; $padding <= 100; $padding += 5): ?>
  .tb_<?php echo $abbrev; ?>_<?php echo $padding; ?><?php if ($property == 'top' || $property == 'bottom'): ?>,
  .row-wrap.tb_<?php echo $abbrev; ?>_<?php echo $padding; ?>  > .row<?php endif; ?>,
  <?php endfor; ?>
  .tb_<?php echo $abbrev; ?>_105<?php if ($property == 'top' || $property == 'bottom'): ?>,
  .row-wrap.tb_<?php echo $abbrev; ?>_105  > .row<?php endif; ?>
  {
    padding-<?php echo $property; ?>: 40px;
  }
  <?php endforeach; ?>
}


.row-wrap:not(#wrapper) {
  padding-top: 0;
  padding-bottom: 0;
}

/*  ---   Responsive   -----------------------------------------------------------------------------  */

@media (max-width: <?php echo $width + 79; ?>px) {
  .tb_width_<?php echo $width; ?> #wrapper:not(.container) > .tb_width_fixed,
  .tb_width_<?php echo $width; ?> #wrapper:not(.container) > .container,
  .tb_width_<?php echo $width; ?> #wrapper:not(.container) > :not(.container):not(.tb_width_fixed):not(.tb_content_fixed) > .tb_width_fixed
  {
    margin-left:  40px;
    margin-right: 40px;
  }
  .tb_width_<?php echo $width; ?> #wrapper:not(.container) > .tb_content_fixed,
  .tb_width_<?php echo $width; ?> #wrapper:not(.container) > :not(.tb_content_fixed):not([class*="tb_pl_"]):not([class*="tb_pr_"]) > .tb_content_fixed:not([class*="tb_pl_"]):not([class*="tb_pr_"]),
  .tb_width_<?php echo $width; ?> #wrapper:not(.container) > :not(.container):not(.tb_width_fixed):not(.tb_content_fixed):not([class*="tb_pl_"]):not([class*="tb_pr_"]) > div:not(.tb_separate_columns) .tb_content_fixed
  {
    min-width: 0;
    /*
    margin-left: 0 !important;
    margin-right: 0 !important;
    */
    padding-left:  40px !important;
    padding-right: 40px !important;
  }
}

@media (max-width: <?php echo ($screen_sm - 1) . 'px'; ?>) {
  #wrapper:not(.container) > :not(.container):not(.tb_width_fixed):not(.tb_content_fixed) .tb_width_fixed {
    min-width: 0;
    margin-left:  30px !important;
    margin-right: 30px !important;
  }
  [dir="ltr"] .col-align-end > .display-inline-block[class*="tb_ml_"] {
    margin-left: 0;
  }
  [dir="rtl"] .col-align-end > .display-inline-block[class*="tb_mr_"] {
    margin-right: 0;
  }
}

/*  -----------------------------------------------------------------------------------------
    S T Y L I N G
-----------------------------------------------------------------------------------------  */

.row,
html[dir="ltr"] [class*="col-"]:first-child,
html[dir="rtl"] div:not(.tb_no_rtl_columns) > [class*="col-"]:last-child,
html[dir="rtl"] .tb_no_rtl_columns > [class*="col-"]:first-child
{
  border-top-left-radius: inherit;
  border-bottom-left-radius: inherit;
}
.row,
html[dir="ltr"] [class*="col-"]:last-child,
html[dir="rtl"] div:not(.tb_no_rtl_columns) > [class*="col-"]:first-child,
html[dir="rtl"] .tb_no_rtl_columns > [class*="col-"]:last-child
{
  border-top-right-radius: inherit;
  border-bottom-right-radius: inherit;
}
