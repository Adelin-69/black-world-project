<?php $shop = Functions::GetShop(); ?>
<style>
  body {
    background-image: url(/img/background/background10.png);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center; 
    background-attachment: fixed;

  }
  h6, p {
    color: white;
  }
  .button {

  padding: 1px 25px;
  font-size: 15px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background: linear-gradient(to top, #005266 0%, #002933 100%);
  border: none;
  border-radius: 7px;
  box-shadow: 0 5px #001a00;
  }
.button:hover {background: linear-gradient(to bottom, #006600 0%, #006600 100%);}

.button:active {
  background: linear-gradient(to bottom, #003300 0%, #009933 100%);;
  box-shadow: 0 2px #001a00;
  transform: translateY(4px);
}
.clearfix {
  overflow: auto;
}
.clearfix img {
  background-image: url(/do_img/global/items/bg-real_100x100.jpg);
  border: 3px solid #00ccff;
  box-shadow: inset 0px 0px 5px 2px #00ccff;
  animation: mymove 2s infinite;
}
@keyframes mymove {
  50% {border-color: #007a99;}
}
</style>
      <div id="main">
        <div class="container">
          <div class="row">
            <?php require_once(INCLUDES . 'data.php'); ?>

            <div class="col s12">
              <div class="card white-text center padding-15" style="background-color: #00141a; box-shadow: inset 0px 0px 25px 1px #004e66;">
                <h5>SHOP</h5>

                <ul style="background-color: transparent;" class="tabs tabs-fixed-width tab-demo z-depth-3">
                <?php foreach ($shop['categories'] as $value) { ?>
                  <li class="tab"><a href="#<?php echo $value; ?>"><?php echo $value; ?></a></li>
                <?php } ?>
                </ul>

                <?php foreach ($shop['categories'] as $value) { ?>
                  <div id="<?php echo $value; ?>">
                    <div class="row">
                      <?php foreach ($shop['items'] as $value2) { if ($value2['category'] == $value && $value2['active']) { ?>
                      <div style="background-color: transparent;" class="col m4 s2">
                        <div id="item-<?php echo $value2['id']; ?>" style="background-color: #002733; box-shadow: inset 0px 0px 10px 2px#004e66;" class="card">
                          <div class="clearfix">
                            <img src="<?php echo DOMAIN; ?><?php echo $value2['image']; ?>">
                            <?php if ($value2['amount']) { ?>
                            <div style="overflow: hidden;font-size: 10px;font-family: Verdana, Arial, sans-serif;position: absolute;margin: auto;left: 0;right: 0;bottom: 5px;"></div>
                            <?php } ?>
                          </div>
                          <div class="card-content">
                            <span class="card-title" style="color: #ccf5ff; font-weight: bold; font-size: 15px"><?php echo $value2['name']; ?></span>
                            <p style="color: white; font-size: 18px;"><b><i><span class="price"><?php echo number_format($value2['price'], 0, '.', '.'); ?></i></b></span> <?php echo ($value2['priceType'] == 'uridium' ? '<img src="do_img/global/items/uridium.png" title="Uridium">' : '<img src="do_img/global/items/credits.png" title="Credits">'); ?></p>
                            <?php if ($value2['amount']) { ?>
                            <div class="input-field">
                              <input type="hidden" name="price" value="<?php echo $value2['price']; ?>">
                              <input class="white-text" type="number" name="amount" id="amount-<?php echo $value2['id']; ?>" min="1" value="1">
                              <label for="amount-<?php echo $value2['id']; ?>" style="color: white" >Amount</label>
                            </div>
                            <?php } ?>
                          </div>
                          <div style="background-color: transparent;" class="card-action">
                            <div class="row">
                              <button href="#modal" data-item-id="<?php echo $value2['id']; ?>" class="buy button modal-trigger"><b>BUY</b></button>
                            </div>
                          </div>
                        </div>
                      </div>
                    <?php } } ?>
                    </div>
                  </div>
                <?php } ?>
              </div>
            </div>

          </div>
          <div id="modal" class="modal white-text" style="background-color: #00141a; box-shadow: inset 0px 0px 25px 1px #004e66;">
            <div class="modal-content center">
              <b style="font-size: 20px;"><p>Do you really want to buy this %item_name%?</p></b>
              <b><a id="confirm-buy" class="modal-close waves-effect waves-light btn" style="background-color: green">BUY!</a></b>
              <b><a class="modal-close waves-effect waves-light btn" style="background-color: red">CANCEL</a></b>
          </div>
        </div>
    </div>
