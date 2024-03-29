import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(userRepository) : super(SignInInitial()) {
    on<SignInRequired>((event, emit) async {
      emit(SignInLoading());
      try {
        // todo sign in request
        await Future.delayed(const Duration(seconds: 2));
      } catch (e) {
        emit(SignInError());
      }
    });
  }
}
