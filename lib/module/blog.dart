class Blog {
  late final String _blogID;
  late final String _bloggerID;
  late final String _blogTitle;
  late final String _blogContent;
  late final DateTime _publishDate;
  late final String _blogImageUrl;
  late final int? _numbersOfReaders;
  late final int? _numberOfLikes;

  //Constructor
  Blog({
    required String blogId,
    required String bloggerId,
    required String title,
    required String content,
    required DateTime publishDate,
    required String imgUrl,
    int? numberOfReaders,
    int? numberOfLikes,
  }) {
    this._blogID = blogId;
    this._bloggerID = bloggerId;
    this._blogTitle = title;
    this._blogContent = content;
    this._publishDate = publishDate;
    this._blogImageUrl = imgUrl;
    this._numbersOfReaders = numberOfReaders;
    this._numberOfLikes = numberOfLikes;
  }

  // getters and setters
  
  int? get numberOfLikes => _numberOfLikes;

  set numberOfLikes(int? value) {
    if(value! > 0){
      _numberOfLikes = value;
    }

  }

  int? get numbersOfReaders => _numbersOfReaders;

  set numbersOfReaders(int? value) {
    if(value! > 0) {
      _numbersOfReaders = value;
    }
  }

  String get blogImageUrl => _blogImageUrl;

  set blogImageUrl(String value) {
    _blogImageUrl = value;
  }

  DateTime get publishDate => _publishDate;

  set publishDate(DateTime value) {
    _publishDate = value;
  }

  String get blogContent => _blogContent;

  set blogContent(String value) {
    _blogContent = value;
  }

  String get blogTitle => _blogTitle;

  set blogTitle(String value) {
    _blogTitle = value;
  }

  String get bloggerID => _bloggerID;

  set bloggerID(String value) {
    _bloggerID = value;
  }

  String get blogID => _blogID;

  set blogID(String value) {
    _blogID = value;
  }




}
