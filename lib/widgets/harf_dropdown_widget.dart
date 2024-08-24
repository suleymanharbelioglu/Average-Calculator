import 'package:average_calculator/constants/app_constants.dart';
import 'package:average_calculator/helper/data_helper.dart';
import 'package:flutter/material.dart';

class HarfDropdownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropdownWidget({super.key, required this.onHarfSecildi});

  @override
  State<HarfDropdownWidget> createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
  double secilenHarfDegeri = 4;

  @override
  Widget build(BuildContext context) {
    print("harf dropdown build");
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropdownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        value: secilenHarfDegeri,
        items: DataHelper.tumDerslerinHarfleri(),
        onChanged: (value) {
          setState(() {
            secilenHarfDegeri = value!;
            widget.onHarfSecildi(secilenHarfDegeri);
          });
        },
        iconEnabledColor: Sabitler.anaRenk.shade200,
        underline: SizedBox(),
      ),
    );
  }
}
