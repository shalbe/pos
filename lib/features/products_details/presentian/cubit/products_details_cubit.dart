import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_project/features/products_details/presentian/cubit/products__details_state.dart';

class ProductsDetailsCubit extends Cubit<ProductsDetailsStates> {
  ProductsDetailsCubit() : super(IntitialProductsDetailsState());
  static ProductsDetailsCubit get(context) => BlocProvider.of(context);

}
