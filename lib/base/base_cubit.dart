import 'package:bloc/bloc.dart';

abstract class BaseCubit<Dao> extends Cubit<Dao> {
  BaseCubit(Dao state) : super(state);
}
