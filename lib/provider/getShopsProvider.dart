import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:project/models/getShopsModel.dart';

class GetShopProvider with ChangeNotifier {
  FormData formData = new FormData.fromMap(
      {"longitude": 42.25, "latitude": 46.25, "department_id": 0});
  Dio dio = Dio();
  Future<GetShops> getShops() async {
    try {
      Response response = await dio
          .post("https://dalel-alyoom.com/api/v1/shops", data: formData);
      print(response.data);
      if (response.statusCode == 200) {
        GetShops getShopsModel = GetShops.fromJson(response.data);
        notifyListeners();
        return getShopsModel;
      }
    } catch (error) {
      print(error);
    }
  }
}
