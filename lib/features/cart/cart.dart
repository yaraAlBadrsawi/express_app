import 'package:express_app/core/resources/manager_assets.dart';
import 'package:express_app/core/resources/manager_color.dart';
import 'package:express_app/core/resources/manager_fonts.dart';
import 'package:express_app/core/resources/manager_sizes.dart';
import 'package:express_app/core/resources/manager_strings.dart';
import 'package:express_app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(ManagerStrings.myCart),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ManagerAssets.background),
            ),
          ),
          child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return CartItem(
                    ManagerStrings.apple, ManagerAssets.test, '500\$ /k');
              })),
    );
  }
}

class CartItem extends StatelessWidget {
  final String productName;
  final String image;
  final String price;

  const CartItem(this.productName, this.image, this.price, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ManagerWidth.w20),
      margin: EdgeInsets.symmetric(
          horizontal: ManagerWidth.w15, vertical: ManagerHeight.h8),
      decoration: BoxDecoration(
        color: ManagerColor.white,
        borderRadius: BorderRadius.all(
          Radius.circular(ManagerRadius.r20),
        ),
      ),
      child: Row(
        children: [
          Image.asset(image),
          SizedBox(
            width: ManagerWidth.w30,
          ),
          Column(
            children: [
              Text(
                productName,
                style: TextStyle(fontSize: ManagerFontSize.s18),
              ),
              SizedBox(
                height: ManagerHeight.h4,
              ),
              Text(
                price,
                style: TextStyle(
                    fontSize: ManagerFontSize.s18,
                    color: ManagerColor.oliveDrab),
              ),
            ],
          ),
          SizedBox(
            width: ManagerWidth.w70,
          ),
          Column(
            children: [
              Icon(Icons.cancel_outlined),
              SizedBox(
                height: ManagerHeight.h30,
              ),
              Row(
                children: [
                  Controller(FontAwesomeIcons.minus),
                  Text('5'),
                  Controller(Icons.add),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Controller extends StatelessWidget {
  final IconData icon;

  const Controller(this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(ManagerWidth.w5),
      decoration: BoxDecoration(
          color: ManagerColor.oliveDrab,
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(ManagerRadius.r12))),
      width: ManagerWidth.w20,
      height: ManagerHeight.h20,
      child: Icon(
        icon,
        size: ManagerIconSize.s18,
        color: ManagerColor.white,
      ),
    );
  }
}
