import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:intl/intl.dart';
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
  String? _date, _gasoline, _base, _location;
  int? _vehicle;

  void _onLoad() async {
    _file = await ImageUtils.load();
    final _res = await FlutterImageCompress.compressWithFile(_file!.absolute.path, minWidth: 1500, minHeight: 1500, quality: 80);
    _base = base64Encode(_res!);
    print(_base);
    setState(() {});
  }

  void _onTime(DateTime d) {
    _date = DateFormat('yyyy-MM-dd').format(d);

  }

  void _onCar(Map<String, dynamic> d) {
    _vehicle = d['id'];
  }

  void _onGas(String s) {
    _gasoline = s;
  }

  void _onSubmit() {
    Map<String, dynamic> _post = {
      'kendaraan_id': _vehicle.toString(),
      'tanggal_klaim': _date ?? DateFormat('yyyy-MM-dd').format(DateTime.now()),
      'lokasi': _location,
      'jenis_bbm': _gasoline,
      'jumlah_liter': _litreController.text,
      'total': _totalController.text,
      'receipt': _base
    };
    //print(_post);
    BlocProvider.of<ClaimBloc>(context).add(OnClaimPost(_post));
  }

  void _onLocation() {
    Navigator.of(context).pushNamed(MapRoutes.path);
  }

  void _onPosition(String s) {
    _location = s;
  }

  @override
  Widget build(BuildContext context) {
    return ClaimTemplate(
      children: [
        HeaderScreen(title: 'INPUT TRANSAKSI BARU',),
        BoardContainer(),
        BottomCard(
          child: ClaimForm(
            map:OnMapScreen(onLocation: _onLocation, onResult: _onPosition),
            locationController: _locationController,
            litreController: _litreController,
            totalController: _totalController,
            vehicle: VehicleListScreen(onChange: _onCar,),
            gasoline:GasolineScreen(onChange: _onGas),
            onTime: _onTime,
            onLoad: _onLoad,
            onSubmit: _onSubmit,
            receipt: _file,
            edit:false,
          ),
        )
      ],
    );
  }

}
