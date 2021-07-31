import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sipbilroid/widgets/widgets.dart';
import 'package:sipbilroid/modules/modules.dart';

class ClientScreen extends StatefulWidget {
  ClientScreen({Key? key}) : super(key: ClientRoutes.key);
  @override
  _ClientScreenState createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {

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
        print(state.client);
        return ClientTemplate(
          children: [
            HeaderScreen(),
            BottomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: .6.sh,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: PrimaryButton(label: 'Logout',),
                    ),
                    SizedBox(height: .1.sh,)
                  ],
                ),
              )
          ],
        );
      }
    );
  }
}
