Content
=======
The `SimpleGraph` unit defines the following classes:

- **[TSimpleGraph](TSimpleGraph.md) = class (TCustomControl)** \
  Provides a canvas for drawing simple directional graphs.

- **[TGraphConstraints](TGraphConstraints.md) = class(TPersistent)** \
  Defines the bounding constraints of the graphs on the [TSimpleGraph](TSimpleGraph.md) control.

- **[TGraphObjectList](TGraphObjectList.md) = class(TPersistent)** \
  Maintains the collection of objects on a graph.

- **[TGraphObject](TGraphObject.md) = class(TPersistent)** \
  Represents an object on a graph.

- **[TGraphLink](TGraphLink.md) = class([TGraphObject](TGraphObject.md))** \
  Represents a link/edge on a graph.

- **[TGraphNode](TGraphNode.md) = class([TGraphObject](TGraphObject.md))** \
  Represents a node on a graph.

- **[TPolygonalNode](TPolygonalNode.md) = class([TGraphNode](TGraphNode.md))** \
  Represents a polygonal node on a graph.

- **TRoundRectangularNode = class([TGraphNode](TGraphNode.md))** \
  Represents a rounded rectangular node on a graph.

- **TEllipticNode = class([TGraphNode](TGraphNode.md))** \
  Represents an elliptical node on a graph.

- **TTriangularNode = class([TPolygonalNode](TPolygonalNode.md))** \
  Represents a triangular node on a graph.

- **TRectangularNode = class([TPolygonalNode](TPolygonalNode.md))** \
  Represents a rectangular node on a graph.

- **TRhomboidalNode = class([TPolygonalNode](TPolygonalNode.md))** \
  Represents a rhomboidal node on a graph.

- **THexagonalNode = class([TPolygonalNode](TPolygonalNode.md))** \
  Represents a hexagonal node on a graph.

- **[TGraphScrollBar](TGraphScrollBar.md) = class(TPersistent)** \
  Manages a horizontal or vertical scroll bar on the [TSimpleGraph](TSimpleGraph.md) control.

- **[TMemoryHandleStream](TMemoryHandleStream.md) = class(TMemoryStream)** \
  Creates a stream whose backing store is memory allocated in the Windows global heap.

- **[TCanvasRecall](TCanvasRecall.md) = class(TObject)** \
  Stores the current state of a `Canvas` object, so that it can be restored at a later time.

- **TCompatibleCanvas = class(TCanvas)** \
  Provides a `Canvas` object compatible with the screen's device context.

In addition, the code offers various [global procedures and functions](Globals.md).
