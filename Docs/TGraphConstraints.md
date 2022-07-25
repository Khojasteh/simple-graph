TGraphConstraints = class(TPersistent)
======================================
This class has the bounding box of the graph objects on a [TSimpleGraph](TSimpleGraph.md) control.

Properties
----------
In addition to the properties of the `TPersistent` class, the `TGraphConstraints` class provides the following properties:

- **`public BoundsRect: TRect`** \
  Specifies the bounding box of the graph objects on canvas as a `TRect` value.
  
- **`published MinLeft: Integer default 0`** \
  Specifies the minimum horizontal placement of a graph object on canvas.
  
- **`published MinTop: Integer default 0`** \
  Specifies the minimum vertical placement of a graph object on canvas.
  
- **`published MaxRight: Integer default 65535`** \
  Specifies the maximum horizontal placement of a graph object on canvas.
  
- **`published MaxBottom: Integer default 65535`** \
  Specifies the maximum vertical placement of a graph object on canvas.
  
- **`public Owner: TSimpleGraph`** (read-only) \
  Gets the [TSimpleGraph](TSimpleGraph.md) control that owns this instance.
  
Methods
-------
In addition to the methods of the `TPersistent` class, the `TGraphConstraints` class has the following public methods:

- **`procedure SetBounds(aLeft, aTop, aWidth, aHeight: Integer);`** \
  Sets the bounding box of the graph objects on canvas.

  | Parameter | Description                                       |
  |-----------|---------------------------------------------------|
  | aLeft     | The minimum horizontal position                   |
  | aTop      | The minimum vertical position                     |
  | aWidth    | The maximum horizontal size                       |
  | aHeight   | The minimum vertical size                         |

- **`function WithinBounds(const Pts: array of TPoint): Boolean;`** \
  Determines whether all the given coordinates satisfy the constraints.

  | Parameter | Description                                       |
  |-----------|---------------------------------------------------|
  | Pts       | The array of coordinates to be examined           |

  Returns `true` if all the coordinates satisfy the constraints; otherwise, return `false`.

- **`function ConfinePt(var Pt: TPoint): Boolean;`** \
  Moves a given coordinate inside the bounding box if it is outside of the box.

  | Parameter | Description                                       |
  |-----------|---------------------------------------------------|
  | Pt        | The coordinates to be confined                    |

  Returns `true` if the coordinate already satisfies the constraints; otherwise, return `false`.

- **`function ConfineRect(var Rect: TRect): Boolean;`** \
  Shrinks a given rectangle to fit inside the bounding box if any side of it is outside of the box.

  | Parameter | Description                                       |
  |-----------|---------------------------------------------------|
  | Rect      | The rectangle to be confined                      |

  Returns `true` if the rectangle already satisfies the constraints; otherwise, return `false`.

- **`function ConfineMoveResize(const Rect: TRect; Mobility: TObjectSides; var dX, dY: Integer): Boolean;`** \
  Adjusts changes in position and/or size of a rectangle, so that the rectangle stays inside the bounding box.

  | Parameter | Description                                       |
  |-----------|---------------------------------------------------|
  | Rect      | The rectangle                                     |
  | Mobility  | The sides of the rectangle that can be displaced  |
  | dX        | The amount of horizontal changes                  |
  | dY        | The amount of vertical changes                    |

  Returns `true` if after applying the changes, the rectangle already satisfies the constraints; otherwise, return `false`.

Events
------
The `TGraphConstraints` class has the following event:

- **`OnChange: TNotifyEvent`** \
  Occurs when the value of a property has been changed.
