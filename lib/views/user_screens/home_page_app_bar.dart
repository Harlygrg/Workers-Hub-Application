import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/controllers/User%20controllers/workers_list_and_category_controller.dart';
import 'package:workers_hub/models/constants.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';

import 'end_drawer_home_page.dart';
import 'home_page_notification_bottom_sheet.dart';

ButtonRefact button = ButtonRefact();
WidgetRefact widget = WidgetRefact();

 appbarHomePage(context){
  return AppBar(
    title:
    //appbarTitle(),
    SizedBox(width: 60.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("WORKERS HUB",style: TextStyle(fontSize: 15.sp,
              color: white,fontWeight: FontWeight.w500),),
        ],
      ),
    ),
    actions: [
      Container(
        width: 10.w,
        margin: EdgeInsets.only(right: 15),
        height: 10.h,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            //---------------------------------------------------------------------
            Positioned(child:
            button.iconButton(
              onPressed: (){
                notification(context);
              }, icon:Icon(
              Icons.notifications,color: white,size: 25.sp,
            ), ),
            ),
            Positioned(
              top: 2.5.w,
              left: 6.w,
              child: Container(
                width: 5.w,
                height: 5.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(2.5.w),
                  border: Border.all(width: 1.5),
                ),
                child: Text("10",
                  style: TextStyle(fontSize: 7.sp,
                      color: black,
                      fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),
      button.iconButton(
        onPressed: ()=>workerCatCntlr.history(), icon: Icon(
        Icons.history_outlined,color:white,size: 25.sp,
      ),
      ),
    ],
    backgroundColor: primeColor,
  );
}