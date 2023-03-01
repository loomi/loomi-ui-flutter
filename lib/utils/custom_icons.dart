class CustomIcons {
  static String homeIcon = _svgParser("home.svg");
  static String addIcon = _svgParser("plus-square-Regular_1_.svg");
  static String moreConfig = _svgParser("more_configs_circle.svg");
  static String subIcon = _svgParser("minus-square-Regular_1_.svg");
  static String checkIcon = _svgParser("check_icon.svg");
  static String infoCircleIcon = _svgParser("info-circle-Regular_1_.svg");
  static String arrowCircleRight = _svgParser("arrow-circle-right.svg");
  static String settings = _svgParser("settings.svg");
  static String filter = _svgParser("filter.svg");
  static String arrowCircleLeft = _svgParser("arrow-circle-left.svg");
  static String question = _svgParser("question.svg");
  static String trash = _svgParser("trash.svg");
  static String bookmark = _svgParser("bookmark.svg");

  //PATH FUNCTION
  static String _svgParser(String icon) {
    return "assets/vectors/$icon";
  }
}
