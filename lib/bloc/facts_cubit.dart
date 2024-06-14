import 'package:bloc/bloc.dart';
import 'package:cat_trivia/service/net_service.dart';

import '../model/cat_facts.dart';

class FactsCubit extends Cubit<List<Cat>> {
  FactsCubit() : super([]);

  void parsingResponse() async {
    var response = await NetworkService.GET_LESSON_METHOD({});

    emit(NetworkService.parsingResponse(response!));
    print("After: ______________________________________${state[0].id}");
  }
}
