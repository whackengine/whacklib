# To do

## Packages

### whack.core.\*

(Inside whack.core)

Includes at least the `Application` and `UIComponent` classes.

Mechanisms:

- Register shortcut actions (keyboard and gamepad) in an application, including global shortcut events (such as update, button press, button release) and retrieving button pressure.
- Internationalization in an application, including global language events.

### whack.controls.\*

(Inside whack.core)

For the `new UIComponent()` constructor, throw an `Error` for server side (the Node.js engine).

## whack.layout.\*

(Inside whack.core)

## whack.skins.\*

(Inside whack.skins)

### whack.gfx.\*

(Outside whack.core)

whack.gfx.\* is implemented in an optional package that the user may depend in. It includes:

- The `Canvas` user interface component.
- The `DisplayObject` hierarchy of classes (not the same concept as Flash Display List).