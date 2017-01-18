<fieldset>
  <legend>Listing</legend>
  <div class="s_row_1">
    <div class="s_select">
      <select name="widget_data[view_mode]">
        <option value="grid"<?php if ($settings['view_mode'] == 'grid'): ?> selected="selected"<?php endif; ?>>Grid</option>
        <option value="list"<?php if ($settings['view_mode'] == 'list'): ?> selected="selected"<?php endif; ?>>List</option>
        <option value="compact"<?php if ($settings['view_mode'] == 'compact'): ?> selected="selected"<?php endif; ?>>Compact</option>
      </select>
    </div>
  </div>
</fieldset>