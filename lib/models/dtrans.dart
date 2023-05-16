class Dtrans {
  String orderId;
  String menuId;
  int qty;
  int price;
  int subtotal;
  DateTime createdAt;
  DateTime updatedAt;

  Dtrans({
    required this.orderId,
    required this.menuId,
    required this.qty,
    required this.price,
    required this.subtotal,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Dtrans.fromJson(Map<String, dynamic> json) => Dtrans(
        orderId: json["orderId"],
        menuId: json["menuId"],
        qty: json["qty"],
        price: json["price"],
        subtotal: json["subtotal"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );
}
