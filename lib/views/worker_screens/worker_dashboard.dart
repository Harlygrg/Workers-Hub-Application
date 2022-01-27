import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/controllers/worker%20Conrollers/dashboard_controller.dart';
import 'package:workers_hub/constants.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
import 'package:workers_hub/views/user_screens/home_page_notification_bottom_sheet.dart';
import 'package:workers_hub/views/worker_screens/eidt_work_details.dart';
import 'package:workers_hub/views/worker_screens/worker_app_bar.dart';
import 'package:workers_hub/views/worker_screens/worker_notification_details.dart';

  ButtonRefact button = ButtonRefact();
  WidgetRefact refactWidget = WidgetRefact();
//final DashBoardController controller=  Get.find();
 //final controller=  Get.put(DashBoardController());
class WorkerDashboard extends StatelessWidget {
   WorkerDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    titleTexts({
      Color color = primeColor,
      required String text,
      required double fontSize
    }){
      return refactText(
          text: text,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: color,
      );
    }

    return GetBuilder<DashBoardController>(
      init:DashBoardController() ,
      builder: (controller) {
        return Scaffold(
          appBar: workerAppBar(),
          body: SingleChildScrollView(
            child: SizedBox(
              width: rWidth(context),
              height: rHeight(context),
              child: Column(
                children: [
                  divider4,
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            titleTexts(
                                text:"Overall Rating:", fontSize: 12.sp,),
                            //Spacer(),
                            SizedBox(
                              width: 55.w,
                              height: 4.3.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                  itemBuilder: (BuildContext context, int index){
                                    return const Padding(
                                      padding:  EdgeInsets.only(left: 5),
                                      child: FaIcon(FontAwesomeIcons.solidStar,color: gold,),
                                    );
                                  }
                              ),
                            ),
                          ],
                        ),
                        divider2,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            titleTexts(
                                text: "Work Mode",
                                fontSize: 12.sp,),
                            SizedBox(
                              width: 25.w,
                              height: 5.h,
                              child: button.elevatedButton(
                                  text: "Daily", onPressed: (){},
                                buttonColor: white,textColor: primeColor
                              )
                            ),
                            SizedBox(
                                width: 25.w,
                                height: 5.h,
                                child: button.elevatedButton(
                                    text: "Hourly", onPressed: (){},
                                    buttonColor: white,textColor: primeColor
                                )
                            ),
                          ],
                        ),
                        divider4,
                        Container(
                          //height: 32.h,
                          width: 95.w,
                          constraints: BoxConstraints(
                            //maxWidth:95.w,
                            //minWidth: 95.w,
                            maxHeight: 30.h,
                            //minHeight: 12.h
                          ),
                          decoration: BoxDecoration(
                            color: primeColor,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Column(
                            children: [
                              divider1,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  titleTexts(
                                      text: "Work Type",
                                      fontSize: 12.sp,
                                    color: white
                                  ),
                                  titleTexts(
                                      text: "Rate",
                                      fontSize: 12.sp,
                                      color: white
                                  ),
                                  titleTexts(
                                      text: "Negotiable",
                                      fontSize: 12.sp,
                                      color: white
                                  ),
                                ],
                              ),

                              Expanded(
                                  child: ListView.builder(
                                    itemCount: 3,
                                      itemBuilder: (BuildContext context, int index){
                                        return Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Row(
                                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              refactWidget.divider(width: 7.5.w),
                                              Container(
                                                width: 20.w,
                                                height: 5.h,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: white,
                                                ),
                                                alignment: Alignment.center,
                                                child: titleTexts(
                                                    text: "carpenter",
                                                    fontSize: 11.sp
                                                ),
                                              ),
                                              refactWidget.divider(width: 15.w),
                                              Container(
                                                width: 16.w,
                                                height: 5.h,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: white,
                                                ),
                                                alignment: Alignment.center,
                                                child:Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    FaIcon(FontAwesomeIcons.rupeeSign,size: 14,),
                                                    titleTexts(
                                                        text: "500",
                                                        fontSize: 11.sp,
                                                        color: black
                                                    )

                                                  ],
                                                ),
                                              ),
                                              refactWidget.divider(width: 15.w),
                                              Container(
                                                width: 3.w,
                                                height: 1.5.h,
                                                color: grey,
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                  ),
                              ),
                              Align(alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10,bottom: 10),
                                  child: SizedBox(
                                      width: 22.w,
                                      height: 5.h,
                                      child: button.elevatedButton(
                                          text: "Edit", onPressed: (){
                                            Get.to(()=>EditWorkDetails());
                                      },
                                          buttonColor: white,textColor: primeColor
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        divider3,
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            titleTexts(
                              text:"Available", fontSize: 12.sp,),

                            GetBuilder<DashBoardController>(
                              builder: (controller) {
                                  return Switch(value: controller.isAvailable, onChanged: controller.onChanged,);
                              }
                            ),
                            SizedBox(
                                width: 21.w,
                                height: 5.h,
                                child: button.elevatedButton(
                                    text:"Now", onPressed: (){},
                                    buttonColor: white,textColor: primeColor
                                )
                            ),
                            button.textButton(onPressed: (){},
                                text: "From: 20/02/022\nTo     : 20/02/022",
                                color: primeColor,
                                fontWeight:FontWeight.bold ),
                          ],
                        ),
                        divider1,
                        Align(
                          alignment: Alignment.topLeft,
                          child: titleTexts(text: "Available works for you", fontSize: 13.sp),
                        )
                      ],
                    ),
                  ),
                  divider1,
                  Container(
                    padding: EdgeInsets.only(top: 7),
                    width: rWidth(context),
                    height: 37.7.h,
                    decoration:const BoxDecoration(
                      color: primeColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      )
                    ),
                    child: ListView.builder(
                      itemCount: 10,
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: (){
                                Get.to(()=>WorkerNotificationDetails());
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                color: Colors.grey,
                                child:  SizedBox(
                                  width: 150.w,
                                  height: 18.h,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        height: 4.5.h,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: refactText(text:"Raju",fontSize: 12.sp,fontWeight: FontWeight.w500),
                                            ),
                                            Padding(padding:EdgeInsets.only(right: 8,top: 8),
                                              child: refactText(text: "time",fontSize: 12.sp,fontWeight: FontWeight.w400,),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10,right: 10),
                                        child: Row(
                                          children: [
                                            const FaIcon(FontAwesomeIcons.mapMarkerAlt),
                                            widget.divider(width: 10),
                                            SizedBox(
                                              width: 80.w,
                                              height: 12.h,
                                              child: RichText(
                                                  text: TextSpan(
                                                      text: "Calicut, beach\n",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,color: Colors.black,
                                                          fontSize: 12.sp
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: "I need a skilled plumber for my house\n maintanance",
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.w500,color: Colors.black54,
                                                            fontSize: 12.sp,
                                                            overflow: TextOverflow.ellipsis,
                                                          ),

                                                        ),
                                                        TextSpan(
                                                          text: "\nExpires on : 12/12/2022",
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.w500,color: black,
                                                            fontSize: 12.sp,
                                                            overflow: TextOverflow.ellipsis,
                                                          ),

                                                        ),
                                                      ]
                                                  )
                                              ),
                                            )

                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                //------------------------------------------------------------------------------------------------------------------
                              ),
                            ),
                          );
                        }
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
