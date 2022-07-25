MOUSE ACTIONS
=============
The [TSimpleGraph](TSimpleGraph.md) control handles the following mouse actions by default.

## Design Area
The following mouse actions are available when the action is performed on the client area of the control, but not on a graph object.

| Action              | Behavior                                                                                            |
|---------------------|-----------------------------------------------------------------------------------------------------|
| Drag                | Selects the selectable objects in the selected area and clears the previous selection               |
| `Ctrl`+Drag         | Selects the selectable nodes in the selected area and clears the previous selection                 |
| `Shift`+Drag        | Toggles selection of the selectable objects in the selected area while preserving the old selection |
| `Ctrl`+`Shift`+Drag | Toggles selection of the selectable nodes in the selected area while preserving the old selection   |
| `Alt`+Drag          | Zooms the selected area in                                                                          |

## All Objects
The following mouse actions are available for all the graph objects.

| Action              | Behavior                                                                                            |
|---------------------|-----------------------------------------------------------------------------------------------------|
| Click               | Selects the clicked object if it is selectable and clears the previous selection                    |
| `Shift`+Click       | Toggles selection of the clicked object if it is selectable, preserving the old selection           |

## Nodes
The following mouse actions are available only for the graph nodes.

| Action              | Behavior                                                                                            |
|---------------------|-----------------------------------------------------------------------------------------------------|
| Drag Node           | Moves the node if it is movable                                                                     |
| Drag Marker         | Resizes the node if it is resizable                                                                 |

## Links/Edges
The following mouse actions are available only for the graph links/edges.

| Action              | Behavior                                                                                            |
|---------------------|-----------------------------------------------------------------------------------------------------|
| Drag Line/Caption   | Moves the link if it does not have any fixed point                                                  |
| Drag Point          | Moves the point if it is not fixed                                                                  |
| `Alt`+Drag Point    | Establishes a connection if the point is not fixed and is dropped on another object                 |
| `Alt`+Click Point   | Deletes the point if the point is not fixed                                                         |
| `Alt`+Click Line    | Inserts a new breakpoint at the clicked position if the line segment is not fixed                   |
| `Right`+Click       | Inserts a new breakpoint while a point is dragging                                                  |
