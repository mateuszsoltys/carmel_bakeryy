part of 'root_cubit.dart';

@immutable
class RootState {
  final bool? open;
  final bool? admin;

  RootState({required this.open, required this.admin});

  RootState copyWith({
    final bool? open,
    final bool? admin,
  }) {
    return RootState(open: open ?? this.open, admin: admin ?? this.admin);
  }
}
