class Page{
  int size;
  int totalElements;
  int totalPages;
  int number;

  Page(this.size, this.totalElements, this.totalPages, this.number);

  factory Page.fromJson(Map<String, dynamic> json){
    return Page(
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