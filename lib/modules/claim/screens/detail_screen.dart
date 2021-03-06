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

class DetailScreen extends StatefulWidget {

  DetailScreen({Key? key}) : super(key: ClaimRoutes.detail);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>{
  TextEditingController _litreController = TextEditingController();
  TextEditingController _totalController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  File? _file;
  String? _date, _gasoline, _base, _location;

  void _onLoad() async {
    _file = await ImageUtils.load();
    final _res = await FlutterImageCompress.compressWithFile(_file!.absolute.path, minWidth: 1500, minHeight: 1500, quality: 80);
    _base = base64Encode(_res!);
    setState(() {});
  }

  void _onTime(DateTime d) {
    _date = Format.dashDate().format(d);
  }

  void _onGas(String s) {
    _gasoline = s;
  }

  void _onSubmit() {
    ClaimModel _claim = ModalRoute.of(context)!.settings.arguments as ClaimModel;
    Map<String, dynamic> _post = {
      'id': _claim.id.toString(),
      'tanggal_klaim': _date ?? Format.dashDate().format(_claim.tanggalKlaim!),
      'lokasi': _location ?? _claim.lokasi,
      'jenis_bbm': _gasoline ?? _claim.jenisBbm,
      'jumlah_liter': _litreController.text,
      'total': _totalController.text,
      'receipt': _base
    };
    BlocProvider.of<ClaimBloc>(context).add(OnClaimUpdate(_post));
  }

  void _onLocation() {
    Navigator.of(context).pushNamed(MapRoutes.path);
  }

  void _onPosition(String s) {
    _location = s;
  }

  @override
  void initState() {
    super.initState();

  }

  void _onSuccess() {
    showDialog(context: context, builder: (BuildContext context){
      return WarnDialog(warn:'update klaim berhasil');
    });
  }

  @override
  Widget build(BuildContext context) {
    ClaimModel _claim = ModalRoute.of(context)!.settings.arguments as ClaimModel;

    _locationController.text = _claim.lokasi!;
    _litreController.text  = _claim.jumlahLiter!.toString();
    _totalController.text = _claim.total!.toString();
    bool _enable = true;
    if(_claim.status == 'TERKONFIRMASI' || _claim.status == 'TERVERIVIKASI') {
      _enable = false;
    }
    return BlocBuilder<ClaimBloc, ClaimState>(
      buildWhen: (previous, current) => previous.claim != current.claim,
      builder: (BuildContext context, ClaimState state) {
        if(state.claim.message == 'update success') {
          WidgetsBinding.instance!.addPostFrameCallback((_) { 
            _onSuccess();
          });
        }
        return ClaimTemplate(
          children: [
            HeaderScreen(title: 'DETAIL TRANSAKSI'),
            BoardContainer(),
            BottomCard(
              child: ClaimForm(
                map: OnMapScreen(onLocation: _onLocation, onResult: _onPosition, location: _claim.lokasi, enable: _enable),
                date: _claim.tanggalKlaim,
                locationController: _locationController,
                litreController: _litreController,
                totalController: _totalController,
                vehicle: VehicleListScreen(plate: _claim.nomorPolisi, edit: true),
                gasoline:GasolineScreen(onChange: _onGas, value: _claim.jenisBbm, enable: _enable),
                onTime: _onTime,
                onLoad: _onLoad,
                onSubmit: _onSubmit,
                receipt: _file,
                edit: true,
                enable: _enable,
                url: 'http://151.106.113.7/bbm-claim-api${_claim.struk}',
              ),
            )
          ],
        );
      }
    );
  }
}
