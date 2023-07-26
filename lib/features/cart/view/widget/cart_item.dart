import 'package:express_app/core/resources/manager_fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/resources/manager_color.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/widget/controller.dart';

class CartItem extends StatefulWidget {
  final String productName;
  final String image;
  final String price;
  int amount;

  CartItem(this.productName, this.image, this.price, this.amount, {Key? key})
      : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w10, vertical: ManagerHeight.h8),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 1, // Spread radius
              blurRadius: 4, // Blur radius
              offset: Offset(0, 3), // Offset in the X, Y direction
            ),
          ],
          color: ManagerColor.white,
          borderRadius: BorderRadius.all(
            Radius.circular(ManagerRadius.r20),
          ),
        ),
        child: Row(
          children: [
            Image.asset(widget.image),
            SizedBox(
              width: ManagerWidth.w20,
            ),
            Column(
              children: [
                Text(
                  widget.productName,
                  style: TextStyle(fontSize: ManagerFontSize.s18),
                ),
                SizedBox(
                  height: ManagerHeight.h4,
                ),
                Text(
                  widget.price,
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: ManagerHeight.h12, right: ManagerWidth.w15),
                  child: Icon(
                    FontAwesomeIcons.remove,
                    color: ManagerColor.red,
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h30,
                ),
                Row(
                  children: [
                    Controller(
                      FontAwesomeIcons.minus,
                      () {
                        setState(() {
                          if (widget.amount > 1) {
                            widget.amount--;
                          }
                        });
                      },
                      ManagerWidth.w12,
                    ),
                    Text(
                      '${widget.amount}',
                      style: TextStyle(fontSize: ManagerFontSize.s18),
                    ),
                    Controller(Icons.add, () {
                      setState(() {
                        widget.amount++;
                      });
                    }, ManagerWidth.w12),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
