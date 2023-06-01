import 'package:flutter/foundation.dart';

import '../models/htrans.dart';
import '../utils/dbhelper.dart';

class HtransProvider extends ChangeNotifier {
  final List<Htrans> _htransList = [];
  late DbHelper _dbHelper;

  List<Htrans> get htransList => _htransList;

  dbHtrans() {
    _dbHelper = DbHelper();
  }

  Future<void> addHtrans(Htrans htrans) async {
    await _dbHelper.insertHtrans(htrans);
    notifyListeners();
  }

  Future<void> editHtrans(Htrans htrans) async {
    await _dbHelper.updateHtrans(htrans);
    notifyListeners();
  }
}
