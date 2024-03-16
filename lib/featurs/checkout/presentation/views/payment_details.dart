import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:payment/featurs/checkout/presentation/views/success_view.dart';
import 'package:payment/featurs/checkout/presentation/views/widgets/app_bar.dart';
import 'package:payment/featurs/checkout/presentation/views/widgets/custom_button.dart';
import 'package:payment/featurs/checkout/presentation/views/widgets/custom_redit_card.dart';

import 'package:payment/featurs/checkout/presentation/views/widgets/payment_listview.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(title: 'Payment Details'),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: PaymentItemListView()),
          SliverToBoxAdapter(
              child: CustomCreditCard(
            autovalidateMode: autovalidateMode,
            formkey: formkey,
          )),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 16, right: 16),
                child: CustomButton(
                  title: 'Play',
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      log('payment');
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ThankYou(),
                      ));
                      autovalidateMode = AutovalidateMode.always;
                    }
                    setState(() {});
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
