class ExploreState {
  bool isLoading;
  List categories;

  ExploreState({
    this.isLoading = false,
    this.categories = const [],
    });

    ExploreState copyWith({
    bool? isLoading,
    List? categories,
    }) {
    return ExploreState(
      isLoading: isLoading ?? this.isLoading,
      categories: categories ?? this.categories,
    );
    }
}