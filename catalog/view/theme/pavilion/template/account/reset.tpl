<?php $tbData->echoHeader($header); ?>


<?php // Breadcrumbs -------------------------------------------------- ?>

<?php $tbData->slotStartSystem('account/reset.breadcrumbs'); ?>
<nav class="breadcrumbs">
  <ul class="clearfix">
    <?php foreach ($breadcrumbs as $breadcrumb): ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php endforeach; ?>
  </ul>
</nav>
<?php $tbData->slotStop(); ?>

<?php // Page title --------------------------------------------------- ?>

<?php $tbData->slotStartSystem('account/reset.page_title'); ?>
<h1><?php echo $heading_title; ?></h1>
<?php $tbData->slotStop(); ?>

<?php // Page content ------------------------------------------------- ?>

<?php $tbData->slotStartSystem('account/reset.page_content'); ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
  <fieldset>
    <legend><?php echo $text_password; ?></legend>
    <div class="form-group">
      <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
      <div class="col-sm-10">
        <input type="password" name="password" value="<?php echo $password; ?>" id="input-password" class="form-control" />
        <?php if ($error_password) { ?>
        <div class="text-danger"><?php echo $error_password; ?></div>
        <?php } ?>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
      <div class="col-sm-10">
        <input type="password" name="confirm" value="<?php echo $confirm; ?>" id="input-confirm" class="form-control" />
        <?php if ($error_confirm) { ?>
        <div class="text-danger"><?php echo $error_confirm; ?></div>
        <?php } ?>
      </div>
    </div>
  </fieldset>

  <div class="tb_submit clearfix">
    <a href="<?php echo $back; ?>" class="tb_button tb_button_back tb_button_default tb_bg_str_3"><?php echo $button_back; ?></a>
    <button type="submit" class="tb_button tb_button_primary"><?php echo $button_continue; ?></button>
  </div>

</form>
<?php $tbData->slotStop(); ?>


<?php $tbData->echoFooter($footer); ?>