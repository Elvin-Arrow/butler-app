class SearchRepository{

  String getPopularity(String raw) {
    double popularity;
    try {
      popularity = double.parse(raw);
    } catch (_) {
      return '0.0';
    }
    return (popularity / 10).toStringAsFixed(1);
  }

}