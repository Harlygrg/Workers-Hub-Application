import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/models/constants.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
import 'package:workers_hub/views/user_screens/home_page_notification_bottom_sheet.dart';

import '../end_drawer_home_page.dart';
class UserChat extends StatelessWidget {
   UserChat({Key? key}) : super(key: key);
   FormFieldRefact formfield = FormFieldRefact();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primeColor,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            divider4,
            SizedBox(width: rWidth(context),height: 8.5.h,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 5,
                child: ListTile(
                  onTap: (){
                  },
                  leading: SizedBox(width: 50,height: 50,
                    child: CircleAvatar(
                      backgroundColor: primeColor,
                      child: refactText(text: "Image"),
                    ),),
                  trailing:refactText(text: "Name",fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Spacer(),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 5,
              child: ListTile(
                onTap: (){
                },
                leading: SizedBox(width: 80.w,height: 50,
                  child: formfield.textFormField(
                      hintText: "Message",
                  )
                ),
                trailing:SizedBox(
                  width: 10.w,
                  height: 8.h,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: button.iconButton(
                        onPressed: (){},
                        icon:FaIcon(FontAwesomeIcons.solidPaperPlane),)),
                )
              ),
            ),
            divider1,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 38.w,
                  height: 6.h,
                  child: button.elevatedButton(
                      text: "Make an offer",
                      onPressed: (){},buttonColor: grey,
                    textColor: primeColor
                  ),
                ),SizedBox(
                  width: 40.w,
                  height: 6.h,
                  child: button.elevatedButton(
                      text: "Schedule Work",
                      buttonColor: grey,
                      textColor: primeColor,
                      onPressed: (){}
                      ),
                ),
              ],

            ),
            divider1,
           Align(
             alignment: Alignment.bottomLeft,
             child:  button.textButton(
                 onPressed: (){},
                 text: "Report a problem",
                 fontWeight: FontWeight.bold
             ),
           ),
            divider3,
          ],
        ),
      ),
    );
  }
}
