import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'filter_transactions_event.dart';
part 'filter_transactions_state.dart';

class FilterTransactionsBloc extends Bloc<FilterTransactionsEvent, FilterTransactionsState> {
  FilterTransactionsBloc() : super(FilterTransactionsInitial()) {
    on<FilterTransactionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
