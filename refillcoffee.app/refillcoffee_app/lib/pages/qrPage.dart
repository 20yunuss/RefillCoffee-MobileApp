import 'package:com_refillcoffee_app/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:com_refillcoffee_app/context_extension/context_extension.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uuid/uuid.dart';

class qrPage extends StatefulWidget {
  const qrPage({super.key});

  @override
  State<qrPage> createState() => _qrPageState();
}

class _qrPageState extends State<qrPage> {
  Timer? _timer;
  int _secondsRemaining = 60;
  String qrData = Uuid().v4();
  

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_secondsRemaining > 0) {
            _secondsRemaining--;
          } else {
            timer.cancel();
            Navigator.pop(context);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double logoHeight = context.dynamicHeight(0.03);
    double sizedBoxHeight = context.dynamicHeight(0.1);
    double containerHeight = context.dynamicHeight(0.6);
    double containerWidth = context.dynamicWidth(0.35);
    double radiusValue = context.dynamicHeight(0.03);
    double qrHeight = context.dynamicHeight(0.2);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(248, 179, 178, 178),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          shadowColor: Colors.black,
          backgroundColor: Colors.black,
          actions: [
            Text(
              '$progressValue',
              style: GoogleFonts.ubuntu(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Container(
              height: logoHeight,
              child: Image.asset('assets/images/cup.png'),
            ),
            SizedBox(width: sizedBoxHeight / 5),
          ],
          elevation: 5,
          centerTitle: true,
          title: Text(
            '$username',
            style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Container(
            height: containerHeight,
            width: containerWidth,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(radiusValue)),
            ),
            child: Column(
              children: [
                SizedBox(height: sizedBoxHeight / 2),
                Text(
                  'Okutunuz!',
                  style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: sizedBoxHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '1',
                      style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: logoHeight,
                      child: Image.asset('assets/images/cup.png'),
                    ),
                    Text(
                      ' Kazanmak için okutun: ',
                      style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: sizedBoxHeight / 2),
                Container(
                  height: qrHeight,
                  child: QrImageView(
                    data: qrData,
                    version: QrVersions.auto,
                    size: qrHeight,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(height: sizedBoxHeight),
                Text(
                  "Kalan Süre: $_secondsRemaining saniye",
                  style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



/* import 'package:com_refillcoffee_app/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:com_refillcoffee_app/context_extension/context_extension.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uuid/uuid.dart';




class qrPage extends StatefulWidget {
  const qrPage({super.key});

  @override
  State<qrPage> createState() => _qrPageState();
}
int _secondsRemaining = 60;

class _qrPageState extends State<qrPage> {
 Timer? _timer; // Timer'ı burada tanımla



  @override
  void initState() {
    super.initState();
    // Timer'ı başlat
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) { // Widget ağacında bulunduğunuzu kontrol edin
        setState(() {
          if (_secondsRemaining > 0) {
            _secondsRemaining--; // Her saniyede bir süreyi azalt
          } else {
            // Süre bittiğinde navigator.pop çağırarak bir önceki sayfaya dön
            timer.cancel(); // Timer'ı durdur
            Navigator.pop(context);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Timer'ı durdur
    super.dispose();
  }

  Widget build(BuildContext context) {

    double logoHeight = context.dynamicHeight(0.03);
    double sizedBoxHeight = context.dynamicHeight(0.1);
    double containerHeight = context.dynamicHeight(0.6);
    double containerWidth = context.dynamicWidth(0.35);
    double radiusValue = context.dynamicHeight(0.03);
    double qrHeight = context.dynamicHeight(0.2);

    return  SafeArea(
      child: Scaffold(
        
        backgroundColor: const Color.fromARGB(248, 179, 178, 178),
        appBar: AppBar(
          leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white), // Ok işareti ikonunu beyaz olarak ayarla
                onPressed: () {
                 Navigator.pop(context); // Geri tuşuna basıldığında yapılacak işlemler
                },
              ),
          shadowColor: Colors.black, 
          backgroundColor: Colors.black,
          actions: [
      
       Text('$progressValue', style: GoogleFonts.ubuntu(color: Colors.white ,fontWeight: FontWeight.bold),),

      Container(

          height: logoHeight ,
          child: Image.asset('assets/images/cup.png', ),
        
        ),

          SizedBox(width:  sizedBoxHeight/5 ),
     
          ],

     elevation: 5,
     centerTitle: true,
     title: Text(
      '$username', 
      style: GoogleFonts.ubuntu(color: Colors.white ,fontSize: 20, fontWeight:FontWeight.bold ) ,),

     ),
     body: Center(
       child: Container(
          
          height: containerHeight ,
          width: containerWidth ,
          

          decoration:  BoxDecoration(
            color: Colors.black ,
            borderRadius: BorderRadius.all(Radius.circular(radiusValue)),
            ),
            child: Column(
              
              children: [

                SizedBox(height: sizedBoxHeight/2,),

                Text('Okutunuz!', style: GoogleFonts.ubuntu(color: Colors.white ,fontSize: 19 ,fontWeight: FontWeight.bold ),),

                SizedBox(height: sizedBoxHeight,),
              // 1 BARDAK BAKİYESİ KAZANMAK İÇİN OKUT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                       Text('1', style: GoogleFonts.ubuntu(color: Colors.white ,fontSize:16 ,fontWeight: FontWeight.bold), ),
                      
                      Container(

                          height: logoHeight ,
                          child: Image.asset('assets/images/cup.png', ),
                        
                        ),
                       Text(' Kazanmak için okutun: ', style: GoogleFonts.ubuntu(color: Colors.white ,fontSize:16 ,fontWeight: FontWeight.bold,),),

                  ],
                ),

                SizedBox(height: sizedBoxHeight/2,),
              // QR KOD 
                Container(
                  height: qrHeight,
                  child: Image.asset('assets/images/qrcode.png'),

                  ),

                SizedBox(height: sizedBoxHeight,),
              // KALAN SÜRE SANİYE CİNSİNDEN
                Text(
                    "Kalan Süre: $_secondsRemaining saniye",
                    style: GoogleFonts.ubuntu(color: Colors.white ,fontSize:16 ,),
                  ),
                
              ],
            ),
       
       ),
     ),
       
      ),
    );
  }
} */