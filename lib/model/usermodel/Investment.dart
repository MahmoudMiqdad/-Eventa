class InvestmentEventmodel {
  final int id;
  final String description;
  final String address;
  final String startDate;
  final String endDate;
  final int shopsNumber;
  final String reservePrice;
  final String createdAt;
  final String updatedAt;

  InvestmentEventmodel({
    required this.id,
    required this.description,
    required this.address,
    required this.startDate,
    required this.endDate,
    required this.shopsNumber,
    required this.reservePrice,
    required this.createdAt,
    required this.updatedAt,
  });


  factory InvestmentEventmodel.fromJson(Map<String, dynamic> json) {
    return InvestmentEventmodel(
      id: json['id'],
      description: json['description'],
      address: json['address'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      shopsNumber: json['shops_number'],
      reservePrice: json['reserve_price'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

}
