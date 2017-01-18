<?php $profile_border ? $border_offset = 10 : $border_offset = 0; ?>
<?php if ($like_box_style == 'custom'): ?>
<style scoped>
#<?php echo $widget->getDomId(); ?> ul.uiList {
  <?php if ($profile_name): ?>
  height: <?php echo ($tbData->fonts['body']['line-height'] * 1.5 + 50 + $border_offset) * $profiles_rows; ?>px;
  <?php else: ?>
  height: <?php echo ($tbData->fonts['body']['line-height'] * 0.5 + 50 + $border_offset) * $profiles_rows + 1; ?>px;
  <?php endif; ?>
}
</style>
<?php endif; ?>

<?php if ($title): ?>
<h2 class="align_<?php echo $title_align; ?>"><?php echo $title; ?></h2>
<?php endif; ?>
<?php if ($like_box_style == 'custom'): ?>
<div class="tb_fb_likebox<?php echo $like_box_classes; ?> tb_social_box tb_custom">
  <div class="tb_fb_like tb_social_button">
    <div class="fb-like" data-href="<?php echo $page_url; ?>" data-layout="<?php echo $like_button_style; ?>" data-action="like" data-show-faces="false" data-share="false"></div>
  </div>
  <?php echo $content; ?>
</div>
<?php else: ?>
<div class="tb_fb_likebox tb_social_box tb_default">
  <div class="tb_social_box_wrap">
    <div class="fb-page" data-href="<?php echo $page_url; ?>" data-small-header="<?php echo $default_small_header; ?>" data-adapt-container-width="true" data-hide-cover="<?php echo $default_hide_cover; ?>" data-show-facepile="true" data-show-posts="false"></div>
  </div>
</div>
<?php endif; ?>