<h2 class="tb_bg_str_2"> <?php echo $heading_title; ?></h2>
<div id="coupon" class="cart-content">
  <div id="apply_coupon">
    <label for="input-coupon"><strong><?php echo $entry_coupon; ?></strong></label>
    <input type="text" name="coupon" value="<?php echo $coupon; ?>" placeholder="<?php echo $entry_coupon; ?>" id="input-coupon" class="form-control" size="28" />
    <button type="button" id="button-coupon" class="tb_button"><?php echo $button_coupon; ?></button>
  </div>
</div>

<script type="text/javascript"><!--
$('#button-coupon').on('click', function() {
	$.ajax({
		url: 'index.php?route=total/coupon/coupon',
		type: 'post',
		data: 'coupon=' + encodeURIComponent($('input[name=\'coupon\']').val()),
		dataType: 'json',
		beforeSend: function() {
			$('#button-coupon').button('loading');
		},
		complete: function() {
			$('#button-coupon').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#cart_form').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}

			if (json['redirect']) {
				location = json['redirect'];
			}
		}
	});
});
//--></script>
