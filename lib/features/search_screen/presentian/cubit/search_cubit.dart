import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_project/features/search_screen/presentian/cubit/search_state.dart';
// 
class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(IntitialSearchState());
  static SearchCubit get(context) => BlocProvider.of(context);

  
}
