import 'package:flutter/material.dart';
import 'package:flutter_environments_and_codemagic/flavor_config.dart';
import 'package:flutter_environments_and_codemagic/widgets/device_info_dialog.dart';

class FlavorBanner extends StatelessWidget {
  final Widget child;
  FlavorBanner({@required this.child});

  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.isProduction()) return child;
    final BannerConfig bannerConfig = _getDefaultBanner();
    return Stack(
      children: <Widget>[child, _buildBanner(context, bannerConfig)],
    );
  }

  BannerConfig _getDefaultBanner() {
    return BannerConfig(
        bannerName: FlavorConfig.instance.name,
        bannerColor: FlavorConfig.instance.color);
  }

  Widget _buildBanner(BuildContext context, BannerConfig bannerConfig) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: 50,
        height: 50,
        child: CustomPaint(
          painter: BannerPainter(
              message: bannerConfig.bannerName,
              textDirection: Directionality.of(context),
              layoutDirection: Directionality.of(context),
              location: BannerLocation.topStart,
              color: bannerConfig.bannerColor),
        ),
      ),
      onLongPress: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return DeviceInfoDialog();
            });
      },
    );
  }
}

class BannerConfig {
  final String bannerName;
  final Color bannerColor;

  BannerConfig({@required this.bannerName, @required this.bannerColor});
}
