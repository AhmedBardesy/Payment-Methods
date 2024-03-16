import 'package:flutter/material.dart';
import 'package:payment/featurs/checkout/presentation/views/widgets/app_bar.dart';
import 'package:payment/featurs/checkout/presentation/views/widgets/thank_you_container.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppbar(title: ''),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
          child: Stack(clipBehavior: Clip.none, children: [
            const ThankYouCard(),
            Positioned(
              left: 0,
              right: 0,
              bottom: MediaQuery.sizeOf(context).height * .2 + 20,
              child: Row(
                children: List.generate(
                    20,
                    (index) => Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Container(
                            color: Color(0xffb8b8b8),
                            height: 2,
                          ),
                        ))),
              ),
            ),
            Positioned(
                left: -20,
                bottom: MediaQuery.sizeOf(context).height * .2,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                )),
            Positioned(
                right: -20,
                bottom: MediaQuery.sizeOf(context).height * .2,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                )),
            const Positioned(
                left: 0,
                right: 0,
                top: -50,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xffd9d9d9),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xff34a853),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}
