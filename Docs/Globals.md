Global Procedures
=================

```pascal
WrapText(Canvas: TCanvas; const Text: String; MaxWidth: Integer): String;
```
Breaks a text between words if the lines of the text exceed a given width. 

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| Canvas    | The canvas that provides the font metrics for the measurements    |
| Text      | The text to be wrapped                                            |
| MaxWidth  | The maximum width of the text lines                               |

Returns the wrapped text.


```pascal
function MinimizeText(Canvas: TCanvas; const Text: String; const Rect: TRect): String;
```
Breaks a text between words and chopping it off if its dimensions exceed a given bounds. 

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| Canvas    | The canvas that provides the font metrics for the measurements    |
| Text      | The text to be minimized                                          |
| Rect      | The bounding rectangle of the text on the canvas                  |

Returns the minimized text.


```pascal 	
function IsBetween(Value: Integer; Bound1, Bound2: Integer): Boolean;
```
Determines whether a value is in a given range.

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| Value     | The value to be examined                                          |
| Bound1    | The lower or upper bound of the range                             |
| Rect      | The upper or lower bound of the range                             |

Returns `true` if the value is in the range; otherwise, returns `false`.


```pascal
function EqualPoint(const Pt1, Pt2: TPoint): Boolean;
```
Determines whether two points are equal.

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| Pt1       | The first point                                                   |
| Pt2       | The second point                                                  |

Returns `true` if points are equal; otherwise, returns `false`.


```pascal
function NormalizeAngle(const Angle: Double): Double;
```
Converts an angle value, so that it falls between `-Pi` and `Pi`.

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| Angle     | The angle to be normalized in radians                             |

Returns the normalized angle in radians.


```pascal
function TransformRgn(Rgn: HRGN; const XForm: TXForm): HRGN;
```
Transforms a region using a given transformation matrix.

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| Rgn       | The windows handle of region to be transformed                    |
| XForm     | The transformation matrix                                         |

Returns the windows handle of the new transformed region.


```pascal
procedure TransformPoints(var Points: array of TPoint; const XForm: TXForm);
```
Transforms a set of coordinates using a given transformation matrix.

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| Points    | The coordinates to be transformed                                 |
| XForm     | The transformation matrix                                         |


```pascal
procedure RotatePoints(var Points: array of TPoint; const Angle: Double; const OrgPt: TPoint);
```
Rotates a set of coordinates around a given point.

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| Points    | The coordinates to be transformed                                 |
| Angle     | The angle of rotation in radians                                  |
| OrgPt     | The point where the coordinates should be rotated around          |


```pascal
procedure ScalePoints(var Points: array of TPoint; const Factor: Double; const RefPt: TPoint);
```
Moves a set of coordinates toward or away from a given point by a scaling factor.

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| Points    | The coordinates to be transformed                                 |
| Factor    | The scaling factor                                                |
| RefPt     | The point where the coordinates should be moved related to        |


```pascal
procedure ShiftPoints(var Points: array of TPoint; dX, dY: Integer; const RefPt: TPoint);
```
Moves a set of coordinates toward or away from a given point by the specified amount of horizontal and vertical displacement.

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| Points    | The coordinates to be transformed                                 |
| dX        | The amount of horizontal displacement                             |
| dY        | The amount of vertical displacement                               |
| RefPt     | The point where the coordinates should be moved related to        |


```pascal
procedure OffsetPoints(var Points: array of TPoint; dX, dY: Integer);
```
Moves a set of coordinates by the specified amount of horizontal and vertical displacement.

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| Points    | The coordinates to be transformed                                 |
| dX        | The amount of horizontal displacement                             |
| dY        | The amount of vertical displacement                               |


```pascal
function CenterOfPoints(var Points: array of TPoint): TPoint;
```
Determines the point at the center of a set of coordinates.

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| Points    | The source coordinates                                            |

Returns the center of mass.


```pascal
function BoundsRectOfPoints(var Points: array of TPoint): TRect;
```
Determines the minimum bounding box of a set of coordinates.

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| Points    | The source coordinates                                            |

Returns the minimum bounding rectangle.


```pascal
function NearestPoint(const Points: array of TPoint; const RefPt: TPoint; out NearestPt: TPoint): Integer;
```
Determines the nearest point in a set of coordinates to a given point.

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| Points    | The source coordinates                                            |
| RefPt     | The target coordinate                                             |
| NearestPt | When the function returns, contains the nearest coordinate        |

Returns the zero-based index of the nearest coordinate.


