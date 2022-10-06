abstract class CounterStates{}

class CounterInitialState extends CounterStates{}

class CounterChangeState extends CounterStates{}

class CounterMinusState extends CounterStates{
  final int counter;

  CounterMinusState(this.counter);
}

class CounterPlusState extends CounterStates{
  final int counter;

  CounterPlusState(this.counter);
}

class CounterRefreshState extends CounterStates{
  final int counter;


  CounterRefreshState(this.counter);
}