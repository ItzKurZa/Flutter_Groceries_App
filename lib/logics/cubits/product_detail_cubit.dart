import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hello_world/logics/states/product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit()
    : super(
        ProductDetailState(
          image: '',
          name: '',
          details: '',
          description: '',
          price: '',
          amount: 1,
          isFavorited: false,
          isLoading: false,
          removeDisable: false,
          addDisable: false,
        ),
      );

  void setProductDetails({
    required String image,
    required String name,
    required String details,
    required String description,
    required String price,
  }) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(Duration(seconds: 2));

    emit(
      state.copyWith(
        image: image,
        name: name,
        details: details,
        description: description,
        price: price,
        isLoading: false,
        removeDisable: true,
      ),
    );
  }

  void toggleFavorite() {
    emit(state.copyWith(isFavorited: !state.isFavorited));
  }

  void incrementAmount() {
    if (state.amount < 5) {
      emit(state.copyWith(amount: state.amount + 1));
      if (state.removeDisable == true) {
        emit(state.copyWith(removeDisable: false));
      } else if (state.amount == 5) {
        emit(state.copyWith(addDisable: true));
      }
    }
  }

  void decrementAmount() {
    if (state.amount > 1) {
      emit(state.copyWith(amount: state.amount - 1));
      if (state.addDisable == true) {
        emit(state.copyWith(addDisable: false));
      } else if (state.amount == 1) {
        emit(state.copyWith(removeDisable: true));
      }
    }
  }
}
