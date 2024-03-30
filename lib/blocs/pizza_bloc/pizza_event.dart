part of 'pizza_bloc.dart';

sealed class PizzaEvent extends Equatable {
  const PizzaEvent();

  @override
  List<Object> get props => [];
}

class GetPizza extends PizzaEvent {}
