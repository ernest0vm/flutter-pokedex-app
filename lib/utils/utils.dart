bool? _isEmpty(dynamic value) {
  if (value is String) {
    return value.toString().trim().isEmpty;
  }
  if (value is Iterable || value is Map) {
    return value.isEmpty as bool?;
  }
  return false;
}

class Utils {
  /// Checks if data is null.
  static bool isNull(dynamic value) => value == null;

  /// Checks if data is null or blank (empty or only contains whitespace).
  static bool? isNullOrBlank(dynamic value) {
    if (isNull(value)) {
      return true;
    }

    // Pretty sure that isNullOrBlank should't be validating
    // iterables... but I'm going to keep this for compatibility.
    return _isEmpty(value);
  }

  /// Checks if data is null or blank (empty or only contains whitespace).
  static bool? isBlank(dynamic value) => _isEmpty(value);

  /// Capitalize each word inside string
  /// Example: your name => Your Name, your name => Your name
  static String? capitalize(String value) {
    if (isNull(value)) return null;
    if (isBlank(value)!) return value;
    return value.split(' ').map(capitalizeFirst).join(' ');
  }

  /// Uppercase first letter inside string and let the others lowercase
  /// Example: your name => Your name
  static String? capitalizeFirst(String s) {
    if (isNull(s)) return null;
    if (isBlank(s)!) return s;
    return s[0].toUpperCase() + s.substring(1).toLowerCase();
  }

  /// Convert decimeters to centimeters
  static String dmToCm(int decimeters) => '${decimeters * 10} cm';

  /// Convert decimeters to feets
  static String dmToFt(int decimeters) =>
      '${(decimeters / 3.048).toStringAsFixed(2)} ft';

  /// Convert hectograms to pounds
  static String hgToLb(int hectograms) =>
      '${(hectograms / 4.536).toStringAsFixed(2)} lb';

  /// Convert hectograms to kilograms
  static String hgToKg(int hectograms) =>
      '${(hectograms / 10).toStringAsFixed(2)} kg';

  /// Get gender percent by gender rate
  static String genterPercent(int rate) =>
      '${((100 / 8) * rate).toStringAsFixed(1)} %';
}
