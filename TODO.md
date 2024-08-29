# To do

## Packages

### sw.core.\*

(Inside sw.core)

Includes at least the `Application` and `UIComponent` classes.

Mechanisms:

- Register shortcut actions (keyboard and gamepad) in an application, including global shortcut events (such as update, button press, button release) and retrieving button pressure.
- Internationalization in an application, including global language events.

### sw.controls.\*

(Inside sw.core)

For the `new UIComponent()` constructor, throw an `Error` for server side (the Node.js engine).

## sw.layout.\*

(Inside sw.core)

## sw.skins.\*

(Inside sw.skins)

### sw.gfx.\*

(Outside sw.core)

sw.gfx.\* is implemented in an optional package that the user may depend in. It includes:

- The `Canvas` user interface component.
- The `DisplayObject` hierarchy of classes (not the same concept as Flash Display List).