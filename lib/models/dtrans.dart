class Dtrans {
  int orderId;
  int menuId;
  int price;
  int qty;
  int subtotal;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Dtrans({
    required this.orderId,
    required this.menuId,
    required this.price,
    required this.qty,
    required this.subtotal,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Dtrans.fromJson(Map<String, dynamic> json) => Dtrans(
        orderId: json["orderId"],
        menuId: json["menuId"],
        price: json["price"],
        qty: json["qty"],
        subtotal: json["subtotal"],
        status: json["status"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );
}
