const _svgFolder = 'assets/svg/';
const _svgIconsFolder = '${_svgFolder}icons/';

/// Provides the svg assets locations used throughout the app.
class SvgAsset {
  static const String backgroundDefault = '${_svgFolder}background_default.svg';
  static const String characterDefaultHop =
      '${_svgFolder}character_default_hop.svg';
  static const String characterDefaultPlain =
      '${_svgFolder}character_default_plain.svg';
  static const String logo = '${_svgFolder}logo.svg';
  static const String logoText = '${_svgFolder}logo_text.svg';
  static const String mobileDevice = '${_svgFolder}mobile_device.svg';
}

class GameSvgAsset {
  // Background
  static const String backgroundSky = '${_svgFolder}game/background/sky.svg';
  static const String backgroundGrass =
      '${_svgFolder}game/background/grass.svg';
  static const String backgroundDistantBush =
      '${_svgFolder}game/background/distant_bush.svg';
  static const String backgroundCloud1 =
      '${_svgFolder}game/background/cloud_1.svg';
  static const String backgroundCloud2 =
      '${_svgFolder}game/background/cloud_2.svg';
  static const String backgroundCloud3 =
      '${_svgFolder}game/background/cloud_3.svg';

  // Obstacles
  static const String obstacle1Lane = '${_svgFolder}game/obstacles/1_lane.svg';
  static const String obstacle2Lane = '${_svgFolder}game/obstacles/2_lane.svg';
  static const String obstacle3Lane = '${_svgFolder}game/obstacles/3_lane.svg';

  // Character
  static const String characterDefault =
      '${_svgFolder}game/character/default.svg';
}

class SvgIconName {
  static const String back = '${_svgIconsFolder}back.svg';
  static const String checkboxChecked =
      '${_svgIconsFolder}checkbox_checked.svg';
  static const String checkboxUnchecked =
      '${_svgIconsFolder}checkbox_unchecked.svg';
  static const String settings = '${_svgIconsFolder}settings.svg';
  static const String share = '${_svgIconsFolder}share.svg';
  static const String shop = '${_svgIconsFolder}shop.svg';
  static const String volume = '${_svgIconsFolder}volume.svg';
  static const String mute = '${_svgIconsFolder}mute.svg';
  static const String pause = '${_svgIconsFolder}pause.svg';
}

class ScribbleLayerAsset {
  const ScribbleLayerAsset({required this.outline, required this.background});

  final String outline;
  final String background;
}

class UiAsset {
  static const layerButtonBottom = ScribbleLayerAsset(
    outline: '${_svgFolder}ui/layer_button1_outline.svg',
    background: '${_svgFolder}ui/layer_button1_background.svg',
  );

  static const layerButtonTop = ScribbleLayerAsset(
    outline: '${_svgFolder}ui/layer_button2_outline.svg',
    background: '${_svgFolder}ui/layer_button2_background.svg',
  );

  static const layerIconBottom = ScribbleLayerAsset(
    outline: '${_svgFolder}ui/layer_icon1_outline.svg',
    background: '${_svgFolder}ui/layer_icon1_background.svg',
  );

  static const layerIconTop = ScribbleLayerAsset(
    outline: '${_svgFolder}ui/layer_icon2_outline.svg',
    background: '${_svgFolder}ui/layer_icon2_background.svg',
  );

  static const layerOverlay1 = ScribbleLayerAsset(
    outline: '${_svgFolder}ui/layer_overlay1_outline.svg',
    background: '${_svgFolder}ui/layer_overlay1_background.svg',
  );

  static const loading = '${_svgFolder}ui/loading.svg';
}
