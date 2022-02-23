import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/constants/constants.dart';
import 'package:workers_hub/views/refactoredWidgets/appbar_title.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
class UserHistory extends StatelessWidget {
  const UserHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primeColor,
      appBar: AppBar(
        title: appbarTitle(),
        backgroundColor: white,
        iconTheme: IconThemeData(color: primeColor,),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30,left: 25,right: 25,),
        child: SizedBox(
          width: rWidth(context),height: rHeight(context),
          child: ListView.builder(itemCount: 10,
              itemBuilder: (BuildContext context, index){
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Card(
                color: Colors.grey[400],
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  title: refactText(text: "Plumbing",fontSize: 15.sp,fontWeight:FontWeight.w500 ),
                  trailing: refactText(text: "date",fontSize: 12.sp,fontWeight: FontWeight.w400),
                  subtitle: refactText(text:"Description",fontSize: 12.sp,fontWeight: FontWeight.normal)
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
