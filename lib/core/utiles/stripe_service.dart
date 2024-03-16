import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/utiles/api_keys.dart';
import 'package:payment/core/utiles/api_service.dart';
import 'package:payment/featurs/checkout/data/model/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payment/featurs/checkout/data/model/payment_intent/payment_intent.dart';

import '../../featurs/checkout/data/model/payment_intent_input_model.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentintent(
      paymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
        body: paymentIntentInputModel.toJson(),
        url: 'https://api.stripe.com/v1/payment_intents',
        token: ApiKeys.secretKey);
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required String paymentIntentClientSecret,
      required String customerId,
      required String ephemeralKey}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentIntentClientSecret,
      merchantDisplayName: 'Ahmed Khaled',
      customerEphemeralKeySecret: ephemeralKey,
      customerId: customerId,
    ));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
      body: {'customer': customerId},
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKey}',
        'Stripe-Version': '2023-10-16'
      },
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ApiKeys.secretKey,
    );
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }

  Future makePayment(
      {required paymentIntentInputModel paymentIntentInputModel}) async {
    var EphemeralKey =
        await createEphemeralKey(customerId: paymentIntentInputModel.customer!);
    var paymentIntentModel = await createPaymentintent(paymentIntentInputModel);
    await initPaymentSheet(
        customerId: paymentIntentInputModel.customer!,
        ephemeralKey: EphemeralKey.secret!,
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();
  }
}

//Steps for payment Stripe
//1. create payment intent
//2. create payment sheet
//3. init payment sheet
//4. present payment sheet

//Steps for payment Stripe
//paymentIntentObject create Paymentintent(amount, currency)
//init payment Sheet (paymnentIntentClientSecret)
//present paymentSheet
