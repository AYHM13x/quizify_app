class FontFamilies {
  static const comicSansMS = "ComicSansMS";
  static const dancingScript = "DancingScript";
}

class AssetsImage {
  static const _assetesFolder = "assets/images/";
  static const String appLogo = "${_assetesFolder}quiz_logo.png";
  static const List<String> categoriesImages = [
    "${_assetesFolder}linux.png",
    "${_assetesFolder}devops.png",
    "${_assetesFolder}docker.png",
  ];
}

class AssetsSound {
  static const _assetsFolder = "assets/sounds/";
  static const successSound = "${_assetsFolder}success_sound.mp3";
  static const failSound = "${_assetsFolder}fail_sound.mp3";
  static const finalSuccessSound = "${_assetsFolder}final_success.mp3";
  static const finalFailureSound = "${_assetsFolder}final_failure.mp3";
}
