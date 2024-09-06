import 'package:base_flutter_app/generated/l10n.dart';
import 'package:base_flutter_app/src/utils/barrel_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (p, c) => p.statusLoading != c.statusLoading,
      listener: (context, state) {},
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.current.app_name), // example use localizations
        ),
        body: Container(),
      ),
    );
  }
}
