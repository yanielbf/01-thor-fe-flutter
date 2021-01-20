import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StoreLocal {
  final GetStorage _storage = Get.find<GetStorage>();

  Future<void> setStore(String key, String value) async {
    await _storage.write(key, value);
  }

  Future<String> getStore(String key) async {
    return await _storage.read(key);
  }

  Future<void> removeKey(String key) async {
    await _storage.remove(key);
  }

  Future<void> removeAll(String key) async {
    await _storage.erase();
  }
}
