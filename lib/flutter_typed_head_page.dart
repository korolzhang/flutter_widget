import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_project/data.dart';
import 'package:flutter_widget_project/product_page.dart';

class FlutterTypedHeadPage extends StatefulWidget {
  @override
  _FlutterTypedHeadPageState createState() => _FlutterTypedHeadPageState();
}

class _FlutterTypedHeadPageState extends State<FlutterTypedHeadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterTypedHead"),
      ),
      body: TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
          autofocus: true,
          style: DefaultTextStyle.of(context)
              .style
              .copyWith(fontStyle: FontStyle.italic),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        suggestionsCallback: (pattern) async {
          return await BackendService.getSuggestions(pattern);
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text(suggestion['name']),
            subtitle: Text('\$${suggestion['price']}'),
          );
        },
        onSuggestionSelected: (suggestion) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductPage(product: suggestion)
          ));
        },
      ),
    );
  }
}
