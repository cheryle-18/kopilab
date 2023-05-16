class Htrans {
  String orderId;
  int totalPrice;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Htrans({
    required this.orderId,
    required this.totalPrice,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Htrans.fromJson(Map<String, dynamic> json) => Htrans(
        orderId: json["orderId"],
        totalPrice: json["totalPrice"],
        status: json["status"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );
}
