import 'package:thor_flutter/app/data/model/dish.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MenuAPI {
  final Dio _dio = Get.find<Dio>();

  Future<List<Dish>> requestDailyMenu() async {
    var response = await _dio.get('/menu/main-dishes');
    return (response.data['data'] as List)
        .map((e) => Dish.fromJson(e))
        .toList();
  }

  Future<Dish> requestDishDetail(int id) async {
    var response = await _dio.get('/menu/dish/$id');
    print(response.data);
    return Dish.fromJsonWithRelated(response.data['data']);
  }
}
