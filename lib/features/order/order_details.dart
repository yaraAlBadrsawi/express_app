import 'package:express_app/core/resources/manager_assets.dart';
import 'package:express_app/core/resources/manager_fonts.dart';
import 'package:express_app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../core/resources/manager_color.dart';
import '../../core/resources/manager_sizes.dart';
import '../../core/resources/manager_strings.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(ManagerStrings.orderDetails, Icons.arrow_back_ios, () {
        Navigator.pop(context);
      }),
      body: Container(
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(ManagerAssets.background))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(ManagerWidth.w32),
                margin: EdgeInsets.all(ManagerWidth.w8),
                decoration: BoxDecoration(
                  color: ManagerColor.brown,
                  borderRadius:
                      BorderRadius.all(Radius.circular(ManagerRadius.r20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              ManagerStrings.orderId,
                              style: TextStyle(
                                  color: ManagerColor.oliveDrab,
                                  fontSize: ManagerFontSize.s18,
                                  fontWeight: ManagerFontWeight.bold),
                            ),
                            SizedBox(
                              width: ManagerWidth.w8,
                            ),
                            Text(
                              '1256666',
                              style: TextStyle(
                                  color: ManagerColor.oliveDrab,
                                  fontSize: ManagerFontSize.s18,
                                  fontWeight: ManagerFontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ManagerHeight.h12,
                        ),
                        Row(
                          children: [
                            Text('12/2/2019'),
                            SizedBox(
                              width: ManagerWidth.w8,
                            ),
                            const Text(ManagerStrings.total),
                            Text('100\$'),
                            SizedBox(
                              width: ManagerWidth.w30,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Text(
                      ManagerStrings.onDelivery,
                      style: TextStyle(color: ManagerColor.red),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ManagerHeight.h28,
              ),
              Padding(
                padding: EdgeInsets.all(ManagerWidth.w8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserDetails(ManagerStrings.phoneDot, '+972 568923140'),
                    UserDetails(ManagerStrings.cityDot, 'Gaza'),
                    UserDetails(ManagerStrings.address, ''),
                    Text('Al Thalathini Street - Al Noor Building - 2nd Floor')
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ManagerWidth.w20),
                child: Text(
                  ManagerStrings.product,
                  style: TextStyle(
                      fontSize: ManagerFontSize.s18,
                      fontWeight: ManagerFontWeight.bold),
                ),
              ),
              ProductOrder(ManagerStrings.apple, '500', ManagerAssets.test, 50),
              ProductOrder(ManagerStrings.apple, '500', ManagerAssets.test, 50),
              ProductOrder(ManagerStrings.apple, '500', ManagerAssets.test, 50),
            ],
          )),
    );
  }
}

class ProductOrder extends StatelessWidget {
  final String productName;
  final String price;
  final String image;
  final int quantity;

  const ProductOrder(this.productName, this.price, this.image, this.quantity,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: ManagerHeight.h10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: ManagerWidth.w90,
                height: ManagerHeight.h70,
                color: ManagerColor.oliveDrab,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ManagerStrings.quantity,
                      style: TextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColor.white),
                    ),
                    Text(
                      '$quantity',
                      style: TextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColor.white),
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(-10, 0),
                child: Container(
                  decoration: BoxDecoration(
                      color: ManagerColor.white,
                      borderRadius:
                          BorderRadius.all(Radius.circular(ManagerRadius.r15))),
                  width: ManagerWidth.w100,
                  height: ManagerHeight.h70,
                  child: Image.asset(ManagerAssets.test),
                ),
              ),
            ],
          ),
          Text(
            productName,
            style: TextStyle(fontSize: ManagerIconSize.s22),
          ),
          Text(
            '$price\$ /k',
            style: TextStyle(color: ManagerColor.grey),
          ),
          SizedBox(
            width: ManagerWidth.w8,
          ),
        ],
      ),
    );
  }
}

class UserDetails extends StatelessWidget {
  final String title;
  final String data;

  const UserDetails(
    this.title,
    this.data, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        title,
        style: TextStyle(
            fontWeight: ManagerFontWeight.bold, fontSize: ManagerFontSize.s18),
      ),
      Text(data, style: TextStyle(fontSize: ManagerFontSize.s14)),
    ]);
  }
}
