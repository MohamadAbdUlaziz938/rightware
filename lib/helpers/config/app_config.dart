import 'package:flutter/services.dart';
import 'package:rightware/helpers/http/app_http_client.dart';

// import 'package:package_info/package_info.dart';
import 'package:yaml/yaml.dart';

import 'local_config.dart';

class AppConfig {
  late AppHttpClient httpClient;
  late LocalConfig localConfig;

  Future<AppConfig> init() async {
    YamlMap local = loadYaml(await rootBundle.loadString('app-config.yaml'));
    localConfig = LocalConfig.fromJson(Map.from(local));
    httpClient =
        AppHttpClient(localConfig.baseBackendUrl ?? '', localConfig.apiVersion);
    return this;
  }
}
