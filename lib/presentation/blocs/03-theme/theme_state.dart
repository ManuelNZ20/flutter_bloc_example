part of 'theme_cubit.dart';

// sealed, parecido al abstract
class ThemeState extends Equatable {
  final bool isDarkmode;

  const ThemeState({
    required this.isDarkmode,
  });

  @override
  List<Object> get props => [isDarkmode];
}

// final class ThemeInitial extends ThemeState {}
