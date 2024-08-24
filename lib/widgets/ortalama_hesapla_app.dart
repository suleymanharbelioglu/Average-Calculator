import 'package:flutter/material.dart';
import 'package:v164_callbackfunc_uygulamasasonu/constants/app_constants.dart';
import 'package:v164_callbackfunc_uygulamasasonu/helper/data_helper.dart';
import 'package:v164_callbackfunc_uygulamasasonu/model/ders.dart';
import 'package:v164_callbackfunc_uygulamasasonu/widgets/ders_listesi.dart';
import 'package:v164_callbackfunc_uygulamasasonu/widgets/harf_dropdown_widget.dart';
import 'package:v164_callbackfunc_uygulamasasonu/widgets/kredi_dropdpwn_widget.dart';
import 'package:v164_callbackfunc_uygulamasasonu/widgets/ortalama_goster.dart';

class OrtalamaHesaplaApp extends StatefulWidget {
  const OrtalamaHesaplaApp({super.key});

  @override
  State<OrtalamaHesaplaApp> createState() => _OrtalamaHesaplaAppState();
}

class _OrtalamaHesaplaAppState extends State<OrtalamaHesaplaApp> {
  var formKey = GlobalKey<FormState>();
  double secilenKrediDegeri = 1;
  double secilenHarfDegeri = 4;
  String olusturulanDersAdi = "";
  @override
  Widget build(BuildContext context) {
    print("ortalam hesapla app build .............................");
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          Sabitler.baslikText,
          style: Sabitler.baslikStyle,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                child: OrtalamaGoster(
                    ortalama: DataHelper.ortalamaHesapla(),
                    dersSayisi: DataHelper.tumEklenenDersler.length),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: DersListesi(
                onElemanCikarildi: (index) {
                  setState(() {
                    DataHelper.tumEklenenDersler.removeAt(index);
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.yatayPaddin8,
            child: _buildTextFormField(),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPaddin8,
                  child: HarfDropdownWidget(
                    onHarfSecildi: (harf) {
                      secilenHarfDegeri = harf;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPaddin8,
                  child: KrediDropdownWidget(
                    onKrediSecildi: (kredi) {
                      secilenKrediDegeri = kredi;
                    },
                  ),
                ),
              ),
              IconButton(
                iconSize: 30,
                color: Sabitler.anaRenk,
                onPressed: _dersEkleVeOrtalamaHesapla,
                icon: Icon(Icons.arrow_forward_ios_sharp),
              ),
            ],
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (newValue) {
        olusturulanDersAdi = newValue!;
      },
      validator: (value) {
        if (value!.length <= 0) {
          return "Ders adini giriniz";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: "Matematik",
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.5),
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  _dersEkleVeOrtalamaHesapla() {
    print("ders ekle ortalama hesapla fonksiyonu");
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: olusturulanDersAdi,
          harfDegeri: secilenHarfDegeri,
          krediDegeri: secilenKrediDegeri);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
