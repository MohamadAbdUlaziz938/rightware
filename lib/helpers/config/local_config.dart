import 'dart:convert';

const DEFAULT_API_VERSION = 'v1';

class LocalConfig {
  LocalConfig({
    this.baseBackendUrl,
    this.apiVersion = DEFAULT_API_VERSION,
  });

  final String? baseBackendUrl;
  final String apiVersion;

  factory LocalConfig.fromRawJson(String str) =>
      LocalConfig.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocalConfig.fromJson(Map<String, dynamic> json) {
    String backendUrl = json["backend_url"];
    return LocalConfig(
      baseBackendUrl: backendUrl,
      apiVersion: json["api_version"] ?? DEFAULT_API_VERSION,
    );
  }

  Map<String, dynamic> toJson() =>
      {"backend_url": baseBackendUrl, "api_version": apiVersion};
}
