import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/controllers/User%20controllers/workers_list_and_category_controller.dart';
import 'package:workers_hub/constants.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';

ButtonRefact button = ButtonRefact();
WidgetRefact widget = WidgetRefact();
final WorkerCategoryController workerCatCntlr = Get.find();
bool starColorGolden=false;
Widget homeDrawer(context){
  return Drawer(

    child: Container(
      height: rHeight(context),width: 70.w,
      color: primeColor,
      child: Column(
        children: [
          widget.divider(height: 20.w),
          Row(
            children: [ widget.divider(width: 2.w),
              SizedBox(
                width: 34.w,
                child:refactText(text: "Select State",
                    fontSize: 12.sp,color: black,fontWeight: FontWeight.w500),
              ),

              SizedBox(
                child: DropdownButton(
                  underline: Text(""),
                  style: TextStyle(color: black),
                  value: workerCatCntlr.selectedStateName,
                  items: workerCatCntlr.state.map((itemNames){
                    return DropdownMenuItem(value:itemNames,
                        child: Text(itemNames,style: TextStyle(fontSize: 12.sp,color: black),)
                    );
                  }).toList(),
                  onChanged: workerCatCntlr.newVal,
                ),
              ),
            ],
          ),
          //widget.divider(height: ..h),
          Row(
            children: [ widget.divider(width: 2.w),
              SizedBox(
                width: 34.w,
                child:refactText(text: "Select District",
                    fontSize: 12.sp,color: black,fontWeight: FontWeight.w500),
              ),

              SizedBox(
                child: DropdownButton(
                  underline: Text(""),
                  style: TextStyle(color: black),
                  value: workerCatCntlr.selectedDistName,
                  items: workerCatCntlr.district.map((itemNames){
                    return DropdownMenuItem(value:itemNames,
                        child: Text(itemNames,style: TextStyle(fontSize: 12.sp,color: black),)
                    );
                  }).toList(),
                  onChanged: workerCatCntlr.newDist,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}