
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/utiles/styles.dart';
import 'package:payment/featurs/checkout/data/model/payment_intent_input_model.dart';
import 'package:payment/featurs/checkout/data/repos/checkout_repo_imple.dart';
import 'package:payment/featurs/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:payment/featurs/checkout/presentation/views/success_view.dart';
import 'package:payment/featurs/checkout/presentation/views/widgets/Paypal.dart';

import 'package:payment/featurs/checkout/presentation/views/widgets/app_bar.dart';
import 'package:payment/featurs/checkout/presentation/views/widgets/custom_button.dart';
import 'package:payment/featurs/checkout/presentation/views/widgets/payment_listview.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: buildAppbar(title: 'My Cart'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            Expanded(child: Image.asset('assets/images/basket_image.png')),
            const SizedBox(
              height: 25,
            ),
            const OrderInfoItem(data: 'Order Subtotal', data2: r'$42.97'),
            const SizedBox(
              height: 3,
            ),
            const OrderInfoItem(data: 'Discount', data2: r'$0'),
            const SizedBox(
              height: 3,
            ),
            const OrderInfoItem(data: 'Shipping', data2: r'$8'),
            const SizedBox(
              height: 6,
            ),
            const Divider(
              thickness: 2,
              color: Color(0xffC7C7C7),
            ),
            const SizedBox(
              height: 6,
            ),
            const Row(
              children: [
                Text(
                  'Totla',
                  style: Styles.style24,
                ),
                Expanded(child: SizedBox()),
                Text(
                  r'$50.97',
                  style: Styles.style24,
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
              title: 'Complete Payment',
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => PaymentCubit(CheckOutImpl()),
                      child: const CustomButtonSheet(),
                    );
                  },
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ));
  }
}

class CustomButtonSheet extends StatelessWidget {
  const CustomButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        PaymentItemListView(),
        const SizedBox(
          height: 35,
        ),
        BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {
            if (state is PaymentSuccess) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const ThankYou()));
            }

            if (state is PaymentFailer) {
              if (state.error.contains('FailureCode.Canceled')) {
                Navigator.of(context).pop();
                return;
              } else {
                print('${state.error}');
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red, content: Text(state.error)));
              }
            }
          },
          builder: (context, state) {
        
            return CustomButton(
              title: 'Continue',
              onPressed: () {
                if (BlocProvider.of<PaymentCubit>(context).activeindex == 0) {
                return  strip(context);
                } else {
                return  paypal(context);
                }
              },
              isLoading: state is PaymentLoading ? true : false,
            );
          },
        )
      ]),
    );
  }

  void strip(BuildContext context) {
    BlocProvider.of<PaymentCubit>(context).makePayment(
      paymentIntentInputModel: paymentIntentInputModel(
        amount: '5000',
        currency: 'USD',
        customer: 'cus_PkBkP0WKirESC6',
      ),
    );
  }
}
