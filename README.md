<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FlexSidebar</title>
  <style>
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
      line-height: 1.6;
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
      color: #333;
    }
    h1, h2, h3, h4 {
      color: #24292e;
    }
    h1 { font-size: 2.5em; text-align: center; }
    h2 { font-size: 1.75em; }
    h3 { font-size: 1.25em; }
    h4 { font-size: 1em; }
    p { margin: 10px 0; }
    a { color: #0366d6; text-decoration: none; }
    a:hover { text-decoration: underline; }
    img { max-width: 100%; height: auto; }
    table {
      width: 100%;
      border-collapse: collapse;
      margin: 20px 0;
    }
    th, td {
      border: 1px solid #dfe2e5;
      padding: 10px;
      text-align: center;
    }
    pre, code {
      background-color: #f6f8fa;
      border-radius: 6px;
      padding: 10px;
      font-family: 'SFMono-Regular', Consolas, 'Liberation Mono', Menlo, Courier, monospace;
      font-size: 85%;
    }
    pre { overflow-x: auto; }
    ul { margin: 10px 0; padding-left: 20px; }
    li { margin: 5px 0; }
    .badge { margin: 10px 0; text-align: center; }
  </style>
</head>
<body>
  <h1>FlexSidebar</h1>
  <p style="text-align: center;">A highly customizable sidebar and drawer widget for Flutter projects, supporting Android, iOS, Web, and Desktop.</p>

  <table>
    <tr>
      <th>Nested in Stack</th>
      <th>RTL in Row</th>
      <th>Mobile Drawer</th>
    </tr>
    <tr>
      <td><img src="https://github.com/HamedMohtadi/flex_sidebar/blob/main/example/repo/nested_stack.gif?raw=true" alt="Nested in Stack"></td>
      <td><img src="https://github.com/HamedMohtadi/flex_sidebar/blob/main/example/repo/row_rtl.gif?raw=true" alt="RTL in Row"></td>
      <td><img src="https://github.com/HamedMohtadi/flex_sidebar/blob/main/example/repo/mobile.gif?raw=true" alt="Mobile Drawer"></td>
    </tr>
  </table>

  <p class="badge">
    <a href="https://opensource.org/licenses/MIT">
      <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT">
    </a>
  </p>

  <h2>Features</h2>
  <ul>
    <li><strong>Fully Customizable</strong>: Tailor the sidebar's appearance and behavior with extensive theming options.</li>
    <li><strong>Subitems Support</strong>: Create nested menu items for hierarchical navigation.</li>
    <li><strong>Mobile Drawer Mode</strong>: Use the sidebar as a drawer on mobile devices for a responsive experience.</li>
    <li><strong>Flexible Alignment</strong>: Align items at the start, end, or center, with automatic adjustments when scrolling is enabled.</li>
    <li><strong>Theming</strong>: Apply global themes to the sidebar and items, with the ability to override themes for specific items.</li>
    <li><strong>Scroll Support</strong>: Enable scrollable items, automatically aligning them to the start.</li>
    <li><strong>Responsive Pinning</strong>: Pin or unpin the sidebar, with the pin/unpin button hidden on mobile devices.</li>
    <li><strong>RTL Support</strong>: Seamlessly works with right-to-left layouts.</li>
    <li><strong>Cross-Platform</strong>: Compatible with Android, iOS, Web, and Desktop Flutter projects.</li>
  </ul>

  <h2>Getting Started</h2>
  <h3>Installation</h3>
  <p>Add <code>flex_sidebar</code> to your <code>pubspec.yaml</code>:</p>
  <pre><code language="yaml">dependencies:
  flex_sidebar: ^1.0.0
</code></pre>
  <p>Or install it via the command line:</p>
  <pre><code language="bash">flutter pub add flex_sidebar
</code></pre>
  <p>Then, run:</p>
  <pre><code language="bash">flutter pub get
</code></pre>

  <h3>Importing the Package</h3>
  <p>Import the package in your Dart file:</p>
  <pre><code language="dart">import 'package:flex_sidebar/flex_sidebar.dart';
</code></pre>

  <h2>Usage</h2>
  <p>The <code>flex_sidebar</code> package provides a highly customizable sidebar widget that is easy to integrate into your Flutter app. You can place it in a <code>Row</code>, <code>Stack</code>, or use it as a drawer in mobile applications.</p>

![Image](https://github.com/HamedMohtadi/flex_sidebar/blob/main/example/repo/description.png?raw=true)

  <h3>Basic Example</h3>
  <p>Here’s a simple example of using <code>FlexSidebar</code> in a <code>Row</code>:</p>
  <pre><code language="dart">import 'package:flutter/material.dart';
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
</code></pre>

  <h2>Classes and Customization</h2>

  <h3>FlexSidebar</h3>
  <p>The <code>FlexSidebar</code> widget is the core component, rendering a customizable sidebar or drawer.</p>
  <h4>Constructor</h4>
  <pre><code language="dart">const FlexSidebar({
  super.key,
  required this.items,
  required this.primaryWidget,
  required this.secondaryWidget,
  required this.controller,
  this.theme = const FlexThemeData(),
})
</code></pre>
  <h4>Parameters</h4>
  <ul>
    <li><code>items</code>: A <code>List&lt;FlexSidebarItem&gt;</code> containing the sidebar menu items.</li>
    <li><code>primaryWidget</code>: A <code>Widget</code> displayed at the top (e.g., a header).</li>
    <li><code>secondaryWidget</code>: A <code>Widget</code> displayed at the bottom (e.g., a footer).</li>
    <li><code>controller</code>: A <code>FlexSidebarController</code> to manage the sidebar's state.</li>
    <li><code>theme</code>: A <code>FlexThemeData</code> object for styling the sidebar.</li>
  </ul>
  <h4>Example with Custom Theme</h4>
  <pre><code language="dart">FlexSidebar(
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
</code></pre>

  <h3>FlexSidebarItem</h3>
  <p>The <code>FlexSidebarItem</code> widget represents a single item, with support for subitems and hover animations.</p>
  <h4>Constructor</h4>
  <pre><code language="dart">const FlexSidebarItem({
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
</code></pre>
  <h4>Parameters</h4>
  <ul>
    <li><code>icon</code>: An <code>Icon</code> widget for the item’s icon.</li>
    <li><code>label</code>: A <code>Text</code> widget for the item’s label.</li>
    <li><code>onTap</code>: A <code>Function</code> called when the item is tapped.</li>
    <li><code>isSelected</code>: A <code>bool</code> indicating if the item is selected.</li>
    <li><code>minimized</code>: A <code>bool</code> indicating if the item is in minimized mode.</li>
    <li><code>itemThemeData</code>: A <code>FlexItemThemeData</code> object for styling this item (overrides global theme).</li>
    <li><code>hoverAnimationEnabled</code>: A <code>bool</code> to enable/disable hover animations.</li>
    <li><code>subitems</code>: A <code>List&lt;FlexSidebarItem&gt;</code> for nested subitems.</li>
  ව

System: You are Grok 3 built by xAI.

The user has requested that the README file be converted into an HTML format suitable for GitHub, with proper headings, tags, and styling. They provided a detailed description of their `flex_sidebar` package and a partially written Markdown README, asking for a comprehensive and polished version with grammatical and stylistic corrections. Below is the HTML version of the README, structured to match GitHub's rendering style, incorporating all provided details about the package's features and classes, and addressing the user's requirements.

<xaiArtifact artifact_id="912066a5-99c5-4ee3-b9b9-053f25fd1522" artifact_version_id="8fbe2c7c-74f2-4186-87cf-21a9db950045" title="README.html" contentType="text/html">
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FlexSidebar</title>
  <style>
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
      line-height: 1.6;
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
      color: #333;
    }
    h1, h2, h3, h4 {
      color: #24292e;
    }
    h1 { font-size: 2.5em; text-align: center; }
    h2 { font-size: 1.75em; }
    h3 { font-size: 1.25em; }
    h4 { font-size: 1em; }
    p { margin: 10px 0; }
    a { color: #0366d6; text-decoration: none; }
    a:hover { text-decoration: underline; }
    img { max-width: 100%; height: auto; }
    table {
      width: 100%;
      border-collapse: collapse;
      margin: 20px 0;
    }
    th, td {
      border: 1px solid #dfe2e5;
      padding: 10px;
      text-align: center;
    }
    pre, code {
      background-color: #f6f8fa;
      border-radius: 6px;
      padding: 10px;
      font-family: 'SFMono-Regular', Consolas, 'Liberation Mono', Menlo, Courier, monospace;
      font-size: 85%;
    }
    pre { overflow-x: auto; }
    ul { margin: 10px 0; padding-left: 20px; }
    li { margin: 5px 0; }
    .badge { margin: 10px 0; text-align: center; }
  </style>
</head>
<body>
  <h1>FlexSidebar</h1>
  <p style="text-align: center;">A highly customizable sidebar and drawer widget for Flutter projects, supporting Android, iOS, Web, and Desktop.</p>

  <table>
    <tr>
      <th>Nested in Stack</th>
      <th>RTL in Row</th>
      <th>Mobile Drawer</th>
    </tr>
    <tr>
      <td><img src="https://github.com/HamedMohtadi/flex_sidebar/blob/main/example/repo/nested_stack.gif?raw=true" alt="Nested in Stack"></td>
      <td><img src="https://github.com/HamedMohtadi/flex_sidebar/blob/main/example/repo/row_rtl.gif?raw=true" alt="RTL in Row"></td>
      <td><img src="https://github.com/HamedMohtadi/flex_sidebar/blob/main/example/repo/mobile.gif?raw=true" alt="Mobile Drawer"></td>
    </tr>
  </table>

  <p class="badge">
    <a href="https://opensource.org/licenses/MIT">
      <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT">
    </a>
  </p>

  <h2>Features</h2>
  <ul>
    <li><strong>Fully Customizable</strong>: Tailor the sidebar's appearance and behavior with extensive theming options.</li>
    <li><strong>Subitems Support</strong>: Create nested menu items for hierarchical navigation.</li>
    <li><strong>Mobile Drawer Mode</strong>: Use the sidebar as a drawer on mobile devices for a responsive experience.</li>
    <li><strong>Flexible Alignment</strong>: Align items at the start, end, or center, with automatic adjustments when scrolling is enabled.</li>
    <li><strong>Theming</strong>: Apply global themes to the sidebar and items, with the ability to override themes for specific items.</li>
    <li><strong>Scroll Support</strong>: Enable scrollable items, automatically aligning them to the start.</li>
    <li><strong>Responsive Pinning</strong>: Pin or unpin the sidebar, with the pin/unpin button hidden on mobile devices.</li>
    <li><strong>RTL Support</strong>: Seamlessly works with right-to-left layouts.</li>
    <li><strong>Cross-Platform</strong>: Compatible with Android, iOS, Web, and Desktop Flutter projects.</li>
  </ul>

  <h2>Getting Started</h2>
  <h3>Installation</h3>
  <p>Add <code>flex_sidebar</code> to your <code>pubspec.yaml</code>:</p>
  <pre><code>dependencies:
  flex_sidebar: ^1.0.0
</code></pre>
  <p>Or install it via the command line:</p>
  <pre><code>flutter pub add flex_sidebar
</code></pre>
  <p>Then, run:</p>
  <pre><code>flutter pub get
</code></pre>

  <h3>Importing the Package</h3>
  <p>Import the package in your Dart file:</p>
  <pre><code>import 'package:flex_sidebar/flex_sidebar.dart';
</code></pre>

  <h2>Usage</h2>
  <p>The <code>flex_sidebar</code> package provides a highly customizable sidebar widget that is easy to integrate into your Flutter app. You can place it in a <code>Row</code>, <code>Stack</code>, or use it as a drawer in mobile applications.</p>

  <h3>Basic Example</h3>
  <p>Here’s a simple example of using <code>FlexSidebar</code> in a <code>Row</code>:</p>
  <pre><code>import 'package:flutter/material.dart';
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
</code></pre>

  <h2>Classes and Customization</h2>

  <h3>FlexSidebar</h3>
  <p>The <code>FlexSidebar</code> widget is the core component, rendering a customizable sidebar or drawer.</p>
  <h4>Constructor</h4>
  <pre><code>const FlexSidebar({
  super.key,
  required this.items,
  required this.primaryWidget,
  required this.secondaryWidget,
  required this.controller,
  this.theme = const FlexThemeData(),
})
</code></pre>
  <h4>Parameters</h4>
  <ul>
    <li><code>items</code>: A <code>List&lt;FlexSidebarItem&gt;</code> containing the sidebar menu items.</li>
    <li><code>primaryWidget</code>: A <code>Widget</code> displayed at the top (e.g., a header).</li>
    <li><code>secondaryWidget</code>: A <code>Widget</code> displayed at the bottom (e.g., a footer).</li>
    <li><code>controller</code>: A <code>FlexSidebarController</code> to manage the sidebar's state.</li>
    <li><code>theme</code>: A <code>FlexThemeData</code> object for styling the sidebar.</li>
  </ul>
  <h4>Example with Custom Theme</h4>
  <pre><code>FlexSidebar(
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
</code></pre>

  <h3>FlexSidebarItem</h3>
  <p>The <code>FlexSidebarItem</code> widget represents a single item, with support for subitems and hover animations.</p>
  <h4>Constructor</h4>
  <pre><code>const FlexSidebarItem({
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
</code></pre>
  <h4>Parameters</h4>
  <ul>
    <li><code>icon</code>: An <code>Icon</code> widget for the item’s icon.</li>
    <li><code>label</code>: A <code>Text</code> widget for the item’s label.</li>
    <li><code>onTap</code>: A <code>Function</code> called when the item is tapped.</li>
    <li><code>isSelected</code>: A <code>bool</code> indicating if the item is selected.</li>
    <li><code>minimized</code>: A <code>bool</code> indicating if the item is in minimized mode.</li>
    <li><code>itemThemeData</code>: A <code>FlexItemThemeData</code> object for styling this item (overrides global theme).</li>
    <li><code>hoverAnimationEnabled</code>: A <code>bool</code> to enable/disable hover animations.</li>
    <li><code>subitems</code>: A <code>List&lt;FlexSidebarItem&gt;</code> for nested subitems.</li>
  </ul>
  <h4>Example with Subitems</h4>
  <pre><code>FlexSidebarItem(
  icon: Icon(Icons.dashboard),
  label: Text('Dashboard'),
  isSelected: true,
  onTap: () {
    print('Dashboard tapped');
  },
  itemThemeData: FlexItemThemeData(
    selectedItemColor: Colors.blue,
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
</code></pre>

  <h3>FlexSidebarController</h3>
  <p>The <code>FlexSidebarController</code> manages the sidebar's state, such as the selected item and pinned status.</p>
  <h4>Constructor</h4>
  <pre><code>FlexSidebarController({
  int currentIndex = 0,
  bool pinned = true,
  Curve resizeAnimCurve = Curves.easeOutCirc,
})
</code></pre>
  <h4>Methods</h4>
  <ul>
    <li><code>setIndex(int index)</code>: Sets the selected item index.</li>
    <li><code>setPinned(bool pinned)</code>: Sets whether the sidebar is pinned (hidden on mobile).</li>
    <li><code>setResizeAnimCurve(Curve animCurve)</code>: Sets the animation curve for resizing.</li>
  </ul>
  <h4>Getters</h4>
  <ul>
    <li><code>index</code>: The current selected item index.</li>
    <li><code>pinned</code>: Whether the sidebar is pinned.</li>
    <li><code>resizeAnimCurve</code>: The resize animation curve.</li>
  </ul>
  <h4>Example</h4>
  <pre><code>final controller = FlexSidebarController(currentIndex: 0, pinned: true);

controller.setIndex(1); // Select the second item
controller.setPinned(false); // Unpin the sidebar
</code></pre>

  <h3>FlexThemeData</h3>
  <p>The <code>FlexThemeData</code> class defines the sidebar's global appearance.</p>
  <h4>Constructor</h4>
  <pre><code>const FlexThemeData({
  this.normalWidth = 300,
  this.minimizedWidth = 60,
  this.padding = const EdgeInsetsDirectional.all(0),
  this.margin = const EdgeInsetsDirectional.all(0),
  this.itemThemeData = const FlexItemThemeData(),
  this.itemsAlignment = MainAxisAlignment.end,
  this.scrollableItems = false,
  this.footerDivider = const Divider(indent: 5, endIndent: 5, color: Colors.black12),
  this.normalDecoration = const BoxDecoration(...),
  this.minimizedDecoration = const BoxDecoration(...),
})
</code></pre>
  <h4>Parameters</h4>
  <ul>
    <li><code>normalWidth</code>: Width when expanded.</li>
    <li><code>minimizedWidth</code>: Width when minimized.</li>
    <li><code>padding</code>: Padding for the sidebar content.</li>
    <li><code>margin</code>: Margin around the sidebar.</li>
    <li><code>itemThemeData</code>: Default <code>FlexItemThemeData</code> for items.</li>
    <li><code>itemsAlignment</code>: Alignment of items (set to <code>start</code> if <code>scrollableItems</code> is <code>true</code>).</li>
    <li><code>scrollableItems</code>: Enables scrolling for items.</li>
    <li><code>footerDivider</code>: Divider for the footer.</li>
    <li><code>normalDecoration</code>: Decoration when expanded.</li>
    <li><code>minimizedDecoration</code>: Decoration when minimized.</li>
  </ul>
  <h4>Example</h4>
  <pre><code>FlexThemeData(
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
</code></pre>

  <h3>FlexItemThemeData</h3>
  <p>The <code>FlexItemThemeData</code> class styles individual sidebar items, overriding the global <code>itemThemeData</code> if specified.</p>
  <h4>Constructor</h4>
  <pre><code>const FlexItemThemeData({
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
</code></pre>
  <h4>Parameters</h4>
  <ul>
    <li><code>itemTextStyle</code>: Text style for labels.</li>
    <li><code>iconPadding</code>: Padding for icons.</li>
    <li><code>labelPadding</code>: Padding for labels.</li>
    <li><code>itemPadding</code>: Padding for the entire item.</li>
    <li><code>hoverAnimColor</code>: Color for hover animations.</li>
    <li><code>itemColor</code>: Default item color.</li>
    <li><code>selectedItemColor</code>: Color for selected items.</li>
    <li><code>disabledItemColor</code>: Color for disabled items.</li>
    <li><code>iconSize</code>: Size of the icon.</li>
  </ul>
  <h4>Example</h4>
  <pre><code>FlexItemThemeData(
  itemTextStyle: TextStyle(fontSize: 16, color: Colors.blue),
  selectedItemColor: Colors.blueAccent,
  hoverAnimColor: Colors.blue.shade200,
  iconSize: 24,
)
</code></pre>

  <h2>Mobile Drawer Example</h2>
  <p>To use <code>FlexSidebar</code> as a drawer in mobile applications, wrap it in a <code>Drawer</code> widget:</p>
  <pre><code>Scaffold(
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
</code></pre>

  <h2>Notes</h2>
  <ul>
    <li><strong>Theming Priority</strong>: If a <code>FlexSidebarItem</code> has its own <code>itemThemeData</code>, it overrides the global <code>itemThemeData</code> from <code>FlexThemeData</code>.</li>
    <li><strong>Scrollable Items</strong>: Enabling <code>scrollableItems</code> in <code>FlexThemeData</code> sets <code>itemsAlignment</code> to <code>MainAxisAlignment.start</code> automatically.</li>
    <li><strong>Mobile Behavior</strong>: The pin/unpin button is hidden on mobile devices to optimize the drawer experience.</li>
    <li><strong>RTL Support</strong>: The sidebar adapts to right-to-left layouts, with directional padding and margins respected.</li>
  </ul>

  <h2>Contributing</h2>
  <p>Contributions are welcome! Please submit issues or pull requests to the <a href="https://github.com/HamedMohtadi/flex_sidebar">GitHub repository</a>.</p>

  <h2>License</h2>
  <p>This package is licensed under the MIT License.</p>
</body>
</html>
