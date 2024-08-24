import 'package:flutter/material.dart';
import 'package:v164_callbackfunc_uygulamasasonu/constants/app_constants.dart';
import 'package:v164_callbackfunc_uygulamasasonu/helper/data_helper.dart';

class KrediDropdownWidget extends StatefulWidget {
  final onKrediSecildi;
  const KrediDropdownWidget({super.key, this.onKrediSecildi});

  @override
  State<KrediDropdownWidget> createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  double secilenKrediDegeri = 1;

  @override
  Widget build(BuildContext context) {
    print("kredi dropdown build");
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropdownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        value: secilenKrediDegeri,
        items: DataHelper.tumDerslerinKredileri(),
        onChanged: (value) {
          setState(() {
            secilenKrediDegeri = value!;
            widget.onKrediSecildi(secilenKrediDegeri);
          });
        },
        iconEnabledColor: Sabitler.anaRenk.shade200,
        underline: SizedBox(),
      ),
    );
  }
}
