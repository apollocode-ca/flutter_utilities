import 'package:apollocode_flutter_utilities/decorations/material_scrollable_table_decoration.dart';
import 'package:apollocode_flutter_utilities/models/pagination_data.dart';
import 'package:apollocode_flutter_utilities/themes/material_scrollable_table_theme_data.dart';
import 'package:apollocode_flutter_utilities/widgets/icons/dropdown_arrow.dart';
import 'package:apollocode_flutter_utilities/widgets/texts/body_text.dart';
import 'package:flutter/material.dart';

class PaginationRow extends StatefulWidget {
  final MaterialScrollableTableDecoration decoration;
  final void Function(int page, int itemsPerPage)? onItemsPerPageChanged;
  final void Function(int page, int itemsPerPage)? onNextPageTap;
  final void Function(int page, int itemsPerPage)? onPreviousPageTap;
  final PaginationData pagination;

  const PaginationRow({
    required this.decoration,
    required this.onItemsPerPageChanged,
    required this.onNextPageTap,
    required this.onPreviousPageTap,
    required this.pagination,
    super.key,
  });

  @override
  State<PaginationRow> createState() => _PaginationRowState();
}

class _PaginationRowState extends State<PaginationRow> {
  late int currentItemsPerPage;

  var currentPage = 1;

  MaterialScrollableTableThemeData? get theme {
    return Theme.of(context).extension<MaterialScrollableTableThemeData>();
  }

  void onItemsPerPageChanged(int? value) {
    if (value != null) {
      setState(() {
        currentItemsPerPage = value;
      });
      final callback = widget.onItemsPerPageChanged;
      if (callback != null) {
        callback(currentPage, currentItemsPerPage);
      }
    }
  }

  void onNextPageTap() {
    setState(() {
      currentPage++;
    });
    final callback = widget.onNextPageTap;
    if (callback != null) {
      callback(currentPage, currentItemsPerPage);
    }
  }

  void onPreviousPageTap() {
    setState(() {
      currentPage--;
    });
    final callback = widget.onPreviousPageTap;
    if (callback != null) {
      callback(currentPage, currentItemsPerPage);
    }
  }

  @override
  void initState() {
    super.initState();
    currentItemsPerPage = widget.pagination.initialItemsPerPage;
  }

  @override
  Widget build(BuildContext context) {
    final alignment = widget.decoration.paginationAlignment ??
        theme?.paginationAlignment ??
        MainAxisAlignment.end;
    final backgroundColor = widget.decoration.paginationBackgroundColor ??
        widget.decoration.headingBackgroundColor ??
        theme?.headingBackgroundColor ??
        Theme.of(context).colorScheme.primary;
    final dropdownBackgroundColor = widget.decoration.dropdownBackgroundColor ??
        theme?.dropdownBackgroundColor ??
        Theme.of(context).colorScheme.surfaceVariant;
    final dropdownForegroundColor = widget.decoration.dropdownForegroundColor ??
        theme?.dropdownForegroundColor ??
        Theme.of(context).colorScheme.onSurfaceVariant;
    final foregroundColor = widget.decoration.paginationForegroundColor ??
        widget.decoration.headingForegroundColor ??
        theme?.headingForegroundColor ??
        Theme.of(context).colorScheme.onPrimary;
    final height = widget.decoration.paginationHeight ??
        widget.decoration.headingHeight ??
        theme?.headingHeight ??
        56;
    final padding = widget.decoration.paginationPadding ??
        widget.decoration.padding ??
        theme?.padding ??
        const EdgeInsets.symmetric(
          horizontal: 24,
        );
    final textColor = widget.decoration.paginationTextStyle?.color ??
        widget.decoration.headingTextStyle?.color ??
        foregroundColor;
    final textStyle = widget.decoration.paginationTextStyle?.copyWith(
          color: textColor,
        ) ??
        widget.decoration.headingTextStyle?.copyWith(
          color: textColor,
        ) ??
        theme?.headingTextStyle.copyWith(
          color: textColor,
        ) ??
        TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
        );
    final itemsPerPageSuggestions = widget.pagination.itemsPerPageSuggestions;
    return Container(
      constraints: BoxConstraints.tightFor(
        height: height,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      padding: padding,
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          BodyText(
            widget.pagination.formattedItemsPerPageText,
            style: textStyle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: IconButton(
              color: foregroundColor,
              constraints: BoxConstraints.tight(
                const Size.square(48),
              ),
              disabledColor: foregroundColor.withOpacity(0.38),
              padding: EdgeInsets.zero,
              onPressed: () {
                if (currentPage > 1) {
                  return onPreviousPageTap;
                }
                return null;
              }(),
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 24,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            constraints: const BoxConstraints.tightFor(
              width: 64,
            ),
            child: BodyText(
              widget.pagination.formatCurrentPageText(currentPage),
              style: textStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 16,
            ),
            child: IconButton(
              color: foregroundColor,
              constraints: BoxConstraints.tight(
                const Size.square(48),
              ),
              disabledColor: foregroundColor.withOpacity(0.38),
              padding: EdgeInsets.zero,
              onPressed: () {
                final pageCount = widget.pagination.paginated?.pageCount ?? 0;
                if (currentPage < pageCount) {
                  return onNextPageTap;
                }
                return null;
              }(),
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 24,
              ),
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton(
              dropdownColor: dropdownBackgroundColor,
              icon: DropdownArrow(
                color: foregroundColor,
              ),
              onChanged: onItemsPerPageChanged,
              value: currentItemsPerPage,
              items: [
                ...itemsPerPageSuggestions.map((suggestion) {
                  return DropdownMenuItem(
                    value: suggestion,
                    child: BodyText(
                      suggestion.toString(),
                      style: TextStyle(
                        color: dropdownForegroundColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }),
              ],
              selectedItemBuilder: (context) {
                return [
                  ...itemsPerPageSuggestions.map((suggestion) {
                    return DropdownMenuItem(
                      value: suggestion,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(
                          width: 40,
                        ),
                        child: BodyText(
                          suggestion.toString(),
                          style: textStyle,
                        ),
                      ),
                    );
                  }),
                ];
              },
            ),
          ),
        ],
      ),
    );
  }
}
