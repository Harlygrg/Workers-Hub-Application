import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:workers_hub/controllers/text_editing_controllers.dart';

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'password is required'),
  MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
]);

final emailValidator = EmailValidator(errorText: 'enter a valid email address');
final requiredValidator = RequiredValidator(errorText: 'this field is required');


 String ?contactNumberValidator(value){
  if(value.length!=10){
    return "enter a valid phone number";
  }

}
String ?confirmPasswordValildate(password){

   if(password!=passwordController.text ){

     return "Password miss match";
   }
}