import 'package:dartz/dartz.dart';
import 'package:payment/core/utiles/stripe_service.dart';
import 'package:payment/featurs/checkout/data/model/payment_intent_input_model.dart';
import 'package:payment/featurs/checkout/data/repos/checkout_repo.dart';

class CheckOutImpl extends CheckOutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failer, void>> makePayment(
      {required paymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailer(errorMesagr: e.toString()));
    }
  }
}
