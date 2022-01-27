
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:workers_hub/constants.dart';

rWidth(context)=>MediaQuery.of(context).size.width;
rHeight(context) => MediaQuery.of(context).size.height;


refactText({
  required String text,
  double fontSize=15,
  FontWeight fontWeight= FontWeight.normal,
  Color color=black,
}){
 return Text(text,overflow: TextOverflow.clip,
   style: TextStyle(
   fontSize: fontSize,fontWeight: fontWeight,color: color
 ),);
}

class WidgetRefact{

    //divider
divider({double height=10,double width=10}){
    return SizedBox(
      height: height,
      width: width,
    );
}
// user home page card's details
aboutWorker({required String text,required Widget icon}){
  return SizedBox(
    width: 40.w,height: 5.h,
    child: Row(
      children: [divider(width: 10),SizedBox(width: 7.w,child:icon,),

        divider(width: 15),
        Text(text,style: TextStyle(color: black,fontWeight: FontWeight.w500,fontSize: 13.sp)),
      ],
    ),
  );
}

}


class FormFieldRefact{

  //login page text formfield
  textFormField({
    required String hintText,
    Widget ?icon,
    String? Function (String?)? validator,
    TextEditingController? controller,
    bool obscuretext =false,
    AutovalidateMode? autovalidateMode,
    TextInputType? keyboardType
  }){
    return TextFormField(
      decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: icon,
          border:const UnderlineInputBorder(
              borderSide: BorderSide(color: primeColor),
          ),
      ),
      validator: validator,
      controller: controller,
      obscureText: obscuretext,
      autovalidateMode:autovalidateMode ,
      keyboardType: keyboardType,
    );
  }


}

class ButtonRefact {
  // login page button for user and worker
  loginButton({required String buttonText,required Function() onTap,
  Color backgroundColor=white,Color textColor=secColor}){
    return  OutlinedButton(
      child: Text(buttonText,style: TextStyle(fontSize: 15.sp,color: textColor),),
      style: OutlinedButton.styleFrom(
          primary: primeColor,
          backgroundColor:  backgroundColor,
          side: BorderSide(width: 3,color: primeColor,),
          elevation: 5,
          minimumSize: Size(15.w,6.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
      ),
      onPressed: onTap,

    );
  }

  //elevated long button for submit
  submitButton({required String text,required Function() onPressed,Color buttonColor =primeColor,Color textColor=white}){
    return  SizedBox(
      width: 79.w,
      child: ElevatedButton(
        onPressed: onPressed, child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(text,style: TextStyle(fontSize: 15.sp,color: textColor),),
      ),
        style: ElevatedButton.styleFrom(
            primary: buttonColor,
            elevation: 10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),

      ),
    );
  }

  //elevatedbutton for all page

  elevatedButton({
    required String text,
    required Function() onPressed,
    double fontSize=15,
    Color buttonColor=primeColor,
    Color textColor=white,
  }) {
    return  ElevatedButton(
      onPressed: onPressed, child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(text,style: TextStyle(fontSize: fontSize,color: textColor),),
    ),
      style: ElevatedButton.styleFrom(
          primary: buttonColor,
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),

    );
  }


  //icon buttons for all page
iconButton({required Function() onPressed, required Widget icon}){
    return IconButton(
      icon: icon,
      onPressed: onPressed,
    );

}
// text Button for all pages
textButton({
  required Function() onPressed,
  required String text,
  double fontSize=15,
  FontWeight fontWeight= FontWeight.normal,
  Color color=black,
}){
    return TextButton(
        onPressed:onPressed ,
        child: refactText(text:text,fontSize: fontSize,fontWeight: fontWeight,color: color )
    );
}

}