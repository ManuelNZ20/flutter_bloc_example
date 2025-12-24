import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import '../presentation/blocs/blocs.dart';
import '../config/config.dart';

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<UsernameCubit>(),
          // lazy: true, //configuración por defecto
        ),
        BlocProvider(
          create: (context) => getIt<RouterSimpleCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<CounterCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ThemeCubit>(),
        ),
      ],
      child: FlutterBlocApp(),
    );
  }
}
