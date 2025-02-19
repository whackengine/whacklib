# To do

## Packages

### whack.core.\*

(Inside whack.base)

- [ ] `Node` implements events `Event.ENTER_FRAME`, `Event.COMPONENT_DID_MOUNT` and `Event.COMPONENT_WILL_UNMOUNT` for `UIComponents` (methods such as `addChild()` and `removeChild()` must trigger them *"RECURSIVELY"*).
  - `COMPONENT_DID_MOUNT` is dispatched after the component has been added as a descendant of the topmost `Application` component.
  - `COMPONENT_WILL_UNMOUNT` is dispatched before the component is removed as a descendant from the topmost `Application` component.

### Enter frame event

- [ ] Dispatch it when entering frames on `whack.components.UIComponent` and `whack.gfx.DisplayObject`.

### whack.components.\*

(Inside whack.base)

Includes the `UIComponent` and `Application` classes using specific behavior for client side and server side.

Mechanisms:

- [ ] Register shortcut actions (keyboard and gamepad) in an application, including global shortcut events (such as update, button press, button release) and retrieving button pressure.
- [ ] Internationalization in an application, including global language events.
- [ ] Nest themes. Components may link an optional theme to be nested with that of the `Application`.
- [ ] When theme is updated (hierarchically), trigger `Event.THEME_UPDATE` for every descendant of a component.
- [ ] Provide CSS color retrieval method for a specific `UIComponent` (computes browser's CSS `color` property).
- [ ] On `Event.COMPONENT_WILL_UNMOUNT`, ensure internally generated CSS blocks are disposed from components that generated them.

### whack.components.hypertext

Defines components used by HTML tags.

### whack.layout.\*

(Inside whack.base)

### whack.skins.\*

(Inside whack.base)

### whack.events.\*

(Inside whack.base)

- [ ] `Event#clone()` should use `Object.clone()` by default.

### whack.utils.\*

(Inside whack.base)

- [ ] `Color` (wrap the NPM `color` package)
- [ ] Provide `ColorObserver`, which triggers `ColorObserverEvent.UPDATE_COLOR` with `color : whack.utils.Color` whenever CSS character color is possibly updated.
  - [ ] Implementation: constructor takes (*component*) and checks for `Event.THEME_UPDATE` (use setTimeout of 90ms to trigger update), and, for every parent, checks for `FocusEvent.FOCUS_IN`, `FocusEvent.FOCUS_OUT`, `MouseEvent.MOUSE_DOWN`, `MouseEvent.CLICK`, `MouseEvent.MOUSE_OVER`, `MouseEvent.MOUSE_UP`, `MouseEvent.MOUSE_OUT` (these listeners are removed on `Event.COMPONENT_WILL_UNMOUNT`). On `Event.COMPONENT_DID_MOUNT`, trigger `ColorObserverEvent.UPDATE_COLOR` once (use setTimeout of 70ms to trigger update).
  - [ ] Implementation: get `color` CSS property's value from HTML element's computed style.
  - [ ] Use-cases: icons adaptive to light or dark themes.
  - [ ] Document it

### whack.gfx.\*

(Outside whack.base)

whack.gfx.\* is implemented in an optional package that the user may depend in. It includes:

- The `Canvas` user interface component.
- The `DisplayObject` hierarchy of classes (not the same concept as Flash Display List, but very close).
  - `Bitmap`
  - `Shape` (supports geometric graphics drawing)
  - `TextArea`
  - `MovieClip`

Maybe implement it with PIXI.js if the clipping bug solves itself: may consider recreating the PIXI.js Application instance and reparenting previous children into new stage, at every resize event. Perhaps that works? And in that case, `Shape` would be rendered into a PIXI.js bitmap as needed.