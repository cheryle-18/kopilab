class Htrans {
  late int orderId;
  late int totalItem;
  late int totalPrice;
  late String status;
  late String createdAt;
  late String updatedAt;

  Htrans({
    required this.orderId,
    required this.totalItem,
    required this.totalPrice,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "orderId": orderId,
      "totalItem": totalItem,
      "totalPrice": totalPrice,
      "status": status,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }

  Htrans.fromMap(Map<String, dynamic> map) {
    orderId = map['orderId'];
    totalItem = map['totalItem'];
    totalPrice = map['totalPrice'];
    status = map['status'];
    createdAt = map['createdAt'];
    updatedAt = map['updatedAt'];
  }

  factory Htrans.fromJson(Map<String, dynamic> json) => Htrans(
        orderId: json["orderId"],
        totalItem: json["totalItem"],
        totalPrice: json["totalPrice"],
        status: json["status"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );
}
