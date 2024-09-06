enum StatusLoading { initial, loading, success, error }

extension StatusLoadingEx on StatusLoading {
  bool get isLoading => this == StatusLoading.loading;
  bool get isSuccess => this == StatusLoading.success;
  bool get isError => this == StatusLoading.error;
}
