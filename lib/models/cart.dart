class Cart {
  int menuId;
  String name;
  int price;
  int qty;
  int subtotal;

  Cart(this.menuId, this.name, this.price, this.qty, this.subtotal);

  @override
  String toString() {
    return 'Cart{menuId: $menuId, name: $name, price: $price, qty: $qty, subtotal: $subtotal}';
  }
}
