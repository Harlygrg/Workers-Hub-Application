
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workers_hub/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:workers_hub/services/exception_handling.dart';
import 'package:workers_hub/views/refactoredWidgets/refactored_widgets.dart';
import 'package:workers_hub/views/user_screens/bottom_nav.dart';
import 'package:workers_hub/views/worker_screens/bottom_nav_worker.dart';
import 'package:http_parser/http_parser.dart';


class AuthenticationServieces {
  // user sign up api service function
  Future userRegistration({
    required String password,
    required String email,
    required String firstName,
    required String lastName,
    required String contactNumber,
    required String address,

  }) async {
      final apiResponse = await http.post(
          Uri.parse(userRegApiUrl),
          body: {
            "password": password,
            "email": email,
            "first_name": firstName,
            "last_name": lastName,
            "phone": contactNumber,
            "address": address,
          }
      );

      switch(apiResponse.statusCode){
        case 200:   var jsonResponse = jsonDecode(apiResponse.body);
        return jsonResponse["status"];
        // case 400: throw HttpStatus.badRequest;
        // default: throw HttpStatus.badGateway;
        //(apiResponse.body.toString());
      }
  }

//worker registration
  Dio _dio =Dio();
  Future workerRegistration({
    required String city,
    required String discription,
    required List<String> skills,
    required String subscription,
    XFile ?image,
     String ?fileName,

  }) async {

   SharedPreferences pref = await SharedPreferences.getInstance();
   String? accessToken= pref.getString("accessToken");
   String? filePath = image!.path;
   String? fileName = filePath.split('/').last;
    var body= {
      "city": city,
      "description": discription,
      "subscription": subscription,
      "skill":  jsonEncode(skills),
      "image": await MultipartFile.fromFile(
                filePath,
                filename: fileName,
                contentType: MediaType("image", fileName.split(".").last),
              ),
    };

    print(accessToken);





   // print("------form data:- $formData");


    try{
             final apiResponse = await _dio.post(workerRegApiUrl,data:FormData.fromMap(body),
          options: Options(headers: {"Authorization":"Bearer $accessToken"},));

             print("--------------status code-----------------${apiResponse.statusCode}");

      switch(apiResponse.statusCode){
        case 200:
          // var jsonResponse = jsonDecode(apiResponse.body);
          //           pref.setBool("RegesteredAsWorker", true);

        Get.snackbar("", "Successfully regestered",
          backgroundColor: lightTeal,
          titleText: refactText(text: "Successfully Regestered"),
          snackPosition: SnackPosition.BOTTOM,);
                   Future.delayed(Duration(seconds: 2))
                       .then((value) =>Get.to(()=>WorkerBottomNav()) );
                   break;

        case 403:  Get.snackbar("", "Something went wrong",
          backgroundColor: lightTeal,
          titleText: refactText(text: "Something went wrong"),
          snackPosition: SnackPosition.BOTTOM,);
        break;
        case 500:   Get.snackbar("", "Something went wrong",
          backgroundColor: lightTeal,
          titleText: refactText(text: "Something went wrong "),
          snackPosition: SnackPosition.BOTTOM,);
        break;
        default:   Get.snackbar("", "Something went wrong",
          backgroundColor: lightTeal,
          titleText: refactText(text: "default "),
          snackPosition: SnackPosition.BOTTOM,);
        break;
      }
     // return apiResponse.data;


    }

    on SocketException {
      Get.snackbar("Something went wrong", "Check your internet Connection",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: primeColor,

      );
    } on HttpException{
      Get.snackbar("Network error", "Please try after some time",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: primeColor,

      );
    }on DioError
    catch (e){
      print(e.response?.data);
    }
    catch(e){
      print("------------$e");
      Get.snackbar("Network error", "Please try after some time $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: primeColor,);
    }
    // on TimeoutException{
    //   Get.snackbar("Connection time out", "Please try again",
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: primeColor,
    //
    //   );
    // }
    //---------------------------------------------------------------------------------






    // switch(apiResponse.statusCode){
    //   case 200:   var jsonResponse = jsonDecode(apiResponse.body);
    //               pref.setBool("RegesteredAsWorker", true);
    //
    //   Get.snackbar("", "Successfully regestered",
    //     backgroundColor: lightTeal,
    //     titleText: refactText(text: "Successfully Regestered"),
    //     snackPosition: SnackPosition.BOTTOM,);
    //              Future.delayed(Duration(seconds: 2))
    //                  .then((value) =>Get.to(()=>WorkerBottomNav()) );
    //
    //                 return jsonResponse["status"];
    //   case 400:   throw BadRequestException(apiResponse.body.toString());
    //   case 403:   throw UnauthorisedException(apiResponse.body.toString());
    //   case 500:   throw InvalidInputException(apiResponse.body.toString());
    // }
  }


  // user login

  //api service

  Future<dynamic> userLogin({
    required String email,
    required String password
  })async{

    SharedPreferences pref = await SharedPreferences.getInstance();


    final body ={
      "email" : email,
      "password": password
    };
    try{

      final response = await http.post(Uri.parse(userLoginUrl),body: body,);
  switch(response.statusCode){
    case 200:   var decodeJson= jsonDecode(response.body);
                print("access:${decodeJson["access"]}");
                print("refresh${decodeJson["refresh"]}");
                pref.setString("accessToken", decodeJson["access"]);
                pref.setString("refreshToken", decodeJson["refresh"]);
                pref.setBool("IsEmployerLoggedInTrue", true);
                Get.to(()=>BottomNav());
                break;
    case 400:   throw BadRequestException(response.body.toString());
    case 403:   throw UnauthorisedException(response.body.toString());
    case 500:   throw InvalidInputException(response.body.toString());

  }

    } on SocketException catch(e){
      print(e.message);
      print(e.osError);
      print(e.address);
      Get.snackbar("Something went wrong", "Check your internet connection",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: primeColor,
        colorText: white,
      );
    } on BadRequestException catch(e){
      Get.snackbar(
        "Something went wrong",
        'check your email address',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: primeColor,
        colorText: white,
      );
    } on InvalidInputException{
      Get.snackbar(
        'Something Went Wrong',
        'Please try again',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: primeColor,
        colorText: white,
      );
    }
  }

}
class WorkerRegn{


  Future regn( var imageFile)async{
    String? filePath =imageFile.path;
    String? fileName = filePath!.split('/').last;
    debugPrint("File Path $filePath");
    debugPrint("File Name $fileName");
    FormData formData =FormData.fromMap({});
  }
}

