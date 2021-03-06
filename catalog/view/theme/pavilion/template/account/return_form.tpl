<?php $tbData->echoHeader($header); ?>


<?php // Breadcrumbs -------------------------------------------------- ?>

<?php $tbData->slotStart('account/return/add.breadcrumbs'); ?>
<nav class="breadcrumbs">
  <ul class="clearfix">
    <?php foreach ($breadcrumbs as $breadcrumb): ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php endforeach; ?>
  </ul>
</nav>
<?php $tbData->slotStop(); ?>

<?php // Page title --------------------------------------------------- ?>

<?php $tbData->slotStart('account/return/add.page_title'); ?>
<h1><?php echo $heading_title; ?></h1>
<?php $tbData->slotStop(); ?>

<?php // Page content ------------------------------------------------- ?>

<?php $tbData->slotStart('account/return/add.page_content'); ?>
<?php if ($error_warning) { ?>
<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>

<div class="tb_text_wrap tb_sep">
  <p><?php echo $text_description; ?></p>
</div>
        
<form id="return_request_form" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">

  <fieldset>
    <legend><?php echo $text_order; ?></legend>

    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
      <div class="col-sm-10">
        <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
        <?php if ($error_firstname) { ?>
        <div class="text-danger"><?php echo $error_firstname; ?></div>
        <?php } ?>
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
      <div class="col-sm-10">
        <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
        <?php if ($error_lastname) { ?>
        <div class="text-danger"><?php echo $error_lastname; ?></div>
        <?php } ?>
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
      <div class="col-sm-10">
        <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
        <?php if ($error_email) { ?>
        <div class="text-danger"><?php echo $error_email; ?></div>
        <?php } ?>
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
      <div class="col-sm-10">
        <input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
        <?php if ($error_telephone) { ?>
        <div class="text-danger"><?php echo $error_telephone; ?></div>
        <?php } ?>
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-order-id"><?php echo $entry_order_id; ?></label>
      <div class="col-sm-10">
        <input type="text" name="order_id" value="<?php echo $order_id; ?>" placeholder="<?php echo $entry_order_id; ?>" id="input-order-id" class="form-control" />
        <?php if ($error_order_id) { ?>
        <div class="text-danger"><?php echo $error_order_id; ?></div>
        <?php } ?>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label" for="input-date-ordered"><?php echo $entry_date_ordered; ?></label>
      <div class="col-sm-3">
        <div class="input-group date"><input type="text" name="date_ordered" value="<?php echo $date_ordered; ?>" placeholder="<?php echo $entry_date_ordered; ?>" data-date-format="YYYY-MM-DD" id="input-date-ordered" class="form-control" /><span class="input-group-btn">
          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
          </span>
        </div>
      </div>
    </div>
  </fieldset>

  <fieldset>
    <legend><?php echo $text_product; ?></legend>

    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-product"><?php echo $entry_product; ?></label>
      <div class="col-sm-10">
        <input type="text" name="product" value="<?php echo $product; ?>" placeholder="<?php echo $entry_product; ?>" id="input-product" class="form-control" />
        <?php if ($error_product) { ?>
        <div class="text-danger"><?php echo $error_product; ?></div>
        <?php } ?>
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-model"><?php echo $entry_model; ?></label>
      <div class="col-sm-10">
        <input type="text" name="model" value="<?php echo $model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="form-control" />
        <?php if ($error_model) { ?>
        <div class="text-danger"><?php echo $error_model; ?></div>
        <?php } ?>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label" for="input-quantity"><?php echo $entry_quantity; ?></label>
      <div class="col-sm-10">
        <input type="text" name="quantity" value="<?php echo $quantity; ?>" placeholder="<?php echo $entry_quantity; ?>" id="input-quantity" class="form-control" />
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label"><?php echo $entry_reason; ?></label>
      <div class="col-sm-10">
        <?php foreach ($return_reasons as $return_reason) { ?>
        <?php if ($return_reason['return_reason_id'] == $return_reason_id) { ?>
        <div class="radio">
          <label>
            <input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" checked="checked" />
            <?php echo $return_reason['name']; ?></label>
        </div>
        <?php } else { ?>
        <div class="radio">
          <label>
            <input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" />
            <?php echo $return_reason['name']; ?></label>
        </div>
        <?php  } ?>
        <?php  } ?>
        <?php if ($error_reason) { ?>
        <div class="text-danger"><?php echo $error_reason; ?></div>
        <?php } ?>
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label"><?php echo $entry_opened; ?></label>
      <div class="col-sm-10">
        <label class="radio-inline">
          <?php if ($opened) { ?>
          <input type="radio" name="opened" value="1" checked="checked" />
          <?php } else { ?>
          <input type="radio" name="opened" value="1" />
          <?php } ?>
          <?php echo $text_yes; ?></label>
        <label class="radio-inline">
          <?php if (!$opened) { ?>
          <input type="radio" name="opened" value="0" checked="checked" />
          <?php } else { ?>
          <input type="radio" name="opened" value="0" />
          <?php } ?>
          <?php echo $text_no; ?></label>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label" for="input-comment"><?php echo $entry_fault_detail; ?></label>
      <div class="col-sm-10">
        <textarea name="comment" rows="10" placeholder="<?php echo $entry_fault_detail; ?>" id="input-comment" class="form-control"><?php echo $comment; ?></textarea>
      </div>
    </div>
    <?php if ($tbData->OcVersionGte('2.1.0.0')): ?>
    <?php echo $captcha; ?>
    <?php elseif ($tbData->OcVersionGte('2.0.2.0')): ?>
    <?php if ($site_key) { ?>
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
        <?php if ($error_captcha) { ?>
          <div class="text-danger"><?php echo $error_captcha; ?></div>
        <?php } ?>
      </div>
    </div>
    <?php } ?>
    <?php else: ?>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-captcha"><?php echo $entry_captcha; ?></label>
      <div class="col-sm-10">
        <input type="text" name="captcha" value="" placeholder="<?php echo $entry_captcha; ?>" id="input-captcha" class="form-control" />
        <span class="clear"></span><br />
        <img src="index.php?route=tool/captcha" alt="" />
        <?php if ($error_captcha) { ?>
        <div class="text-danger"><?php echo $error_captcha; ?></div>
        <?php } ?>
      </div>
    </div>
    <?php endif; ?>
              
  </fieldset>

  <div class="tb_submit clearfix">
    <?php if ($text_agree): ?>
    <label class="checkbox">
      <?php if ($agree) { ?>
      <input type="checkbox" name="agree" value="1" checked="checked" />
      <?php } else { ?>
      <input type="checkbox" name="agree" value="1" />
      <?php } ?>
      <?php echo $text_agree; ?>
    </label>
    <?php endif; ?>
    <button class="tb_button tb_button_primary" type="submit"><?php echo $button_submit; ?></button>
  </div>

</form>

<script type="text/javascript">
tbApp.onScriptLoaded(function() {

  //Validation format
  $('#{{widget_dom_id}} .text-danger').each(function() {
      $(this).parents('.form-group').eq(0).addClass('has-error');
  });

  $('#{{widget_dom_id}} .date').find('input[type="text"]').datepicker({
      dateFormat: 'yy-mm-dd',
      showOtherMonths: true,
      beforeShow: function(input, inst) {
          var newclass = 'tb_jquery_ui';
          if (!inst.dpDiv.parent().hasClass('tb_jquery_ui')) {
              inst.dpDiv.wrap('<div class="'+newclass+'"></div>')
          }
      }
  });

  $('#{{widget_dom_id}} .date').find('button').bind('click', function() {
      $(this).parents('.input-group').first().find('input[type="text"]').datepicker('show');
  });

  tbCreateDialog($('#{{widget_dom_id}} .tb_submit a.agree'));

});
</script> 
<?php $tbData->slotStop(); ?>


<?php $tbData->echoFooter($footer); ?>