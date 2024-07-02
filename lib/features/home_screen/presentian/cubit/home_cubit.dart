import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_project/features/home_screen/presentian/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(IntitialHomeState());
  static HomeCubit get(context) => BlocProvider.of(context);

}
