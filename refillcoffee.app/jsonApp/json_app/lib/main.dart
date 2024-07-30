import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_app/model.dart';
import 'user.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp( MyApp());
}
  
  
  class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

        /* Future<Map<String,dynamic>> createPost(String title, String body, int userId) async {
         final response = await http.post(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'), 
          headers: <String, String> {
            'Content-Type': 'application/json; charset=UTF-8'
          },  
          body: jsonEncode( <String, dynamic> {
            
            'title': title,
            'body': body,
            'userId': userId,
          }),
         );
        if(response.statusCode == 201 || response.statusCode == 200) {
         return jsonDecode(response.body);
        } else {
          throw ('post isteği gonderilirken bir hata olustu');
        }
        } */
     Future<Map<String,dynamic>> fetchPost() async {
          final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/45'));
          if(response.statusCode == 200){
            return jsonDecode(response.body);
          } else {
            throw ('Get isteği gönerilirken hata oluştu !');
          }
        }
        


@override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      body: Center(
        child:  FutureBuilder(

          future: fetchPost(),
          
          builder: ( context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();

            } else if (snapshot.hasError){
              return Text('Hata: ${snapshot.error}');

            }else if (snapshot.hasData) {
              final userIdData = snapshot.data!['userId'];
              final userName = userIdData != null ? userIdData['name'] : 'isim bulunamadı';
              return Text('Yanıt: ${snapshot.data['userId']}');

            }else {
              return const Text('Veri bulunamadı');
            }
            
          },
        ),
        
           // POST İSTEĞİ

           /* FutureBuilder<Map<String, dynamic>>(
          future: createPost('test title', 'test body', 1) ,
          builder: ( BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            } else if (snapshot.hasError){
              return Text('Hata:${snapshot.error}'); 
            } else if (snapshot.hasData){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Başlık: ${snapshot.data!['title']}'),
                  Text('Gövde: ${snapshot.data!['body']}'),
                  Text('User ID: ${snapshot.data!['userId']}'),
                  Text('ID: ${snapshot.data!['id']}'),
                ],
              );
            } else {
              return Text('Veri bulunamadı');
            }
          },
        ), 
        */
        
        // GET İSTEĞİ
         
           // GET İSTEĞİ  
              
      ) ,
    );
  }
 
}



 class MyApp extends StatelessWidget {
   MyApp({super.key});

  
  

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      home:  MyHomePage(),
    );
  }

       
} 





