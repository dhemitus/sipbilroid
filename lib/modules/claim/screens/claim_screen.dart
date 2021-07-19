import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class ClaimScreen extends StatefulWidget {
  ClaimScreen({Key? key}) : super(key: ClaimRoutes.claim);

  @override
  _ClaimScreenState createState() => _ClaimScreenState();
}

class _ClaimScreenState extends State<ClaimScreen> {
  TextEditingController _litreController = TextEditingController();
  TextEditingController _totalController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  File? _file;
  String? _date, _gasoline, _base;
  int? _vehicle;

  void _onLoad() async {
    _file = await ImageUtils.load();
    final _res = await FlutterImageCompress.compressWithFile(_file!.absolute.path, minWidth: 1500, minHeight: 1500, quality: 80);
    _base = base64Encode(_res!);
    _base = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAAD6BAMAAADpQ2fAAAAAG1BMVEXMzMwAAACysrJ/f3+ZmZlMTEwZGRlmZmYzMzOGFPoFAAAACXBIWXMAAA7EAAAOxAGVKw4bAAADFUlEQVR4nO3XwU/aYBjH8fq2iEerIhyLIu4I0wNHynC7UjVmRyEb2xGSZbuCS9z+7L3P25a+lUGy5WXJku8nsX2AQn8+ffu29TwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD8d9TVVZSVb67Xq3XnV4P0i2ci3S7I3nPmJgzD05nZTRKGjahcrQv0Z+GTVPuhqEt5kb/nSqXxJVK9hpRxfaC+HperdctPA/Uu7Eus71faa4kafokuxx2HsaqyA28+0i06jfRi2ber37iXRftIL/ZG+XvNiV68OnEYK3VwqP+OzA4f7WoTXw7d3ix/uYz0Qk2dx6rqILH556vHdrWRRGjmsYKaWc1dHkXD17GSyJQNu9poKbHyGBXTXW9v4TpW5TBtQLrDohLVyKz8vv2FRP/Feaz9R7OSkeBWUx+29Eh488iqzGcTs+ou7C88S6w8aDb2q0eOU6lp5AX1tO52isqsAjkvPb98SOVVN48Vp4PM3zYY/0KQPBU/GneKKltLu8rNMpt0Ww/TjxItz+801vvnUOYiP5t2mrOiylLrdr1olhlN8/GPbw9yMcjapupOY/0cy/+8OZa0q9ystD/JrVSTHcXSv9erbY0VnJ6Xm6WKl35tZ7H0D4+2xfLi8aK0+b51zi13GKt6shqwcSd4MeT1x2FU2ty+XOpM8S6GvFC1YoLoF9Vq18uJvXXF3r/OlE8Q7q/Vjc3TqcxZ6dyVS2bWCx1rV9Op533efPExc1ZstatSGkM61s4uPtKgtDmqVBkyZ9ntSkp3CnrjrE3NkeeYf7zlxsbMWUW7Dsoje7rDGxs54w/MiG0u7MpENpPUql2qfHNsbgjNmam23Qj9qQvZm1p25Hrdl5327cqKF2cp2x/yr8pdvNd9zN9ruzwR243rs/PEDOK3tUErOSlXmp+ugsisVHgnDxbyDDe+G7R65gEpGN+f3YR9h7G8nn6Wqpldqof1ak0QpnSGy7F+lEuP6IUub12m0jsarp48W8P1ags1HEarsu82FQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP6dXw2DcUWesEn2AAAAAElFTkSuQmCC';
    setState(() {});
  }

  void _onTime(DateTime d) {
    _date = Format.fullDate().format(d);

  }

  void _onCar(Map<String, dynamic> d) {
    _vehicle = d['id'];
  }
  void _onGas(String s) {
    _gasoline = s;
  }

  _onSubmit() {
    Map<String, dynamic> _post = {
      'kendaraan_id': _vehicle,
      'tanggal_klaim': _date,
      'lokasi': _locationController.text,
      'jenis_bbm': _gasoline,
      'jumlah_liter': _litreController.text,
      'total': _totalController.text,
      'receipt': _base
    };
    BlocProvider.of<ClaimBloc>(context).add(OnClaimPost(_post));
    //print(_post);
  }

  @override
  Widget build(BuildContext context) {
    return ClaimTemplate(
      children: [
        HeaderScreen(title: 'INPUT TRANSAKSI BARU',),
        BoardContainer(),
        BottomCard(
          child: ClaimForm(
            locationController: _locationController,
            litreController: _litreController,
            totalController: _totalController,
            vehicle: VehicleListScreen(onChange: _onCar,),
            gasoline:GasolineScreen(onChange: _onGas),
            onTime: _onTime,
            onLoad: _onLoad,
            onSubmit: _onSubmit,
            receipt: _file,
          ),
        )
      ],
    );
  }

}
