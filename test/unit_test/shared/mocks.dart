import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route {}
