## Version 2.92 (July 25, 2022)
- Fixed bug in the `ForEachObject` method of the [TSimpleGraph](Docs/TSimpleGraph.md) control. The method was always returning zero.
- Renamed the `ContainsRect` method of the [TGraphObject](Docs/TGraphObject.md) class to `IntersectsWith` for sake of clarity.
- Renamed the `TGraphNodeResizeEvent` event type to `TGraphNodeNotifyEvent`.
- Refactored the code.
- Improved the documentation.

## Version 2.91 (January 25, 2013)
- Fixed a bug in wrapping text (Thanks to _Oleg_).

## Version 2.90 (April 27, 2013)
- Fixed the bug causing some random characters appear on the caption of links.
- Improved positioning of the links' caption.

## Version 2.81 (January 6, 2013)
- Fixed the compatibility issues with Delphi XE2 and XE3.

## Version 2.80 (June 2, 2011)
- Added the `gloFixedAnchorStartPoint` and `gloFixedAnchorEndPoint` options to the `LinkOptions` property of the [TGraphLink](Docs/TGraphLink.md) class. These options determine whether the hooked links should be anchored to a fixed point on the target object or not.

## Version 2.72 (February 2, 2009)
- Fixed code malfunction in changing the `Left`, `Top`, `Width`, and `Height` properties of the [TGraphNode](Docs/TGraphNode.md) class inside a `BeginUpdate`/`EndUpdate` block.

## Version 2.71 (January 16, 2009)
- Re-entrance problem in repositioning of hooked objects is fixed (Thanks to _cml0816_).
- Problem in selecting horizontal and vertical links with one pixel width is fixed (Thanks to _cml0816_).
- Added the `Push` and `Pop` methods to the [TGraphObjectList](Docs/TGraphObjectList.md) class.

## Version 2.70 (November 14, 2008)
- Fixed compatibility issue with Delphi 2009.
- Fixed bug in the `NormalizeBreakPoints` method of the [TGraphLink](Docs/TGraphLink.md) class (Thanks to _liu8670_).
- Fixed bug in the `ZoomRect` method of the [TSimpleGraph](Docs/TSimpleGraph.md) control (Thanks to _Choe, Cheng-Dae_).

## Version 2.62 (May 15, 2007)
- Fixed the compatibility issue with Delphi 5.

## Version 2.61 (March 30, 2006)
- Fixed a bug in managing mouse, which was occurred when the `CommandMode` property was set to `cmViewOnly`.

## Version 2.60 (March 29, 2006)
- Added the `OnObjectMouseEnter` and `OnObjectMouseLeave` events to the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Added the `DragSource` and `ObjectAtCursor` properties to the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Added the `ResizeSelection` method to the [TSimpleGraph](Docs/TSimpleGraph.md) control.

## Version 2.50 (March 26, 2006)
- Introduced the `OverlappedRect` global procedure.
- Added the `Transparent` property to the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Added the `ChangeZoom`, `ChangeZoomBy`, and `AlignSelection` methods to the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Fixed a bug in drawing child controls.
- Fixed a bug in calculating range of scroll bars when the control had some aligned child controls.

## Version 2.40 (March 22, 2006)
- Fixed a bug in scrolling the graph by keyboard.
- Fixed a bug in the `Assign` method of the [TGraphObjectList](Docs/TGraphObjectList.md) class.

## Version 2.30 (March 21, 2006)
- Introduced the [TCompatibleCanvas](Docs/TCompatibleCanvas.md) class.
- Introduced `cmPan` as a new option for the `CommandMode` property of the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Added the `OnMoveResizeNode` event to the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Fixed a bug in the `FindObjectAt` method of the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Fixed a bug in triggering some events while loading or clearing a graph.

## Version 2.20 (March 19, 2006)
- Added the `SourceRect` property to the [TGraphConstraints](Docs/TGraphConstraints.md) class.
- Fixed a bug in merging graphs.

