import 'package:apollocode_flutter_utilities/models/address.dart';
import 'package:apollocode_flutter_utilities/models/suggestion.dart';
import 'package:apollocode_flutter_utilities/services/canadapost.dart';
import 'package:apollocode_flutter_utilities/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:apollocode_flutter_utilities/models/form_field_input.dart';

class AddressForm extends StatefulWidget {
  final Function(
    Address address,
  )? onAddressCompleted;
  final String searchLabel;
  final ListTileStyle? listTileStyle;

  const AddressForm({Key? key, this.onAddressCompleted, this.searchLabel = "Recherche", this.listTileStyle}) : super(key: key);

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  Address address = Address();
  FormFieldInput? _searchController;
  bool hasListeners = false;
  List<Suggestion> suggestions = [];

  Future getSuggestions(String _search) async {
    var results =
        await CanadaPostService.getAddressesSuggestions(queryParameters: {
      'Text': _search,
      'Origin': 'CAN',
      'Limit': 5,
      'SESSION': '763fb251-9ff6-fe26-e4e8-31dac526e585'
    });

    setState(() {
      suggestions = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    _searchController ??= FormFieldInput(
        label: widget.searchLabel,
        focusNode: FocusNode(),
        onChanged: (value) async {
          await getSuggestions(value);
        });

    return SingleChildScrollView(
        child: Column(
      children: [
        InputField(
          _searchController!,
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
        ),
        for (var i = 0; i < suggestions.length; i++)
          ListTile(
            style: widget.listTileStyle,
            onTap: () async {
              if (widget.onAddressCompleted != null) {
                var address =
                    await CanadaPostService.getAddress(suggestions[i].id!);
                widget.onAddressCompleted!(address);
              }
            },
            title:
                Text('${suggestions[i].text!}, ${suggestions[i].description!}'),
          ),
      ],
    ));
  }
}
