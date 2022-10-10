import 'package:crypto_app/l10n/app_localizations.dart';
import 'package:crypto_app/presenter/controllers/crypto_history/crypto_history_provider.dart';
import 'package:crypto_app/shared/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import 'widget_tests/fake_repository/crypto_history_fake_repository.dart';

class SetupWidgetTester extends StatelessWidget {
  const SetupWidgetTester({
    Key? key,
    this.locale,
    required this.child,
    required this.navigatorObservers,
  }) : super(key: key);

  final Widget child;
  final Locale? locale;

  final List<NavigatorObserver> navigatorObservers;
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        cryptoHistoryProvider.overrideWithProvider(fakeHistoryProvider),
      ],
      child: MaterialApp(
        locale: locale ?? const Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateRoute: GeneratedRoutes.generateRoute,
        navigatorObservers: navigatorObservers,
        home: Material(
          child: MediaQuery(
            data: const MediaQueryData(),
            child: child,
          ),
        ),
      ),
    );
  }
}

Future<void> loadPage(WidgetTester tester, Widget child) async {
  final widget = SetupWidgetTester(
    navigatorObservers: const [],
    child: child,
  );
  await tester.pumpWidget(widget);
  await tester.pumpAndSettle();
}

Future<void> loadPageObserver(
  WidgetTester tester,
  Widget child,
  List<NavigatorObserver> navigatorObservers,
) async {
  final widget = SetupWidgetTester(
    navigatorObservers: navigatorObservers,
    child: child,
  );
  await tester.pumpWidget(widget);
  await tester.pumpAndSettle();
}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route {}
