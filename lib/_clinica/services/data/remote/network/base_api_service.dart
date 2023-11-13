abstract class BaseApiService {
  Future<dynamic> getResponse(String url);
  Future<dynamic> getFile(String url);
  Future<dynamic> getFileWithPost(
    String url,
    Object body,
  );
  Future<dynamic> putResponse(String url, Object jsonBody,
      {Map<String, String> headers = const {}});
  Future<dynamic> postResponse(String url, Object jsonBody,
      {Map<String, String> headers = const {}});
  Future<dynamic> postResponseHeaders(
      String url, Object jsonBody, Map<String, String> headers);

  Future<dynamic> uploadPhoto(String url, String filePath,
      {Map<String, String> headers = const {}});
}
