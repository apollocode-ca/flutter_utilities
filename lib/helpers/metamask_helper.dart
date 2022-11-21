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

  void connectWallet(BuildContext context, void Function(String) callback) {
    if (Ethereum.isSupported) {
      ethereum?.getChainId().then((networkId) {
        if (networkId != this.networkId) {
          _bannerManager.showErrorBanner(
            context: context,
            message: networkError,
          );
        } else {
          try {
            ethereum?.requestAccount().then((addresses) {
              if (addresses.isEmpty) {
                _bannerManager.showErrorBanner(
                  context: context,
                  message: noAccountError,
                );
              } else {
                callback(addresses.first);
              }
            });
          } on EthereumException {
            _bannerManager.showErrorBanner(
              context: context,
              message: walletRequestError,
            );
          } on EthereumUserRejected {
            _bannerManager.showErrorBanner(
              context: context,
              message: walletRejectedError,
            );
          }
        }
      });
    } else {
      _bannerManager.showErrorBanner(
        context: context,
        message: noWalletError,
      );
    }
  }
}
