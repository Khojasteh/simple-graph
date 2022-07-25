TMemoryHandleStream = class(TMemoryStream)
==========================================
This class is similar to the Delphi's standard `TMemoryStream` class, except that it uses the Windows global heap.

Properties
----------
In addition to the properties of the `TMemoryStream` class, the `TMemoryHandleStream` class has the following properties:

- **`public Handle: THandle`** \
  The handle to the memory allocated in the Windows global heap.

- **`public ReleaseHandle: Boolean default false`** \
  Specifies whether the instance should release the managed memory during destruction.
  
Methods
-------
In addition to the methods of the `TMemoryStream` class, the `TMemoryHandleStream` has the following method:

- **`constructor Create(MemHandle: THandle);`** \
  Creates an instance of the class.

  | Parameter  | Description                                                               |
  |------------|---------------------------------------------------------------------------|
  | MemHandle  | The handle to a memory allocated on the Windows global heap (can be zero) |
