import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/controllers/User%20controllers/workers_list_and_category_controller.dart';
import 'package:workers_hub/constants.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';

import 'end_drawer_home_page.dart';
FormFieldRefact formFieldRefact =FormFieldRefact();
WidgetRefact widget = WidgetRefact();



 notification(context){
    showModalBottomSheet(context: context,
        isScrollControlled: true,
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(35),
              topLeft: Radius.circular(35)),
        ),
        backgroundColor: primeColor,
        builder: (context){
          return Container(
            // color: Colors.red,
            constraints: BoxConstraints(maxHeight: 50.h,minHeight: 18.h),
            child: Padding(
              padding: const EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 15),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Colors.grey,
                    child: SizedBox(
                      width: 150.w,
                      height: 18.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 40.w,
                                height: 8.h,
                                child:  refactText(text:"Need Plumber will Expire in 2 days",fontSize: 12.sp,fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: 37.w,
                              height: 6.h,
                              child: button.elevatedButton(text: "Reschedule", onPressed: (){}),
                            )

                          ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(padding:EdgeInsets.only(right: 10,top: 10),
                                child: refactText(text: "time",fontSize: 12.sp,fontWeight: FontWeight.w400,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15,right: 15),
                                child: SizedBox(
                                  width: 37.w,
                                  height: 6.h,
                                  child: button.elevatedButton(text: "Delete Post", onPressed: (){}),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Colors.grey,
                    child:  SizedBox(
                      width: 150.w,
                      height: 18.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 150.w,
                            height: 4.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: refactText(text:"Give rating to Raju",fontSize: 12.sp,fontWeight: FontWeight.w500),
                                ),
                                Padding(padding:EdgeInsets.only(right: 8,top: 8),
                                  child: refactText(text: "time",fontSize: 12.sp,fontWeight: FontWeight.w400,),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(width: 40.w,
                              height: 3.h,
                              child: ListView.builder(
                                  itemCount: 5,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, int index){
                                    return GestureDetector(
                                      onTap: (){
                                        if( starColorGolden=false){
                                          starColorGolden=true;
                                        }else{
                                          starColorGolden=false;
                                        }
                                      },
                                      child: Icon(
                                        Icons.star_rate_rounded,color:!starColorGolden ? white:const Color(0xffFFD700),
                                      ),
                                    );
                                  }
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 40.w,
                                  height: 8.h,
                                  child: Form(
                                      child: formFieldRefact.textFormField(
                                        hintText: "Leave comments", icon: Icon(
                                        Icons.rate_review_outlined,
                                      ),)),
                                ),
                                widget.divider(width: 10),
                                SizedBox(
                                  width: 10.w,
                                  height: 8.h,
                                  child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: button.iconButton(
                                        onPressed: (){},
                                        icon:FaIcon(FontAwesomeIcons.solidPaperPlane),)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    //------------------------------------------------------------------------------------------------------------------
                  ),
                ],
              ),
            ),
          );
        });
  }
