import 'package:flame/cache.dart';
import 'package:flame/flame.dart';
import 'package:flutter_svg/flutter_svg.dart'
    show DrawableRoot, ExactAssetPicture, SvgPicture, precachePicture, svg;

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

final Map<String, DrawableRoot> _cache = {};

/// Get the cached Svg Asset
DrawableRoot getGameSvg(String asset) {
  return _cache[asset]!;
}

final _assetsToLoad = [
  SvgAsset.backgroundDefault,
  SvgAsset.characterDefaultHop,
  SvgAsset.characterDefaultPlain,
  SvgAsset.logo,
  SvgAsset.logoText,
  SvgAsset.mobileDevice,

  // Icons
  SvgIconName.back,
  SvgIconName.checkboxChecked,
  SvgIconName.checkboxUnchecked,
  SvgIconName.settings,
  SvgIconName.share,
  SvgIconName.shop,
  SvgIconName.volume,
  SvgIconName.mute,
  SvgIconName.pause,

  // UI
  UiAsset.layerButtonBottom.background,
  UiAsset.layerButtonBottom.outline,
  UiAsset.layerButtonTop.background,
  UiAsset.layerButtonTop.outline,
  UiAsset.layerIconBottom.background,
  UiAsset.layerIconBottom.outline,
  UiAsset.layerIconTop.background,
  UiAsset.layerIconTop.outline,
  UiAsset.layerOverlay1.outline,
  UiAsset.layerOverlay1.outline,
];

final _gameSvgAssets = [
  GameSvgAsset.backgroundSky,
  GameSvgAsset.backgroundGrass,
  GameSvgAsset.backgroundDistantBush,
  GameSvgAsset.backgroundCloud1,
  GameSvgAsset.backgroundCloud2,
  GameSvgAsset.backgroundCloud3,
  GameSvgAsset.obstacle1Lane,
  GameSvgAsset.obstacle2Lane,
  GameSvgAsset.obstacle3Lane,
  GameSvgAsset.characterDefault,
];

Future<void> preloadSvgs() async {
  for (final asset in _assetsToLoad) {
    await precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, asset),
      null,
    );
  }

  for (final asset in _gameSvgAssets) {
    _cache[asset] = await loadFlameSvg(asset.replaceFirst(_svgFolder, 'svg/'));
  }
}

Future<DrawableRoot> loadFlameSvg(String fileName, {AssetsCache? cache}) async {
  cache ??= Flame.assets;
  final svgString = await cache.readFile(fileName);
  return svg.fromSvgString(svgString, 'FLAME:$fileName');
}
