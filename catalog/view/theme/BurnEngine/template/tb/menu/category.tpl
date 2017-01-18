<li id="menu_category_<?php echo $menu_item_id; ?>"<?php echo $menu_classes; ?>>
  <span class="tb_toggle tb_bg_str_2"></span>

  <?php if (!empty($category_label)): ?>
  <a<?php echo $label_classes; ?> href="<?php echo $category['url']; ?>"<?php echo $label_attributes; ?>>
    <span class="tb_text"><?php echo $menu_icon; ?><span><?php echo $category_label; ?></span></span>
    <?php if (!empty($settings['accent_text'])): ?>
    <span class="tb_accent_label" style="color: <?php echo $settings['accent_color']; ?>; background-color: <?php echo $settings['accent_bg']; ?>;"><?php echo $settings['accent_text']; ?></span>
    <?php endif; ?>
  </a>
  <?php endif; ?>

  <?php if (!empty($subcategories)): ?>
  <?php if ($settings['is_megamenu']): ?>
  <div<?php echo $dropdown_attributes; ?>>
    <div class="row tb_separate_columns tb_ip_20">
      <div class="col-xs-12 col-sm-fill">
        <div class="tb_subcategories"><?php echo $subcategories; ?></div>
        <?php if(!empty($manufacturers) && $settings['manufacturers_position'] == 'below'): ?>
        <span class="clear border tb_mt_20 tb_mb_20 tb_ml_-20 tb_mr_-20"></span>
        <?php echo $category_manufacturers; ?>
        <?php endif; ?>
      </div>
      <?php if(!empty($manufacturers) && $settings['manufacturers_position'] == 'column'): ?>
      <div class="col-xs-12 col-sm-1-5"<?php if (!empty($settings['manufacturers_column_size'])) { echo ' style="width: ' . $settings['manufacturers_column_size'] . '%; max-width: none;"'; } ?>>
        <?php echo $category_manufacturers; ?>
      </div>
      <?php endif; ?>
      <?php if($category_info): ?>
      <div class="col-xs-12 col-sm-1-5 col-valign-<?php echo $settings['information_valign']; ?> tb_category_info_col tb_pt_20 tb_pr_20 tb_pb_20 tb_pl_20"<?php if (!empty($settings['info_column_size'])) { echo ' style="width: ' . $settings['info_column_size'] . '%; max-width: none;"'; } ?>>
        <div class="tb_category_info">
          <?php if ($settings['show_title']): ?>
          <h2><?php echo $category['name']; ?></h2>
          <?php endif; ?>
          <?php if ($settings['show_main_thumbnail'] && $settings['is_megamenu']): ?>
          <img class="thumbnail" src="<?php echo $category['thumb']; ?>" width="<?php echo $category['thumb_width']; ?>" height="<?php echo $category['thumb_height']; ?>" alt="<?php echo $category['name']; ?>" />
          <?php endif; ?>
          <?php if ($settings['description']): ?>
          <p class="tb_desc"><?php echo $settings['description']; ?></p>
          <?php endif; ?>
        </div>
      </div>
      <?php endif; ?>
    </div>
  </div>
  <?php else: ?>
  <?php echo $subcategories; ?>
  <?php endif; ?>
  <?php endif; ?>

</li>

<?php if ($settings['is_megamenu']): ?>
<script>

<?php // Category thumb hover ?>
<?php if ($settings['category_thumb']): ?>
var margin = '<?php echo $tbData->language_direction == 'left' ? 'margin-left' : 'margin-right'; ?>';

$("#menu_category_<?php echo $menu_item_id; ?>").find(".tb_subcategories > ul > li").each(function() {
    var image_source = $(this).is("[data-thumb]") ? $(this).attr("data-thumb") : "<?php echo $toolImage->resizeImage('no_image.jpg', $settings['cat_image_size_x'], $settings['cat_image_size_y']); ?>";

    $(this).find("> a").after('<span class="thumbnail"><img src="' + image_source + '" /></span>');
    $(this).find("> .tb_submenu > ul").css(margin, <?php echo $settings['cat_image_size_x']; ?>);
});
<?php endif; ?>

<?php // Subcategory thumb hover ?>
<?php if ($settings['subcategory_hover_thumb']): ?>
$('#menu_category_<?php echo $menu_item_id; ?>')
.on("mouseenter", "li[data-thumb]", function() {
  var $image = $(this).parent().closest('li[class*="category_"]').find("> .thumbnail img");

  if ($image.length) {
    if (!$image.is("[original_src]")) {
      $image.attr("original_src", $image.attr("src"));
    }
    $image.attr("src", $(this).attr("data-thumb"));
  }
})
.on("mouseleave", "li[data-thumb]", function() {
  var $image = $(this).parent().closest('li[class*="category_"]').find("> .thumbnail img");

  if ($image.length) {
    $image.attr("src", $image.attr("original_src"));
  }
});
<?php endif; ?>
</script>

<?php // Responsive grid ?>
<?php if ($settings['subcategory_direction'] == 'row'): ?>
<script type="text/javascript" data-critical="1">
adjustItemSize('#menu_category_<?php echo $menu_item_id; ?> .tb_subcategories');
</script>
<?php endif; ?>
<?php endif; ?>

<?php if (!empty($subcategories) && $category_info): ?>
<style scoped>
[id*="menu_category_<?php echo $menu_item_id; ?>"] .tb_category_info_col {
  <?php if (!empty($settings['category_information_color'])): ?>
  color: <?php echo $settings['category_information_color']; ?>;
  <?php endif; ?>
  <?php if(!empty($settings['category_custom_bg'])): ?>
  background: url("<?php echo $settings['category_custom_bg']; ?>") no-repeat top center / cover;
  <?php endif; ?>
}
</style>
<?php endif; ?>
