TGraphNode = class([TGraphObject](TGraphObject.md))
===================================================
This abstract class the base class of all graph nodes.

Properties
----------
In addition to the properties of the [TGraphObject](Docs/TGraphObject.md) class, the `TGraphNode` class has the following extra properties:

- **`published Alignment: TAlignment default taCenter`** \
  `TAlignment = (taLeftJustify, taRightJustify, taCenter)` \
  Controls the horizontal placement of the text within the node.

  | Value          | Description                                                              |
  |----------------|--------------------------------------------------------------------------|
  | taLeftJustify  | The text is left-justified: lines all begin at the left edge of the node |
  | taCenter       | The text is centered horizontally in the node                            |
  | taRightJustify | The text is right-justified: lines all end at the right edge of the node |

- **`published Layout: TTextLayout default tlCenter`** \
  `TTextLayout = (tlTop, tlCenter, tlBottom)` \
  Specifies the vertical placement of the text within the node.

  | Value          | Description                                                              |
  |----------------|--------------------------------------------------------------------------|
  | tlTop          | The text appears at the top of the node                                  |
  | tlCenter       | The text is vertically centered in the node                              |
  | tlBottom       | The text appears along the bottom of the node                            |

- **`published Margin: Integer default 8`** \
  Determines the margin of the text from edges of the node.

- **`published Background: TPicture`** \
  Specifies the background image of the node.

- **`public BackgroundMargins: TRect`** \
  Determines the margins of the background image relative to the node's dimensions in percent.

- **`published Left: Integer`** \
  Specifies the x-coordinate of the node's top-left corner.

- **`published Top: Integer`** \
  Specifies the y-coordinate of the node's top-left corner.
  
- **`published Width: Integer`** \
  Specifies the horizontal size of the node.

- **`published Height: Integer`** \
  Specifies the vertical size of the node

- **`public Center: TPoint`** (read-only) \
  Gets the coordinate of the node's center of mass.

- **`published NodeOptions: TGraphNodeOptions default [gnoMovable, gnoResizable, gnoShowBackground]`** \
  `TGraphNodeOptions = set of (gnoMovable, gnoResizable, gnoShowBackground)` \
  Specifies the visual and behavioral attributes of the node.

  | Value             | Description                                                           |
  |-------------------|-----------------------------------------------------------------------|
  | gnoMovable        | The location of node is changeable                                    |
  | gnoResizable      | The size of node is changeable                                        |
  | gnoShowBackground | The background image of the node is visible                           |

  See also the `Options` property of [TGraphObject](TGraphObject.md) class.


Methods
----------
In addition to the properties of the [TGraphObject](Docs/TGraphObject.md) class, the `TGraphNode` class has the following extra methods:

- **`constructor CreateNew(AOwner: TSimpleGraph; const Bounds: TRect);`** \
  Creates an instance of the node class and sets its bounding rectangle.

  | Parameter      | Description                                                              |
  |----------------|--------------------------------------------------------------------------|
  | AOwner         | The [TSimpleGraph](TSimpleGraph.md) instance that owns this node         |
  | Bounds         | The bounding rectangle of the node                                       |

- **`procedure CanMoveResize(var NewLeft, NewTop, NewWidth, NewHeight: Integer; out CanMove, CanResize: Boolean);`** \
  Examines whether the node can be moved or resized.

  | Parameter      | Description                                                              |
  |----------------|--------------------------------------------------------------------------|
  | NewLeft        | The new x-coordinate of the node's top-left corner                       |
  | NewTop         | The new y-coordinate of the node's top-left corner                       |
  | NewWidth       | The new width of the node                                                |
  | NewHeight      | The new height of the node                                               |
  | CanMove        | Specifies whether the node is relocatable                                |
  | CanResize      | Specifies whether the node is resizable                                  |

- **`procedure SetBounds(aLeft, aTop, aWidth, aHeight: Integer);`** \
  Sets the `Left`, `Top`, `Width`, and `Height` properties of the node, all at once.
  
  | Parameter      | Description                                                              |
  |----------------|--------------------------------------------------------------------------|
  | aLeft          | The new x-coordinate of the node's top-left corner                       |
  | aTop           | The new y-coordinate of the node's top-left corner                       |
  | aWidth         | The new width of the node                                                |
  | aHeight        | The new height of the node                                               |
