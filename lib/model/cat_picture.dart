class History {
  String? fact;
  String? createDate;
  String? path;


  History(
      {required this.fact,
        required this.createDate,
        required this.path,
       });

  History.fromJson(Map<String, dynamic> mp)
      : fact = mp["fact"],
        createDate = mp["createDate"],
        path = mp["path"]
     ;

  Map<String, dynamic> toJson() => {
    "fact": fact,
    "createDate": createDate,
    "path": path,
   
  };
}
