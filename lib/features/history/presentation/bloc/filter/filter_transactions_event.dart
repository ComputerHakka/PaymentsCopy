part of 'filter_transactions_bloc.dart';

sealed class FilterTransactionsEvent extends Equatable {
  const FilterTransactionsEvent();

  @override
  List<Object> get props => [];
}

class ChangeFilterEvent extends FilterTransactionsEvent {}
