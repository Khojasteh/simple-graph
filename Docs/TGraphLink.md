TGraphLink = class([TGraphObject](TGraphObject.md))
===================================================
This class represents links (edges) of a graph.

Properties
----------
In addition to the properties of the [TGraphObject](Docs/TGraphObject.md) class, the `TGraphLink` class has the following extra properties:

- **`public Polyline: TPoints`** \
  Gets or sets the endpoint coordinates of the link's line segments.

- **`public Points[Index: Integer]: TPoint`** \
  Determines the coordinate of a start, break, or end point of the link, by specifying its zero-based index.

- **`public PointCount: Integer read fPointCount`** (read-only) \
  Gets the number of points in the `Polyline` and `Points` properties of the link.

- **`published TextPosition: Integer default -1`** \
  Determines the index of the line segment, where the caption of the link appears parallel to it. A value of -1 for this property, indicates the longest line segment.

- **`published TextSpacing: Integer default 0`** \
  Determines the distance between the caption of the link and the line segment parallel to it.

- **`published BeginStyle: TLinkBeginEndStyle default lsNone`** \
  `TLinkBeginEndStyle = (lsNone, lsArrow, lsArrowSimple, lsCircle, lsDiamond)` \
  Specifies the begin style of the link.

  | Value         | Shape at the starting point of the link |
  |---------------|-----------------------------------------|
  | lsNone        | Nothing                                 |
  | lsArrow       | An open-headed arrow                    |
  | lsArrowSimple | A simple arrow                          |
  | lsCircle      | A circle                                |
  | lsDiamond     | A diamond                               |

- **`published BeginSize: Byte default 6`** \
  Determines the size of the `BeginStyle` shape of the link.

- **`published EndStyle: TLinkBeginEndStyle default lsArrow`** \
  `TLinkBeginEndStyle = (lsNone, lsArrow, lsArrowSimple, lsCircle, lsDiamond)` \
  Specifies the end style of the link.

  | Value         | Shape at the ending point of the link   |
  |---------------|-----------------------------------------|
  | lsNone        | Nothing                                 |
  | lsArrow       | An open-headed arrow                    |
  | lsArrowSimple | A simple arrow                          |
  | lsCircle      | A circle                                |
  | lsDiamond     | A diamond                               |

- **`published EndSize: Byte default 6`** \
  Determines the size of the `EndStyle` shape of the link. 

- **`published LinkOptions: TGraphLinkOptions default []`** \
  `TGraphLinkOptions =  (gloFixedStartPoint, gloFixedEndPoint, gloFixedBreakPoints, gloFixedAnchorStartPoint, gloFixedAnchorEndPoint)` \
  Specifies the behavioral attributes of the node.

  | Value                    | Description                                                           |
  |--------------------------|-----------------------------------------------------------------------|
  | gloFixedStartPoint       | The starting point of the link cannot be changed.                     |
  | gloFixedEndPoint         | The ending point of the link cannot be changed.                       |
  | gloFixedBreakPoints      | The breakpoints of the link cannot be changed.                        |
  | gloFixedAnchorStartPoint | If the starting point of the link is attached to a node, the point is fixed to the center of the node. If the starting point of the link is attached to a link, the point is fixed to the innermost breakpoint or line segment of the other link. |
  | gloFixedAnchorEndPoint   | If the ending point of the link is attached to a node, the point is fixed to the center of the node. If the ending point of the link is attached to a link, the point is fixed to the innermost breakpoint or line segment of the other link. |

  See also the `Options` property of [TGraphObject](TGraphObject.md) class.

- **`public Source: TGraphObject`** \
  Determines the graph object to which the starting point of the link is attached.

- **`public Target: TGraphObject`** \
  Determines the graph object to which the ending point of the link is attached.

Methods
-------
In addition to the methods of the [TGraphObject](Docs/TGraphObject.md) class, the `TGraphLink` class has the following extra methods:

