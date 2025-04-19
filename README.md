# FlexSidebar

A highly customizable sidebar and drawer widget for Flutter projects, supporting Android, iOS, Web, and Desktop.

| Nested in Stack                                                                                                   | RTL in Row                                                                                              | Mobile Drawer                                                                                             |
| ----------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| ![Nested in Stack](https://github.com/HamedMohtadi/flex_sidebar/blob/main/example/repo/nested_stack.gif?raw=true) | ![RTL in Row](https://github.com/HamedMohtadi/flex_sidebar/blob/main/example/repo/row_rtl.gif?raw=true) | ![Mobile Drawer](https://github.com/HamedMohtadi/flex_sidebar/blob/main/example/repo/mobile.gif?raw=true) |

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## Features

- **Fully Customizable**: Tailor the sidebar's appearance and behavior with extensive theming options.
- **Subitems Support**: Create nested menu items for hierarchical navigation.
- **Mobile Drawer Mode**: Use the sidebar as a drawer on mobile devices for a responsive experience.
- **Flexible Alignment**: Align items at the start, end, or center, with automatic adjustments when scrolling is enabled.
- **Theming**: Apply global themes to the sidebar and items, with the ability to override themes for specific items. Styles defined directly on item elements (icon and text) have the highest priority, followed by per-item themes, and then the global sidebar theme.
- **Scroll Support**: Enable scrollable items, automatically aligning them to the start.
- **Responsive Pinning**: Pin or unpin the sidebar, with the pin/unpin button hidden on mobile devices.
- **RTL Support**: Seamlessly works with right-to-left layouts.
- **Cross-Platform**: Compatible with Android, iOS, Web, and Desktop Flutter projects.

## Getting Started

### Installation

Add `flex_sidebar` to your `pubspec.yaml`:

```yaml
dependencies:
  flex_sidebar: ^1.0.1
```

Or install it via the command line:

```yaml
flutter pub add flex_sidebar
```

### import

```dart
import 'package:flex_sidebar/flex_sidebar.dart';
```

## Usage

The flex_sidebar package provides a highly customizable sidebar widget that is easy to integrate into your Flutter app. You can place it in a Row, Stack, or use it as a drawer in mobile applications.

### Basic Example

Here’s a simple example of using FlexSidebar in a Row:

```dart
import 'package:flutter/material.dart';
import 'package:flex_sidebar/flex_sidebar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            FlexSidebar(
              controller: FlexSidebarController(),
              primaryWidget: Image.asset('assets/images/header.png'),
              secondaryWidget: Text('Footer Description'),
              items: [
                FlexSidebarItem(
                  icon: Icon(Icons.import_contacts),
                  label: Text('Contacts'),
                  onTap: () {
                    print('Contacts tapped');
                  },
                ),
                FlexSidebarItem(
                  icon: Icon(Icons.settings),
                  label: Text('Settings'),
                  onTap: () {
                    print('Settings tapped');
                  },
                ),
              ],
            ),
            Expanded(
              child: Center(child: Text('Main Content')),
            ),
          ],
        ),
      ),
    );
  }
}
```

## Classes and Customization

![description](https://github.com/HamedMohtadi/flex_sidebar/blob/main/example/repo/description.png?raw=true)

### FlexSidebar

The FlexSidebar widget is the core component, rendering a customizable sidebar or drawer.

```dart
const FlexSidebar({
  super.key,
  required this.items,
  required this.primaryWidget,
  required this.secondaryWidget,
  required this.controller,
  this.theme = const FlexThemeData(),
})
```

**Parameters**

- **items**: A List<FlexSidebarItem> containing the sidebar menu items.
- **primaryWidget**: A Widget displayed at the top (e.g., a header or logo).
- **secondaryWidget**: A Widget displayed at the bottom (e.g., a footer or description).
- **controller**: A FlexSidebarController to manage the sidebar's state.
- **theme**: A FlexThemeData object for styling the sidebar.

### Example with Custom Theme

```dart
FlexSidebar(
  controller: FlexSidebarController(pinned: false),
  theme: FlexThemeData(
    normalWidth: 280,
    minimizedWidth: 60,
    normalDecoration: BoxDecoration(
      color: Colors.blue.shade100,
      borderRadius: BorderRadius.circular(20),
    ),
    scrollableItems: true,
    itemsAlignment: MainAxisAlignment.start,
  ),
  primaryWidget: Container(
    height: 100,
    child: Center(child: Text('Header')),
  ),
  secondaryWidget: Text('Footer'),
  items: [
    FlexSidebarItem(
      icon: Icon(Icons.home),
      label: Text('Home'),
      isSelected: true,
    ),
  ],
)
```

### FlexSidebarItem

The FlexSidebarItem widget represents a single item, with support for subitems and hover animations.

```dart
const FlexSidebarItem({
  super.key,
  required this.icon,
  required this.label,
  this.onTap,
  this.isSelected = false,
  this.minimized = false,
  this.itemThemeData,
  this.hoverAnimationEnabled = true,
  this.subitems = const [],
})
```

**Parameters**

- **icon**: An Icon widget for the item’s icon.
- **label**: A Text widget for the item’s label.
- **onTap**: A Function called when the item is tapped.
- **isSelected**: A bool indicating if the item is selected.
- **minimized**: A bool indicating if the item is in minimized mode.
- **itemThemeData**: A FlexItemThemeData object for styling this item (overrides global theme).
- **hoverAnimationEnabled**: A bool to enable/disable hover animations.
- **subitems**: A List<FlexSidebarItem> for nested subitems.

### Example with Subitems and Custom Item Styling

```dart
FlexSidebarItem(
  icon: Icon(Icons.dashboard, color: Colors.red), // Highest priority: direct icon style
  label: Text('Dashboard', style: TextStyle(color: Colors.red)), // Highest priority: direct text style
  isSelected: true,
  onTap: () {
    print('Dashboard tapped');
  },
  itemThemeData: FlexItemThemeData(
    selectedItemColor: Colors.blue, // Second priority: item-specific theme
    itemTextStyle: TextStyle(fontWeight: FontWeight.bold),
  ),
  subitems: [
    FlexSidebarItem(
      icon: Icon(Icons.analytics),
      label: Text('Analytics'),
      onTap: () {
        print('Analytics tapped');
      },
    ),
    FlexSidebarItem(
      icon: Icon(Icons.report),
      label: Text('Reports'),
      onTap: () {
        print('Reports tapped');
      },
    ),
  ],
)
```

### FlexSidebarController

The FlexSidebarController manages the sidebar's state, such as the selected item and pinned status.

```dart
FlexSidebarController({
  int currentIndex = 0,
  bool pinned = true,
  Curve resizeAnimCurve = Curves.easeOutCirc,
})
```

**Methods**

- **setIndex(int index)**: Sets the selected item index.
- **setPinned(bool pinned)**: Sets whether the sidebar is pinned (hidden on mobile).
- **setResizeAnimCurve(Curve animCurve)**: Sets the animation curve for resizing.
  **Getters**
- **index**: The current selected item index.
- **pinned**: Whether the sidebar is pinned.
- **resizeAnimCurve**: The resize animation curve.

```dart
final controller = FlexSidebarController(currentIndex: 0, pinned: true);

controller.setIndex(1); // Select the second item
controller.setPinned(false); // Unpin the sidebar
```

### FlexThemeData

The FlexThemeData class defines the sidebar's global appearance.

```dart
const FlexThemeData({
this.normalWidth = 300,
this.minimizedWidth = 60,
this.padding = const EdgeInsetsDirectional.all(0),
this.margin = const EdgeInsetsDirectional.all(0),
this.itemThemeData = const FlexItemThemeData(),
this.itemsAlignment = MainAxisAlignment.end,
this.scrollableItems = false,
this.footerDivider = const Divider(indent: 5, endIndent: 5, color: Colors.black12),
this.normalDecoration = const BoxDecoration(
borderRadius: BorderRadiusDirectional.horizontal(end: Radius.circular(40)),
color: Color.fromARGB(255, 171, 228, 255),
),
this.minimizedDecoration = const BoxDecoration(
borderRadius: BorderRadius.all(Radius.circular(40)),
color: Color.fromARGB(255, 119, 212, 255),
),
})
```

**Parameters**

- **normalWidth**: Width when expanded.
- **minimizedWidth**: Width when minimized.
- **padding**: Padding for the sidebar content.
- **margin**: Margin around the sidebar.
- **itemThemeData**: Default FlexItemThemeData for items.
- **itemsAlignment**: Alignment of items (set to start if scrollableItems is true).
- **scrollableItems**: Enables scrolling for items.
- **footerDivider**: Divider for the footer.
- **normalDecoration**: Decoration when expanded.
- **minimizedDecoration**: Decoration when minimized.

#### example:

```dart
FlexThemeData(
normalWidth: 300,
minimizedWidth: 70,
scrollableItems: true, // Automatically sets itemsAlignment to MainAxisAlignment.start
normalDecoration: BoxDecoration(
color: Colors.teal.shade100,
borderRadius: BorderRadius.circular(30),
),
itemThemeData: FlexItemThemeData(
itemTextStyle: TextStyle(fontSize: 18),
selectedItemColor: Colors.teal,
),
)
```

### FlexItemThemeData

The FlexItemThemeData class styles individual sidebar items, overriding the global itemThemeData if specified.

```dart
const FlexItemThemeData({
this.itemTextStyle = const TextStyle(fontSize: 20),
this.iconPadding = const EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
this.labelPadding = const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
this.itemPadding = const EdgeInsetsDirectional.fromSTEB(5, 10, 0, 10),
this.hoverAnimColor = Colors.white70,
this.itemColor = Colors.black45,
this.selectedItemColor = Colors.black,
this.disabledItemColor = Colors.black12,
this.iconSize = 30,
})
```

**Parameters**

- **itemTextStyle**: Text style for labels.
- **iconPadding**: Padding for icons.
- **labelPadding**: Padding for labels.
- **itemPadding**: Padding for the entire item.
- **hoverAnimColor**: Color for hover animations.
- **itemColor**: Default item color.
- **selectedItemColor**: Color for selected items.
- **disabledItemColor**: Color for disabled items.
- **iconSize**: Size of the icon.

#### Example

```dart
FlexItemThemeData(
itemTextStyle: TextStyle(fontSize: 16, color: Colors.blue),
selectedItemColor: Colors.blueAccent,
hoverAnimColor: Colors.blue.shade200,
iconSize: 24,
)
```

### Mobile Drawer Example

To use FlexSidebar as a drawer in mobile applications, wrap it in a Drawer widget:

```dart
Scaffold(
    appBar: AppBar(title: Text('FlexSidebar Demo')),
    drawer: Drawer(
      child: FlexSidebar(
        controller: FlexSidebarController(pinned: false),
        primaryWidget: Container(
          height: 100,
          color: Colors.blue.shade100,
          child: Center(child: Text('Header')),
        ),
        secondaryWidget: Text('Footer'),
        items: [
          FlexSidebarItem(
            icon: Icon(Icons.home),
            label: Text('Home'),
            onTap: () {
              print('Home tapped');
            },
          ),
          FlexSidebarItem(
            icon: Icon(Icons.settings),
            label: Text('Settings'),
            onTap: () {
              print('Settings tapped');
            },
          ),
        ],
      ),
    ),
    body: Center(child: Text('Main Content')),
  )
```

## Notes

### Theming Priority:

The styling priority is as follows:

- **Direct Element Styles**: Styles applied directly to the icon (e.g., Icon.color) and label (e.g., Text.style) of a FlexSidebarItem have the highest priority.
- **Item-Specific Theme**: The itemThemeData of a FlexSidebarItem overrides the global theme for that item.
- **Global Sidebar Theme**: The itemThemeData in FlexThemeData applies to all items unless overridden. This hierarchy maximizes customization flexibility.

### Scrollable Items:

Enabling scrollableItems in FlexThemeData sets itemsAlignment to MainAxisAlignment.start automatically.

### Mobile Behavior:

The pin/unpin button is hidden on mobile devices to optimize the drawer experience.

### RTL Support:

The sidebar adapts to right-to-left layouts, with directional padding and margins respected.

## Contributing

Contributions are welcome! Please submit issues or pull requests to the GitHub repository.

## License

This package is licensed under the MIT License.
