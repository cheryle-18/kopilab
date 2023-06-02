import 'package:intl/intl.dart';

class Currency {
  final formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: '',
    decimalDigits: 0,
  );
  int price;

  Currency(this.price);

  @override
  String toString() {
    return formatter.format(price);
  }
}
