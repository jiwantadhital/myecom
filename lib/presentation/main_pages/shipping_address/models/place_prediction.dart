import 'dart:convert';

import 'package:ecommerce/presentation/main_pages/shipping_address/models/auto_complete_predication.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class PlaceAutocompleteResponse {
final String? status;
final List<AutocompletePrediction>? predictions;
PlaceAutocompleteResponse({this.status, this.predictions});
factory PlaceAutocompleteResponse. fromJson (Map<String, dynamic> json) {
return PlaceAutocompleteResponse (
status: json ['status'] as String?,
predictions: json ['predictions'] != null
? json ['predictions']
.map<AutocompletePrediction>(
(json) => AutocompletePrediction.fromJson (json))
.toList()
: null,
); // PlaceAutocompleteResponse
}

static PlaceAutocompleteResponse parseAutocompleteResult(
String responseBody) {
final parsed = json.decode(responseBody). cast<String, dynamic>();
return PlaceAutocompleteResponse. fromJson (parsed);
}
}