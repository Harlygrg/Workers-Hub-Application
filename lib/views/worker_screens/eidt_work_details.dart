import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/controllers/worker%20Conrollers/dashboard_controller.dart';
import 'package:workers_hub/constants.dart';
import 'package:workers_hub/views/refactoredWidgets/appbar_title.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
import '../../multi_select_dropdown.dart';

class EditWorkDetails extends StatelessWidget {
   EditWorkDetails({Key? key}) : super(key: key);
  WidgetRefact widget =WidgetRefact();
  ButtonRefact button = ButtonRefact();
  FormFieldRefact formField = FormFieldRefact();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      init: DashBoardController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: appbarTitle(),
            backgroundColor: white,
          ),
          body: Column(
            children: [
              divider1,
              Row(
                children: [
                  widget.divider(width: 2.w),
                  refactText(
                      text:"Work Type",
                      fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                  ),
                  widget.divider(width: 20.w),
                  refactText(
                    text:"Rate",
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                  ),
                  widget.divider(width: 20.w),
                  refactText(
                    text:"Netotiable",
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                  ),
                ],
              ),
              divider1,
              Row(
                children: [
                  widget.divider(width: 2.w),
                  button.elevatedButton(text: "Select Job Type", onPressed:  ()=>showMultiSelect(context))

                ],
              ),
              Row(
               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.divider(width: 2.w),
                  Container(
                    width: 20.w,
                    height: 4.5.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2,color: primeColor),
                    ),
                    alignment: Alignment.center,
                    child:
                        refactText(text: "Carpenter"),
                  ),
                  widget.divider(width: 22.w),
                  SizedBox(width: 20.w,height: 4.5.h,
                  child: formField.textFormField(hintText: "Amount",),
                    ),
                  widget.divider(width: 10.w),
                  Checkbox(
                      value:controller.isNegotiable ,
                      onChanged: controller.chekNegotiable,
                  ),
                  widget.divider(width: 2.w),
                  button.iconButton(onPressed: (){}, icon: Icon(
                    Icons.cancel_outlined,
                  ),)
                ],
              ),
              divider1,
              button.elevatedButton(text: "Save Changes", onPressed: (){})
            ],
          ),
        );
      }
    );
  }
}
