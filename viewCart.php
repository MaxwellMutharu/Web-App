<?php
include_once 'Cart.class.php';
$cart = new Cart;
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Maxwell AI Sales and Repairs</title>
<meta charset="utf-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}
.active, .dot:hover {
  background-color: #717171;
}
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
</style>
<meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
function updateCartItem(obj,id){
    $.get("cartAction.php", {action:"updateCartItem", id:id, qty:obj.value}, function(data){
        if(data == 'ok'){
            location.reload();
        }else{
            alert('Cart update failed, please try again.');
        }
    });
}
</script>
</head>
<body style="background-image:url(image.jpg);">
  <div class="jumbotron text-center" style="margin-bottom:0">
    <div class="container">
      <h1><u>Maxwell AI Sales and Repairs</u></h1>
      <p>Its a Pleasure Serving You</p>
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
      </ol>
      <div class="carousel-inner">
        <div class="item active">
          <img src="max.jpg" alt="ts1" style="width:100%;">
        </div>
        <div class="item">
          <img src="i.jpg" alt="ts" style="width:100%;">
        </div>
        <div class="item">
          <img src="j.jpeg" alt="ts" style="width:100%;">
        </div>
        <div class="item">
          <img src="121.jpg" alt="ts" style="width:100%;">
        </div>

      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </div>
  </div>
  <nav class="navbar navbar-expand-sm bg-white navbar-light">
    <a class="navbar-brand" href="index1.php">Maxwell AI</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
        <li class="nav-item">
        <p>For any Queries or Repairs needs <i class="fa fa-phone"></i> 0740695039  or <a href="https://WWW.GMAIL.COM">email <i class="fa fa-mobile"></i></a> us at maxwellkarani269@gmail.com</p>
        </li>
      </ul>
    </div>
  </nav>
  <div class="container" style="margin-top:30px">
<div class="container">
<h1>SHOPPING CART</h1>
<div class="row">
<div class="cart">
<div class="col-12">
<div class="table-responsive">
<table class="table table-striped">
<thead>
                            <tr>
<th width="45%">Product</th>
<th width="10%">Price</th>
<th width="15%">Quantity</th>
<th class="text-right" width="20%">Total</th>
<th width="10%"> </th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            if($cart->total_items() > 0){
                                // Get cart items from session
                                $cartItems = $cart->contents();
                                foreach($cartItems as $item){
                            ?>
                            <tr>
                                <td><?php echo $item["name"]; ?></td>
                                <td><?php echo '$'.$item["price"].' USD'; ?></td>
                                <td><input class="form-control" type="number" value="<?php echo $item["qty"]; ?>" onchange="updateCartItem(this, '<?php echo $item["rowid"]; ?>')"/></td>
                                <td class="text-right"><?php echo '$'.$item["subtotal"].' USD'; ?></td>
                                <td class="text-right"><button class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')?window.location.href='cartAction.php?action=removeCartItem&id=<?php echo $item["rowid"]; ?>':false;"><i class="itrash"></i> </button> </td>
                            </tr>
                            <?php } }else{ ?>
                            <tr><td colspan="5"><p>Your cart is empty.....</p></td>
                            <?php } ?>
                            <?php if($cart->total_items() > 0){ ?>
                            <tr>
                                <td></td>
                                <td></td>
                                <td><strong>Cart Total</strong></td>
                                <td class="text-right"><strong><?php echo 'sh'.$cart->total().' Ksh'; ?></strong></td>
                                <td></td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col mb-2">
                <div class="row">
                    <div class="col-sm-12  col-md-6">
                        <a href="index1.php" class="btn btn-block btn-light">Continue Shopping</a>
                    </div>
                    <div class="col-sm-12 col-md-6 text-right">
                        <?php if($cart->total_items() > 0){ ?>
                        <a href="checkout.php" class="btn btn-lg btn-block btn-primary">Checkout</a>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0">
  <p align="left">Follow<br><a href="www.facebook.com"><i class="fa fa-facebook"></i></i></a> <a href="www.paypal.com"><i class="fa fa-paypal"></i></a> <a href="https//:www.instagram.com"><i class="fa fa-instagram"></i></a><br> Copyright<br>&copy;</p>
    <br>
  </div>
</body>
</html>
