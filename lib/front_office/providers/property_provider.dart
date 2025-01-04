import 'package:flutter/cupertino.dart';
import 'package:frontend/front_office/models/property.dart';

class PropertyProvider extends ChangeNotifier {
  late Property _selectedProperty;
  List<Property> _propertyList = [];

  PropertyProvider() {
    _propertyList = [Property(name: "Hotel Hive")];
    _selectedProperty = _propertyList[0];
  }

  Property getSelectedProperty() {
    return _selectedProperty;
  }
  // set selectedProperty(Property newProperty) {
  //   _selectedProperty = newProperty;
  // }
  List<Property> getPropertyList() {
    return _propertyList;
  }
  void addProperty(Property property) {
    _propertyList.add(property);
  }
  void removeProperty(Property property) {
    _propertyList.remove(property);
  }

  void setSelectedProperty(Property property) {
    _selectedProperty = property;
  }
}