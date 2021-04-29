import 'api_manager.dart';

Future<dynamic> unsplashCall({
  String clientId = 'Hjnt9zghNu9pf7RpIFuECRuDxX5WM03GiEV4HpAR6DI',
  String query = '',
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'Unsplash',
      apiDomain: 'api.unsplash.com',
      apiEndpoint: 'search/photos/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'client_id': clientId,
        'query': query,
      },
      returnResponse: true,
    );
