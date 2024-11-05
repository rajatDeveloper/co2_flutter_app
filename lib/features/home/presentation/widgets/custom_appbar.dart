import 'package:co2_flutter_app/core/const/colors.dart';
import 'package:co2_flutter_app/core/utils/use_full_functions.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getDeviceHeight(context) * 0.075,
      padding: const EdgeInsets.all(9),
      alignment: Alignment.center,
      width: getDeviceWidth(context),
      decoration: BoxDecoration(
          color: AppColors.blackColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor1.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 6), // changes position of shadow
            ),
          ],
          //bottom right and left radiis
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: getDeviceWidth(context) * 0.1,
          ),
          Container(
            alignment: Alignment.center,
            width: getDeviceWidth(context) * 0.5,
            child: Text(
              widget.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.primaryColor1,
                fontSize: getFontSize(20, getDeviceWidth(context)),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: getDeviceWidth(context) * 0.1,
          )
        ],
      ),
    );
  }
}
