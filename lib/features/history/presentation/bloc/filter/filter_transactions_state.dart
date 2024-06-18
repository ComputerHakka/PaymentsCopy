part of 'filter_transactions_bloc.dart';

sealed class FilterTransactionsState extends Equatable {
  const FilterTransactionsState(
      {this.transactions, this.dates, required this.filters});

  final List<TransactionEntity>? transactions;
  final List<bool> filters;
  final List<DateTime>? dates;

  @override
  List<Object?> get props => [transactions, filters, dates];
}

final class FilterTransactionsLoadingState extends FilterTransactionsState {
  const FilterTransactionsLoadingState(
      {super.filters = const [true, false, false, false]});
}

final class FilterTransactionsFilterState extends FilterTransactionsState {
  const FilterTransactionsFilterState(
      {super.transactions, super.dates, required super.filters});
}
