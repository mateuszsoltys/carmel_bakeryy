import 'package:carmel_bakeryy/app/cubit/root_cubit.dart';
import 'package:carmel_bakeryy/app/theme/global_theme.dart';
import 'package:carmel_bakeryy/data/remote_data_sources/global_remote_data_source.dart';
import 'package:carmel_bakeryy/features/auth_page/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RootCubit(GlobalRemoteDataSource())..initGlobalSteram(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Carmel Bakery',
            theme: GlobalTheme(),
            home: AuthGate(),
          );
        },
      ),
    );
  }
}
