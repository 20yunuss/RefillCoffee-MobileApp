import 'package:com_refillcoffee_app/pages/numberInputPage.dart';
import 'package:com_refillcoffee_app/pages/qrPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:com_refillcoffee_app/context_extension/context_extension.dart';



class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

const int progressValue = 6;
int won = 20;
String username = 'Yunus' ;

class _homePageState extends State<homePage> {
  
   // İlerleme değeri (1 - 10 arasında)
  

  @override
  Widget build(BuildContext context) {

     //double imageHeight = context.dynamicHeight(0.25);
     double imageWidth = context.dynamicWidth(0.5);
     double paddingValue = context.dynamicHeight(0.04);
     double sizedBoxHeight = context.dynamicHeight(0.1);
     double progressPercentage = progressValue / 10;
     double logoHeight = context.dynamicHeight(0.05);
     double buttonHeight = context.dynamicHeight(0.05);
     double buttonWidth = context.dynamicWidth(0.09);     


     String url1 = "https://mithra.coffee/blog/wp-content/uploads/2020/08/kahve-cesitleri-nelerdir.jpg";
     String url2 = "https://upload.wikimedia.org/wikipedia/commons/e/e4/Latte_and_dark_coffee.jpg";
     String url3 = "https://img.freepik.com/free-photo/fresh-coffee-steams-wooden-table-close-up-generative-ai_188544-8923.jpg";
     String url4 = "https://www.allrecipes.com/thmb/Hqro0FNdnDEwDjrEoxhMfKdWfOY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/21667-easy-iced-coffee-ddmfs-4x3-0093-7becf3932bd64ed7b594d46c02d0889f.jpg";






    return SafeArea(

    child: Scaffold(
      
      backgroundColor: const Color.fromARGB(250, 230, 230, 255),

     appBar: AppBar(

    backgroundColor: Colors.white,

     elevation: 0,
     centerTitle: true,
     title: Text(

      'İyi günler $username', 
      style: GoogleFonts.ubuntu(fontSize: 20, fontWeight:FontWeight.bold ) ,),

      leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
             
     ),
     // SİDEBAR
     drawer: Drawer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    Text(username, style: GoogleFonts.ubuntu(color: Colors.black, fontSize:18, fontWeight: FontWeight.bold ),),
                    SizedBox(height: sizedBoxHeight/3), 
                    Text('+90 $phoneNumber', style: GoogleFonts.ubuntu(color: Colors.black, fontSize:18),),
                    SizedBox(height: sizedBoxHeight/3), // Araya boşluk eklemek için SizedBox kullanıyoruz
                    Container(
                      height: buttonHeight,
                      width: buttonWidth*3,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Hesabı Sil'),
                                content: const Text('Hesabınızı silmek istediğinize emin misiniz?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false); // Hayır düğmesine basıldığında AlertDialog'u kapat
                                    },
                                    child: const Text('Hayır', style: TextStyle(color: Colors.black),),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(true); // Evet düğmesine basıldığında AlertDialog'u kapat
                                    },
                                    child: const Text('Evet', style: TextStyle(color: Colors.black),),
                                  ),
                                ],
                              );
                            },
                          ).then((value) {
                            if (value == true) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const numberInputPage()), // Evet'e basılırsa Hesap Silme Sayfasına yönlendirme yap
                              );
                            }
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // Arka plan rengi siyah
                        ),
                        child: const Text(
                          'Hesabı Sil',
                          style: TextStyle(
                            color: Colors.white, // Yazı rengi beyaz
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


    
     
     body:  Stack(
       children: [
        Positioned.fill(
          child: Column(
              children: [
       
       
              // EKRANIN ½30UNU KAPLAYAN SİYAH CONTAİNER
       
                Container(
                    height: MediaQuery.of(context).size.height * 0.25, // Ekranın 
                    color: Colors.black,
       
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
       
                     Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                 SizedBox(
                                  width: sizedBoxHeight ,
                                  height: sizedBoxHeight,
                                  child:  CircularProgressIndicator(
                                    value: progressPercentage,
                                    color: Colors.orange.shade600,
                                    strokeWidth: 10,
                                  ),
                                ),
                                Container(
                                  height: logoHeight ,
                                  child: Image.asset('assets/images/cup.png', ),
                                ),
                              ],
                            ),
                            
                            SizedBox(height: sizedBoxHeight/5 ,),
                            
                            Text(
                                  '$progressValue/10', // Yüzdeyi yazdırma
                                  style: GoogleFonts.ubuntuMono(color: Colors.white ,fontSize: 20, ) ,
                                ),
                          ],
                        ),
       
                        SizedBox(width: sizedBoxHeight/2 ,),
                        
                        
       
                         Column(
                          mainAxisAlignment: MainAxisAlignment.center,
       
                           children: [
                            // suan kahve bakıyesı
                            Row(
                              children: [
                             
                                Text('Şuan  ', style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 14)),
                             
                                Text('$progressValue ', style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 14 )),
                             
                                Container(
                                      height: logoHeight/2 ,
                                      child: Image.asset('assets/images/cup.png', ),
                                    ),
                                
                                
                              ],
                             ),
                             SizedBox(height: sizedBoxHeight/6,),
       
                            // bugüne kadar kazanılan
                             Row(
                              children: [
                             
                                Text('Bugüne kadar kazanılan  ', style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 14)),
                             
                                Text('$won ', style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 14 )),
                             
                                Container(
                                      height: logoHeight/2 ,
                                      child: Image.asset('assets/images/cup.png', ),
                                    ),
       
                                SizedBox(height: sizedBoxHeight/6,),
                                
                                
                              ],
                             ),
                           ],
                         ),
                        
                       
       
       
       
                      ],
                      ),
                  ),
           // networkden gelen image sıralaması
           Expanded(
             child: SingleChildScrollView(
               child: Column(
 
                children: [
             
             
                    imageWidget(imageWidth:imageWidth, url: url1),
                    imageWidget(imageWidth:imageWidth, url: url2),
                    imageWidget( imageWidth:imageWidth, url: url3),
                    imageWidget(imageWidth:imageWidth, url: url4),
                   
                   
             
                ],
             
             
               ),
             ),
           ),
         ],
       ),
  ),
         // SAĞ ALTTAKİ QR OKUT BUTONU 
        Positioned(
      bottom: paddingValue,
      right: paddingValue/2,
      child: TextButton(
                onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const qrPage()),
                );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  minimumSize: MaterialStateProperty.all<Size>(Size(buttonWidth, buttonHeight)),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.black), // Siyah gölge rengi ve opaklığı
                  elevation: MaterialStateProperty.all<double>(paddingValue/3),
                ),
                child:  Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Icon(Icons.qr_code),
                    // SizedBox(width: sizedBoxHeight/7 ), // İkon ile metin arasında boşluk bırakır
                    Text('QR Okut', style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold ),),
                  ],
                ),
              ),

    ),

     ],
     ), 
    ),
   );
 }
}

class imageWidget extends StatelessWidget {
  const imageWidget({
    super.key,
    required this.imageWidth,
    //required this.imageHeight,
    required this.url,
  });

  final double imageWidth;
  //final double imageHeight;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
       
      width: imageWidth,
      //height: imageHeight,
    
    
     child: Image.network(url, fit: BoxFit.fill),
     );
  }
}