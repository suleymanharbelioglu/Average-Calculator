import 'package:flutter/material.dart';
import 'package:v164_callbackfunc_uygulamasasonu/constants/app_constants.dart';
import 'package:v164_callbackfunc_uygulamasasonu/widgets/ortalama_hesapla_app.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Dinamik Ortalama Hesapla',
      home: OrtalamaHesaplaApp(),
    );
  }
}
