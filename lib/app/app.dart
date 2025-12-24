import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../config/config.dart';

class FlutterBlocApp extends StatelessWidget {
  const FlutterBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RouterSimpleCubit>().state;

    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: state,
      theme: AppTheme(
        isDarkmode: false,
      ).getTheme(),
    );
  }
}
