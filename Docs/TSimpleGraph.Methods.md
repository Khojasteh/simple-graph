TSimpleGraph Methods
====================
In addition to the methods of the `TCustomControl` class, the [TSimpleGraph](TSimpleGraph.md) control has the following public methods:

- **`class procedure Register(ANodeClass: TGraphNodeClass); overload;`** \
  Adds a node type, so that the node objects of that type can be instantiated in the `TSimpleGraph` controls.

  | Parameter  | Description                                                         |
  |------------|---------------------------------------------------------------------|
  | ANodeClass | A concrete class derived from the [TGraphNode](TGraphNode.md) class |

- **`class procedure Unregister(ANodeClass: TGraphNodeClass); overload;`** \
  Removes a node type from the list of the registered node types. 

  | Parameter  | Description                                                         |
  |------------|---------------------------------------------------------------------|
  | ANodeClass | A concrete class derived from the [TGraphNode](TGraphNode.md) class |

- **`class function NodeClassCount: Integer;`** \
  Returns the number of registered node types.

- **`class function NodeClasses(Index: Integer): TGraphNodeClass;`** \
  Gets the registered node type at a specified index.

  | Parameter  | Description                                                         |
  |------------|---------------------------------------------------------------------|
  | Index      | An integer between 0 and `NodeClassCount`                           |

  Returns the node type.

- **`class procedure Register(ALinkClass: TGraphLinkClass); overload;`** \
  Adds a link type, so that the link objects of that type can be instantiated in the `TSimpleGraph` controls. 

  | Parameter  | Description                                                         |
  |------------|---------------------------------------------------------------------|
  | ALinkClass | A concrete class derived from the [TGraphLink](TGraphLink.md) class |

- **`class procedure Unregister(ALinkClass: TGraphLinkClass); overload;`** \
  Removes a link type from the list of the registered link types. 

  | Parameter  | Description                                                         |
  |------------|---------------------------------------------------------------------|
  | ALinkClass | A concrete class derived from the [TGraphLink](TGraphLink.md) class |

- **`class function LinkClassCount: Integer;`** \
  Returns the number of registered link types.

- **`class function LinkClasses(Index: Integer): TGraphLinkClass;`** \
  Gets the registered link type at a specified index.

  | Parameter  | Description                                                         |
  |------------|---------------------------------------------------------------------|
  | Index      | An integer between 0 and `LinkClassCount`                           |

  Returns the link type.

- **`procedure BeginUpdate;`** \
  Suspends screen repainting.

- **`procedure EndUpdate;`** \
  Resumes screen repainting.

- **`procedure Invalidate;`** \
  Repaints the control entirely.

- **`procedure InvalidateRect(const Rect: TRect);`** \
  Repaints a specific rectangular area of the graph.

  | Parameter  | Description                                                         |
  |------------|---------------------------------------------------------------------|
  | Rect       | The area to be repainted in graph coordinates                       |

- **`procedure Draw(Canvas: TCanvas);`** \
  Draws the graph in its actual size on a given `Canvas` object.

  | Parameter  | Description                                                         |
  |------------|---------------------------------------------------------------------|
  | Canvas     | The `Canvas` object where the graph should be drawn on              |

- **`procedure Print(Canvas: TCanvas; const Rect: TRect);`** \
  Prints the graph inside a specified rectangle on a given printer `Canvas` object. This method preserves the aspect ratio of the graph.

  | Parameter  | Description                                                         |
  |------------|---------------------------------------------------------------------|
  | Canvas     | The `Canvas` object where the graph should be drawn on              |
  | Rect       | The rectangular area on the canvas where the graph should be fit in |

- **`function FindObjectAt(X, Y: Integer; LookBehind: TGraphObject = nil): TGraphObject;`** \
  Finds a graph object that contains a given point. 

  If the `LookBehind` parameter is `nil`, the search starts from the top most graph object; otherwise,  
  the search starts from the object, which is right behind the `LookBehind` object in z-order.

  | Parameter  | Description                                                         |
  |------------|---------------------------------------------------------------------|
  | X          | The x-coordinate of the point in graph coordinates                  |
  | Y          | The y-coordinate of the point in graph coordinates                  |
  | LookBehind | A graph object that specifies the search scope                      |

  Returns a [TGraphObject](TGraphObject.md) object, or `nil` if no object is found.

- **`function FindObjectByID(ID: DWORD): TGraphObject;`** \
  Finds a graph object by its unique identifier. 
  
  | Parameter  | Description                                                         |
  |------------|---------------------------------------------------------------------|
  | ID         | The unique identifier of the object to be located                   |

  Returns a [TGraphObject](TGraphObject.md) object, or `nil` if no object is found.

