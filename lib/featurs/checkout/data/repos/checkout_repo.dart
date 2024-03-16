import 'package:dartz/dartz.dart';
import 'package:payment/featurs/checkout/data/model/payment_intent_input_model.dart';

abstract class CheckOutRepo {
  Future<Either<Failer, void>> makePayment(
      {required paymentIntentInputModel paymentIntentInputModel});
}

abstract class Failer {
  final String errorMesagr;

  Failer({required this.errorMesagr});
}

class ServerFailer extends Failer {
  ServerFailer({required super.errorMesagr});
}
