import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/config.dart';
import '../presentation/blocs/blocs.dart';

class FlutterBlocApp extends StatelessWidget {
  const FlutterBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RouterSimpleCubit>().state;
    final stateTheme = context.watch<ThemeCubit>();
    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: state,
      theme: AppTheme(
        isDarkmode: stateTheme.state.isDarkmode,
      ).getTheme(),
    );
  }
}
