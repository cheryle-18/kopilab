import 'package:flutter/foundation.dart';
import 'package:kopilab/helpers/DatabaseHelper.dart';

import '../models/cart.dart';

class CartProvider extends ChangeNotifier {
  final List<Cart> _cartList = [];

  List<Cart> get cartList => _cartList;

  Future<void> addCart(Cart cart) async {
    if (_cartList.map((item) => item.menuId).contains(cart.menuId)) {
      Cart menu = _cartList.firstWhere((item) => item.menuId == cart.menuId);
      menu.price = cart.price;
      menu.qty += cart.qty;
      menu.subtotal = menu.price * menu.qty;
      await DatabaseHelper().update(cart.menuId, cart.price, menu.qty);
      _cartList[_cartList.indexWhere((item) => item.menuId == item.menuId)] =
          menu;
    } else {
      await DatabaseHelper().insert(cart);
      _cartList.add(cart);
    }

    notifyListeners();
  }

  Future<void> setCart(Cart cart) async {
    _cartList.add(cart);

    notifyListeners();
  }

  int count() {
    return _cartList.length;
  }

  void addQuantity(int index){
    _cartList[index].qty++;
    _cartList[index].subtotal = _cartList[index].price * _cartList[index].qty;
    notifyListeners();
  }

  Future<void> removeQuantity(int index) async {
    _cartList[index].qty--;
    if(_cartList[index].qty == 0){
      _cartList.removeAt(index);
      await DatabaseHelper().removeAt(_cartList[index].menuId);
    }
    else{
      _cartList[index].subtotal = _cartList[index].price * _cartList[index].qty;
      await DatabaseHelper().update(_cartList[index].menuId, _cartList[index].price, _cartList[index].qty);
    }

    notifyListeners();
  }

  Future<void> clearCart() async {
    _cartList.clear();
    await DatabaseHelper().clear();
    notifyListeners();
  }

  int getTotal(){
    int total = 0;
    for (var element in _cartList) {
      total += element.subtotal;
    }
    return total;
  }
}
