class Pdf {
  final bool? isAvailable;

  const Pdf({this.isAvailable});

  factory Pdf.fromJson(Map<String, dynamic> json) =>
      Pdf(isAvailable: json['isAvailable'] as bool?);
}