## Version 2.10 (March 18, 2006)
- Introduced the [TCanvasRecall](Docs/TCanvasRecall.md) class.
- Added the `UnionRect` and `IntersectRect` global procedures.
- Added the `ClipboardFormats`, `DraggingObjects`, and `DraggingBounds` properties to the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Added the `ScrollCenter`, `ScreenToGraph`, `GraphToScreen`, `SnapPoint`, `SnapOffset`, `FindObjectByID`, `ForEachObject`, `SaveAsBitmap`, `CopyToGraphic`, `MergeFromStream`, `MergeFromFile`, and `InvalidateRect` methods to the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Added `OnObjectInitInstance`, `OnObjectChange`, `OnCanRemoveObject`, `OnObjectRead` and `OnObjectWrite` events to the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Added the `ID`, `Data`, `States`, `HasCustomData`, `VisualRect`, `SelectedVisualRect`, `Dependents`, `DependentCount`, `LinkInputs`, `LinkInputCount`, `LinkOutputs`, and `LinkOutputCount` properties to the [TGraphObject](Docs/TGraphObject.md) class.
- Added the `CanDelete`, `DragBy`, and `Invalidate` methods to the [TGraphObject](Docs/TGraphObject.md) class.
- Added the missing `AssignTo` method to the [TGraphObject](Docs/TGraphObject.md) class.
- Added the `IsNode` class method  to the [TGraphObject](Docs/TGraphObject.md) class.
- Added the `Create` constructor to the [TGraphObject](Docs/TGraphObject.md) class.
- Added the `CreateNew` constructor to the [TGraphLink](Docs/TGraphLink.md) class.
- Added the `CreateNew` constructor to the [TGraphNode](Docs/TGraphNode.md) class.
- Changed signature of the `BeginDrag` and `DragTo` methods of the [TGraphObject](Docs/TGraphObject.md) class.
- Changed the return value of the `ConvertTo` method of the [TGraphObject](Docs/TGraphObject.md) class.
- Changed the [TGraphObjectList](Docs/TGraphObjectList.md) class. The new implementation provides safe enumeration of the graph objects even when the list is changed during the enumeration.
- Changed the `OnObjectBeginDrag` and `OnObjectEndDrag` events of the [TSimpleGraph](Docs/TSimpleGraph.md) control, so that more information about the dragging object be available.
- Changed zooming properties of the [TSimpleGraph](Docs/TSimpleGraph.md) control. The current zoom range is between 5% and 36863%. Because of the new `OnMouseWheelDown` and `OnMouseWheelUp` events of the control, the control does not change the zoom factor internally. Due to these changes, `ZoomMin`, `ZoomMax`, and `ZoomStep` properties of the control are removed.
- Changed signature of the `FindObjectAt` method of the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Improved painting algorithm to increase speed and reduce CPU usage.
- Fixed a bug in moving a group of selected link objects.
- Fixed a bug in inserting links, which were occurring in Delphi 4 and 5.
- Fixed the bug about not triggering the `OnObjectUnhook` event of the [TSimpleGraph](Docs/TSimpleGraph.md) control when unhooking was the result of an object deletion.
- Fixed a bug in saving the `BackgroundMargins` property of the [TGraphObject](Docs/TGraphObject.md) class.
- Fixed a bug in the `MinimizeText` global procedure. In addition, three periods as ellipsis (...) is changed to a single character ellipses (…) if the font supports it.
- Fixed a bug regarding positioning of the links.
- Fixed some minor other bugs.
- And, many other improvements in the stability and performance of the code.

## Version 2.00 (February 23, 2006)
To improve performance and functionality of the control, most part of the code is rewritten. This may lead to some breaking changes in your code.

Changes in the [TSimpleGraph](Docs/TSimpleGraph.md) class:
- Added the `LockLinks` property.
- Added the `OnObjectBeginDrag` and `OnObjectEndDrag` events.
- Added the `OnObjectHook` and `OnObjectUnhook` events.
- Added the `OnCanHookLink` event.
- Replaced the `OnCanLinkNodes` event with the `OnCanLinkObjects` event.
- Replaced the `ToggleNodesAt` method with the `ToggleSelection` method. The new method is more flexible and detects objects that are either inside or intersecting with the selection rectangle.
- Added an overload for the `FindObjectAt` method.
- Changed `Bounds` parameter of the `InsertNode` method from `PRect` to `TRect`.
- Replaced the `LinkNodes` method with the `InsertLink` method. The new method has four overloads.
- Added the `ClearSelection` method.
- Renamed the `cmLinkNodes` value of the `CommandMode` property to `cmInsertLink`.
- Removed the `IsValidLink` method. Use the `CanLink` method of the [TGraphLink](Docs/TGraphLink.md) class as substitute.
- Changed some keyboard and mouse actions. As of now, each object has its own keyboard and mouse events.
- Added the missing constraints check while moving/resizing objects by keyboard.

