import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class GasolineScreen extends StatefulWidget {
  final Function? onChange;
  final String? value;

  GasolineScreen({this.onChange, this.value});

  @override
  _GasolineScreenState createState() => _GasolineScreenState();
}

class _GasolineScreenState extends State<GasolineScreen> {
  late List<String> _gasoline;
  @override
  void initState() {
    super.initState();
    _gasoline = [];
    BlocProvider.of<GasolineBloc>(context).add(OnGasolineList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GasolineBloc, GasolineState>(
      buildWhen: (previous, current) => previous.gasoline.list != current.gasoline.list,
      builder: (BuildContext context, GasolineState state) {
        print(state.gasoline.list);
        if(state.gasoline.list != null && state.gasoline.list!.isNotEmpty) {
          _gasoline = ['Pilih BBM'];
          state.gasoline.list!.map((GasolineModel e) => _gasoline.add(e.deskripsi!) ).toList();
        }
        if(state.status == GasolineStatus.DONE) {
          return DropMenuButton(value: widget.value ?? _gasoline[0], items: _gasoline, onChange: widget.onChange,);
        } else {
          return Container();
        }
      }
    );
  }

}
