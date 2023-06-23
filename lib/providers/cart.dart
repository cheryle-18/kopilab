import 'package:flutter/foundation.dart';

import '../models/cart.dart';

class CartProvider extends ChangeNotifier {
  final List<Cart> _cartList = [];

  List<Cart> get cartList => _cartList;

  void add(Cart cart) {
    if (_cartList.map((item) => item.menuId).contains(cart.menuId)) {
      Cart menu = _cartList.firstWhere((item) => item.menuId == cart.menuId);
      menu.price = cart.price;
      menu.qty += cart.qty;
      menu.subtotal = menu.price * menu.qty;
      _cartList[_cartList.indexWhere((item) => item.menuId == item.menuId)] =
          menu;
    } else {
      _cartList.add(cart);
    }
    notifyListeners();
  }

  int count() {
    return _cartList.length;
  }
}
