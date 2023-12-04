import 'package:bloc/bloc.dart';
import 'package:blocapicall/repos/repository.dart';
import 'package:blocapicall/repos/usermodel.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final Repos _repos;

  UserBloc(this._repos) : super(UserLoading()) {
    on<LaodUserEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final user = await _repos.getUser();
        emit(UserLoaded(user));
      } catch (e) {
        // emit(UserError(e.toString()));
      }
    });
  }
}