- **`constructor CreateNew(AOwner: TSimpleGraph; ASource: TGraphObject; const Pts: array of TPoint; ATarget: TGraphObject);`** \
  Initiates a new instance of the link class.

  | Parameter      | Description                                                                                          |
  |----------------|------------------------------------------------------------------------------------------------------|
  | AOwner         | The [TSimpleGraph](TSimpleGraph.md) instance that owns this link                                     |
  | ASource        | The [GraphObject](TGraphObject.md.md) instance that is the source of a connection, or `nil` for none |
  | Pts            | The control points of the link                                                                       |
  | ATarget        | The [GraphObject](TGraphObject.md.md) instance that is the target of a connection, or `nil` for none |

  A `EGraphInvalidOperation` exception will be raised if instance cannot be created.

- **`function AddPoint(const Pt: TPoint): Integer;`** \
  Adds a point to the end of the `Points` list.

  | Parameter      | Description                                                            |
  |----------------|------------------------------------------------------------------------|
  | Pt             | The coordinate of the new point                                        |

  Returns the index of the newly added point in the `Points` list.

- **`procedure InsertPoint(Index: Integer; const Pt: TPoint);`** \
  Adds a point at a specified index of the `Points` list .

  | Parameter      | Description                                                            |
  |----------------|------------------------------------------------------------------------|
  | Index          | The index of the new point in the `Points` list                        |
  | Pt             | The coordinate of the new point                                        | 

- **`procedure RemovePoint(Index: Integer);`** \
  Removes the point at the specified index of the `Points` list. 

  | Parameter      | Description                                                            |
  |----------------|------------------------------------------------------------------------|
  | Index          | The index of the point in the `Points` list                            |

- **`function IndexOfPoint(const Pt: TPoint; Neighborhood: Integer = 0): Integer;`** \
  Finds index of a point in the `Points` list.

  | Parameter      | Description                                                            |
  |----------------|------------------------------------------------------------------------|
  | Pt             | The coordinate of the point                                            |
  | Neighborhood   | The proximity tolerance as radius in pixels                            |

  Returns the index of the point if the point is found; otherwise, returns -1.

- **`function AddBreakPoint(const Pt: TPoint): Integer;`** \
  Inserts a breakpoint at the specified point on (or close to) a line segment of the link. 

  | Parameter      | Description                                                            |
  |----------------|------------------------------------------------------------------------|
  | Pt             | The coordinate of the point                                            |

  Returns the index of the inserted point in the `Points` list, or -1 if the point was not close to any line segment.

- **`function NormalizeBreakPoints(Options: TLinkNormalizeOptions): Boolean;`** \
  Passes through the `Points` list and deletes the ineffectual ones.

  | Parameter      | Description                                                            |
  |----------------|------------------------------------------------------------------------|
  | Options        | Determines how to select the candidate points for removal              |

  The `Options` parameter can have a combination of the following values:

  | Value              | Meaning                                                            |
  |--------------------|--------------------------------------------------------------------|
  | lnoDeleteSamePoint | Remove the break points that produce tiny line segments            |
  | lnoDeleteSameAngle | Remove the break points that produce parallel line segments        |

  Returns `true` if any point is removed; otherwise, returns `false`.

- **`function IsFixedPoint(Index: Integer; HookedPointsAsFixed: Boolean): Boolean;`** \
  Determines whether the point at the specified index of the `Points` list, is fixed.

  | Parameter           | Description                                                                             |
  |---------------------|-----------------------------------------------------------------------------------------|
  | Index               | The index of the point in the `Points` list                                             |
  | HookedPointsAsFixed | Specifies whether the points attached to other graph objects should be considered fixed |

  Returns `true` if the point is a fixed point; otherwise, returns `false`.

- **`function IsHookedPoint(Index: Integer): Boolean;`** \
  Determines whether the point at the specified index of the `Points` list is attached to a graph object.

  | Parameter           | Description                                                         |
  |---------------------|---------------------------------------------------------------------|
  | Index               | The index of the point in the `Points` list                         |

  Returns `true` if the point is attached to a graph object; otherwise, returns `false`.  

- **`function HookedObjectOf(Index: Integer): TGraphObject;`** \
  Gets the graph object to which the point at the specified index of the `Points` list is attached.

  | Parameter           | Description                                                         |
  |---------------------|---------------------------------------------------------------------|
  | Index               | The index of the point in the `Points` list                         |

  Returns the graph object to which the point is attached, or `nil` if the point is attached to none.

