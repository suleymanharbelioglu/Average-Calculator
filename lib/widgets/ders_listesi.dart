import 'package:average_calculator/constants/app_constants.dart';
import 'package:average_calculator/helper/data_helper.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanCikarildi;
  const DersListesi({super.key, required this.onElemanCikarildi});

  @override
  Widget build(BuildContext context) {
    print("derslisteis build .................................");
    return DataHelper.tumEklenenDersler.length > 0
        ? ListView.builder(
            itemCount: DataHelper.tumEklenenDersler.length,
            itemBuilder: (context, index) {
              var ders = DataHelper.tumEklenenDersler[index];
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  onElemanCikarildi(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text((ders.krediDegeri * ders.harfDegeri)
                            .toStringAsFixed(0)),
                      ),
                      title: Text(ders.ad),
                      subtitle: Text(
                          "kredi degeri : ${ders.krediDegeri} harf degeri : ${ders.harfDegeri}"),
                    ),
                  ),
                ),
              );
            },
          )
        : Center(
            child: Text(
              "Lütfen Ders Ekleyin",
              style: Sabitler.baslikStyle,
            ),
          );
  }
}
