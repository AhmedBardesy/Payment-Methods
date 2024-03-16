import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    super.key,
    this.active = false,
    required this.imge,
  });
  final bool active;
  final String imge;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 62,
      width: 103,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1.50,
                  color: active ? const Color(0xff34a853) : Colors.grey),
              borderRadius: BorderRadius.circular(15)),
          shadows: [
            BoxShadow(
                color: active ? const Color(0xff34a853) : Colors.white,
                blurRadius: 4,
                offset: const Offset(0, 0),
                spreadRadius: 0)
          ]),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Center(child: SvgPicture.asset(imge)),
      ),
    );
  }
}
