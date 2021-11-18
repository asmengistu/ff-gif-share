import 'api_manager.dart';

Future<dynamic> unsplashCall({
  String clientId = 'Hjnt9zghNu9pf7RpIFuECRuDxX5WM03GiEV4HpAR6DI',
  String query = '',
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'Unsplash',
    apiUrl: 'https://api.unsplash.com/search/photos/',
    callType: ApiCallType.GET,
    headers: {},
    params: {
      'client_id': clientId,
      'query': query,
    },
    returnResponse: true,
  );
}
