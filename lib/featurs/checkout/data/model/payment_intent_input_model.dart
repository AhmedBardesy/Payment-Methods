class paymentIntentInputModel {
  final String? amount;
  final String? currency;
  final String? customer;

  paymentIntentInputModel({
    required this.amount,
    required this.currency,
    required this.customer,
  });

  Map<String, dynamic> toJson() => {
        'amount': '${amount}00',
        'currency': currency,
        'customer': customer,
      };
}
