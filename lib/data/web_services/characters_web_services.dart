import 'package:dio/dio.dart';
import 'package:rick_and_morty/constants/strings.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20), // انتظر 20 ثانية قبل الفصل
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  // دالة تجلب البيانات الخام (Map)
  Future<Map<String, dynamic>> getAllCharacters(String url) async {
    try {
      Response response = await dio.get(url);
      return response.data; // يعيد البيانات كـ Map
    } catch (e) {
      print(e.toString());
      return {}; // في حال الخطأ نرجع ماب فارغة
    }
  }
}
