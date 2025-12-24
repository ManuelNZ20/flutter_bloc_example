import 'package:flutter/material.dart';

import 'app/blocs_providers.dart';
import 'presentation/blocs/blocs.dart';

void main() {
  serviceLocatorInit();

  runApp(
    const BlocsProviders(),
  );
}
