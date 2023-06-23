class Cart {
  int menuId;
  String name;
  int price;
  int qty;
  int subtotal;

  Cart({
    required this.menuId,
    required this.name,
    required this.price,
    required this.qty,
    required this.subtotal
  });

  @override
  String toString() {
    return 'Cart{menuId: $menuId, name: $name, price: $price, qty: $qty, subtotal: $subtotal}';
  }

  Map<String, dynamic> toMap() {
    return {
      "menuID": menuId,
      "name": name,
      "price": price,
      "qty": qty,
      "subtotal": subtotal,
    };
  }

}
