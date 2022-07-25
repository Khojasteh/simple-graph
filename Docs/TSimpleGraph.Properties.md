TSimpleGraph Properties
=======================
In addition to the properties of the `TCustomControl` class, the [TSimpleGraph](TSimpleGraph.md) control has the following properties:

- **`published ClipboardFormats: TGraphClipboardFormats default [cfNative]`** \
  `TGraphClipboardFormats = set of (cfNative, cfMetafile, cfBitmap)` \
  Specifies the formats that should be used for copying the graph contents into the Windows clipboard.

  | Value      | Windows Value  | Clipboard Content                                                                 |
  |------------|----------------|-----------------------------------------------------------------------------------|
  | cfNative   | CF_SIMPLEGRAPH | Native binary data (the only format supported by the `PasteFromClipboard` method) |
  | cfMetafile | CF_ENHMETAFILE | Enhanced metafile image                                                           |
  | cfBitmap   | CF_BITMAP      | Device dependent bitmap image                                                     |

- **`public CommandMode: TGraphCommandMode`** \
  `TGraphCommandMode = (cmViewOnly, cmEdit, cmInsertNode, cmLinkNodes)` \
  Determines which set of commands are available to the user.
  
  | Value        | Description                                                                 |
  |--------------|-----------------------------------------------------------------------------|
  | cmViewOnly   | User cannot interact with the graph                                         |
  | cmPan        | User can only pan the graph                                                 |
  | cmEdit       | User can modify the existing graph nodes and links                          | 
  | cmInsertNode | User can add a node; this mode changes to `cmEdit` after inserting the node |
  | cmLinkNodes  | User can add a link; this mode changes to `cmEdit` after inserting the link |

- **`public CursorPos: TPoint`** \
  Gets or sets the position of mouse pointer in graph coordinates.

- **`published DefaultKeyMap: Boolean default true`** \
  Specifies whether the control should handle the keyboard shortcuts entered by the user. 
  See [Keyboard Shortcuts](TSimpleGraph.Keyboard.md) for the default keyboard mapping.

- **`public DefaultLinkClass: TGraphLinkClass`** \
  `TGraphLinkClass = class of TGraphLink` \
  Gets or sets the [TGraphLink](TGraphLink.md) class that should be used when adding a new link to a graph.

- **`public DefaultNodeClass: TGraphNodeClass`** \
  `TGraphNodeClass = class of TGraphNode` \
  Gets or sets the [TGraphNode](TGraphNode.md) class that should be used when adding a new node to a graph.

- **`public DragSource: TGraphObject`** (read-only) \
  Gets the [TGraphObject](TGraphObject.md) instance that is the source of a drag operation, or `nil` if there is none.

- **`public DraggingBounds: TRect`** (read-only) \
  Gets the smallest visual bounding rectangle of the graph objects, which are being dragged. The values are in graph coordinates.

- **`public DraggingObjects: TGraphObjectList`** (read-only) \
  Gets the [TGraphObjectList](TGraphObjectList.md) instance, which contains the graph objects being dragged.

- **`published DrawOrder: TGraphDrawOrder default doDefault`** \
  Specifies the z-order of the graph objects.

  | Value        | Description                                  |
  |--------------|----------------------------------------------|
  | doDefault    | The objects are drawn in their natural order |
  | doNodesOnTop | The nodes appear above the links             |
  | doLinksOnTop | The links appear above the nodes             |

- **`published FixedScrollBars: Boolean false`** \
  Determines how range of the scroll bars should be calculated. 
  
  If `FixedScrollBars` is set to `true`, the range of the scroll bars is set to the maximum permitted dimensions of the graph.

  If `FixedScrollBars` is set to `false`, the range of the scroll bars is measured using the current dimensions of the graph.

- **`public GraphBounds: TRect`** (read-only) \
  Gets the smallest visual bounding rectangle of the visible graph objects.

- **`published GraphConstraints: TGraphConstraints`** (read-only) \
  Gets the [TGraphConstraints](TGraphObjectList.md) instance that specifies the bounding constraints of the graphs. 

- **`published GridColor: TColor default clGray`** \
  Determines the color of the grid.

- **`published GridSize: TGridSize default 8`** \
  `TGridSize = 4..128` \
  Determines the grid's spacing along the x- and y-axis.

- **`published HideSelection: Boolean default false`** \
  Specifies whether the visual indication of the selected graph objects should remain when focus shifts to another control.

- **`published HorzScrollBar: TGraphScrollBar`** (read-only) \
  Gets the [TGraphScrollBar](TGraphScrollBar.md) instance that represents the horizontal scroll bar.  

- **`published LockLinks: Boolean default false`** \
  Specifies whether the users are disallowed to move the links/edges of the graph.

- **`published LockNodes: Boolean default false`** \
  Specifies whether the users are disallowed to move and resize the nodes of the graph.

- **`published MarkerColor: TColor default clBlack`** \
  Determines the color of the markers on the selected graph objects.

- **`published MarkerSize: TMarkerSize default 3`** \
  `TMarkerSize = 3..9` \
  Determines the size of the markers on the selected graph objects. 

- **`published MinNodeSize: default 16`** \
  Specifies the minimum width and height of the nodes of the graph.

- **`public Modified: Boolean`** (read-only) \
  Indicates wether the graph has been changed.

- **`public ObjectAtCursor: TGraphObject`** (read-only) \
  Gets the [TGraphObject](TGraphObject.md) instance that is currently under the mouse pointer, or `nil` if there is none.

- **`published ObjectPopupMenu: TPopupMenu`** \
  Determines the popup menu of the graph objects.

- **`public Objects: TGraphObjectList`** (read-only) \
  Gets the [TGraphObjectList](TGraphObjectList.md) instance, which contains all the graph objects.
 
- **`public SelectedObjects: TGraphObjectList`** (read-only) \
  Gets the [TGraphObjectList](TGraphObjectList.md) instance, which contains the selected graph objects.

- **`public SelectionBounds: TRect`** (read-only) \
  Gets the smallest visual bounding rectangle of the selected graph objects. The values are in graph coordinates.

- **`published ShowGrid: Boolean default true`** \
  Specifies whether the grid should appear on the control.

- **`published ShowHiddenObjects: Boolean default false`** \
  Indicates whether the control should show the hidden graph objects.

- **`published SnapToGrid: Boolean default true`** \
  Indicates whether the graph objects are automatically aligned with the grid when they are placed, moved, or resized.

- **`published Transparent: Boolean default false`** \
  Specifies whether the background of the control is transparent.

- **`published VertScrollBar: TGraphScrollBar`** \
  Gets the [TGraphScrollBar](TGraphScrollBar.md) instance that represents the vertical scroll bar.  

- **`public VisibleBounds: TRect`** (read-only) \
  Gets the bounding rectangle of the visible part of the graph. The values are in graph coordinates.

- **`published Zoom: TZoom default 100`** \
  `TZoom = 5..36863` \
  Specifies the display scaling factor of the graph on the control in percent.
