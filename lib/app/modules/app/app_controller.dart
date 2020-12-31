import 'package:thor_flutter/app/data/model/customer.dart';
import 'package:thor_flutter/app/data/model/order.dart';
import 'package:thor_flutter/app/data/model/order_item.dart';
import 'package:thor_flutter/app/data/provider/local/authentication_local.dart';
import 'package:thor_flutter/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  final AuthenticationLocal _authenticationLocal =
      Get.find<AuthenticationLocal>();

  RxInt _activeRouteBottomBar = 0.obs;
  RxInt get activeRouteBottomBar => _activeRouteBottomBar;

  String _activeRoute = AppRoutes.MAIN;
  String get activeRoute => _activeRoute;

  Customer _customer;
  Customer get customer => _customer;

  RxInt _totalNotifications = 1.obs;
  RxInt get totalNotifications => _totalNotifications;

  Order _order;

  Order get order => _order;

  @override
  void onInit() async {
    super.onInit();
    await _bootstrap();
  }

  Future<void> _bootstrap() async {
    await _getSession();
    _createOrderEmpty();
  }

  Future<void> _getSession() async {
    _customer = await _authenticationLocal.getSession();
  }

  void _createOrderEmpty() {
    _order = Order(
        dateDelivery: DateTime.now(), status: 'Pendiente', orderItems: []);
  }

  void addOrderItem(OrderItem order) {
    _order.orderItems.add(order);
  }

  void clearOrderItems() {
    _order.orderItems.clear();
    update(['main-actions']);
  }

  void navigateFromBottomBar(int index) {
    switch (index) {
      case 0:
        _activeRoute = AppRoutes.MAIN;
        _activeRouteBottomBar.value = index;
        Get.toNamed(AppRoutes.MAIN);
        break;
      case 1:
        _activeRoute = AppRoutes.MAIN;
        _activeRouteBottomBar.value = index;
        Get.toNamed(AppRoutes.MAIN);
        break;
      case 2:
        Get.toNamed(AppRoutes.MAIN);
        _activeRoute = AppRoutes.MAIN;
        _activeRouteBottomBar.value = index;
        break;
      case 3:
        _activeRoute = AppRoutes.PROFILE_OPTIONS;
        _activeRouteBottomBar.value = index;
        Get.toNamed(AppRoutes.PROFILE_OPTIONS);
        break;
    }
  }

  void navigateToRoute(String route,
      {bool removeStack = false, dynamic arguments}) {
    _activeRoute = route;
    if (removeStack) {
      Get.offAllNamed(route);
    } else {
      Get.toNamed(route, arguments: arguments);
    }
  }

  void closeSession() {
    _authenticationLocal.removeSession();
    Get.offNamed(AppRoutes.LOGIN);
  }
}
