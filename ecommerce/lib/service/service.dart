class service{
  static var baseurl="http://10.0.2.2:8000/api/";
  static var user='${baseurl}user';
  static var login='${baseurl}login';
  static var logout='${baseurl}logout';
  static var register='${baseurl}register';
  static var slider='${baseurl}slider';
  static var categories='${baseurl}categories';
  static var subcategory='${baseurl}subcategories/';
  static var product='${baseurl}products';
  static var productid='${baseurl}products/';
  static var detail='${baseurl}products/detail/';
  static var getfavorite='${baseurl}favorite/get';
  static var storefavorite='${baseurl}favorite/store/';
  static var getcart='http://10.02.2:8000/api/cart';
  static var addcart='${baseurl}cart/store';

  static var getorder='${baseurl}order';
  static var getorderstatus='${baseurl}order/status/';


  static var add_remove='${baseurl}cart/update';
  static var cartdelete='${baseurl}cart/delete/';
  static var storeordersingle='${baseurl}order/store/single';
}