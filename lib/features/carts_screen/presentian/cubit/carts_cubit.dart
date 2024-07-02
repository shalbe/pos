import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_project/features/carts_screen/presentian/cubit/carts_state.dart';
import 'package:pos_project/features/profile_screen/presentian/cubit/profile_state.dart';
// 
class CartsCubit extends Cubit<CartsStates> {
  CartsCubit() : super(IntitialCartsState());
  static CartsCubit get(context) => BlocProvider.of(context);

  
}
