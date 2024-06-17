part of 'filter_transactions_bloc.dart';

sealed class FilterTransactionsState extends Equatable {
  const FilterTransactionsState();
  
  @override
  List<Object> get props => [];
}

final class FilterTransactionsInitial extends FilterTransactionsState {}
