/// Set the name and the break point of this sreen
class ElScreen<T> {
  /// Choose a [name] of any type [T] you prefer for this breakpoint
  final T name;
  /// Breakpoint of type int
  final int breakpoint;

  ElScreen({
    required this.name,
    required this.breakpoint,
  });
}
