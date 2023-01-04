import 'package:google_maps_webservice/places.dart';

class AutocompletePrediction {
/// [description] contains the human-readable name for the returned result.
/// the business name.
final String? description;
/// [structured Formatting] provides pre-formatted text that can be shown in
final StructuredFormatting? structuredFormatting;
/// [placeId] is a textual identifier that uniquely identifies a place. To
/// pass this identifier in the placeId field of a Places API request. For
final String? placeId; 
/// [reference] contains reference.
final String? reference;
AutocompletePrediction({
this.description,
this.structuredFormatting,
this.placeId,
this.reference,
});
factory AutocompletePrediction.fromJson (Map<String, dynamic> json) {
return AutocompletePrediction(
description: json ['description'] as String?,
placeId: json['place_id'] as String?,
reference: json ['reference'] as String?,
structuredFormatting: json ['structured_formatting'] != null
? StructuredFormatting.fromJson (json ['structured_formatting'])
: null,
); // AutocompletePrediction
}
}
class StructuredFormatting {
/// [mainText] contains the main text of a prediction, usually the name of
final String? mainText;
/// [secondaryText] contains the secondary text of a prediction, usually th
final String? secondaryText;
StructuredFormatting({this.mainText, this.secondaryText});
factory StructuredFormatting. fromJson (Map<String, dynamic> json) {
return StructuredFormatting (
mainText: json ['main_text'] as String?,
secondaryText: json ['secondary_text'] as String?,
);
}
}

