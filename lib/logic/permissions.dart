import 'package:permission_handler/permission_handler.dart';

class PermissionsLogic{
  static void checkStoragePermissions() async {
    var status = await Permission.storage.status;
    const Permission permission = Permission.storage;
    if (status.isDenied) {
      // Ask for permission
      await permission.request();
    }else if (status.isPermanentlyDenied){
      // Permission is permanently denied, deny access to the payment method

    }else if (status.isGranted) {
      // proceed with transaction
    }
  }


}