- **`function FindNextObject(StartIndex: Integer; Inclusive, Backward, Wrap: Boolean; GraphObjectClass: TGraphObjectClass = nil): TGraphObject;`** \
 Searches for a graph object of a specified type.

  | Parameter        | Description                                                                  |
  |------------------|------------------------------------------------------------------------------|
  | StartIndex       | The search starting position                                                 |
  | Inclusive        | Specifies whether to include the graph object at `StartIndex`                |
  | Backward         | Specifies whether to search backward in the list of graph objects            |
  | Wrap             | Specifies whether to continue the search if end/begin of the list is reached |
  | GraphObjectClass | Determines the type of graph object to search for, or `nil` for all          |

Returns the graph object if it could be found; otherwise, returns `nil`.

- **`function InsertNode(const Bounds: TRect; ANodeClass: TGraphNodeClass = nil): TGraphNode;`** \
  Adds a new node to the graph.

  | Parameter  | Description                                                                              |
  |------------|------------------------------------------------------------------------------------------|
  | Bounds     | The bounding rectangle of the node on the graph                                          |
  | ANodeClass | The type of the node, or `nil` for the type specified by the `DefaultNodeClass` property |

  Returns the new [TGraphNode](TGraphNode.md) instance, or `nil` if the node could not be added.

- **`function InsertLink(Source, Target: TGraphObject; ALinkClass: TGraphLinkClass = nil): TGraphLink; overload;`** \
  Adds a new link to the graph. The start and end points of the link will be anchored to the specified graph objects.

  | Parameter  | Description                                                                              |
  |------------|------------------------------------------------------------------------------------------|
  | Source     | The graph object that the start point of the link should be anchored to                  |
  | Target     | The graph object that the end point of the link should be anchored to                    |
  | ALinkClass | The type of the link, or `nil` for the type specified by the `DefaultLinkClass` property |

  Returns the new [TGraphLink](TGraphLink.md) instance, or `nil` if the link could not be added. 

- **`function InsertLink(Source: TGraphObject; const Pts: array of TPoint; ALinkClass: TGraphLinkClass = nil): TGraphLink; overload;`** \
  Adds a new link to the graph. The start point of the link will be anchored to the specified graph object.

  | Parameter  | Description                                                                              |
  |------------|------------------------------------------------------------------------------------------|
  | Source     | The graph object that the start point of the link should be anchored to                  |
  | Pts        | The coordinates of the break points and end point of the link                            |
  | ALinkClass | The type of the link, or `nil` for the type specified by the `DefaultLinkClass` property |

  Returns the new [TGraphLink](TGraphLink.md) instance, or `nil` if the link could not be added. 

- **`function InsertLink(const Pts: array of TPoint; Target: TGraphObject; ALinkClass: TGraphLinkClass = nil): TGraphLink; overload;`** \
  Adds a new link to the graph. The end point of the link will be anchored to the specified graph object.

  | Parameter  | Description                                                                              |
  |------------|------------------------------------------------------------------------------------------|
  | Pts        | The coordinates of the start point and break points of the link                          |
  | Target     | The graph object that the end point of the link should be anchored to                    |
  | ALinkClass | The type of the link, or `nil` for the type specified by the `DefaultLinkClass` property |

  Returns the new [TGraphLink](TGraphLink.md) instance, or `nil` if the link could not be added. 

- **`function InsertLink(const Pts: array of TPoint; ALinkClass: TGraphLinkClass = nil): TGraphLink; overload;`** \
  Adds a new link to the graph.

  | Parameter  | Description                                                                              |
  |------------|------------------------------------------------------------------------------------------|
  | Pts        | The coordinates of the start point, break points, and end point of the link              |
  | ALinkClass | The type of the link, or `nil` for the type specified by the `DefaultLinkClass` property |

  Returns the new [TGraphLink](TGraphLink.md) instance, or `nil` if the link could not be added. 

- **`procedure ScrollInView(GraphObject: TGraphObject); overload;`** \
  Scrolls a graph object in the graph into the visible area of the control.

  | Parameter   | Description                                          |
  |-------------|------------------------------------------------------|
  | GraphObject | The target [TGraphObject](TGraphObject.md) instance  |
  
- **`procedure ScrollInView(const Rect: TRect); overload;`** \
  Scrolls a rectangular area of the graph into the visible area of the control.

  | Parameter   | Description                                             |
  |-------------|---------------------------------------------------------|
  | Rect        | The bounding rectangle of the area in graph coordinates |

