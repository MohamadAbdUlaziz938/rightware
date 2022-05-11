import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:rightware/helpers/database/local_storage.dart';

class EntryCache<T> {
  Map<String, T> _data = {};
  late LocalStorageAdapter storage;

  EntryCache(LocalStorage localStorage,) {
    storage = localStorage.permanent.scopedToUser();
  }

  Map<String, T> get all {
    return _data;
  }

  get(String serviceId) {
    return _data[serviceId];
  }

  set(String serviceId, T service) {
    _data.addAll({serviceId: service});
  }

  void cleanEntryCash() {
    _data = {};
  }

  void removeItems(List<String> ids) {
    _data.removeWhere((key, value) => ids.contains(key));
  }



  String responseCacheKey(Map<String, String> params) {
    final string = params.toString().replaceAll(' ', '');
    final hash = md5.convert(utf8.encode(string)).toString();
    return hash;
  }
}
