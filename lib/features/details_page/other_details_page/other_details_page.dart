import 'package:carmel_bakeryy/data/remote_data_sources/other_remote_data_source.dart';
import 'package:carmel_bakeryy/features/details_page/other_details_page/cubit/other_details_cubit.dart';
import 'package:carmel_bakeryy/models/data/OfferDetailsDataModel.dart';
import 'package:carmel_bakeryy/models/pages/loading_page.dart';
import 'package:carmel_bakeryy/models/widgets/AnimatedArrowWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app/cubit/root_cubit.dart';

class OtherDetailsPage extends StatelessWidget {
  const OtherDetailsPage({required this.id, Key? key}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OtherDetailsCubit(OtherRemoteDataSource())..getDetailsWithID(id),
      child: BlocBuilder<OtherDetailsCubit, OtherDetailsState>(
        builder: (context, details) {
          final detail = details.detailsState;
          return BlocBuilder<RootCubit, RootState>(
            builder: (context, root) {
              bool? admin = root.admin;

              if (admin == null || detail == null) {
                return const LoadingPage();
              }
              return Dismissible(
                // key: UniqueKey(),
                // key: Key(UniqueKey().toString()),
                key: const Key('1'),
                direction: DismissDirection.down,
                onDismissed: (_) => Navigator.of(context).pop(),
                child: Scaffold(
                    body: Column(
                  children: [
                    Header(detail: detail),
                    const SizedBox(
                      height: 20,
                    ),
                    DetailsDescription(detail: detail),
                    const SizedBox(
                      height: 50,
                    ),
                    admin
                        ? SwitchValueButton(id: id, detail: detail)
                        : const SizedBox(
                            height: 1,
                          ),
                    const AnimatedArrowDown()
                  ],
                )),
              );
            },
          );
        },
      ),
    );
  }
}

class SwitchValueButton extends StatelessWidget {
  const SwitchValueButton({
    Key? key,
    required this.id,
    required this.detail,
  }) : super(key: key);

  final String id;
  final OfferDetailsDataModel? detail;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context
              .read<OtherDetailsCubit>()
              .switchBoolAvailabilityWithRefresh(id, detail!.Availability);
        },
        child: Text(detail!.Availability
            ? 'Zmień na niedostępny'
            : 'Zmień na dostępny'),
        style: ElevatedButton.styleFrom(
            primary: detail!.Availability
                ? const Color.fromARGB(255, 216, 0, 0)
                : const Color.fromARGB(255, 76, 216, 33),
            onPrimary: Colors.deepPurple));
  }
}

class DetailsDescription extends StatelessWidget {
  const DetailsDescription({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final OfferDetailsDataModel? detail;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  'SKŁADNIKI:',
                  style: GoogleFonts.teko(fontSize: 25),
                ),
                Text(detail!.Ingredients,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.lobster(fontSize: 12)),
              ],
            ),
          ),
          const VerticalDivider(
            thickness: 5.0,
            color: Colors.black,
          ),
          Expanded(
            child: Column(
              children: [
                Text('OPIS PRODUKTU:', style: GoogleFonts.teko(fontSize: 25)),
                Text(
                  detail!.Description,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.lobster(fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final OfferDetailsDataModel? detail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              child: Image(
                fit: BoxFit.fitWidth,
                image: NetworkImage(detail!.Av_URL),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(99, 110, 25, 167),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(detail!.Name,
                    style: GoogleFonts.michroma(
                        fontSize: 14, color: Colors.white)),
                const Spacer(),
                detail!.Availability
                    ? Text('DOSTĘPNE',
                        style: GoogleFonts.michroma(
                            fontSize: 12, color: Colors.green))
                    : Text('NIEDOSTĘPNE',
                        style: GoogleFonts.michroma(
                            fontSize: 12, color: Colors.red))
              ],
            ),
          )
        ],
      ),
    );
  }
}
