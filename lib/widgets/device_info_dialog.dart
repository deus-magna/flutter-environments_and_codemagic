import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_environments_and_codemagic/flavor_config.dart';
import 'package:flutter_environments_and_codemagic/utils/device_utils.dart';
import 'package:flutter_environments_and_codemagic/utils/string_utils.dart';

class DeviceInfoDialog extends StatelessWidget {
  DeviceInfoDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(bottom: 10.0),
      title: Container(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Text(
            'Device Info',
          ),
        ),
      ),
      titlePadding: EdgeInsets.all(0),
      content: _getContent(),
    );
  }

  Widget _getContent() {
    if (Platform.isAndroid) {
      return _androidContent();
    }
    // if (Platform.isIOS) {
    //   return _iOSContent();
    // }
    return Text("You're not on Android neither iOS");
  }

  //Widget _iOSContent() {} omitted for simplicity
  Widget _androidContent() {
    return FutureBuilder(
        future: DeviceUtils.androidDeviceInfo(),
        builder: (context, AsyncSnapshot<AndroidDeviceInfo> snapshot) {
          if (!snapshot.hasData) return Container();
          AndroidDeviceInfo device = snapshot.data;
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildTile('Flavor:', '${FlavorConfig.instance.name}'),
                _buildTile('Build mode:',
                    '${StringUtils.enumName(DeviceUtils.currentBuildMode().toString())}'),
                _buildTile('Physical device:', '${device.isPhysicalDevice}'),
                _buildTile('Manufacturer:', '${device.manufacturer}'),
                _buildTile('Model:', '${device.model}'),
                _buildTile('Android version:', '${device.version.release}'),
                _buildTile('Android SDK:', '${device.version.sdkInt}')
              ],
            ),
          );
        });
  }

  Widget _buildTile(String key, String value) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            key,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value)
        ],
      ),
    );
  }
}
