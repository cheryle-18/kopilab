class Dtrans {
  late int orderId;
  late int menuId;
  late int price;
  late int qty;
  late int subtotal;
  late String status;
  late String createdAt;
  late String updatedAt;

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

  Map<String, dynamic> toMap() {
    return {
      "orderId": orderId,
      "menuId": menuId,
      "price": price,
      "qty": qty,
      "subtotal": subtotal,
      "status": status,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }

  Dtrans.fromMap(Map<String, dynamic> map) {
    orderId = map['orderId'];
    menuId = map['menuId'];
    price = map['price'];
    qty = map['qty'];
    subtotal = map['subtotal'];
    status = map['status'];
    createdAt = map['createdAt'];
    updatedAt = map['updatedAt'];
  }

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
