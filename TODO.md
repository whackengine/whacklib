# To do

## Packages

### whack.core.\*

(Inside whack.base)

### whack.components.\*

(Inside whack.base)

Includes the `UIComponent` and `Application` classes using specific behavior for client side and server side.

Mechanisms:

- Register shortcut actions (keyboard and gamepad) in an application, including global shortcut events (such as update, button press, button release) and retrieving button pressure.
- Internationalization in an application, including global language events.

### whack.components.tags

Defines components used by HTML tags.

### whack.layout.\*

(Inside whack.base)

### whack.skins.\*

(Inside whack.base)

### whack.events.\*

(Inside whack.base)

- [ ] `Event#clone()` should use `Object.clone()` by default.

### whack.gfx.\*

(Outside whack.base)

whack.gfx.\* is implemented in an optional package that the user may depend in. It includes:

- The `Canvas` user interface component.
- The `DisplayObject` hierarchy of classes (not the same concept as Flash Display List, but very close).
  - `Bitmap`
  - `Shape`
  - `TextArea`
  - `MovieClip`