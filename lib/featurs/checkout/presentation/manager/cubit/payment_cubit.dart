import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment/featurs/checkout/data/model/payment_intent_input_model.dart';
import 'package:payment/featurs/checkout/data/repos/checkout_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
   int activeindex = 0;
  PaymentCubit(this.checkOutRepo) : super(PaymentInitial());
  final CheckOutRepo checkOutRepo;
  Future makePayment(
      {required paymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    var result = await checkOutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    result.fold((l) => emit(PaymentFailer(error: l.errorMesagr)),
        (r) => emit(PaymentSuccess()));
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
