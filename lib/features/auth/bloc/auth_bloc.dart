import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/auth/bloc/auth_event.dart';
import '../../../features/auth/bloc/auth_state.dart';
import '../../../DI/di.dart';
import '../data/repository/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _repository = locator.get();

  AuthBloc() : super(AuthInitiateState()) {
    on<AuthLoginRequest>(
      (event, emit) async {
        emit(AuthLoadingState());
        var response = await _repository.login(event.username, event.password);
        emit(
          AuthResponseState(response),
        );
      },
    );

    on<AuthRegisterRequest>(
      (event, emit) async {
        emit(AuthLoadingState());
        var response = await _repository.register(
            event.username, event.password, event.passwordConfirm);
        emit(
          AuthResponseState(response),
        );
      },
    );
  }
}