- **`procedure ScrollInView(const Pt: TPoint); overload;`** \
  Scrolls a point of the graph into the visible area of the control.

  | Parameter   | Description                                          |
  |-------------|------------------------------------------------------|
  | Pt          | The point in graph coordinates                       | 

- **`procedure ScrollCenter(GraphObject: TGraphObject); overload;`** \
  Scrolls a graph object in the graph into the center of the control.

  | Parameter   | Description                                          |
  |-------------|------------------------------------------------------|
  | GraphObject | The target [TGraphObject](TGraphObject.md) instance  |
  
- **`procedure ScrollCenter(const Rect: TRect); overload;`** \
  Scrolls a rectangular area of the graph into the center of the control.
  
  | Parameter   | Description                                          |
  |-------------|------------------------------------------------------|
  | Rect        | The bounding box of the area in graph coordinates    |

- **`procedure ScrollCenter(const Pt: TPoint); overload;`** \
  Scrolls a point of the graph into the center of the control.

  | Parameter   | Description                                          |
  |-------------|------------------------------------------------------|
  | Pt          | The point in graph coordinates                       | 

- **`procedure ScrollBy(dX, dY: Integer);`** \
  Scrolls the graph along the x- and y-axis.

  | Parameter   | Description                                          |
  |-------------|------------------------------------------------------|
  | dX          | The changes in pixels along the X axis               | 
  | dY          | The changes in pixels along the Y axis               | 

- **`function ZoomRect(const Rect: TRect): Boolean;`** \
  Adjusts the current zoom to the area covered by a specified rectangle.

  | Parameter   | Description                                          |
  |-------------|------------------------------------------------------|
  | Rect        | The rectangle to be zoomed in graph coordinates      |

- **`function ZoomObject(GraphObject: TGraphObject): Boolean;`** \
  Adjusts the current zoom to the area covered by a specified graph object.

  | Parameter   | Description                                          |
  |-------------|------------------------------------------------------|
  | GraphObject | The target [TGraphObject](TGraphObject.md) instance  |

- **`function ZoomSelection: Boolean;`** \
  Adjusts the current zoom to the area covered by the selected graph objects.

- **`function ZoomGraph: Boolean;`** \
  Adjusts the current zoom to the area covered by the entire graph.
 
- **`function ChangeZoom(NewZoom: Integer; Origin: TGraphZoomOrigin): Boolean;`** \
  Sets the current zoom to a new value.

  | Parameter   | Description                                          |
  |-------------|------------------------------------------------------|
  | NewZoom     | The new zoom factor                                  |
  | Origin      | Specifies how the current view should be preserved   |

  The `Origin` parameter can have one of the following values:

  | Value          | Meaning                                                                 |
  |----------------|-------------------------------------------------------------------------|
  | zoTopLeft      | Try to keep the point at the top-left corner of the current view as is  |
  | zoCenter       | Try to keep the point at center of the current view as is               |
  | zoCursor       | Try to keep the point under the mouse pointer as is                     |
  | zoCursorCenter | Try to move the point under the mouse pointer to the center of the view |

- **`function ChangeZoomBy(Delta: Integer; Origin: TGraphZoomOrigin): Boolean;`** \
  Adjusts the current zoom by a specified amount.
  
  | Parameter   | Description                                          |
  |-------------|------------------------------------------------------|
  | Delta       | The amount of changes in the current zoom            |
  | Origin      | Specifies how the current view should be preserved   |

  The `Origin` parameter can have one of the following values:

  | Value          | Meaning                                                                 |
  |----------------|-------------------------------------------------------------------------|
  | zoTopLeft      | Try to keep the point at the top-left corner of the current view as is  |
  | zoCenter       | Try to keep the point at center of the current view as is               |
  | zoCursor       | Try to keep the point under the mouse pointer as is                     |
  | zoCursorCenter | Try to move the point under the mouse pointer to the center of the view |

