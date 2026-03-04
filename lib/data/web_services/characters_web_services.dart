// import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;
// import 'package:rick_and_morty/constants/strings.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

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
        print("Server Error: ${response.statusCode}");
        return {};
      }
    } catch (e) {
      // في حال وجود خطأ في الإنترنت أو الرابط
      print("Network Error: $e");
      return {};
    }
  }
}

// class CharactersWebServices {
//   late Dio dio;

//   CharactersWebServices() {
//     BaseOptions options = BaseOptions(
//       baseUrl: baseUrl,
//       receiveDataWhenStatusError: true,
//       connectTimeout: const Duration(seconds: 20), // انتظر 20 ثانية قبل الفصل
//       receiveTimeout: const Duration(seconds: 20),
//     );
//     dio = Dio(options);
//   }

//   // دالة تجلب البيانات الخام (Map)
//   Future<Map<String, dynamic>> getAllCharacters(String url) async {
//     try {
//       Response response = await dio.get(url);
//       return response.data; // يعيد البيانات كـ Map
//     } catch (e) {
//       print(e.toString());
//       return {}; // في حال الخطأ نرجع ماب فارغة
//     }
//   }
// }
