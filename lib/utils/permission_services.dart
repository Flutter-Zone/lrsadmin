import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  static Future<PermissionStatus> getCameraPermissionStatus() async {
    PermissionStatus status = await Permission.camera.status;
    if (status.isDenied || status.isLimited) {
      status = await Permission.camera.request();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
    return status;
  }

  static Future<PermissionStatus> getStoragePermissionStatus() async {
    PermissionStatus status = await Permission.storage.status;
    if (status.isDenied || status.isLimited) {
      status = await Permission.storage.request();
    }
    return status;
  }

  static Future<PermissionStatus>
      getFineAccessLocationPermissionStatus() async {
    PermissionStatus status = await Permission.location.status;
    if (status.isDenied || status.isLimited) {
      status = await Permission.location.request();
    }
    return status;
  }
}
