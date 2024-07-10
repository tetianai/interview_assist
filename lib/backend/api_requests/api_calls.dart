import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Flowise Group Code

class FlowiseGroup {
  static String getBaseUrl() =>
      'https://flowiseai-railway-production-dc24f.up.railway.app/api/v1/';
  static Map<String, String> headers = {};
  static UniversalQueryCall universalQueryCall = UniversalQueryCall();
  static PdfUpsertCall pdfUpsertCall = PdfUpsertCall();
  static WebUpsertCall webUpsertCall = WebUpsertCall();
}

class UniversalQueryCall {
  Future<ApiCallResponse> call({
    String? question = '',
    String? namespace = '',
  }) async {
    final baseUrl = FlowiseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "overrideConfig": {
    "supabaseMetadataFilter": {
      "namespace": "${namespace}"
    }
  },
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'universalQuery',
      apiUrl: '${baseUrl}prediction/9af32815-745a-4758-b2be-eb93e1223d98',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.text''',
      ));
}

class PdfUpsertCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? files,
    String? question = 'What is this document about?',
    String? metadata = '',
  }) async {
    final baseUrl = FlowiseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'pdfUpsert',
      apiUrl: '${baseUrl}vector/upsert/74922331-42e0-4d71-a759-17d37985c907',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'multipart/form-data',
      },
      params: {
        'files': files,
        'question': question,
        'metadata': metadata,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class WebUpsertCall {
  Future<ApiCallResponse> call({
    String? question = 'What is this website about?',
    String? url = '',
    String? namespace = '',
  }) async {
    final baseUrl = FlowiseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "overrideConfig": {
    "url": "${url}",
    "metadata": {
      "namespace": "${namespace}"
    }
  },
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'webUpsert',
      apiUrl: '${baseUrl}vector/upsert/74922331-42e0-4d71-a759-17d37985c907',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Flowise Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
