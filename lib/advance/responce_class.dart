class  ResponseClass<T>{
  String message;
  bool success;
  T? data;

  ResponseClass({
    required this.message,
    required this.success,
    this.data,
});
}