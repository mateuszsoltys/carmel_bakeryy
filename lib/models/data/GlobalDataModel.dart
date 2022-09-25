class GlobalDataModel {
  final bool? open;
  final bool? admin;
  final String? user;

  GlobalDataModel(
      {required this.open, required this.admin, required this.user});

  GlobalDataModel copyWith({
    bool? open,
    bool? admin,
    String? user,
  }) {
    return GlobalDataModel(
      open: open ?? this.open,
      admin: admin ?? this.admin,
      user: user ?? this.user,
    );
  }
}
