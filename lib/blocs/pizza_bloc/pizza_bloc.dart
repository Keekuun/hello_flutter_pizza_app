import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pizza_repository/pizza_repository.dart';

part 'pizza_event.dart';

part 'pizza_state.dart';

class PizzaBloc extends Bloc<PizzaEvent, PizzaState> {
  final PizzaRepository _pizzaRepository;

  PizzaBloc(this._pizzaRepository) : super(PizzaInitial()) {
    on<GetPizza>((event, emit) async {
      emit(GetPizzaLoading());
      try {
        final pizzas = await _pizzaRepository.getPizzas();
        emit(GetPizzaSuccess(pizzas));
      } catch (e) {
        emit(GetPizzaFailure());
      }
    });
  }
}
