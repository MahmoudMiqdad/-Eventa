class hall {
  final int ?status;
  final String message;

  hall({required this.status, required this.message});

 
  factory hall.fromJson(Map<String, dynamic> json) {
    return hall(
      status: json['Status'],
      message: json['Message'],
    );
  }}