TGraphScrollBar = class(TPersistent)
====================================
This class manages a horizontal or vertical scroll bar on a [TSimpleGraph](TSimpleGraph.md) control.

Properties
----------
In addition to the properties of the `TPersistent` class, the `TGraphScrollBar` class provides the following properties:

- **`published ButtonSize: Integer default 0`** \
  Specifies the sizes of the buttons in the scroll bar.

  If the scroll bar is horizontal, `ButtonSize` is the width of the arrow buttons in pixels. 

  If the scroll bar is vertical, `ButtonSize` is the height of the arrow buttons in pixels.
  
  Set this property to zero to use the system's default button size.
  
- **`published Color: TColor default clBtnHighlight`** \
  Specifies the scroll bar's color.

- **`published Increment: TScrollBarInc default 8`** \
  Determines how far the display moves when the user clicks one of the small end arrows on the scroll bar.

- **`public Kind: TScrollBarKind`** (read-only) \
  Indicates whether the scroll bar is horizontal or vertical.

- **`published Margin: Word default 0`** \
  Determines the minimum number of pixels that must separate a graph object from the edge of the [TSimpleGraph](TSimpleGraph.md) control. At runtime, whenever a graph object is less than `Margin` pixels from the edge and the `Visible` property is set to `true`, the scroll bar appears.

- **`public Owner: TSimpleGraph`** (read-only) \
  Determines the [TSimpleGraph](TSimpleGraph.md) control that owns this scroll bar.

- **`published ParentColor: Boolean default true`** \
  Specifies whether the scroll bar should use the color of its parent [TSimpleGraph](TSimpleGraph.md) control.

  When the value of the `Color` property is changed, the `ParentColor` property is automatically set to `false`.

- **`published Position: Integer default 0`** \
  Specifies the position of the thumb tab on the scroll bar.

  Use `Position` to programmatically scroll the client area of the [TSimpleGraph](TSimpleGraph.md) control. 
  
  The value of `Position` changes (from 0 to `Range`) at runtime as the user scrolls the scroll bar.

- **`public Range: Integer`** (read-only) \
  Determines how far the scrolling region of the [TSimpleGraph](TSimpleGraph.md) control can move.

- **`public ScrollPos: Integer`** (read-only) \
  Indicates the position of the thumb tab.

  The read-only `ScrollPos` property gets the current value of the `Position` property when the scroll bar is visible. If the scroll bar is not visible, the value of this property is 0.

- **`published Size: Integer default 0`** \
  Specifies the scroll bar's size.

  If the scroll bar is horizontal, `Size` is the width of the scroll bar in pixels.

  If the scroll bar is vertical, `ButtonSize` is the height of the scroll bar in pixels.
  
  Set this property to zero to use the system's default size.

- **`published Smooth: Boolean default false`** \
  Specifies whether the amount the [TSimpleGraph](TSimpleGraph.md) control scrolls is dynamically computed.

- **`published Style: TScrollBarStyle default ssRegular`** \
  Determines whether the scroll bar appears three-dimensional, flat, or uses hot tracking.

- **`published ThumbSize: Integer default 0`** \
  Specifies the length of the scroll bar's thumb tab.

- **`published Tracking: Boolean default false`** \
  Determines whether the graph on the [TSimpleGraph](TSimpleGraph.md) control moves before the thumb tab is released.

- **`published Visible: Boolean default true`** \
  Determines whether the scroll bar appears.

  If `Visible` is set to `true`, the scroll bar appears whenever a graph object is less than `Margin` pixels from the edge of the [TSimpleGraph](TSimpleGraph.md) control. 
  
  If `Visible` is set to `false`, the scroll bar is never visible.

Methods
-------
In addition to the methods of the `TPersistent` class, the `TGraphScrollBar` class has the following public method:

- **`function IsScrollBarVisible: Boolean;`** \
  Determines whether the scroll bar is currently visible on the [TSimpleGraph](TSimpleGraph.md) control.

  Returns `true` if the scroll bar is visible; otherwise, returns `false`.