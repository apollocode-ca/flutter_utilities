import 'dart:math';

import 'package:apollocode_dart_utilities/apollocode_dart_utilities.dart';

class PaginationData<T> {
  final String currentPageText;
  final List<int> itemsPerPageSuggestions;
  final String itemsPerPageText;
  final Paginated<T>? paginated;

  PaginationData({
    required this.currentPageText,
    this.itemsPerPageSuggestions = const [5, 10, 25, 50, 100],
    required this.itemsPerPageText,
    this.paginated,
  });

  String get formattedItemsPerPageText {
    final text = itemsPerPageText;
    if (!text.contains('<count>')) {
      throw StateError(
        'The "itemsPerPageText" property of PaginationData must have a '
        '"<count>" token. For exemple, the text should be "<count> items" '
        'instead of "items".',
      );
    }
    return text.replaceAll('<count>', displayedItems.toString());
  }

  int get initialItemsPerPage {
    final middle = itemsPerPageSuggestions.length ~/ 2;
    return itemsPerPageSuggestions[middle];
  }

  int get displayedItems {
    final itemCount = paginated?.itemCount ?? 0;
    final dataLength = paginated?.data.length ?? 0;
    return min(itemCount, dataLength);
  }

  String formatCurrentPageText(int currentPage) {
    final text = currentPageText;
    if (!text.contains('<current>') || !text.contains('<total>')) {
      throw StateError(
        'The "currentPageText" property of PaginationData must have a '
        '"<current>" and a "<total>" token. For example, the text should be '
        '"<current> / <total>" instead of "/"',
      );
    }
    final page = paginated != null ? currentPage : 0;
    final pageCount = paginated?.pageCount ?? 0;
    return text
        .replaceAll('<current>', page.toString())
        .replaceAll('<total>', pageCount.toString());
  }
}
