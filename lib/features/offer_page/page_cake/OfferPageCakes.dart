import 'package:carmel_bakeryy/app/cubit/root_cubit.dart';
import 'package:carmel_bakeryy/models/widgets/PlaceStatusIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/widgets/AnimatedArrowWidget.dart';

class OfferPageCakes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, RootState>(
      builder: (context, state) {
        bool? indicator = state.open;
        return Scaffold(
          appBar: AppBar(
            leading: indicator == null
                ? Container(
                    height: 50, width: 50, child: CircularProgressIndicator())
                : PlaceStatusIndicator(indicator: indicator),
            title: const Center(
              child: Text('CIASTA'),
            ),
            actions: [
              Column(
                children: [
                  AnimatedArrowRight(),
                  const Text("NAPOJE"),
                ],
              )
            ],
          ),
          body: ListView(
            children: [
              Text('dane z Firebase'),
            ],
          ),
        );
      },
    );
  }
}
