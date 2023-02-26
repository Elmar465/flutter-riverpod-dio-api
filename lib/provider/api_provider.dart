import 'package:flutter_api2/model/user_model.dart';
import 'package:flutter_api2/service/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiService = Provider<ApiService>((ref) => ApiService());
final userDataProvider = FutureProvider<List<User>>((ref) => ref.read(apiService).getUser());