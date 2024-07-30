import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:com_refillcoffee_app/pages/numberInputPage.dart';

void main() {
  
 
    runApp( const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ],);
    
    return const MaterialApp(
      
      
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: numberInputPage(),
        ),
      ),


      /* localizationsDelegates: [
          
          DefaultMaterialLocalizations.delegate, // Örnek olarak varsayılan delegeleri kullanabilirsiniz.
          DefaultWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
           Locale('en', 'US'), 
        ], */
      );
  }
}


