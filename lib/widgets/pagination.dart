import 'package:apollocode_dart_utilities/src/models/type_paginated.dart';
import 'package:flutter/material.dart';

class PaginationWidget<T> extends StatelessWidget {
  final Paginated<T> paginated;
  final int page;
  final int pageSize;
  final String search;
  final String label;
  final String? nextLabel;
  final String? backLabel;
  final double? width;

  final Function()? onPageBack;
  final Function()? onPageNext;
  final Function(int size)? onPageSizeChange;

  const PaginationWidget(this.paginated,
      {Key? key,
      this.page = 1,
      this.pageSize = 25,
      this.search = "",
      this.width,
      this.label = "items",
      this.onPageBack,
      this.backLabel,
      this.onPageNext,
      this.nextLabel,
      this.onPageSizeChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(bottom: 5),
      alignment: Alignment.centerRight,
      child: SizedBox(
          width: 500,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("${paginated.itemCount} $label"),
              TextButton.icon(
                  onPressed: onPageBack,
                  label: Text(backLabel ?? ""),
                  icon: const Icon(Icons.arrow_back_ios_new)),
              Text('$page/${paginated.pageCount}'),
              TextButton.icon(
                  onPressed: onPageNext,
                  label: Text(nextLabel ?? ""),
                  icon: const Icon(Icons.arrow_forward_ios)),
              DropdownButton(
                  isDense: true,
                  underline: Container(),
                  isExpanded: false,
                  value: pageSize,
                  items: [
                    DropdownMenuItem(
                      value: 5,
                      child: Text(
                        '5',
                        style:
                            Theme.of(context).inputDecorationTheme.labelStyle,
                      ),
                    ),
                    DropdownMenuItem(
                      value: 10,
                      child: Text(
                        '10',
                        style:
                            Theme.of(context).inputDecorationTheme.labelStyle,
                      ),
                    ),
                    DropdownMenuItem(
                      value: 25,
                      child: Text(
                        '25',
                        style:
                            Theme.of(context).inputDecorationTheme.labelStyle,
                      ),
                    ),
                    DropdownMenuItem(
                      value: 50,
                      child: Text(
                        '50',
                        style:
                            Theme.of(context).inputDecorationTheme.labelStyle,
                      ),
                    ),
                    DropdownMenuItem(
                      value: 100,
                      child: Text(
                        '100',
                        style:
                            Theme.of(context).inputDecorationTheme.labelStyle,
                      ),
                    )
                  ],
                  onChanged: (int? value) {
                    if (onPageSizeChange != null) {
                      onPageSizeChange!(value!);
                    }
                  }),
            ],
          )),
    );
  }
}
