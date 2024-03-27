class GRNListDetails {
  final String propertyName;
  final String propertyValue;

  GRNListDetails({required this.propertyName, required this.propertyValue});

  factory GRNListDetails.fromJson(Map<String, dynamic> json) {
    return GRNListDetails(
      propertyName: json['ordernumber'],
      propertyValue: json['Object'],
    );
  }
}
