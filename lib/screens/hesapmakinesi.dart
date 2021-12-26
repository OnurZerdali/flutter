import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HesapMakinesi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Basla(),
    );
  }
}

class Basla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(AppLocalizations.of(context).calculator)),
      ),
      body: HesapM(),
    );
  }
}

class HesapM extends StatefulWidget {
  _HesapMState createState() => _HesapMState();
}

class _HesapMState extends State<HesapM> {
  num s1, s2, cikti = 0;
  TextEditingController sayi1 =
      TextEditingController(); //textfield'in içindekileri okuyacak
  TextEditingController sayi2 = TextEditingController();

  Toplama() {
    setState(() {
      // state güncellensin ekrandaki değişiklik gözüksün
      s1 = num.parse(sayi1.text); // tip dönüşümü yapıldı
      s2 = num.parse(sayi2.text);
      cikti = s1 + s2;
    });
  }

  Carpma() {
    setState(() {
      s1 = num.parse(sayi1.text);
      s2 = num.parse(sayi2.text);
      cikti = s1 * s2;
    });
  }

  Bolme() {
    setState(() {
      s1 = num.parse(sayi1.text);
      s2 = num.parse(sayi2.text);
      cikti = s1 / s2;
    });
  }

  Cikarma() {
    setState(() {
      s1 = num.parse(sayi1.text);
      s2 = num.parse(sayi2.text);
      cikti = s1 - s2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(35),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: TextField(
                controller: sayi1,
                //style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            Container(
              child: TextField(
                controller: sayi2,
                //style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 40.0, bottom: 50.0),
                child: Text(
                  cikti.toString(),
                  //style: TextStyle(fontSize: 25, color: Colors.white),
                )),
            RaisedButton(
                child: const Text(
                  '+',
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                color: Colors.green,
                onPressed: Toplama),
            RaisedButton(
                child: const Text(
                  '-',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                color: Colors.red,
                onPressed: Cikarma),
            RaisedButton(
                child: const Text(
                  '*',
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                color: Colors.amber,
                onPressed: Carpma),
            RaisedButton(
                child: const Text(
                  '/',
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                color: Colors.purple,
                onPressed: Bolme),
          ],
        ),
      ),
    );
  }
}
