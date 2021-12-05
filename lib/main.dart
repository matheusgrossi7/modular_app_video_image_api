import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_modules.dart';
import 'app/app_widgets.dart';

// flutter packages pub run build_runner watch --delete-conflicting-outputs

void main() {
  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
