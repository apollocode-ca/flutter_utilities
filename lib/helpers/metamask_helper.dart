import 'package:apollocode_flutter_utilities/managers/banner_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';

class MetamaskHelper {
  final String networkError;
  final int networkId;
  final String noAccountError;
  final String noWalletError;
  final String walletRejectedError;
  final String walletRequestError;

  late final BannerManager _bannerManager;

  MetamaskHelper({
    Color? bannerBackgroundColor,
    Color? bannerErrorColor,
    Color? bannerIconColor,
    EdgeInsetsGeometry? bannerPadding,
    TextStyle? bannerTextStyle,
    required this.networkError,
    required this.networkId,
    required this.noAccountError,
    required this.noWalletError,
    required this.walletRejectedError,
    required this.walletRequestError,
  }) {
    _bannerManager = BannerManager(
      backgroundColor: bannerBackgroundColor,
      errorColor: bannerErrorColor,
      iconColor: bannerIconColor,
      padding: bannerPadding,
      textStyle: bannerTextStyle,
    );
  }

  Future<String?> connectWallet(BuildContext context) async {
    if (Ethereum.isSupported) {
      final networkId = await ethereum?.getChainId();
      if (networkId != this.networkId) {
        _bannerManager.showErrorBanner(
          context: context,
          message: networkError,
        );
        return Future.value();
      }
      try {
        final addresses = await ethereum?.requestAccount();
        if (addresses == null || addresses.isEmpty) {
          _bannerManager.showErrorBanner(
            context: context,
            message: noAccountError,
          );
          return Future.value();
        }
        return addresses.first;
      } on EthereumException {
        _bannerManager.showErrorBanner(
          context: context,
          message: walletRequestError,
        );
        return Future.value();
      } on EthereumUserRejected {
        _bannerManager.showErrorBanner(
          context: context,
          message: walletRejectedError,
        );
        return Future.value();
      }
    }
    _bannerManager.showErrorBanner(
      context: context,
      message: noWalletError,
    );
    return Future.value();
  }
}
