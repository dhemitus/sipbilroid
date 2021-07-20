import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';
import 'package:sipbilroid/shareds/shareds.dart';

class DetailScreen extends StatefulWidget {

  DetailScreen({Key? key}) : super(key: ClaimRoutes.detail);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>{

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ClaimModel _claim = ModalRoute.of(context)!.settings.arguments as ClaimModel;
      BlocProvider.of<ClaimBloc>(context).add(OnClaimDetail(_claim));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('detail'),);
  }
}
