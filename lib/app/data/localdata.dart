import 'package:get_storage/get_storage.dart';

class AppLocalData {
  final _getStorage = GetStorage();
  saveIntroInfo() {
    _getStorage.write('appinstalled', true);
  }

  bool getIntroInfo() {
    return _getStorage.read('appinstalled') ?? false;
  }

  saveloginSuccess() {
    _getStorage.write('loginsuccess', true);
  }

  bool getloginSuccess() {
    return _getStorage.read('loginsuccess') ?? false;
  }
}
