extension StringExtension on String {
  String capitalize() {
    var valueReturn = "";
    if (this.isNotEmpty) {
      valueReturn = "${this[0].toUpperCase()}${this.substring(1)}";
    }
    return valueReturn;
  }

  String capitalizeWords() {
    return "${this.split(" ").map((str) => str.capitalize()).join(" ")}";
  }
}
