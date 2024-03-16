import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/utiles/styles.dart';

AppBar buildAppbar({required String title}) {
  return AppBar(
    leading: Center(child: SvgPicture.asset('assets/images/arrow.svg')),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      title,
      style: Styles.style25,
    ),
  );
}

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({super.key, required this.data, required this.data2});
  final String data;
  final String data2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          data,
          style: Styles.style18,
          textAlign: TextAlign.center,
        ),
        const Expanded(child: SizedBox()),
        // const Spacer(),
        Text(
          data2,
          style: Styles.style18,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
