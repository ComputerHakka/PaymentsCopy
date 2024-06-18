part of 'filter_transactions_bloc.dart';

sealed class FilterTransactionsEvent extends Equatable {
  const FilterTransactionsEvent({required this.index});
  final int index;

  @override
  List<Object> get props => [index];
}

class ChangeFilterEvent extends FilterTransactionsEvent {
  const ChangeFilterEvent({required super.index});
}
