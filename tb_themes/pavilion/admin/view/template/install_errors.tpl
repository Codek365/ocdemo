<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <style type="text/css">
  #install_error {
    width: 900px;
    min-height: 500px;
    margin: 50px auto;
  }
  #install_error .alert {
    font-size: 14px;
  }
  #install_error .alert > span {
    float: left;
    margin-right: 15px;
    font-size: 18px;
  }
  #install_error .alert div {
    overflow: hidden;
  }
  #install_error .alert div p:last-child {
    margin-bottom: 0;
  }
  </style>
  <div id="install_error">
    <h2><strong class="text-capitalize"><?php echo $theme_name; ?></strong> has not been installed successfully due to the following reasons:</h2>
    <br />
    <div class="alert alert-danger" role="alert">
      <span class="fa fa-exclamation-circle" aria-hidden="true"></span>
      <div>
      <?php foreach ($errors as $error): ?>
      <p><?php echo $error; ?></p>
      <?php endforeach; ?>
      </div>
    </div>
    <p>Please, correct the errors above and then try to <a href="<?php echo $install_theme_url; ?>">install the theme module</a> again.</p>
  </div>
</div>
<?php echo $footer; ?>
