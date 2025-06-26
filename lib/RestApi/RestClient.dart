import 'dart:convert';
import 'package:crud/style/style.dart';
import 'package:http/http.dart' as http;

// Product Read
Future<List>ProductGridViewListRequest()async{
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
  var PostHeader = {"Content-Type":"application/json"};

  var response = await http.get(URL,headers: PostHeader);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return ResultBody['data'];
  }
  else{
    ErrorToast("Request Fail ! Try Again");
    return [];
  }



}


//Product Create
Future<bool> ProductCreateRequest(FormValues) async{
  var URL =Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var PostBody = json.encode(FormValues);
  var PostHeader = {"Content-Type":"application/json"};

  var response =  await http.post(URL,headers: PostHeader,body: PostBody);

  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode == 200 && ResultBody['status']=="success"){
      SuccessToast("Request Success");
      return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }

}


//Product Delete
Future<bool> ProductDeleteRequest(id) async {
  var url = Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/$id");
  var postHeader = {"Content-Type": "application/json"};

  var response = await http.get(url, headers: postHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode == 200 && resultBody['status'] == 'success') {
    SuccessToast("Request success.");
    return true;
  } else {
    ErrorToast("Request failed! try again.");
    return false;
  }
}


//////Product Update
Future<bool> ProductUpdateRequest(FormValues,id) async{
  var URL =Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/$id");
  var PostBody = json.encode(FormValues);
  var PostHeader = {"Content-Type":"application/json"};

  var response =  await http.post(URL,headers: PostHeader,body: PostBody);

  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode == 200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }

}