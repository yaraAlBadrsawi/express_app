import 'package:express_app/core/resources/manager_assets.dart';
import 'package:express_app/core/resources/manager_color.dart';
import 'package:express_app/core/resources/manager_fonts.dart';
import 'package:express_app/routes/routes.dart';
import 'package:flutter/material.dart';

import '../../core/resources/manager_sizes.dart';
import '../../core/resources/manager_strings.dart';
import '../../core/widget/custom_app_bar.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final List<String>? _tabs = [
    ManagerStrings.openOrder,
    ManagerStrings.completedOrder,
  ];

  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        ManagerStrings.myOrder,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(ManagerAssets.background))),
        width: double.infinity,
        margin: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Custom TabBar
            SizedBox(
              width: double.infinity,
              height: ManagerHeight.h60,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _tabs!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              current = index;
                            });
                          },
                          child: Center(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              padding: EdgeInsets.symmetric(
                                  vertical: ManagerWidth.w4,
                                  horizontal: ManagerWidth.w8),
                              margin: EdgeInsets.all(ManagerWidth.w2),
                              decoration: BoxDecoration(
                                  color: current == index
                                      ? ManagerColor.oliveDrab
                                      : Colors.white54,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Container(
                                width: ManagerWidth.w175,
                                padding: EdgeInsets.all(ManagerWidth.w10),
                                child: Text(_tabs![index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: ManagerFontSize.s16,
                                        fontWeight: FontWeight.bold,
                                        color: current == index
                                            ? Colors.white
                                            : ManagerColor.oliveDrab)),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                            visible: current == index,
                            child: Container(
                              width: ManagerWidth.w5,
                              height: ManagerHeight.h5,
                              decoration: const BoxDecoration(
                                  color: ManagerColor.oliveDrab,
                                  shape: BoxShape.circle),
                            ))
                      ],
                    );
                  }),
            ),

            // completed order
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      if (ManagerStrings.openOrder == _tabs![current]) {
                        return const orderItem('125896', '12/5/2019', '100\$',
                            Icons.directions_bus_outlined);
                      } else {
                        return Text(ManagerStrings.completedOrder);
                      }
                    }))
          ],
        ),
      ),
    );
  }
}

class orderItem extends StatelessWidget {
  final String orderId;
  final String date;
  final String total;
  final IconData icon;

  const orderItem(
    this.orderId,
    this.date,
    this.total,
    this.icon, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: ManagerColor.greyDark,
          padding: EdgeInsets.all(ManagerWidth.w0)),
      onPressed: () {
        Navigator.pushReplacementNamed(context, Routes.orderDetailsView);
      },
      child: Container(
        padding: EdgeInsets.all(ManagerWidth.w15),
        margin: EdgeInsets.all(ManagerWidth.w8),
        decoration: BoxDecoration(
          color: ManagerColor.white,
          borderRadius: BorderRadius.all(Radius.circular(ManagerRadius.r20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              color: ManagerColor.oliveDrab,
              size: ManagerFontSize.s50,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(ManagerStrings.orderId),
                    SizedBox(
                      width: ManagerWidth.w8,
                    ),
                    Text(orderId),
                  ],
                ),
                Row(
                  children: [
                    Text(date),
                    SizedBox(
                      width: ManagerWidth.w8,
                    ),
                    const Text(ManagerStrings.total),
                    Text(total),
                    SizedBox(
                      width: ManagerWidth.w30,
                    ),
                  ],
                ),
              ],
            ),
            const Row(
              children: [
                Text(
                  ManagerStrings.onDelivery,
                  style: TextStyle(color: ManagerColor.red),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: ManagerColor.grey,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
