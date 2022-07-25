Graph Object Hit-Testing
========================
The hit-test result of a graph object is a mask of 32-bit values. Presence of each value in the result, determines which part of the graph object is at the point of hit-testing.

| Value           | Meaning                                                                                               | Scope                           |
|-----------------|-------------------------------------------------------------------------------------------------------|---------------------------------|
| GHT_NOWHERE     | The point is not on the object.                                                                       | [TGraphObject](TGraphObject.md) |
| GHT_TRANSPARENT | The point is on the object, but the object is not selectable.                                         | [TGraphObject](TGraphObject.md) |
| GHT_LEFT        | The point is on the left side of the object.                                                          | [TGraphNode](TGraphNode.md)     |
| GHT_TOP         | The point is on the top side of the object.                                                           | [TGraphNode](TGraphNode.md)     |
| GHT_RIGHT       | The point is on the right side of the object.                                                         | [TGraphNode](TGraphNode.md)     |
| GHT_BOTTOM      | The point is on the bottom side of the object.                                                        | [TGraphNode](TGraphNode.md)     |
| GHT_TOPLEFT     | The point is on the top-left corner of the object.                                                    | [TGraphNode](TGraphNode.md)     |
| GHT_TOPRIGHT    | The point is on the top-right corner of the object.                                                   | [TGraphNode](TGraphNode.md)     |
| GHT_BOTTOMLEFT  | The point is on the bottom-left corner of the object.                                                 | [TGraphNode](TGraphNode.md)     |
| GHT_BOTTOMRIGHT | The point is on the bottom-right corner of the object.                                                | [TGraphNode](TGraphNode.md)     |
| GHT_CLIENT      | The point is on the body of the object.                                                               | [TGraphObject](TGraphObject.md) |
| GHT_CAPTION     | The point is on the caption of the object.                                                            | [TGraphObject](TGraphObject.md) |
| GHT_POINT       | The point is on one of the control points of the object. The high-order word holds the point's index. | [TGraphLink](TGraphLink.md)     |
| GHT_LINE        | The point is on one of the line segments of the object. The high-order word holds the line's index.   | [TGraphLink](TGraphLink.md)     |

For example, the following function returns the index of a breakpoint/endpoint of a given link, if the mouse pointer is over such point.

```pascal
function IndexOfPointUnderMouseCursor(Link: TGraphLink): Integer;
var
  HT: DWord;
begin 
  HT := Link.HitTest(Link.Owner.CursorPos);
  if (HT and GHT_POINT) <> 0 then
    Result := HiWord(HT)
  else
    Result := -1;
end;
