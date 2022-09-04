import 'package:carmel_bakeryy/data/remote_data_sources/other_remote_data_source.dart';
import 'package:carmel_bakeryy/features/details_page/other_details_page/other_details_page.dart';
import 'package:carmel_bakeryy/features/offer_page/page_other/cubit/page_other_cubit.dart';
import 'package:carmel_bakeryy/models/Route/my_page_route.dart';
import 'package:carmel_bakeryy/models/pages/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/widgets/AnimatedArrowWidget.dart';
import '../../../models/widgets/OfferWidgetModel.dart';

class OfferPageOther extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageOtherCubit(OtherRemoteDataSource())..start(),
      child: BlocBuilder<PageOtherCubit, PageOtherState>(
        builder: (context, state) {
          final otherDatas = state.dataOther;
          if (otherDatas == null) {
            return LoadingPage();
          }
          return Scaffold(
            appBar: AppBar(
              leading: Column(
                children: [
                  AnimatedArrowLeft(),
                  const Text("NAPOJE"),
                ],
              ),
              title: const Center(
                child: Text('INNE'),
              ),
              actions: [
                const SizedBox(
                  height: 30,
                  width: 50,
                )
              ],
            ),
            body: ListView(
              children: [
                for (final otherData in otherDatas)
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MyPageRoute(OtherDetailsPage(
                              id: otherData.id,
                            )));
                      },
                      child: OfferWidgetModel(offerDataModel: otherData))
              ],
            ),
          );
        },
      ),
    );
  }
}
