TSimpleGraph Events
===================
In addition to the events of the `TCustomControl` class, the [TSimpleGraph](TSimpleGraph.md) control defines the following events:

- **`OnAfterDraw: TGraphDrawEvent`** \
  `TGraphDrawEvent = procedure(Graph: TSimpleGraph; Canvas: TCanvas) of object` \
  Occurs after the graph is drawn on a canvas.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph              |
  | Canvas      | The canvas where the graph is drawn on                        |

- **`OnBeforeDraw: TGraphDrawEvent`** \
  `TGraphDrawEvent = procedure(Graph: TSimpleGraph; Canvas: TCanvas) of object` \
  Occurs when the graph is about to be drawn on a canvas.
  
  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph              |
  | Canvas      | The canvas` where the graph is about to be drawn on           |

- **`OnCanHookLink: TGraphCanHookEvent`** \
  `TGraphCanHookEvent = procedure(Graph: TSimpleGraph; GraphObject: TGraphObject; Link: TGraphLink; Index: Integer; var CanHook: Boolean) of object` \
  Occurs when an attempt is made to attach a point of a link to a graph object.

  | Parameter   | Description                                                       |
  |-------------|-------------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph                  |
  | GraphObject | The graph object that the link is about to be attached to         |
  | Link        | The link that is being attached                                   |
  | Index       | The index of attaching point in the `Points` property of the link |
  | CanHook     | Specifies whether the attachment is allowed to be made            |

- **`OnCanLinkObjects: TGraphCanLinkEvent`** \
  `TGraphCanLinkEvent = procedure(Graph: TSimpleGraph; Link: TGraphLink; Source, Target: TGraphObject; var CanLink: Boolean) of object` \
  Occurs when an attempt is made to connect two graph objects together via a link.

  | Parameter   | Description                                                       |
  |-------------|-------------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph                  |
  | Link        | The link that is about to connect the graph objects               |
  | Source      | The graph object that is the links's source object                |
  | Target      | The graph object that is the link's target object                 |
  | CanLink     | Specifies whether the connection is allowed to be made            |

- **`OnCanMoveResizeNode: TCanMoveResizeNodeEvent`** \
  `TCanMoveResizeNodeEvent = procedure(Graph: TSimpleGraph; Node: TGraphNode; var NewLeft, NewTop, NewWidth, NewHeight: Integer; var CanMove, CanResize: Boolean) of object` \
  Occurs when an attempt is made to resize or relocate a node.

  | Parameter   | Description                                                       |
  |-------------|-------------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph                  |
  | Node        | The node that is about to be relocated and/or resized             |
  | NewLeft     | The new x-coordinate of the node's top-left corner                |
  | NewTop      | The new y-coordinate of the node's top-left corner                |
  | NewWidth    | The new width of the node                                         |
  | NewHeight   | The new height of the node                                        |
  | CanMove     | Specifies whether the node is relocatable                         |
  | CanResize   | Specifies whether the node is resizable                           |

- **`OnCanRemoveObject: TGraphCanRemoveEvent`** \
  `TGraphCanRemoveEvent = procedure(Graph: TSimpleGraph; GraphObject: TGraphObject; var CanRemove: Boolean) of object` \
  Occurs when an attempt is made to delete a graph object.
  
  | Parameter   | Description                                                       |
  |-------------|-------------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph                  |
  | GraphObject | The graph object that is about to be removed                      |
  | CanRemove   | Specifies whether the graph object is removable                   |

- **`OnCommandModeChange: TNotifyEvent`** \
  Occurs just after the `CommandMode` property is changed.

- **`OnGraphChange: TNotifyEvent`** \
  Occurs just after the graph is changed. 

- **`OnInfoTip: TGraphInfoTipEvent`** \
  `TGraphInfoTipEvent = procedure(Graph: TSimpleGraph; GraphObject: TGraphObject; var InfoTip: String) of object`\
  Occurs when the mouse pointer is paused over a graph object.

  | Parameter   | Description                                                        |
  |-------------|--------------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph                   |
  | GraphObject | The graph object that the mouse pointer is over it                 |
  | InfoTip     | The text that will be displayed as the tooltip of the graph object | 

- **`OnNodeMoveResize: TGraphNodeNotifyEvent`** \
  Occurs when a node is moved and/or resized.

  | Parameter   | Description                                                        |
  |-------------|--------------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph                   |
  | Node        | The node that has been moved and/or resized                        |

- **`OnObjectAfterDraw: TGraphObjectDrawEvent`** \
  `TGraphObjectDrawEvent = procedure(Graph: TSimpleGraph; GraphObject: TGraphObject; Canvas: TCanvas) of object` \
  Occurs after a graph is drawn on a canvas.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph              |
  | GraphObject | The graph object that is drawn                                |
  | Canvas      | The canvas where the graph object is drawn on                 |

- **`OnObjectBeforeDraw: TGraphObjectDrawEvent`** \
  `TGraphObjectDrawEvent = procedure(Graph: TSimpleGraph; GraphObject: TGraphObject; Canvas: TCanvas) of object` \
  Occurs when a graph object is about to be drawn on a canvas.
  
  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph              |
  | GraphObject | The graph object that is about to be drawn                    |
  | Canvas      | The canvas where the graph object is about to be drawn on     |

- **`OnObjectBeginDrag: TGraphBeginDragEvent`** \
  `TGraphBeginDragEvent = procedure(Graph: TSimpleGraph; GraphObject: TGraphObject; HT: DWord) of object` \
  Occurs just after a graph object is started being dragged.

  | Parameter   | Description                                                                                               |
  |-------------|-----------------------------------------------------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph                                                          |
  | GraphObject | The graph object that is being dragged                                                                    |
  | HT          | Determines which part of the graph object is under the mouse pointer (see [hit-testing](TGraphObject.HitTesting.md)) |

  **Note:** The other selected objects may follow the drag operation but this event occurs only for the drag source.

- **`OnObjectEndDrag: TGraphEndDragEvent`** \
  `TGraphEndDragEvent = procedure(Graph: TSimpleGraph; GraphObject: TGraphObject; HT: DWord; Canceled: Boolean) of object` \
  Occurs just after a graph object is finished being dragged.

  | Parameter   | Description                                                                                               |
  |-------------|-----------------------------------------------------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph                                                          |
  | GraphObject | The graph object that was being dragged                                                                   |
  | HT          | Determines which part of the graph object is under the mouse pointer (see [hit-testing](TGraphObject.HitTesting.md)) |
  | Canceled    | Indicates whether the operation was canceled                                                              |

  **Note:** The other selected objects may follow the drag operation but this event occurs only for the drag source.

- **`OnObjectChange: TGraphNotifyEvent`** \
  `TGraphNotifyEvent = procedure(Graph: TSimpleGraph; GraphObject: TGraphObject) of object` \
  Occurs when a graph object is changed.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph              |
  | GraphObject | The graph object that is changed                              |

- **`OnObjectClick: TGraphNotifyEvent`** \
  `TGraphNotifyEvent = procedure(Graph: TSimpleGraph; GraphObject: TGraphObject) of object` \
  Occurs when user clicks on a graph object.  

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph              |
  | GraphObject | The graph object that is being clicked                        |

- **`OnObjectDblClick: TGraphNotifyEvent`** \
  `TGraphNotifyEvent = procedure(Graph: TSimpleGraph; GraphObject: TGraphObject) of object` \
  Occurs when user double-clicks on a graph object.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph              |
  | GraphObject | The graph object that is being double-clicked                 |

- **`OnObjectContextPopup: TGraphContextPopupEvent`** \
  `TGraphContextPopupEvent = procedure(Graph: TSimpleGraph; GraphObject: TGraphObject; const MousePos: TPoint; var Handled: Boolean) of object` \
  Occurs when user right-clicks on a graph object.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph              |
  | GraphObject | The graph object that is being right-clicked                  |
  | MousePos    | The position of the mouse pointer in client-area coordinates  |
  | Handled     | Specifies whether the default behavior should be bypassed     |

- **`OnObjectMouseEnter: TGraphNotifyEvent`** \
  `TGraphNotifyEvent = procedure(Graph: TSimpleGraph; GraphObject: TGraphObject) of object` \
  Occurs when the mouse pointer moves over a graph object.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph              |
  | GraphObject | The graph object that the mouse pointer moved over it         |

- **`OnObjectMouseLeave: TGraphNotifyEvent`** \
  `TGraphNotifyEvent = procedure(Graph: TSimpleGraph; GraphObject: TGraphObject) of object` \
  Occurs when the mouse pointer moves off from over a graph object.

  | Parameter   | Description                                                    |
  |-------------|----------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph               |
  | GraphObject | The graph object that the mouse pointer moved off from over it |

- **`OnObjectInitInstance: TGraphNotifyEvent`** \
  `TGraphNotifyEvent = procedure(Graph: TSimpleGraph; GraphObject: TGraphObject) of object` \
  Occurs when a new graph object is instantiated. 

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph              |
  | GraphObject | The graph object that is instantiated                         |

  **Note:** When this event is triggered, the graph object is not placed on the graph yet.

- **`OnObjectInsert: TGraphNotifyEvent`** \
  `TGraphNotifyEvent = procedure(Graph: TSimpleGraph; GraphObject: TGraphObject) of object` \
  Occurs when a new graph object is added to the graph. 

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph              |
  | GraphObject | The newly added graph object                                  | 

- **`OnObjectRemove: TGraphNotifyEvent`** \
  `TGraphNotifyEvent = procedure(Graph: TSimpleGraph; GraphObject: TGraphObject) of object` \
  Occurs when a new graph object is removed from the graph. 

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph              |
  | GraphObject | The removed graph object                                      |  

- **`OnObjectSelect: TGraphNotifyEvent`** \
  `TGraphNotifyEvent = procedure(Graph: TSimpleGraph; GraphObject: TGraphObject) of object` \
  Occurs when the selection state of a graph object is changed.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph              |
  | GraphObject | The graph object that its selection state is toggled          |

- **`OnObjectHook: TGraphHookEvent`** \
  `TGraphHookEvent = procedure(Graph: TSimpleGraph; GraphObject: TGraphObject; Link: TGraphLink; Index: Integer) of object` \
  Occurs when a point of a link is attached to a graph object.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph              |
  | GraphObject | The graph object that the link is attached to                 |
  | Link        | The link that is attached to the graph object                 |
  | Index       | The index of the point in the `Points` property of the link   |

- **`OnObjectUnhook: TGraphHookEvent`** \
  Occurs when a point of a link is detached from a graph object.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph              |
  | GraphObject | The graph object that the link is detached from               |
  | Link        | The link that is detached from the graph object               |
  | Index       | The index of the point in the `Points` property of the link   |

- **`OnObjectRead: TGraphStreamEvent`** \
  `TGraphStreamEvent = procedure(Graph: TSimpleGraph; GraphObject: TGraphObject; Stream: TStream) of object` \
  Occurs when a graph object with custom data is being read from a stream.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph              |
  | GraphObject | The graph object that is being read                           |
  | Stream      | The stream where the custom data can be read from             |

- **`OnObjectWrite: TGraphStreamEvent`** \
  `TGraphStreamEvent = procedure(Graph: TSimpleGraph; GraphObject: TGraphObject; Stream: TStream) of object` \ 
  Occurs when a graph object with custom data is being written into a stream.

  | Parameter   | Description                                                   |
  |-------------|---------------------------------------------------------------|
  | Graph       | The `TSimpleGraph` control, which owns the graph              |
  | GraphObject | The graph object that is being written                        |
  | Stream      | The stream where the custom data can be written into          |

- **`OnZoomChange: TNotifyEvent`** \
  Occurs just after the `Zoom` property is changed.