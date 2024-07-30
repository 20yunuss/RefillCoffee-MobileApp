//import 'dart:ffi';

import 'package:com_refillcoffee_app/context_extension/context_extension.dart';
import 'package:com_refillcoffee_app/pages/otpPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:checkbox_formfield/checkbox_formfield.dart';



TextEditingController controller = TextEditingController();
String phoneNumber = "";
bool checkController = false;

class numberInputPage extends StatefulWidget {
  const numberInputPage({super.key});

  @override
  State<numberInputPage> createState() => _numberInputPageState();
}

class _numberInputPageState extends State<numberInputPage> {
  @override
  Widget build(BuildContext context) {

     
     double paddingValue = context.dynamicHeight(0.06);
     double sizedBoxHeight = context.dynamicHeight(0.1);
     double sizedBoxWidth = context.dynamicWidth(0.025);
     double radiusValue = context.dynamicHeight(0.015);
     double logoHeight = context.dynamicHeight(0.175);
     double buttonHeight = context.dynamicHeight(0.05);
     double buttonWidth = context.dynamicWidth(0.4);
    // double iconHeight = context.dynamicHeight(0.08);
     String url = 'https://chat.openai.com/';
    // Burada checkController doğrudan parametre olarak belirtiliyor
     

     
     




    return  SafeArea(
      child:  Scaffold(
        
        backgroundColor:  Colors.black, //Color.fromARGB(255, 23, 30, 34),
        resizeToAvoidBottomInset: false,
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: paddingValue ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [

            
            
              SizedBox(height: sizedBoxHeight/2,),
              //LOGO
                Container(
                  height: logoHeight,
                 
                  child: Image.asset('assets/images/refill.png',),
                  ),
                SizedBox(height: sizedBoxHeight,),

              //HOŞGELDİNİZ

                Align(
                  alignment:Alignment.centerLeft, 
                  child: 
                      Text(
                        'Hoşgeldiniz,', 
                        
                        style: GoogleFonts.ubuntu(fontSize: 28, color: Colors.white),
                        textAlign: TextAlign.left, ),
                          ),
                SizedBox(height: sizedBoxHeight/3,),
                //KÜÇÜK metin
                Text('Doğrulamamız için telefon numaranızı giriniz.', style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 17),),

                SizedBox(height: sizedBoxHeight/3,),

              //TELEFON NO GİRME ALANI

               Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(radiusValue/1.5),
                  ),
                 child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: sizedBoxWidth,),
                     const Text(
                        '+90',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(width: sizedBoxWidth,),
                      Expanded(
                        child: TextField(
                          style: const TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.phone ,
                          controller: controller,
                          maxLength: 10,
                          decoration:  InputDecoration(
                            counterText: '',
                            hintText: 'Telefon Numarası',
                            hintStyle: GoogleFonts.ubuntu(fontSize: 16,color: Colors.black),
                            border: InputBorder.none,
                          ),
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          
                        ),
                      ),
                      Icon(Icons.phone,color: Colors.black,),
                      SizedBox(width: sizedBoxWidth,),
                    ],
                  ),
               ),
              
              
              
               
             
              SizedBox(height: sizedBoxHeight/6,),

                // CHECKBOX VE KVKK.. METNİ
                  Row(
                      children: [

                        Container(
                          height: sizedBoxHeight/1.6 ,
                          width: sizedBoxWidth*1.5 ,
                          child: CheckboxListTileFormField(
                            checkColor: Colors.black,                            
                            activeColor: Colors.white,
                              initialValue: checkController,
                              onChanged: (value) {
                                  setState(() {
                                    checkController = value ; // Değer değişikliğini takip etmek için value kullanın
                                    debugPrint('değer atandı = $checkController');
                                  });
                                },

                            ),
                        ),
                        SizedBox(width: sizedBoxWidth/2,),

                        

                        GestureDetector(
                          onTap: () {
                            canLaunchUrlString(url);
                          },
                          child: const Text(
                            'KVKK şartları',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue, // Mavi renk
                              decoration: TextDecoration.underline, // Altı çizili metin
                            ),
                          ),
                        ),
                       const Text("'nı okudum ve kabul ediyorum.", style: TextStyle(color: Colors.white, fontSize: 12),)
                      ],
                    ),
                
                SizedBox(height: sizedBoxHeight/2,),
                
                // DEVAM ET BUTONU 

              Container(
                
                height: buttonHeight ,
                width: buttonWidth ,


                child: ElevatedButton(
              
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(radiusValue/1.5),
                      ),
              
                    ),
                   onPressed: () {
                        if (controller.text.length == 10 && checkController) {
                          setState(() {
                            phoneNumber = controller.text;
                            debugPrint('no atandı');
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const otpPage()),
                            );
                          });
                        } else {
                          String warningMessage = '';
                          if (controller.text.length != 10) {
                            warningMessage += 'Telefon numaranız 10 haneli olmalıdır. ';
                          }
                          if (!checkController) {
                            warningMessage += 'KVKK şartlarını kabul etmelisiniz. ';
                          }
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Uyarı!'),
                                content: Text(warningMessage),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Tamam',style: TextStyle(color: Colors.black)),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
 
                    child:  Text(
                      'Devam Et',
                      style: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 16
                      ),
                    ),
                  ),
              ),


                SizedBox(height: sizedBoxHeight*1.5,),
                
              ],
            ),
          ) ,
        
        
      ),
    );
    
  }

  
  
}