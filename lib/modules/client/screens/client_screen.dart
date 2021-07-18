import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class ClientScreen extends StatefulWidget {
  ClientScreen({Key? key}) : super(key: ClientRoutes.key);
  @override
  _ClientScreenState createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {

  @override
  Widget build(BuildContext context) {
    return ClientTemplate(
      children: [
        Container()
      ],
    );
  }

}
