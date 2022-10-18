import 'package:crypto_app/data/enpoint/endpoints/get_all_cryptos_remote_endpoint_imp.dart';
import 'package:crypto_app/data/enpoint/get_all_cryptos_enpoint.dart';
import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../shared/api_factory.dart';
import '../shared/mocks.dart';

void main() {
  late Response<Map<String, dynamic>> sucess;
  late DioMock dioMock;
  late GetAllCryptosEnpoint getAllCryptosEnpoint;

  When mockGetResponse() => when(
        () => dioMock.get(
          any(),
          queryParameters: any(named: 'queryParameters'),
        ),
      );

  mockResponse(Map<String, dynamic> factory, int statusCode) => Response(
        data: factory,
        statusCode: statusCode,
        requestOptions: RequestOptions(path: faker.internet.httpUrl()),
      );

  setUp(() {
    dioMock = DioMock();
    getAllCryptosEnpoint = GetAllCryptosRemoteEndpointImp(
      dioMock,
      faker.internet.httpUrl(),
    );
  });

  setUp(() {
    sucess = mockResponse(ApiFactory.getCryptoHistory(), 200);
  });

  test(
    'WHEN getCryptoHistory is requested THEN returns 200',
    (() async {
      mockGetResponse().thenAnswer((_) async => sucess);
      final result = await getAllCryptosEnpoint.getAllCryptos(
        faker.lorem.random.string(15),
      );
      expect(result.statusCode, equals(200));
      expect(result, sucess);
    }),
  );
}
