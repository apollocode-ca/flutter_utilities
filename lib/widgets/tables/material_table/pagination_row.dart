import 'package:apollocode_flutter_utilities/models/pagination_data.dart';
import 'package:apollocode_flutter_utilities/widgets/icons/dropdown_arrow.dart';
import 'package:apollocode_flutter_utilities/widgets/texts/body_text.dart';
import 'package:flutter/material.dart';

class PaginationRow extends StatefulWidget {
  final void Function(int itemsPerPage)? onItemsPerPageChanged;
  final void Function(int page)? onNextPageTap;
  final void Function(int page)? onPreviousPageTap;
  final PaginationData pagination;

  const PaginationRow({
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

  void onItemsPerPageChanged(int? value) {
    if (value != null) {
      setState(() {
        currentItemsPerPage = value;
      });
      final callback = widget.onItemsPerPageChanged;
      if (callback != null) {
        callback(currentItemsPerPage);
      }
    }
  }

  void onNextPageTap() {
    setState(() {
      currentPage++;
    });
    final callback = widget.onNextPageTap;
    if (callback != null) {
      callback(currentPage);
    }
  }

  void onPreviousPageTap() {
    setState(() {
      currentPage--;
    });
    final callback = widget.onPreviousPageTap;
    if (callback != null) {
      callback(currentPage);
    }
  }

  @override
  void initState() {
    super.initState();
    currentItemsPerPage = widget.pagination.initialItemsPerPage;
  }

  @override
  Widget build(BuildContext context) {
    final onPrimary = Theme.of(context).colorScheme.onPrimary;
    final onSurfaceVariant = Theme.of(context).colorScheme.onSurfaceVariant;
    final itemsPerPageSuggestions = widget.pagination.itemsPerPageSuggestions;
    return Container(
      constraints: BoxConstraints.tightFor(
        height: Theme.of(context).dataTableTheme.headingRowHeight,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BodyText(
            widget.pagination.formattedItemsPerPageText,
            style: TextStyle(
              color: onPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: IconButton(
              color: onPrimary,
              constraints: BoxConstraints.tight(
                const Size.square(48),
              ),
              disabledColor: onPrimary.withOpacity(0.38),
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
              style: TextStyle(
                color: onPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 16,
            ),
            child: IconButton(
              color: onPrimary,
              constraints: BoxConstraints.tight(
                const Size.square(48),
              ),
              disabledColor: onPrimary.withOpacity(0.38),
              padding: EdgeInsets.zero,
              onPressed: () {
                if (currentPage < widget.pagination.paginated.pageCount) {
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
              dropdownColor: Theme.of(context).colorScheme.surfaceVariant,
              icon: DropdownArrow(
                color: onPrimary,
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
                        color: onSurfaceVariant,
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
                          style: TextStyle(
                            color: onPrimary,
                            fontWeight: FontWeight.w500,
                          ),
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
