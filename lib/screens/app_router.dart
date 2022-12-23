import 'package:flutter/material.dart';

abstract class RouteName {
  static const splash = 'splash';
  static const bottomNav = 'bottomNav';
  static const main = 'main';
  static const addCategory = 'addCategory';
  static const admin = 'admin';
  static const home = 'home';
  static const showCategory = 'showCategory';
  static const updateCategory = 'updateCategory';
  static const product = 'product';
  static const showProduct = 'showProduct';
  static const addProduct = 'addProduct';
  static const updateProduct = 'updateProduct';
  static const productInfo = 'productInfo';
  static const cart = 'cart';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RouteName.productInfo:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //     builder: (_) => ProductInfoPage(
      //       productModel: args['singleProduct'],
      //     ),
      //   );
      // case RouteName.splash:
      //   return MaterialPageRoute(builder: (_) => SplashPage());

      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
