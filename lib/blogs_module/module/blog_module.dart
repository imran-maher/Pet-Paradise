

class Blog {
  late final String _writerId;
  late final String _blogId;
  late final String _blogTitle;
  late final String _blogContent;
  late final String _blogImgURL;
  late final String _numberOfReads;
  late final String _numberOfLikes;

  Blog(this._writerId, this._blogId, this._blogTitle, this._blogContent,
      this._blogImgURL , this._numberOfLikes,this._numberOfReads);

  factory Blog.fromJson(var json) {
    return Blog(
        json['writerId'] as String,
        json['blogId'] as String,
        json['blogTitle'] as String,
        json['blogContent'] as String,
        json['blogImgURL'] as String,
        json['numberOfReads'] as String,
       json['numberOfLikes'] as String
    );
  }

  static Map<String, dynamic> toMap(Blog blog) {
    return {
      'writerId': blog._writerId,
      'blogId': blog._blogId,
      'blogTitle': blog._blogTitle,
      'blogContent': blog._blogContent,
      'blogImgURL': blog._blogImgURL,
      'numberOfReads' : blog._numberOfReads,
      'numberOfLikes' : blog._numberOfLikes,

    };
  }

  String get blogImgURL => _blogImgURL;

  set blogImgURL(String value) {
    _blogImgURL = value;
  }

  String get blogContent => _blogContent;

  set blogContent(String value) {
    _blogContent = value;
  }

  String get blogTitle => _blogTitle;

  set blogTitle(String value) {
    _blogTitle = value;
  }

  String get blogId => _blogId;

  set blogId(String value) {
    _blogId = value;
  }

  String get writerId => _writerId;

  set writerId(String value) {
    _writerId = value;
  }

  String get numberOfLikes => _numberOfLikes;

  set numberOfLikes(String value) {
    _numberOfLikes = value;
  }

  String get numberOfReads => _numberOfReads;

  set numberOfReads(String value) {
    _numberOfReads = value;
  }
}
