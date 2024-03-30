part of 'pizza_bloc.dart';

sealed class PizzaState extends Equatable {
  const PizzaState();

  @override
  List<Object> get props => [];
}

final class PizzaInitial extends PizzaState {}

final class GetPizzaSuccess extends PizzaState {
  final List<Pizza> pizzas;

  const GetPizzaSuccess(this.pizzas);

  @override
  List<Object> get props => [pizzas];
}

final class GetPizzaFailure extends PizzaState {}

final class GetPizzaLoading extends PizzaState {}
