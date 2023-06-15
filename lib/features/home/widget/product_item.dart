import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/manager_color.dart';
import '../../../core/resources/manager_fonts.dart';
import '../../../core/resources/manager_sizes.dart';
import '../../../core/resources/manager_strings.dart';
import '../../../core/widget/main_button.dart';

class ProductItem extends StatelessWidget {
  final String productName;
  final String productImage;
  final String productPrice;
  final Function() onPressed;

  const ProductItem(
      this.productName, this.productImage, this.productPrice, this.onPressed,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w10),
      child: Card(
        elevation: 3,
        margin: EdgeInsets.symmetric(
            vertical: ManagerHeight.h4, horizontal: ManagerWidth.w8),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(ManagerRadius.r15),
              bottomLeft: Radius.circular(ManagerRadius.r15),
              bottomRight: Radius.circular(ManagerRadius.r15),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: ManagerHeight.h20,
                  left: ManagerWidth.w20,
                  right: ManagerWidth.w20),
              child: Image.asset(
                productImage,
              ),
            ),
            Text(
              productName,
              style: TextStyle(
                fontSize: ManagerFontSize.s14,
                color: ManagerColor.grey,
              ),
            ),
            Text(productPrice,
                style: TextStyle(
                    fontSize: ManagerFontSize.s18,
                    color: ManagerColor.oliveDrab,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: ManagerHeight.h13,
            ),
            MainButton(
              ManagerStrings.addToCart,
              ManagerWidth.w89,
                  () {},
              fontSize: ManagerFontSize.s10,
            ),
            // SizedBox(
            //   height: ManagerHeight.h13,
            // )
          ],
        ),
      ),
    );
  }
}