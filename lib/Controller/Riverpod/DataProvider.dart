import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:offline_service/Controller/Services/ApiServices.dart';
import 'package:offline_service/Controller/Services/CachedServices.dart';

Future<bool> hasInternet() async {
  try {
    // Try pinging Google
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty) {
      return true;
    }
    return false;
  } catch (_) {
    return false;
  }
}

final dataProvider = FutureProvider<List<dynamic>>((ref) async {
  final connectivity = await Connectivity().checkConnectivity();

  // Check if the device has internet access
  if (connectivity != ConnectivityResult.none && await hasInternet()) {
    final fetchData = await Apiservices.fetch_data();
    await Cachedservices.saveData(fetchData);
    return fetchData;
  } else {
    final cachedData = await Cachedservices.getData();
    if (cachedData.isEmpty) {
      throw Exception('No cached data available. Please connect to the internet.');
    }
    return cachedData;
  }
});
