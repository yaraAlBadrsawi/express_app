import 'package:express_app/core/resources/manager_color.dart';
import 'package:express_app/core/resources/manager_fonts.dart';
import 'package:express_app/core/resources/manager_strings.dart';
import 'package:express_app/core/widget/main_button.dart';
import 'package:express_app/core/widget/text_field.dart';
import 'package:express_app/routes/routes.dart';
import 'package:flutter/material.dart';

import '../../core/resources/manager_assets.dart';
import '../../core/resources/manager_sizes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                ManagerAssets.background,
              ),
              fit: BoxFit.fill)),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: ManagerHeight.h244,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          ManagerAssets.path_20529,
                        ),
                        fit: BoxFit.fill)),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: ManagerHeight.h45,
                  ),
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: ManagerColor.grey.withOpacity(0.5),
                    child: CircleAvatar(
                      radius: 75,
                      backgroundColor: ManagerColor.grey.withOpacity(0.8),
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: ManagerColor.transparent,
                        child: Image.asset(
                          ManagerAssets.profileTest,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: ManagerHeight.h25),
            child: Text(
              'yara sameer',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ManagerColor.oliveDrab,
                  fontSize: ManagerIconSize.s24),
            ),
          ),
          const PersonalInformation(ManagerStrings.email, 'test@mail.com'),
          const PersonalInformation(ManagerStrings.phone, '121111111'),
          SizedBox(
            height: ManagerHeight.h80,
          ),
          MainButton(
            ManagerStrings.editProfile,
            ManagerWidth.w150,
            height: ManagerHeight.h40,
            fontSize: ManagerFontSize.s16,
            () {
              Navigator.pushReplacementNamed(context, Routes.editProfileView);
            },
          )
        ],
      ),
    ));
  }
}

class PersonalInformation extends StatelessWidget {
  final String title;
  final String data;

  const PersonalInformation(this.title, this.data, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ManagerWidth.w16),
      margin: EdgeInsets.all(ManagerWidth.w8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(ManagerRadius.r20),
              bottomLeft: Radius.circular(ManagerRadius.r20)),
          color: ManagerColor.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.email,
                color: ManagerColor.oliveDrab,
              ),
              SizedBox(
                width: ManagerWidth.w20,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: ManagerFontSize.s14,
                    fontWeight: FontWeight.bold,
                    color: ManagerColor.oliveDrab),
              ),
            ],
          ),
          Text(
            data,
            style: TextStyle(
                fontSize: ManagerFontSize.s16, color: ManagerColor.grey),
          ),
        ],
      ),
    );
  }
}
