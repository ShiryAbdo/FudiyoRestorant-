

import 'dart:convert';

import 'package:http/http.dart';
import 'package:shaimaa_fudiyo/src/models/user_model.dart';



class UsersApi {
  Future<UserModel> register(String emailUser, String passwordUser) async {
    List<String> categories=["categories[0]","categories[1]"];
    await Client()
        .post("https://test.fudiyo.in/api/partner-app/register", body:
    json.encode({'username': 'username' ,
      'email': 'email' ,
      'mobile': 'mobile' ,
      'password': 'password' ,
      'resturant_name': 'resturant_name' ,
      'longitude': 'longitude' ,
      'latitude': 'latitude' ,
      'certificate': 'certificate' ,
      'resturant_photo': 'resturant_photo' ,
      'contact_number': 'contact_number' ,
      'address': 'address' ,
      'district_id': 'district_id',
      'categories': categories,

    }),
        headers:{
      "Accept": "application/json",
       },)
        .then((response) {
          print("here is reuslt register  ");
          print(response.body);

    });
      UserModel result  ;
    return result;
  }

  Future<String> getCategories() async {


    await Client()
        .get("https://test.fudiyo.in/api/partner-app/categories"  ,
    headers:{
    "Accept": "application/json",
    },)
        .then((response) {
    print("here is getCategories ");
    print(response.body);

    });
      String result ;
    // call  http
    return "";
  }

  Future<String> getDistrict() async {
    await Client()
        .get("https://test.fudiyo.in/api/partner-app/district"  ,
      headers:{
        "Accept": "application/json",
      },)
        .then((response) {
      print("here is getDistrict ");
      print(response.body);

    });
    String result ;
    // call  http
    return "";
  }




}
