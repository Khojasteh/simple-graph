TCanvasRecall = class(TObject)
==============================
This class holds a reference to a `Canvas` object and saves its current state. Later, the saved state of the `Canvas` object can be retrieved by calling the `Retrieve` method or automatically when the `TCanvasRecall` instance is destroyed. 

Properties
----------
In addition to the properties of the `TObject` class, the `TCanvasRecall` class has the following property:

- **`public Reference: TCanvas`** \
  The reference to a `Canvas` object that is managed by this instance. This property can be `nil`.

  By changing this property, the `TCanvasRecall` instance restores the state of the previous `Canvas` object and saves the state of the new one.

Methods
-------
In addition to the methods of the `TObject` class, the `TCanvasRecall` class defines or overrides the following public methods:

- **`constructor Create(AReference: TCanvas);`** \
  Creates an instance of the class and saves the state of the `Canvas` object specified by the parameter.

  | Parameter  | Description                                                                |
  |------------|----------------------------------------------------------------------------|
  | AReference | The `Canvas` object that should be managed by this instance (can be `nil`) |

- **`destructor Destroy; override;`** \
  Restores the saved state of the `Canvas` object and destroys the instance.

- **`procedure Store;`** \
  Saves the current state of the `Canvas` object.
  
- **`procedure Retrieve;`** \
  Restores the saved state of the `Canvas` object.
  
