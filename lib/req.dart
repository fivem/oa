import "package:dio/dio.dart";
import 'dart:convert';

void main(){
  req r = new req();
  r.get("http://www.baidu.com").then((data){
    print(data);
  });
}

class req{
  Dio dio;
  Options options;
  req(){
    dio = new Dio();
    options= Options(
    baseUrl:'https://api.douban.com',
    headers:{
    "tgt":'19832342'
    }
    );
    dio.interceptor.response.onError=(DioError r){
      if(r.response?.statusCode==401){
        print(401);
      }else if(r.response?.statusCode==404){
        print(404);
      }else if(r.response?.statusCode==302){
        print(302);
      }
    };
  }
  Future<Response> get(url) async{
    try{
      return await dio.get(url,data:{},options:this.options);
    }on DioError catch(r){

    }
  }
  Future<Response> post(url,param,options) async{
    try{
      return await dio.post(url,data:param,options:options);
    }on DioError catch(r){

    }
  }
  Future<Response> put(url,param,options) async{
    return await dio.put(url,data:param,options:options);
  }
  Future<Response> delete(url,param,options) async{
    return await dio.delete(url,data:param,options:options);
  }
}