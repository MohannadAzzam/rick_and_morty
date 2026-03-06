import 'dart:convert';

import 'package:http/http.dart' as http;

class CharactersWebServices {

  // دالة لجلب البيانات من أي رابط (URL) نرسله لها
  Future<Map<String, dynamic>> getAllCharacters(String url) async {
    try {
      // 1. إرسال طلب GET للسيرفر
      final response = await http.get(Uri.parse(url));

      // 2. التأكد من أن الطلب نجح (كود 200)
      if (response.statusCode == 200) {
        // تحويل النص القادم من السيرفر إلى Map
        return jsonDecode(response.body);
      } else {
        // في حال وجود خطأ من السيرفر (مثل 404 أو 500)
        return {};
      }
    } catch (e) {
      // في حال وجود خطأ في الإنترنت أو الرابط
      return {};
    }
  }
}
