abstract class Responsive<T> {
  final T desktop;
  final T mobile;

  const Responsive(
    this.desktop,
    this.mobile,
  );
}
