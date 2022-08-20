import 'package:bootickets/utils/app_layout.dart';
import 'package:bootickets/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HotelScreen extends StatelessWidget {
  final Map<String, dynamic> hotel;
  const HotelScreen({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size =  AppLayout.getSize(context);
    return Container(
      width: size.width*0.4,
      height: AppLayout.getHeight(230),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      margin: const EdgeInsets.only(right: 17, top: 5),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius:  BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 20,
              spreadRadius: 5,
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: AppLayout.getHeight(100),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Styles.primaryColor,
                image:  DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/images/${hotel['image']}"
                    )
                )

            ),
          ),
          const Gap(10),
          Text( hotel['place'],
            style: Styles.headlineStyle3.copyWith(color: Styles.kakiColor),),
          const Gap(10),
          Text(hotel['destination'],
            style: Styles.headlineStyle4.copyWith(color: Styles.kakiColor),),
          const Gap(10),
          Text('\$${hotel['price']}',
            style: Styles.headlineStyle2.copyWith(color: Styles.kakiColor),),
        ],
      ),
    );
  }
}
