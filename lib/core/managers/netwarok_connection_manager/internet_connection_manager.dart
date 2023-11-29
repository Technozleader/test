import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:logger/logger.dart';

abstract class ConnectionManager {
  Stream<bool> hasInternetConnection();

  Future<bool> isConnected();
}

class ConnectionManagerImpl implements ConnectionManager {
  final Connectivity connectivity = Connectivity();

  @override
  Stream<bool> hasInternetConnection() =>
      connectivity.onConnectivityChanged.map((event) {
        final bool hasNetwork = event != ConnectivityResult.none;
        Logger().i("${hasNetwork? '':"Don't"}Has internet connection: $event");
        return hasNetwork;
      });

  @override
  Future<bool> isConnected() async {
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      Logger().e("Don't have internet connection");
      return false;
    } else {
      Logger().e(" have internet connection $connectivityResult");
      return true;
    }
  }
}
