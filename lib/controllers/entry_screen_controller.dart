import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/bank_model.dart';

class EntryScreenController extends ChangeNotifier {
  Future<List<Bank>> getJson() async {
    List<Bank> _banks = [];
    try {
      var response = await http.get(Uri.parse(""));

      if (kDebugMode) {
        print(response.body);
      }

      if (response.statusCode >= 200 && response.statusCode <= 201) {
        _banks = bankFromJson(response.body);
        return _banks;
      } else {
        return _banks;
      }
    } catch (e) {
      return _banks;
    }
  }
}
