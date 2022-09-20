import 'package:crypto_app/src/presenter/pages/crypto_info/crypto_info_page.dart';
import 'package:crypto_app/src/presenter/pages/portifolio/portifolio_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Cryptos App',
      theme: ThemeData(
        useMaterial3: false,
      ),
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const PortifolioPage(),
        '/crypto_info': (context) => const CryptoInfoPage(),
      },
    );
  }
}
