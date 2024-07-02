import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_project/features/profile_screen/presentian/cubit/profile_state.dart';
// 
class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(IntitialProfileState());
  static ProfileCubit get(context) => BlocProvider.of(context);

  
}
