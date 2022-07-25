TGraphObject = class(TPersistent)
=================================
This abstract class is the ancestor of all the objects that appear on a graph.

Properties
----------
In addition to the properties of the `TPersistent` class, the `TGraphObject` class provides the following properties:

- **`public BoundsRect: TRect`** \
  Determines the bounding rectangle of the graph object in graph coordinates.

- **`published Brush: TBrush`** \
  Determines the color and pattern for filling the background of the graph object.

- **`public Data: Pointer`** \
  Stores a pointer value as part of the graph object.

- **`public DependentCount: Integer`** (read-only) \
  Determines the number of graph objects whose placement on the graph is dependent on this graph object.

- **`public Dependents[Index: Integer]: TGraphObject`** (read-only) \
  Contains the list of graph objects whose placement on the graph is dependent on this graph object.

- **`public Dragging: Boolean`** (read-only) \
  Indicates whether the graph object is being dragged.

- **`published Font: TFont`** \
  Specifies the font to use when rendering a text on the graph object.

- **`published HasCustomData: Boolean default false`** \
  Indicates whether the graph object holds some application defined data that should be saved.

  If `HasCustomData` is set to `true`, the owner [TSimpleGraph](TSimpleGraph.md) control raises an `OnObjectWrite` event for saving the custom data of the graph object into a stream.

- **`published Hint: String`** \
  Specifies the text string that appears as the tooltip of the graph object.

- **`public ID: DWord`** (read-only) \
  Determines the unique identifier of the graph object in the graph.

- **`public LinkInputCount: Integer`** \
  Determines the number of graph links/edges whose ending point is attached to this graph object.

- **`public LinkInputs[Index: Integer]: TGraphLink`** \
  Contains the list of graph links/edges whose ending point is attached to this graph object.

  The `Target` property of all the [TGraphLink](TGraphLink.md) objects in this list refers to this graph object.

- **`public LinkOutputCount: Integer`** \
  Determines the number of graph links/edges whose starting point is attached to this graph object.

- **`public LinkOutputs[Index: Integer]: TGraphLink`** \
  Contains the list of graph links/edges whose starting point is attached to this graph object.

  The `Source` property of all the [TGraphLink](TGraphLink.md) objects in this list refers to this graph object.

- **`published Options: TGraphObjectOptions default [goLinkable, goSelectable, goShowCaption]`** \
  `TGraphObjectOptions = set of (goLinkable, goSelectable, goShowCaption)` \
  Specifies the visual and behavioral attributes of the node.

  | Value          | Description                                                           |
  |----------------|-----------------------------------------------------------------------|
  | goLinkable     | A link/edge of the graph can attach to this graph object              |
  | goSelectable   | The graph object is selectable                                        |
  | goShowCaption  | The caption of the graph object is visible                            |

- **`public Owner: TSimpleGraph`** (read-only) \
  Determines the [TSimpleGraph](TSimpleGraph.md) control that owns this graph object.

- **`published ParentFont: Boolean default true`** \
  Determines where the graph object looks for its font information.

  If `ParentFont` is set to `true`, the graph object uses the font of its owner [TSimpleGraph](TSimpleGraph.md) control.

- **`published Pen: TPen`** \
  Specifies the kind of pen the graph object uses for drawing lines and outlining shapes.

- **`public Selected: Boolean`** \
  Indicates whether the graph object is selected.

- **`public SelectedVisualRect: TRect`** (read-only) \
  Specifies the rectangle area that the graph object occupies on the graph when it is selected.

- **`public Showing: Boolean`** (read-only) \
  Indicates whether the graph object is showing on the owner [TSimpleGraph](TSimpleGraph.md) control.

- **`public States: TGraphObjectStates`** \
  `TGraphObjectStates = set of (osCreating, osDestroying, osLoading, osReading, osWriting, osUpdating, osDragging, osDragDisabled, osConverting)` \
  Describes the current state of the graph object, indicating when a component needs to avoid certain actions.

  | Value          | Description                                                                                      |
  |----------------|--------------------------------------------------------------------------------------------------|
  | osCreating     | The graph object is being created.                                                               |
  | osDestroying   | The graph object is about to be destroyed.                                                       |
  | osLoading      | The graph object is currently being loaded.                                                      |
  | osReading      | The graph object is reading its properties from a stream.                                        |
  | osWriting      | The graph object is writing its properties into a stream.                                        |
  | osUpdating     | The graph object is being updated. This flag is set between `BeginUpdate` and `EndUpdate` block. |
  | osDragging     | The graph object is being dragged.                                                               |
  | osDragDisabled | The graph object doesn't accept a drag operation at this moment.                                 |
  | osConverting   | The graph object is currently either source or target of a type conversion operation.            |

- **`published Tag: Integer default 0`** \
  Stores an integer value as part of the graph object.

- **`published Text: String`** \
  Specifies the text string that appears as the caption of the graph object.

- **`published Visible: Boolean default true`** \
  Determines whether the graph object appears on the owner [TSimpleGraph](TSimpleGraph.md) control.

