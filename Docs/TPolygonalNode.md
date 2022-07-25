TPolygonalNode = class([TGraphNode](Docs/TGraphNode.md))
========================================================
This abstract class is the base class of the graph nodes that their shape can be represented by a polygon.

Properties
----------
In addition to the properties of the [TGraphNode](Docs/TGraphNode.md) class, the `TPolygonalNode` class has the following property:

- **`public Vertices: TPoints`** (read-only) \
  `TPoints = array of TPoint` \
  Gets the coordinates of the polygon's vertices as an array.

Methods
-------
In addition to the methods of the [TGraphNode](Docs/TGraphNode.md) class, the `TPolygonalNode` class has the following abstract method:

- **`procedure DefineVertices(const ARect: TRect; var Points: TPoints); abstract;`** \
  Calculates the coordinates of the polygon's vertices relative to its bounding box.

  | Parameter | Description                                                                                                                    |
  |-----------|--------------------------------------------------------------------------------------------------------------------------------|
  | ARect     | The bounding box of the polygon                                                                                                |
  | Points    | When the procedure returns, this dynamic array contains the coordinates of the polygon's vertices relative to the bounding box |

  For example, the `TRectangularNode` class overrides the `DefineVertices` method in the following way:

  ```pascal
  procedure TRectangularNode.DefineVertices(const ARect: TRect; var Points: TPoints);
  begin
    SetLength(Points, 4);
    Points[0].X := ARect.Left;
    Points[0].Y := ARect.Top;
    Points[1].X := ARect.Right;
    Points[1].Y := ARect.Top;
    Points[2].X := ARect.Right;
    Points[2].Y := ARect.Bottom;
    Points[3].X := ARect.Left;
    Points[3].Y := ARect.Bottom;
  end;
  ```
