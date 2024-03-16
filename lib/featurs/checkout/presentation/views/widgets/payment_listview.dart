import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/featurs/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:payment/featurs/checkout/presentation/views/widgets/payment_item.dart';

class PaymentItemListView extends StatefulWidget {
  PaymentItemListView({super.key});

  @override
  State<PaymentItemListView> createState() => _PaymentItemListViewState();
}

class _PaymentItemListViewState extends State<PaymentItemListView> {
  final List<String> items = [
    'assets/images/card.svg',
    'assets/images/paypal.svg'
  ];
  // int? activeindex;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        int activeindex = BlocProvider.of<PaymentCubit>(context).activeindex;
        return SizedBox(
          height: 62,
          child: ListView.builder(
            itemCount: items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  BlocProvider.of<PaymentCubit>(context).activeindex = index;
                  print(BlocProvider.of<PaymentCubit>(context).activeindex);
                  setState(() {});
                },
                child: PaymentItem(
                  active: activeindex == index ? true : false,
                  imge: items[index],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
