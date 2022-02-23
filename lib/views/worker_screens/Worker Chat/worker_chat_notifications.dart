import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/constants/constants.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
import 'package:workers_hub/views/worker_screens/Worker%20Chat/worker_chat_page.dart';

class WorkerChatNotifications extends StatelessWidget {
  const WorkerChatNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primeColor,
      body: SizedBox(
        width: rWidth(context),
        height: rHeight(context),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (
                BuildContext context, int index){
              return Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 5,
                  child: ListTile(
                    onTap: (){
                      Get.to(()=>WorkerChats());
                    },
                    title: refactText(text: "Plumber",fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                    subtitle:  refactText(text: "Available, interested to further discussion",fontSize: 12.sp,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
