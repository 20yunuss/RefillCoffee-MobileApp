import 'package:com_refillcoffee_app/context_extension/context_extension.dart';
import 'package:com_refillcoffee_app/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:google_fonts/google_fonts.dart';
import 'numberInputPage.dart';


class otpPage extends StatefulWidget {
  const otpPage({super.key});

  @override
  State<otpPage> createState() => _otpPageState();
}



class _otpPageState extends State<otpPage> {

  TextEditingController pinEditingController = TextEditingController();

   @override
   void dispose() {
    pinEditingController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    // double paddingValue = context.dynamicHeight(0.01);
    double pinHeight = context.dynamicHeight(0.07);
    double pinWidth = context.dynamicWidth(0.05);
    double radiusValue = context.dynamicHeight(0.01);
    double sizedBoxHeight = context.dynamicHeight(0.01);
    double marginValue = context.dynamicHeight(0.01);
    double buttonHeight = context.dynamicHeight(0.05);
    double buttonWidth = context.dynamicWidth(0.4);
    



    final defaultPinTheme = PinTheme(


           height: pinHeight ,
           width: pinWidth ,
           textStyle: const TextStyle( fontSize: 22, color: Colors.black),
           decoration:  BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(radiusValue),
           border: Border.all(color: Colors.transparent),

           ),
    );


    

    return  Directionality(
      textDirection:TextDirection.ltr ,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,

          backgroundColor: Colors.black, 
          
           body: Container(
            
             child: Center(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [

                   // DOĞRULA
                   SizedBox(height: sizedBoxHeight*4,),
                    Text(
                     "Doğrulama", 
                     style: GoogleFonts.ubuntu(
                       color: Colors.white ,
                       fontSize: 28, 
                       fontWeight: FontWeight.bold
                       ),
                     ),
                 
                     SizedBox(height: sizedBoxHeight*2,),
           
                     // KODU GİRİNİZ
                      Container(
                       margin:  EdgeInsets.symmetric(vertical: marginValue ) ,
                       child: Text("Telefonunuza gönderilen kodu giriniz:", 
                       style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 18),/* TextStyle(color: Colors.grey.shade600, fontSize: 18), */
                       ),
                     ),
                     SizedBox(height: sizedBoxHeight*2,),
                      Text("+90 "+ phoneNumber, style: GoogleFonts.acme(color: Colors.white, fontSize:18 ) /* TextStyle(color: Colors.black, fontSize: 18), */),
                     SizedBox(height: sizedBoxHeight*2,),
                   // PİNPUT  
                   Pinput(
                     controller: pinEditingController,
                     length: 4,
                     defaultPinTheme: defaultPinTheme,
                     focusedPinTheme: defaultPinTheme.copyWith(
                       decoration: defaultPinTheme.decoration!.copyWith(
                         border: Border.all(color: Colors.white) ,
                         borderRadius: BorderRadius.circular(radiusValue),
                       ),
                     ),
                 
                     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                     onCompleted: (pin) => debugPrint(pin),
                
                   ),
                   SizedBox(height: sizedBoxHeight*5,),
                   
                   //DOĞRULA BUTONU 
              
                      Container(
                       
                       height: buttonHeight ,
                       width: buttonWidth ,
           
           
                       child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(radiusValue / 1.5),
                          ),
                        ),
                        onPressed: () {
                          // Girilen PIN kodunu al
                          String enteredPin = pinEditingController.text;

                          // Doğru PIN kodu mu kontrol et
                          if (enteredPin == '2323') {
                            // Doğru PIN koduysa yeni sayfaya yönlendir
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const homePage(),
                              ),
                            );
                          } else {
                            // Yanlış PIN koduysa bir alert dialog göster
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Doğrulama Kodu Yanlış'),
                                  content: const Text('Lütfen doğru doğrulama kodunu girin.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Tamam', style: TextStyle(color: Colors.black),),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Text(
                          'Doğrula',
                          style: GoogleFonts.ubuntu(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),

                     ), 
                 ],
               ),
             ) ,
             
             ),
          
        ),
      ),
    );
  }
}