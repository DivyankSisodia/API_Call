part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();
}

class LaodUserEvent extends UserEvent {
  const LaodUserEvent();

  @override
  List<Object> get props => [];
}
