import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/controllers/User%20controllers/home_page_body_and_bottom_nav.dart';
import 'package:workers_hub/controllers/User%20controllers/workers_list_and_category_controller.dart';
import 'package:workers_hub/models/constants.dart';
import 'package:workers_hub/views/refactoredWidgets/appbar_title.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workers_hub/views/user_screens/chat/chat_notifications.dart';
import 'package:workers_hub/views/user_screens/end_drawer_home_page.dart';
import 'package:workers_hub/views/user_screens/work_deail_page.dart';

import 'home_page_app_bar.dart';

class UserHomePage extends StatelessWidget {
  UserHomePage({Key? key}) : super(key: key);
    ButtonRefact button = ButtonRefact();
  WidgetRefact widget = WidgetRefact();
 // final WorkerCategoryController workerCatCntlr = Get.find();
  //final HomePageController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkerCategoryController>(
     init: WorkerCategoryController(),
      builder: ( workerCatCntlr) {
        List imgList = workerCatCntlr.images();
        List nameList= workerCatCntlr.catName();
        return Scaffold(
          drawer: homeDrawer(context),
          appBar: appbarHomePage(context),
          body: Container(
            constraints: BoxConstraints.expand(),
            child: Column(
              children: [

                SizedBox(
                  width:rWidth(context)*.85,height: rHeight(context)*.829,
                  child: ListView.builder(
                      itemCount: imgList.length,
                      itemBuilder: (BuildContext context, index){

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: GestureDetector(
                            onTap: (){
                              Get.to(()=>WorkDetailPage());
                            },
                            child: Card(
                              //color: secColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              elevation: 10,
                              child: SizedBox(
                                width: 100.w,height: 25.h,
                                child: Row(
                                  children: [
                                    widget.divider(width: 5),
                                    SizedBox(
                                      width: 27.w,height: 18.h,
                                      child: Image.asset(imgList[index],fit: BoxFit.fill,),
                                    ),
                                    Column(
                                      children: [
                                        divider1,
                                        Text(nameList[index],
                                          style: TextStyle(color: black,
                                              fontWeight: FontWeight.bold,fontSize: 15.sp),),
                                        divider1,
                                        widget.aboutWorker(text: "Place", icon:const Icon(
                                          Icons.location_on,
                                        ),),
                                        widget.aboutWorker(text: "100/day",
                                          icon:const  FaIcon(FontAwesomeIcons.rupeeSign),),
                                        widget.aboutWorker(text: "Nogiatiable",
                                            icon:const FaIcon(FontAwesomeIcons.handshake)),
                                        SizedBox(
                                          width: 40.w,
                                          height: 3.5.h,
                                          child:
                                          ListView.builder(
                                            itemCount:4,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (BuildContext context,int index){
                                                return const Icon(
                                                  Icons.star_rate_rounded,color: Color(0xffFFD700),
                                                );
                                              }
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: (){
                Get.to(()=>ChatNotificationsList());
              },
            child: SizedBox(
              width: 50,height: 50,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    //left: -10.7.w,top: -8.w,
                    child: button.iconButton(
                        onPressed: (){},
                        icon: FaIcon(FontAwesomeIcons.solidComment,color: white,size: 25,)
                    ),
                  ),
                  Positioned(
                      top: 2.w,left: 2.w,
                      child: SizedBox(
                        width: 18,height: 18,
                        child: CircleAvatar(
                          child: refactText(text: "12",color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),
                          backgroundColor: grey,
                        ),
                      ))
                ],
              ),
            ),
             // bottomNavigationBar: ,,
          ),



        );
      }
    );
  }
}
