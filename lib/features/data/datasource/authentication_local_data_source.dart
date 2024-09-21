import 'package:hive/hive.dart';


abstract class AuthenticationLocalDataSource {
  Future<void> saveSessionId(String sessionId);

  Future<String?> getSessionId();

  Future<void> deleteSessionId();
}

class AuthenticationLocalDataSourceImpl extends AuthenticationLocalDataSource {
  final key = "session_id";
  // final StorageService storageService;

  // AuthenticationLocalDataSourceImpl(this.storageService);

  @override
  Future<void> deleteSessionId() async {
    final authenticationBox = await Hive.openBox('authenticationBox');
    authenticationBox.delete(key);
  }

  @override
  Future<String?> getSessionId() async {
    final authenticationBox = await Hive.openBox('authenticationBox');
    return await authenticationBox.get(key);
  }

  @override
  Future<void> saveSessionId(String sessionId) async {
    final authenticationBox = await Hive.openBox('authenticationBox');
    // storageService.save(key: key, value: sessionId);
    return await authenticationBox.put(key, sessionId);
  }
}
