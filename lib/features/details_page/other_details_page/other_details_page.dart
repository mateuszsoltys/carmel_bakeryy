import 'package:carmel_bakeryy/data/remote_data_sources/other_remote_data_source.dart';
import 'package:carmel_bakeryy/features/details_page/other_details_page/cubit/other_details_cubit.dart';
import 'package:carmel_bakeryy/models/widgets/AnimatedArrowWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtherDetailsPage extends StatelessWidget {
  const OtherDetailsPage({required this.id, Key? key}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OtherDetailsCubit(OtherRemoteDataSource())..getDetailsWithID(id),
      child: BlocBuilder<OtherDetailsCubit, OtherDetailsState>(
        builder: (context, state) {
          final detail = state.detailsState;
          if (detail == null) {
            return const CircularProgressIndicator();
          }
          return Dismissible(
            key: const Key('key'),
            direction: DismissDirection.vertical,
            onDismissed: (_) => Navigator.of(context).pop(),
            child: Scaffold(
                body: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(image: NetworkImage(detail.Av_URL)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(detail.Name),
                          const Spacer(),
                          Text('PRODUKT DOSTĘPNY',
                              style: detail.Availability
                                  ? const TextStyle(color: Colors.green)
                                  : const TextStyle(color: Colors.red))
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text('Składniki'),
                          Text(detail.Ingredients),
                        ],
                      ),
                      const VerticalDivider(
                        thickness: 5.0,
                        color: Colors.black,
                      ),
                      Column(
                        children: [
                          const Text('Krótki opis'),
                          Text(detail.Description),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text('Zmień stan'),
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 76, 216, 33),
                        onPrimary: Colors.deepPurple)),
                const AnimatedArrowDown()
              ],
            )),
          );
        },
      ),
    );
  }
}