- **`function HookedIndexOf(GraphObject: TGraphObject): Integer;`** \
  Gets the index of a point in the `Points` list, to which a specified graph object is attached.

  | Parameter           | Description                                                         |
  |---------------------|---------------------------------------------------------------------|
  | GraphObject         | A [TGraphObject](TGraphObject.md) instance                          |

  Returns the index of the point, or -1 if the graph object is not attached to the link.

- **`function HookedPointCount: Integer;`** \
  Returns the number of points in the `Points` list, which are attached to a graph object.

- **`function CanHook(Index: Integer; GraphObject: TGraphObject): Boolean;`** \
  Examines whether the point at the specified index of the `Points` list can be attached to a given graph object.

  | Parameter           | Description                                                         |
  |---------------------|---------------------------------------------------------------------|
  | Index               | The index of the point in the `Points` list                         |
  | GraphObject         | A [TGraphObject](TGraphObject.md) instance                          |

  Returns `true` if the link can be attached to the graph object at the specified point; otherwise, returns `false`.

- **`function Hook(Index: Integer; GraphObject: TGraphObject): Boolean;`** \
  Attaches the point at the specified index of the `Points` list to a given graph object.

  | Parameter           | Description                                                         |
  |---------------------|---------------------------------------------------------------------|
  | Index               | The index of the point in the `Points` list                         |
  | GraphObject         | A [TGraphObject](TGraphObject.md) instance                          |

  Returns `true` if the link could attach to the graph object at the specified point; otherwise, returns `false`. 

- **`function Unhook(Index: Integer): Boolean; overload;`** \
  Detaches the point at the specified index of the `Points` list from any graph object.

  | Parameter           | Description                                                         |
  |---------------------|---------------------------------------------------------------------|
  | Index               | The index of the point in the `Points` list                         |
  
  Returns `true` if the link was attached to a graph object at the specified point; otherwise, returns `false`.

- **`function Unhook(GraphObject: TGraphObject): Integer; overload;`** \
  Detaches the link from a given graph object.
  
  | Parameter           | Description                                                         |
  |---------------------|---------------------------------------------------------------------|
  | GraphObject         | A [TGraphObject](TGraphObject.md) instance                          |

  Returns the index of the attached point if the link was attached to the graph object; otherwise, returns -1.

- **`function CanLink(ASource, ATarget: TGraphObject): Boolean;`** \
  Examines whether the link can connect two graph objects.

  | Parameter   | Description                                                                 |
  |-------------|-----------------------------------------------------------------------------|
  | ASource     | A [TGraphObject](TGraphObject.md) instance as the source of the connection  |
  | ASource     | A [TGraphObject](TGraphObject.md) instance as the target of the connection  |

  Returns `true` if the link can connect the graph objects; otherwise, returns `false`.

- **`function Link(ASource, ATarget: TGraphObject): Boolean;`** \
  Connects two graph objects.

  | Parameter   | Description                                                                 |
  |-------------|-----------------------------------------------------------------------------|
  | ASource     | A [TGraphObject](TGraphObject.md) instance as the source of the connection  |
  | ASource     | A [TGraphObject](TGraphObject.md) instance as the target of the connection  |

  Returns `true` if the link could connect the graph objects; otherwise, returns `false`.

- **`function CanMove: Boolean;`** \
  Returns `true` if all the points in the `Points` list of the link can move freely.

- **`function Rotate(const Angle: Double; const Origin: TPoint): Boolean;`** \
  Rotates the link by an angle around a specified point.

  | Parameter   | Description                                                                 |
  |-------------|-----------------------------------------------------------------------------|
  | Angle       | The angle of rotation in radians                                            |
  | Origin      | The coordinate of the center of rotation                                    |

  Returns `true` if the link is rotated; otherwise, returns `false`.

- **`function Scale(const Factor: Double): Boolean;`** \
  Scales the link by a scaling factor.

  | Parameter   | Description                                                                 |
  |-------------|-----------------------------------------------------------------------------|
  | Factor      | The scaling factor                                                          |

  Returns `true` if the link is scaled; otherwise, returns `false`.

- **`procedure Reverse;`** \
  Reverses the direction of the link.
