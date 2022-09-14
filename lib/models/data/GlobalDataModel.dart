class GlobalDataModel {
  final bool? open;
  final String? admin1;
  final String? admin2;
  final String? user;

  GlobalDataModel(
      {required this.open,
      required this.admin1,
      required this.admin2,
      required this.user});

  GlobalDataModel copyWith({
    final bool? open,
    final String? admin1,
    final String? admin2,
    final String? user,
  }) {
    return GlobalDataModel(
        open: open ?? this.open,
        admin1: admin1 ?? this.admin1,
        admin2: admin2 ?? this.admin2,
        user: user ?? this.user);
  }
}