- **`function AlignSelection(Horz: THAlignOption; Vert: TVAlignOption): Boolean;`** \
  Lines up the selected graph objects in relation to each other. 

  | Parameter   | Description                                                    |
  |-------------|----------------------------------------------------------------|
  | Horz        | Specifies how the graph objects should be aligned horizontally |
  | Vert        | Specifies how the graph objects should be aligned vertically   |

  The `Horz` parameter can have one of the following values:

  | Value          | Meaning                                                     |
  |----------------|-------------------------------------------------------------|
  | haNoChange     | Do not change the horizontal placement                      |
  | haLeft         | Line up the left edges                                      |
  | haCenter       | Line up the horizontal centers                              |
  | haRight        | Line up the right edges                                     |
  | haSpaceEqually | Line up them horizontally equidistant from each other       | 

  The `Vert` parameter can have one of the following values:

  | Value          | Meaning                                                     |
  |----------------|-------------------------------------------------------------|
  | vaNoChange     | Do not change the horizontal placement                      |
  | vaTop          | Line up the top edges                                       |
  | vaCenter       | Line up the vertical centers                                |
  | vaBottom       | Line up the bottom edges                                    |
  | vaSpaceEqually | Line up them vertically equidistant from each other         |
  
  Returns `true` if the position of at least one graph object is changed; otherwise, returns `false`.

- **`function ResizeSelection(Horz: TResizeOption; Vert: TResizeOption): Boolean;`** \
  Resizes the selected graph objects to be exactly the same height or width.

  | Parameter   | Description                                                    |
  |-------------|----------------------------------------------------------------|
  | Horz        | Specifies how the graph objects should be resized horizontally |
  | Vert        | Specifies how the graph objects should be resized vertically   |

  The `Horz` and `Vert` parameters can have one of the following values:

  | Value       | Meaning                                                        |
  |-------------|----------------------------------------------------------------|
  | roNoChange  | Do not change the size                                         |
  | roSmallest  | Resize to the size of the smallest one                         |
  | roLargest   | Resize to the size of the largest one                          |

  Returns `true` if the size of at least one graph object is changed; otherwise, returns `false`.

roNoChange	 	Does not change the size of the components.
	 	Resizes the selected objects to the height or width of the smallest selected object.
	 	Resizes the selected object to the height or width of the largest selected object.

- **`function ForEachObject(Callback: TGraphForEachMethod; UserData: Integer; Selection: Boolean = False): Integer;`** \
  Enumerates the graph objects by passing each object, in turn, to an application-defined callback method.

  | Parameter   | Description                                                                            |
  |-------------|----------------------------------------------------------------------------------------|
  | Callback    | The method to be called for each graph object                                          |
  | UserData    | A user-defined value passed to the callback method                                     |
  | Selection   | Specifies whether all the graph objects should be enumerated or only the selected ones |

  The `TGraphForEachMethod` callback method has the following signature:
  ```pascal
  function(GraphObject: TGraphObject; UserData: Integer): Boolean of object;
  ```
  | Parameter   | Description                                                                   |
  |-------------|-------------------------------------------------------------------------------|
  | GraphObject | A graph object                                                                |
  | UserData    | The argument passed to the `UserData` parameter of the `ForEachObject` method |

  If the callback method returns `true`, the enumeration continues.
  If the callback method returns `false`, the enumeration stops.

  Returns the number of enumerated graph objects.

- **`function SelectNextObject(Backward: Boolean; GraphObjectClass: TGraphObjectClass = nil): Boolean;`** \
  Moves the selection to the next selectable graph object in the z-order.

  | Parameter        | Description                                                    |
  |------------------|----------------------------------------------------------------|
  | Backward         | Indicates whether to search backward in the z-order            |
  | GraphObjectClass | The type of the graph objects, or `nil` for all                |

  Returns `true` if the selection is changed; otherwise, returns `false`.

- **`function ObjectsCount(GraphObjectClass: TGraphObjectClass = nil): Integer;`** \
  Reports the number of the graph objects of a specified type.

  | Parameter        | Description                                                    |
  |------------------|----------------------------------------------------------------|
  | GraphObjectClass | The type of the graph objects, or `nil` for all                |

  Returns the number of graph objects.

- **`function SelectedObjectsCount(GraphObjectClass: TGraphObjectClass = nil): Integer;`** \
  Reports the number of the selected graph objects of a specified type.

  | Parameter        | Description                                                    |
  |------------------|----------------------------------------------------------------|
  | GraphObjectClass | The type of the graph objects, or `nil` for all                |

  Returns the number of graph objects. 

- **`procedure ToggleSelection(const Rect: TRect; KeepOld: Boolean; GraphObjectClass: TGraphObjectClass = nil);`** \
  Toggles the selection state of the graph objects, those intersect with the given rectangle.

  | Parameter        | Description                                                                 |
  |------------------|-----------------------------------------------------------------------------|
  | Rect             | The bounding rectangle of the target area on the graph                      |
  | KeepOld          | Indicates whether the previously selected graph object should stay selected |
  | GraphObjectClass | The type of the target graph objects, or `nil` for all                      |

