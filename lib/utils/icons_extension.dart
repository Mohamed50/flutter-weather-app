extension IconAsset on String {
  static String fromIconCode(String iconCode) {
    switch (iconCode) {
      case '03d':
      case '03n':
        return '03';
      case '04d':
      case '04n':
        return '04';
      case '09d':
      case '09n':
        return '09';
      case '11d':
      case '11n':
        return '11';
      case '13d':
      case '13n':
        return '13';
      default:
        return '$iconCode';
    }
  }
}
