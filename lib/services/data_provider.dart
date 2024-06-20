import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vodafone/models/models.dart';
import 'package:vodafone/services/services.dart';

final userDataProvider = FutureProvider<List<NewsModel>>(
  (ref) async {
    return ref.watch(service).getUsers();
  },
);