Changes in the [TGraphObject] class:
- Added the `Options` property.
- Added the `Dragging` property as read-only.
- Added the `BeginDrag`, `DragTo`, and `EndDrag` methods.
- Added the `HitTest` method.
- Added the `ContainsRect` method.
- Added the `Delete` method.
- Added the `IsLocked` method.
- Changed the `IsLink` property to class method.

Changes in the [TGraphLink](Docs/TGraphLink.md) class:
- Improved functionality. Each endpoint of a link can be hooked to a graph object (node or link), and style of each endpoint is customizable. The new links can have breakpoints.
- Added the `Points`, `PointCount`, and `Polyline` properties.
- Added the `TextPosition` and `TextSpacing` properties.
- Added the `LinkOptions` property.
- Replaced the `Kind` property with the `BeginStyle` and `EndStyle` properties.
- Replaced the `ArrowSize` property with the `BeginSize` and `EndSize` properties.
- Replace the `FromNode` and `ToNode` properties with the `Source` and `Target` properties.
- Added the `CanMove` method.
- Added the `AddPoint`, `InsertPoint`, `RemovePoint`, `IndexOfPoint`, `AddBreakPoint`, and `NormalizeBreakpoints` methods for manipulating the `Polyline` property.
- Added the `IsFixedPoint`, `IsHookedPoint`, `HookedObjectOf`, `HookedIndexOf`, and `HookedPointCount` methods.
- Added the `CanHook`, `Hook`, `Unhook`, `CanLink`, and `Link` methods for managing the hooking and linking actions.
- Added the `Rotate` and `Scale` methods.

Changes in the [TGraphNode](Docs/TGraphNode.md) class:
- Added the `NodeOptions` property.
- Added the `BackgroundMargins` property.
- Added the `CanMoveResize` method.
- Removed the `QueryLinkTo` method.
- Fixed clipped text problem that was occurring when graph was zoomed in.
- Introduced the Hexagonal node shape.

Changes in the [TPolygonalNode](Docs/TPolygonalNode.md) class:
- Added the `Vertices` property as read-only.

Changes in the `TRectangularNode` class:
- Changed the base class from the [TGraphNode](Docs/TGraphNode.md) class to the [TPolygonalNode](Docs/TPolygonalNode.md) class.

Changes in the [TGraphConstraints](Docs/TGraphConstraints.md) class:
- Added the `WithinBounds` method.
- Added the `ConfineOffset` method.
- Changed signature of `ConfinePt` and `ConfineRect` methods.
- Fixed malfunction of the `ConfineRect` method.

Changes in global procedures:
- Added the `NormalizeAngle`, `EqualPoint`, `ScalePoints`, `ShiftPoints`, `MakeSquare`, `LineLength`, `NearestPointOnLine`, and `IntersectLinePolyline` functions.
- Changed signature of the `IntersectLineRect`, `IntersectLineEllipse`, `IntersectLineRoundRect`, and `IntersectLinePolygon` functions.
- Changed the return type of the `DistanceToLine` function from integer to double.
- Changed type of `DistanceFromThisPt` parameter of the `NextPointOfLine` function from integer to double.

## Version 1.67 (November 14, 2005)
- Added the `OnZoomChange` event the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Fixed bug on calling the `OnResize` and `OnCanResize` events of the [TSimpleGraph](Docs/TSimpleGraph.md) control.

## Version 1.66 (November 11, 2005)
- Added the `FixedScrollBars` property to the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Applied constrains check on the new nodes inserted by mouse actions.
- Added the `ConfinePt` and `ConfineRect` methods to the [TGraphConstraints](Docs/TGraphConstraints.md) class.

## Version 1.65 (November 10, 2005)
- Introduced the [TGraphConstraints](Docs/TGraphConstraints.md) class.
- Replaced the `FreezeTopLeft` property of the [TSimpleGraph](Docs/TSimpleGraph.md) control with the `GraphConstraints` property.
- Added missing `OnClick` and `OnObjectClick` to the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Improved paint handler to remove memory limit on graph's bounds and speed up drawing.
- The [TSimpleGraph](Docs/TSimpleGraph.md) control accepts child controls now.

## Version 1.61 (November 1, 2005)
- Added the `OnInfoTip` event to the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Introduced the `NearestPoint` global procedure.
- Changed all `Extended` data types to `Double` to prevent "Invalid Floating Point Operation" exception.
- Fixed the bug in calculating the end points of the links.
- Dropped the limit on the number of allowed polygon's vertices in the [TPolygonalNode](Docs/TPolygonalNode.md) class.

