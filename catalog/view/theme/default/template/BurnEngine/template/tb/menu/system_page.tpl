<li<?php echo $menu_classes; ?>>
  <?php if ($has_submenu): ?>
  <span class="tb_toggle tb_bg_str_2"></span>
  <?php endif; ?>
  <a<?php echo $label_classes; ?> href="<?php echo $url; ?>"<?php echo $target; ?>>
    <span class="tb_text"><?php echo $menu_icon; ?><?php echo $label; ?></span>
    <?php if (!empty($settings['accent_text'])): ?>
    <span class="tb_accent_label" style="color: <?php echo $settings['accent_color']; ?>; background-color: <?php echo $settings['accent_bg']; ?>;">
      <?php echo $settings['accent_text']; ?>
    </span>
    <?php endif; ?>
  </a>
  <?php if ($has_submenu): ?>
  <ul<?php echo $submenu_classes; ?>>
    <?php echo $tbData->fetchMenuItems($menu_item['children']); ?>
  </ul>
  <?php endif; ?>
</li>