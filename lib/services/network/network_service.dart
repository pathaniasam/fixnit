abstract class INetworkService<T> {
  Future<T> post({
    required String path,
    required T data,
    Map<String, String>? header,
  });

  Future<T> get({
    required String path,
    Map<String, String>? header,
  });
}
