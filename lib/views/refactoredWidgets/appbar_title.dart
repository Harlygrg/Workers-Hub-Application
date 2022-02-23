import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/constants/constants.dart';

appbarTitle(){
  return  SizedBox(width: 60.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [SizedBox(width: 9.w,height: 9.h,
          child: Image.asset(logo)),
        Text("WORKERS HUB",style: TextStyle(fontSize: 15.sp,
            color: primeColor,fontWeight: FontWeight.bold),),
      ],
    ),
  );
}