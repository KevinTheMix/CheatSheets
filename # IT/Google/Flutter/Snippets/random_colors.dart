
// Generate random Colors:

// https://fluttercentral.com/Articles/Post/1182/How_to_generate_random_colors_in_flutter_or_dart
class UniqueColorGenerator {
  static Random random = new Random();
  static Color getColor() {
    return Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}
