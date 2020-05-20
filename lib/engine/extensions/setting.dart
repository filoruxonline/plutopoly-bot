class Setting<T> {
  String title;
  Function(T) onChanged;
  String subtitle = "";
  T Function() value;
  Setting({
    this.title,
    this.onChanged,
    this.value,
    this.subtitle = "",
  });
}
