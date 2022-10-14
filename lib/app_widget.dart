import 'package:crypto_app/l10n/app_localizations.dart';
import 'package:crypto_app/l10n/l10n.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'presenter/pages/portfolio/portfolio_page.dart';
import 'shared/utils/app_routes.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Cryptos App',
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      initialRoute: PortfolioPage.route,
      onGenerateRoute: GeneratedRoutes.generateRoute,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: L10n.all,
    );
  }
}
