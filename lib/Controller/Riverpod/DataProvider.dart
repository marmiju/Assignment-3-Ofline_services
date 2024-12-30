

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:offline_service/Controller/Services/ApiServices.dart';

final dataStateProvider = Provider<Apiservices>((ref)=>Apiservices());

final dataProvider = FutureProvider<List<dynamic>>((ref) async {

  final connectivity = await Connectiv

});