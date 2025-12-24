import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/config.dart';

class UsernameCubit extends Cubit<String> {
  UsernameCubit() : super('no-username');

  void setUsername() {
    emit(RandomGenerator.getRandomName());
  }
}
