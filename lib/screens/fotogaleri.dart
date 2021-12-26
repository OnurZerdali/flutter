import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class galeri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: galerigetir(),
    );
  }
}

class galerigetir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(AppLocalizations.of(context).gallery)),
      ),
      body: fotograflistesi(),
    );
  }
}

class fotograflistesi extends StatefulWidget {
  @override
  _fotograflistesiState createState() => _fotograflistesiState();
}

class _fotograflistesiState extends State<fotograflistesi> {
  int fotografNo = 1;
  int fotoaciklamaNo = 1;
  List<String> fotografAdlari = [
    'Ortaköy Camii',
    'Boğaz Köprüsü',
    'Kız Kulesi',
    'Galata Kulesi',
    'Çamlıca Tepesi'
  ];

  List<String> fotoaciklama = [
    'Büyük Mecidiye Camii ya da halk arasında bilinen adı ile Ortaköy Camii, İstanbul Boğaziçi’nde Beşiktaş ilçesinin, Ortaköy semtinde sahilde bulunan Neo Barok tarzında bir camiidir.Cami, Sultan Abdülmecid tarafından Mimar Nigoğos Balyan’a 1853 yılında yaptırılmıştır. Oldukça zarif bir yapı olan cami Barok üslubundadır. Boğaziçi’nde eşsiz bir konuma yerleştirilmiştir. Bütün selatin camilerinde olduğu gibi harim ve hünkar bölümü olmak üzere iki kısımdan oluşur. Geniş ve yüksek pencereler Boğaz’ın değişken ışıklarını caminin içine taşıyacak biçimde düzenlenmiştir.',
    '15 Temmuz Şehitler Köprüsü, eski adıyla Boğaziçi Köprüsü ya da boğaza inşa edilen ilk köprü olmasına atıfla halk arasında Birinci Köprü; Karadeniz ile Marmara Denizini birbirine bağlayan İstanbul Boğazı üzerinde yer alan üç asma köprüden biri ve ilkidir. Köprünün ayakları Avrupa Yakasında Ortaköy, Anadolu Yakasında Beylerbeyi semtlerindedir.',
    'Kız Kulesi, hakkında çeşitli rivayetler anlatılan, efsanelere konu olan, İstanbul Boğazının Marmara Denizine yakın kısmında, Salacak açıklarında yer alan küçük adacık üzerinde inşa edilmiş yapıdır.Üsküdarın sembolü haline gelen kule, Üsküdar’da Bizans devrinden kalan tek eserdir. MÖ 24 yıllarına kadar uzanan tarihi bir geçmişe sahip olan kule, Karadeniz’in Marmara ile birleştiği yerde küçük bir ada üzerinde kurulmuştur. ',
    'Galata Kulesi ya da müze olarak kullanılmaya başlaması sonrasındaki adıyla Galata Kulesi Müzesi, Türkiyenin İstanbul şehrinin Beyoğlu ilçesinde bulunan bir kuledir. Adını, bulunduğu Galata semtinden alır. Galata Surları dahilinde bir gözetleme kulesi olarak inşa edilen kule günümüzde, bir sergi alanı ve müze olarak kullanılır. Hem Beyoğlunun hem de İstanbulun sembol yapılarından biridir.',
    'Büyük Çamlıca Tepesi İstanbul Anadolu Yakası Üsküdar ilçesi sınırlarında yer alır. Büyük Çamlıca Tepesi (Sefa) denizden 268 m yüksekliktedir ve Nurbaba Tekkesi (Bektaşi) ve Küçük Çamlıca Televizyon Kulesi burada yer alır. Turing Başkanı Merhum Çelik Gülersoy tarafından restore edilerek halka kazandırılan ve tepede yer alan Büyük Çamlıca tesisler gerek doğal ve manzaralı bir konuma sahip olması gerekse hoş ve temiz havası yüzünden yerli yabancı turistlerin uğrak yeridir.'
  ];

  void fotografYenile() {
    setState(() {
      fotografNo = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(2),
              child: FlatButton(
                  highlightColor: Colors.white,
                  splashColor: Colors.white,
                  onPressed: fotografYenile,
                  child: Image.asset('images/istanbul$fotografNo.jpg')),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: Text(
                fotografAdlari[fotografNo - 1],
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: Text(
                fotoaciklama[fotografNo - 1],
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(60),
              child: Text(
                "Bir sonraki için fotoğrafın üstüne tıklayınız.",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
