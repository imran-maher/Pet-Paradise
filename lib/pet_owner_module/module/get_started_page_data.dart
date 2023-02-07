class GetStartedPageData{

  static const TRAINER = "Trainer";
  static const VET = "Veterinarian";
  static const BREEDER = "Breeder";
  static const PET_PANDA = "Pet Panda";
  static const ADOPT_A_PET = "Adopt A Pet";
  static const BLOGS_AND_ARTICLES = "Blogs & Articles";

  late final String _pageTitle;
  late final String _pageSubTitle;
  late final String _imageUrl;

  GetStartedPageData({required String pageTitle , required String subTitle , required String imgUrl}){
    this._pageTitle = pageTitle;
    this._pageSubTitle = subTitle;
    this._imageUrl = imgUrl;
  }

  String get imageUrl => _imageUrl;

  set imageUrl(String value) {
    _imageUrl = value;
  }

  String get pageSubTitle => _pageSubTitle;

  set pageSubTitle(String value) {
    _pageSubTitle = value;
  }

  String get pageTitle => _pageTitle;

  set pageTitle(String value) {
    _pageTitle = value;
  }
}