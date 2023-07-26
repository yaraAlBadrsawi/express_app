import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/resources/manager_color.dart';
import '../../../core/resources/manager_fonts.dart';
import '../../../core/resources/manager_sizes.dart';
import '../../../core/resources/manager_strings.dart';
import '../../../core/widget/controller.dart';
import '../../../core/widget/main_button.dart';

class ProductItem extends StatefulWidget {
  final String productName;
  final String productImage;
  final num productPrice;
  final Function() onPressed;
  int amount = 1;

  ProductItem(this.productName, this.productImage, this.productPrice,
      this.onPressed, this.amount,
      {Key? key})
      : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  String addToCart = ManagerStrings.addToCart;
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(
          vertical: ManagerHeight.h4, horizontal: ManagerWidth.w8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(ManagerRadius.r15),
          bottomLeft: Radius.circular(ManagerRadius.r15),
          bottomRight: Radius.circular(ManagerRadius.r15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: ManagerHeight.h20,
                left: ManagerWidth.w20,
                right: ManagerWidth.w20),
            child: Image.network(widget.productImage,
                height: ManagerHeight.h60,
                width: ManagerWidth.w70, loadingBuilder: (BuildContext context,
                    Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: ManagerColor.oliveDrab,
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              }
            }),
          ),
          SizedBox(
            height: ManagerHeight.h16,
          ),
          Text(
            widget.productName,
            style: TextStyle(
              fontSize: ManagerFontSize.s14,
              color: ManagerColor.grey,
            ),
          ),
          Text("${widget.productPrice}\$ /k ",
              style: TextStyle(
                  fontSize: ManagerFontSize.s18,
                  color: ManagerColor.oliveDrab,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: ManagerHeight.h20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              visible
                  ? Controller(
                      FontAwesomeIcons.minus,
                      () {
                        setState(() {
                          if (widget.amount > 1) {
                            widget.amount--;
                          }
                        });
                      },
                      ManagerWidth.w0,
                      width: ManagerWidth.w25,
                      height: ManagerHeight.h25,
                    )
                  : const Text(''),
              SizedBox(
                width: visible ? ManagerWidth.w4 : ManagerWidth.w0,
              ),
              MainButton(
                addToCart,
                ManagerWidth.w100,
                () {
                  setState(() {
                    visible = true;
                    print('amount ${widget.amount}');
                    addToCart =
                        ManagerStrings.countInCart + "(${widget.amount})";
                  });
                },
                fontSize: ManagerFontSize.s8,
              ),
              SizedBox(
                width: visible ? ManagerWidth.w4 : ManagerWidth.w0,
              ),
              visible
                  ? Controller(
                      Icons.add,
                      () {
                        setState(() {
                          if (widget.amount > 1) {
                            widget.amount++;
                          }
                        });
                      },
                      ManagerWidth.w0,
                      width: ManagerWidth.w25,
                      height: ManagerHeight.h25,
                    )
                  : Text(''),
            ],
          ),
          SizedBox(
            height: ManagerHeight.h13,
          )
        ],
      ),
    );
  }
}