## Version 1.60 (October 29, 2005)
- Added the `Layout` property to the [TGraphNode](Docs/TGraphNode.md) class.
- Added the `DrawOrder` property to the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Added `OnBeforeDraw`, `OnAfterDraw`, `OnObjectBeforeDraw`, and `OnObjectAfterDraw` to the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Introduced the `WrapText` and `MinimizeText` global procedures.
- Displayed caption of objects as hint if the caption does not fit on the screen.
- Fixed issue with drawing caption of nodes for zoom factors other than 100%.
- Some minor tweaks.

## Version 1.58 (September 29, 2005)
- Added the `Hint` property to the [TGraphObject](Docs/TGraphObject.md) class.

## Version 1.57 (May 13, 2005)
- Workaround a Windows API bug. If the view size of a metafile image is larger than the screen size, Windows API cannot clip it.

## Version 1.56 (May 9, 2005)
- Fixed bug in copy/paste functions.

## Version 1.55 (April 21, 2005)
- Fixed memory leak issue.

## Version 1.54.2 (August 24, 2004)
- Fixed the black border artifact, which was appearing during scroll.

## Version 1.54.1 (August 20, 2004)
- Fixed bug in calculating range of the scroll bars.

## Version 1.54 (August 6, 2004)
- Added the `MinNodeSize` property the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Added the `ArrowSize` to the [TGraphLink](Docs/TGraphLink.md) class.
- Some minor tweaks.

## Version 1.53.1 (August 4, 2004)
- Fixed bug related to the `FreezeTopLeft` property of the [TSimpleGraph](Docs/TSimpleGraph.md) control.

## Version 1.53 (August 4, 2004)
- Fixed bug in moving/resizing overlapped objects.
- Added the `FreezeTopLeft` property to the [TSimpleGraph](Docs/TSimpleGraph.md) control.

## Version 1.52 (July 18, 2004)
- Fixed the scrolling malfunction when the zoom was greater than 100%.

## Version 1.51 (June 28, 2004)
- Fixed a minor bug.

## Version 1.50 (June 22, 2004)
- Added the `VisibleBounds` property to the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Introduced the abstract [TPolygonalNode](Docs/TPolygonalNode.md) class.
- Introduced the Triangular, Rhomboidal, and Pentagonal node shapes.
- Added some new global functions.
- Improved performance.

## Version 1.21.1 (June 18, 2004)
- Fixed the compiler error on Delphi 4.

## Version 1.21 (June 13, 2004)
- Added the `SelectionBounds` property to the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Added the `ZoomRect`, `ZoomObject`, `ZoomSelection`, and `ZoomGraph` to the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Added the missing `GraphToClient` method to the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Some minor tweaks.

## Version 1.20 (June 12, 2004)
- Introduced the zooming capabilities. As the result, the `Zoom`, `ZoomMin`, `ZoomMax` and `ZoomStep` properties are added to the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Added the `ClientToGraph` method to the [TSimpleGraph](Docs/TSimpleGraph.md) control.

## Version 1.10 (May 16, 2004)
- Added the `Kind` property to the [TGraphLink](Docs/TGraphLink.md) class.
- Renamed the `LinkTypeTo` method of [TGraphNode](Docs/TGraphNode.md) class to `QueryLinkTo`. Also, improved its functionality.

## Version 1.09 (May 9, 2004)
- Smashed some bugs.

## Version 1.08 (May 10, 2003)
- Fixed the division by zero exception in calculating the distance of a point from a line.

## Version 1.07 (April 27, 2003)
- Added the `Background`property to the [TGraphNode](Docs/TGraphNode.md) class.

## Version 1.06 (April 23, 2003)
- Added the `Print` and `SaveAsMetafile` methods to the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Removed the `PaintTo` method of the [TSimpleGraph](Docs/TSimpleGraph.md) control.
- Add the `HideSelection` property to the [TSimpleGraph](Docs/TSimpleGraph.md) control.

## Version 1.05 (April 21, 2003)
- Added the `Alignment` and `Margin` properties to the [TGraphNode](Docs/TGraphNode.md) class.

## Version 1.04 (April 21, 2003)
- Polished the code for the initial public domain release.

## Version 1.03 (August 27, 2000)
- Fixed issue in finding the intersection of a line and a round rectangle.

## Version 1.02 (August 22, 2000)
- Fixed bug in movement of links.

## Version 1.01 (July 01, 2000)
- Fixed the wrong behavior of the control when nodes were locked.

## Version 1.00 (June 11, 2000)
- Initial release.