```pascal
function MakeSquare(const Center: TPoint; Radius: Integer): TRect;
```
Creates a square specified by its center and radius.

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| Center    | The coordinate of the square's center                             |
| Radius    | The radius of the square (half of the sides' length)              |

Returns a `TRect` value.


```pascal
function MakeRect(const Corner1, Corner2: TPoint): TRect;
```
Creates a rectangle specified by its two opposite corners.

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| Corner1   | The coordinate of one of the rectangle's corners                  |
| Corner2   | The coordinate of the opposite corner              |

Returns a `TRect` value.


```pascal
function CenterOfRect(const Rect: TRect): TPoint;
```
Determines the point at the center of a rectangle.

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| Rect      | The rectangle that its center should be calculated                |

Returns the center of mass.


```pascal
procedure UnionRect(var DstRect: TRect; const SrcRect: TRect);
```
Enlarges a rectangle, so that it also covers the area of another rectangle. None of the rectangles should be empty.

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| DstRect   | The rectangle that gets updated                                   |
| SrcRect   | The other rectangle                                               |


```pascal
procedure IntersectRect(var DstRect: TRect; const SrcRect: TRect);
```
Shrinks a rectangle, so that it covers only the shared area with another rectangle. None of the rectangles should be empty.

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| DstRect   | The rectangle that gets updated                                   |
| SrcRect   | The other rectangle                                               |


```pascal
function OverlappedRect(const Rect1, Rect2: TRect);
```
Determines if two rectangles have intersections.

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| Rect1     | The first rectangle                                               |
| Rect2     | The second rectangle                                              |

Returns `true` if two rectangles are intersecting; otherwise, returns `false`.


```pascal
function LineLength(const LinePt1, LinePt2: TPoint): Double;
```
Determines the length of a line segment.

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| LinePt1   | The first endpoint of the line segment                            |
| LinePt2   | The second endpoint of the line segment                           |

Returns the length of the line segment.


```pascal
function LineSlopeAngle(const LinePt1, LinePt2: TPoint): Double;
```
Determines the slope angle of a line.

|-----------|-------------------------------------------------------------------|
| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| LinePt1   | The first point on the line segment                               |
| LinePt2   | The second point on the line segment                              |

Returns the slope angle of the line in radians


```pascal
function DistanceToLine(const LinePt1, LinePt2: TPoint; const QueryPt: TPoint): Double;
```
Determines the shortest distance between a line segment and a point.

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| LinePt1   | The first endpoint of the line segment                            |
| LinePt2   | The second endpoint of the line segment                           |
| QueryPt   | The point to calculate its distance from the line distance        |

Returns the shortest distance between the line segment and the point.


```pascal
function NearestPointOnLine(const LinePt1, LinePt2: TPoint; const RefPt: TPoint): TPoint;
```
Finds the coordinate of a point on a line segment, which is the closest point to a given point.

| Parameter | Description                                                       |
|-----------|-------------------------------------------------------------------|
| LinePt1   | The first endpoint of the line segment                            |
| LinePt2   | The second endpoint of the line segment                           |
| QueryPt   | The point to calculate its distance from the line segment         |

Returns the coordinate of the nearest point on the line segment.


```pascal
function NextPointOfLine(const LineAngle: Double; const LinePt: TPoint; const LineLength: Double): TPoint;
```
Determines the next endpoint of a line segment.

| Parameter  | Description                                                       |
|------------|-------------------------------------------------------------------|
| LineAngle  | The slope angle of the line segment in radians                    |
| LinePt     | The coordinate of the known endpoint of the line segment          |
| LineLength | The length of the line segment                                    |

Returns the next endpoint of the line segment.


```pascal
function IntersectLines(const Line1Pt: TPoint; const Line1Angle: Double; const Line2Pt: TPoint; const Line2Angle: Double; out Intersect: TPoint): Boolean;
```
Determines the intersection coordinate of two lines if any.

| Parameter  | Description                                                       |
|------------|-------------------------------------------------------------------|
| Line1Pt    | A point on the first line                                         |
| Line1Angle | The slope angle of the first line (between `-Pi` and `Pi`)        |
| Line1Pt    | A point on the second line                                        |
| Line1Angle | The slope angle of the second line (between `-Pi` and `Pi`)       |
| Intersect  | When the function returns, contains the intersection coordinate   |

Returns `true` if the lines intersect; otherwise, returns `false`.


```pascal
function IntersectLineRect(const LinePt: TPoint; const LineAngle: Double; const Rect: TRect): TPoints;
```
Determines the coordinates, where a line intersects with a rectangle.

| Parameter | Description                                                        |
|-----------|--------------------------------------------------------------------|
| LinePt    | A point on the line                                                |
| LineAngle | The slope angle of the line (between `-Pi` and `Pi`)               |
| Rect      | The rectangle                                                      |

Returns the intersection points as a dynamic array.


```pascal
function IntersectLineRoundRect(const LinePt: TPoint; const LineAngle: Double; const Bounds: TRect; CW, CH: Integer): TPoints;
```
Determines the coordinates, where a line intersects with a rounded rectangle.

| Parameter | Description                                                        |
|-----------|--------------------------------------------------------------------|
| LinePt    | A point on the line                                                |
| LineAngle | The slope angle of the line (between `-Pi` and `Pi`)               |
| Bounds    | The bounding box of the rounded rectangle                          |
| CW        | The horizontal curvature of the rounded rectangle                  |
| CH        | The vertical curvature of the rounded rectangle                    |

Returns the intersection points as a dynamic array.


```pascal
function IntersectLineEllipse(const LinePt: TPoint; const LineAngle: Double; const Bounds: TRect): TPoints;
```
Determines the coordinates, where a line intersects with an ellipse.

| Parameter | Description                                                        |
|-----------|--------------------------------------------------------------------|
| LinePt    | A point on the line                                                |
| LineAngle | The slope angle of the line (between `-Pi` and `Pi`)               |
| Bounds    | The bounding box of the ellipse                                    |

Returns the intersection points as a dynamic array.


```pascal
function IntersectLinePolygon(const LinePt: TPoint; const LineAngle: Double; const Vertices: array of TPoint): TPoints;
```
Determines the coordinates, where a line intersects with a polygon.

| Parameter | Description                                                        |
|-----------|--------------------------------------------------------------------|
| LinePt    | A point on the line                                                |
| LineAngle | The slope angle of the line (between `-Pi` and `Pi`)               |
| Vertices  | The coordinates of the polygon's vertices                          |

Returns the intersection points as a dynamic array.


```pascal
function IntersectLinePolyline(const LinePt: TPoint; const LineAngle: Double; const Points: array of TPoint): TPoints;
```
Determines the coordinates, where a line intersects with a polyline.

| Parameter | Description                                                        |
|-----------|--------------------------------------------------------------------|
| LinePt    | A point on the line                                                |
| LineAngle | The slope angle of the line (between `-Pi` and `Pi`)               |
| Points    | The coordinates of the polyline's points                           |

Returns the intersection points as a dynamic array.
