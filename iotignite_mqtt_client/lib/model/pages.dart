class Pages{
  int size;
  int totalElements;
  int totalPages;
  int number;

  Pages(this.size, this.totalElements, this.totalPages, this.number);

  factory Pages.fromJson(Map<String, dynamic> json){
    return Pages(
        json["size"] as int,
        json["totalElements"] as int,
        json["totalPages"] as int,
        json["number"] as int
    );
  }

  @override
  String toString() {
    return 'Page{size: $size, totalElements: $totalElements, totalPages: $totalPages, number: $number}';
  }
}