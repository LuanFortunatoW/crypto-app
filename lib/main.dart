import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'app_widget.dart';

void main() {
  Intl.defaultLocale = 'pt_BR';
  initializeDateFormatting('pt_BR', null).then(
    (_) => runApp(
      ProviderScope(
        child: DevicePreview(
          enabled: false,
          builder: (context) => const MyApp(),
        ),
      ),
    ),
  );
}
