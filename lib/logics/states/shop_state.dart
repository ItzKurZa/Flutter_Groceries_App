class ShopState {
  final bool isLoading;
  final List exclusiveOffers;
  final List bestSelling;
  final List groceryTypes;
  final List groceries;


  ShopState({
    this.isLoading = false,
    List? exclusiveOffers,
    List? bestSelling,
    List? groceryTypes,
    List? groceries,
  }) : groceries = groceries ?? [],
       exclusiveOffers = exclusiveOffers ?? [],
       bestSelling = bestSelling ?? [],
       groceryTypes = groceryTypes ?? [];

  ShopState copyWith({
    bool? isLoading,
    List? exclusiveOffers,
    List? bestSelling,
    List? groceryTypes,
    List? groceries,
  }) {
    return ShopState(
      isLoading: isLoading ?? this.isLoading,
      groceries: groceries ?? this.groceries,
      exclusiveOffers: exclusiveOffers ?? this.exclusiveOffers,
      bestSelling: bestSelling ?? this.bestSelling,
      groceryTypes: groceryTypes ?? this.groceryTypes,
    );
  }
}