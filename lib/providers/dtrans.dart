import 'package:flutter/foundation.dart';

import '../models/dtrans.dart';
import '../utils/dbhelper.dart';

class DtransProvider extends ChangeNotifier {
  final List<Dtrans> _dtransList = [];
  late DbHelper _dbHelper;

  List<Dtrans> get dtransList => _dtransList;

  dbDtrans() {
    _dbHelper = DbHelper();
  }

  Future<void> addDtrans(Dtrans dtrans) async {
    await _dbHelper.insertDtrans(dtrans);
    notifyListeners();
  }

  Future<void> editDtrans(Dtrans dtrans) async {
    await _dbHelper.updateDtrans(dtrans);
    notifyListeners();
  }
}
