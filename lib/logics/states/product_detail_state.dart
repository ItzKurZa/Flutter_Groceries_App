class ProductDetailState {
  final String image;
  final String name;
  final String details;
  final String description;
  final String price;
  int amount;
  bool isFavorited;
  bool isLoading;
  bool removeDisable;
  bool addDisable;

  ProductDetailState({
    required this.image,
    required this.name,
    required this.details,
    required this.description,
    required this.price,
    this.amount = 1,
    this.isFavorited = false,
    this.isLoading = false,
    this.removeDisable = false,
    this.addDisable = false,
  });

  ProductDetailState copyWith({
    String? image,
    String? name,
    String? details,
    String? description,
    String? price,
    int? amount,
    bool? isFavorited,
    bool? isLoading,
    bool? removeDisable,
    bool? addDisable,
  }) {
    return ProductDetailState(
      image: image ?? this.image,
      name: name ?? this.name,
      details: details ?? this.details,
      description: description ?? this.description,
      price: price ?? this.price,
      amount: amount ?? this.amount,
      isFavorited: isFavorited ?? this.isFavorited,
      isLoading: isLoading ?? this.isLoading,
      removeDisable: removeDisable ?? this.removeDisable,
      addDisable: addDisable ?? this.addDisable,
    );
  }
}
