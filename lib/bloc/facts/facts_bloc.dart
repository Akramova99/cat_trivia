
import 'package:bloc/bloc.dart';
import '../../service/reprository.dart';
import 'facts_event.dart';
import 'facts_state.dart';


class FactsBloc extends Bloc<FactsEvent, FactsState> {
  final CatFactRepository repository;

  FactsBloc(this.repository) : super(FactsInitial());

  @override
  Stream<FactsState> mapEventToState(FactsEvent event) async* {
    if (event is FetchFacts) {
      yield FactsLoading();
      try {
        final facts = await repository.fetchCatFacts();
        yield FactsLoaded(facts);
      } catch (e) {
        yield FactsError(e.toString());
      }
    }
  }
}