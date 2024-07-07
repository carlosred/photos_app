import 'package:riverpod/riverpod.dart';

import '../../domain/models/photo/photo.dart';

var tabIndexProvider = StateProvider<int>((ref) => 0);

var photoListProvider = StateProvider<List<Photo>?>((ref) => null);
