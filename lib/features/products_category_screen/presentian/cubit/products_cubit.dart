import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_project/features/products_category_screen/presentian/cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(IntitialProductsState());
  static ProductsCubit get(context) => BlocProvider.of(context);

}