- **`procedure ClearSelection;`** \
  Resets the selection state of all graph objects.

- **`procedure Clear;`** \
  Removes all the graph objects from the control.

- **`procedure LoadFromStream(Stream: TStream);`** \
  Loads a graph from a stream.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Stream      | The input stream                                              |

  A `EGraphStreamError` exception will be raised if the stream does not have the expected format.

- **`procedure SaveToStream(Stream: TStream);`** \
  Saves the graph into a stream.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Stream      | The output stream                                             | 

- **`procedure LoadFromFile(const Filename: String);`** \
  Loads a graph from a file.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Filename    | The path to the input file                                    | 

  A `EGraphStreamError` exception will be raised if the file does not have the expected format.

- **`procedure SaveToFile(const Filename: String);`** \
  Saves the graph into a file.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Filename    | The path to the output file                                   |   

- **`procedure MergeFromStream(Stream: TStream; OffsetX, OffsetY: Integer);`** \
  Loads a graph from a stream and merges it with the current graph.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Stream      | The input stream                                              |
  | OffsetX     | Specifies the x-coordinate of the loaded graph's placement    |  
  | OffsetY     | Specifies the y-coordinate of the loaded graph's placement    |  

  A `EGraphStreamError` exception will be raised if the stream does not have the expected format.

- **`procedure MergeFromFile(const Filename: String; OffsetX, OffsetY: Integer);`** \
  Loads a graph from a file and merges it with the current graph.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Filename    | The path to the input file                                    |
  | OffsetX     | Specifies the x-coordinate of the loaded graph's placement    |  
  | OffsetY     | Specifies the y-coordinate of the loaded graph's placement    |   

  A `EGraphStreamError` exception will be raised if the file does not have the expected format.

- **`procedure SaveAsMetafile(const Filename: String);`** \
  Saves the graph as a Windows metafile image into a file.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Filename    | The path to the output file                                   |  

- **`procedure SaveAsBitmap(const Filename: String);`** \
  Saves the graph as a Windows bitmap image into a file.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Filename    | The path to the output file                                   |    

- **`procedure CopyToGraphic(Graphic: TGraphic);`** \
  Assigns the image of the graph into a graphic object.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Graphic     | The target graphic object                                     | 

- **`procedure CopyToClipboard(Selection: Boolean = True);`** \
  Copies the graph objects to the Windows clipboard. The format of clipboard content is determined by the `ClipboardFormats` property.

  | Parameter   | Description                                                       |
  |-------------|-------------------------------------------------------------------|
  | Selection   | Specifies whether only the selected graph object should be copied |

- **`function PasteFromClipboard: Boolean;`** \
  Copies the graph objects in the Windows clipboard to the graph.

  Returns `true` if clipboard has content in `CF_SIMPLEGRAPH` format; otherwise, returns `false`.

- **`function SnapPoint(const Pt: TPoint): TPoint;`** \
  Gets the closest grid point to a specified point.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Pt          | The point to be snapped in graph coordinates                  |

  Returns the new point's coordinate.

- **`procedure SnapOffset(const Pt: TPoint; var dX, dY: Integer);`** \
  Adjusts changes in position along the x- and y-axis, so that the point to be placed at the closest grid point.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Pt          | The current coordinate of the point in graph coordinates      |
  | dX          | The changes in pixels along the X axis                        |
  | dY          | The changes in pixels along the Y axis                        |

  - **`function ClientToGraph(X, Y: Integer): TPoint;`** \
  Converts the client-area coordinates of a specified point to graph coordinates.
  
  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | X           | The x-coordinate of the point on client-area                  |
  | Y           | The y-coordinate of the point on client-area                  |

  Returns the point in graph coordinates.

- **`function GraphToClient(X, Y: Integer): TPoint;`** \
  Converts the graph coordinates of a specified point to client-area coordinates.
  
  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | X           | The x-coordinate of the point on graph                        |
  | Y           | The y-coordinate of the point on graph                        |

  Returns the point in client-area coordinates.
  
- **`function ScreenToGraph(X, Y: Integer): TPoint;`** \
  Converts the screen coordinates of a specified point to graph coordinates.
  
  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | X           | The x-coordinate of the point on screen                       |
  | Y           | The y-coordinate of the point on screen                       |

  Returns the point in graph coordinates. 

- **`function GraphToScreen(X, Y: Integer): TPoint;`** \
  Converts the graph coordinates of a specified point to screen coordinates.
  
  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | X           | The x-coordinate of the point on graph                        |
  | Y           | The y-coordinate of the point on graph                        |

  Returns the point in screen coordinates.
