import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class HeaderScreen extends StatefulWidget {
  final String? title;

  HeaderScreen({this.title});

  @override
  _HeaderScreenState createState() => _HeaderScreenState();
}

class _HeaderScreenState extends State<HeaderScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ClientBloc>(context).add(OnClientDetail());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientBloc, ClientState>(
      buildWhen: (previous, current) => previous.client != current.client,
      builder: (BuildContext context, ClientState state) {
        return HeaderBar(title: widget.title, description: state.client.name, subdescription: state.client.phone, label: state.client.satker,);
      }
    );
  }
}