- **`public VisualRect: TRect`** \
  Specifies the rectangle area that the graph object occupies on the graph when it is not selected.

- **`public ZOrder: Integer`** \
  Specifies the back-to-front order in which the graph object is displayed relative to other graph objects.


Methods
-------
In addition to the methods of the `TPersistent` class, the `TGraphObject` class provides the following methods:

- **`function ConvertTo(AnotherClass: TGraphObjectClass): TGraphObject;`** \
  Converts the graph object to another graph object type. 
  
  | Parameter      | Description                                                              |
  |----------------|--------------------------------------------------------------------------|
  | AnotherClass   | The new graph object type                                                |

  If the graph object is a link, the new class type must be a link, and if the graph object is a node, the new class type must be a node.

- **`procedure LoadFromStream(Stream: TStream);`** \
  Loads the properties of the graph object from a stream.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Stream      | The input stream                                              |

- **`procedure SaveToStream(Stream: TStream);`** \
  Saves the properties of the graph object into a stream.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Stream      | The output stream                                             | 

- **`procedure BeginUpdate;`** \
  Suspends screen repainting of the graph object.

- **`procedure EndUpdate;`** \
  Resumes screen repainting of the graph object.

- **`procedure Invalidate;`** \
  Repaints the graph object.  

- **`procedure BringToFront;`** \
  Puts the graph object in front of all other graph objects.

- **`procedure SendToBack;`** \
  Puts the graph object behind all other graph objects.

- **`function Delete: Boolean;`** \
  Removes the graph object from the graph
  
  Returns `true` if the graph object could be deleted; otherwise, returns `false`. 

  **Note:**: Any reference to the deleted graph object is invalid and raises an AV exception.

- **`function CanDelete: Boolean;`** \
  Returns `true` if the graph object can be deleted; otherwise, returns `false`. 
  

- **`function IsLocked: Boolean;`** \
  Returns `true` if the graph object is being locked by the owner [TSimpleGraph](TSimpleGraph.md) control.

  Users cannot interact with a locked graph object using a mouse or keyboard.

- **`function HitTest(const Pt: TPoint): DWord;`** \
  Determines which part of the graph object is at the specified point specified.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Pt          | The query point in graph coordinates                          |

  Returns the [Hit-Test](TGraphObject.HitTesting.md) result.

- **`function ContainsPoint(X, Y: Integer): Boolean;`** \
  Examines whether a given point is inside the graph object.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | X           | The x-coordinate of the point                                 |
  | Y           | The x-coordinate of the point                                 |

  Returns `true` if the graph object is visible and the point is inside it; otherwise, returns `false`.

- **`function IntersectsWith(const Rect: TRect): Boolean;`** \
  Examines whether a given rectangle has any intersection with the graph object.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Rect        | The rectangle in graph coordinates                            |

  Returns `true` if the graph object is visible and has intersection with the rectangle; otherwise, returns `false`.
  
- **`function BeginDrag(const Pt: TPoint; HT: DWord = $FFFFFFFF): Boolean;`** \
  Initiates manual dragging of the graph object. 

  | Parameter   | Description                                                                                                   |
  |-------------|---------------------------------------------------------------------------------------------------------------|
  | Rect        | The coordinate of the drag origin                                                                             |
  | HT          | Specifies the part of the graph object that should be dragged (see [hit-testing](TGraphObject.HitTesting.md)) |

  If `HT` parameter is `$FFFFFFFF`, the function detects the dragging part of the graph object. 

  Returns `true` if the drag operation is initiated; otherwise, returns `false`.

  **Note:** The other selected objects in the graph may follow the drag operation.

- **`function EndDrag(Accept: Boolean): Boolean;`** \
  Terminates the current drag operation of the graph object.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Accept      | Indicates whether to commit the outcome of the drag operation |

  Returns `true` if the graph object was being dragged; otherwise, returns `false`.

- **`function DragTo(const Pt: TPoint; SnapToGrid: Boolean): Boolean;`** \
  Moves the drag origin of the graph object to a given point.
  
  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Pt          | The coordinate of the target point                            |
  | SnapToGrid  | Indicates whether snap the drag origin to the grid            |

  Returns `true` if the graph object is being dragged; otherwise, returns `false`.

- **`function DragBy(dX, dY: Integer; SnapToGrid: Boolean): Boolean;`** \
  Moves the drag origin of the graph object by a given amount along the x- and y-axis.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | dX          | The changes along the x-axis in pixels                        |
  | dY          | The changes along the y-axis in pixels                        |
  | SnapToGrid  | Indicates whether snap the drag origin to the grid            |

  Returns `true` if the graph object is being dragged; otherwise, returns `false`.

- **`class function IsLink: Boolean;`** \
  Returns `true` if this graph object type representing a link/edge; otherwise, returns `false`.

- **`class function IsNode: Boolean;`** \
  Returns `true` if this graph object type representing a node; otherwise, returns `false`.  
