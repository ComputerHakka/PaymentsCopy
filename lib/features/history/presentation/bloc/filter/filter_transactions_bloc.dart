import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:personal_payment_app/features/transactions/domain/entities/transaction.dart';

part 'filter_transactions_event.dart';
part 'filter_transactions_state.dart';

class FilterTransactionsBloc
    extends Bloc<FilterTransactionsEvent, FilterTransactionsState> {
  FilterTransactionsBloc() : super(const FilterTransactionsLoadingState()) {
    on<ChangeFilterEvent>(onFilterChangeEvent);
  }

  void onFilterChangeEvent(
      ChangeFilterEvent event, Emitter<FilterTransactionsState> emit) {
    final transactions = TransactionEntity.arrayOfTransactions;
    //TODO крч тут надо сделать тему чтобы даты тоже сортировались по типу операций, так как добавляются пустые дни в фильтры черз any

    Set<DateTime> uniqueDays = transactions
        .map((transaction) => DateTime(transaction.date.year,
            transaction.date.month, transaction.date.day))
        .toSet();
    List<DateTime> uniqueDaysList = uniqueDays.toList()
      ..sort((a, b) => b.compareTo(a));
    // var transactionsByPeriod = TransactionEntity.arrayOfTransactions
    //     .where((element) =>
    //         element.date.day == date.day && date.month == element.date.month)
    //     .toList();
    if (event.index == 0) {
      emit(FilterTransactionsFilterState(
          transactions: transactions,
          dates: uniqueDaysList,
          filters: const [true, false, false, false]));
    }
    if (event.index == 1) {
      final currentTransactions =
          transactions.where((t) => t.type == TransactionType.debit).toList();
      emit(FilterTransactionsFilterState(
          transactions: currentTransactions,
          dates: uniqueDaysList,
          filters: const [false, true, false, false]));
    }
    if (event.index == 2) {
      final currentTransactions =
          transactions.where((t) => t.type == TransactionType.refil).toList();
      emit(FilterTransactionsFilterState(
          transactions: currentTransactions,
          dates: uniqueDaysList,
          filters: const [false, false, true, false]));
    }
    if (event.index == 3) {
      final currentTransactions =
          transactions.where((t) => t.type == TransactionType.iot).toList();
      emit(FilterTransactionsFilterState(
          transactions: currentTransactions,
          dates: uniqueDaysList,
          filters: const [false, false, false, true]));
    }
  }
}
