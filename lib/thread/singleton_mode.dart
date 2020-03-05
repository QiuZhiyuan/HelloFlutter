import 'dart:developer';

class CommonData {
  static CommonData _instance;

  // 懒汉设计
  static CommonData i() {
    log('common data');
    if (_instance == null) {
      log('create object');
      _instance = new CommonData();
    }
    return _instance;
  }

  int _count = 0;

  void increase() {
    _count++;
  }

  int getCount() {
    return _count;
  }
}
