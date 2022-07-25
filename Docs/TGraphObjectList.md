TGraphObjectList = class(TPersistent)
=====================================
This class holds a list of [TGraphObject](TGraphObject.md) objects.

The instances of `TGraphObjectList` class do not own their holding objects.

Properties
----------
In addition to the properties of the `TPersistent` class, the `TGraphObjectList` class provides the following properties:

- **`public Capacity: Integer`** \
  Specifies the allocated size of the array of items maintained by the list.

- **`public Count: Integer`** (read-only) \
  Gets the number of entries in the list that are in use.

- **`public Items[Index: Integer]: TGraphObject`** (read-only) \
  Gets an item in the list by its zero-based index.

Methods
-------
In addition to the methods of the `TPersistent` class, the `TGraphObjectList` class has the following public methods:

- **`procedure Clear;`** \
  Deletes all the items from the list.  

- **`function Add(Item: TGraphObject): Integer;`** \
  Adds a new item at the end of the list.

  | Parameter | Description                                       |
  |-----------|---------------------------------------------------|
  | Item      | The item to be added                              |
  
  Returns the index of the added item.

- **`procedure Insert(Index: Integer; Item: TGraphObject);`** \
  Inserts a new item at a specified index of the list.

  | Parameter | Description                                       |
  |-----------|---------------------------------------------------|
  | Index     | The zero-based index of the new item in the list  |
  | Item      | The item to be added                              |
  
- **`procedure Delete(Index: Integer);`** \
  Removes an item at a specified index from the list.

  | Parameter | Description                                       |
  |-----------|---------------------------------------------------|
  | Index     | The zero-based index of the item to be removed    |

- **`function Remove(Item: TGraphObject): Integer;`** \
  Removes a specified item from the list.

  | Parameter | Description                                       |
  |-----------|---------------------------------------------------|
  | Item      | The item to be removed                            |
  
  Returns the index of the removed item if the item is found; otherwise, returns -1.

- **`procedure Move(CurIndex, NewIndex: Integer);`** \
  Changes the position of an item in the list.

  | Parameter | Description                                       |
  |-----------|---------------------------------------------------|
  | CurIndex  | The zero-based index of the item to be moved      |
  | NewIndex  | The new zero-based index of the item in the list  |

- **`function IndexOf(Item: TGraphObject): Integer;`** \
  Locates the index of an item in the list.

  Returns the index of the item if the item is found; otherwise, returns -1.

- **`function First: TGraphObject;`** \
  Initializes the forward enumeration of the list and returns the first item.
  
  Return the first item in the list if the list is not empty; otherwise, returns `nil`.

- **`function Last: TGraphObject;`** \
  Initializes the backward enumeration of the list and returns the last item.
  
  Return the last item of the list if the list is not empty; otherwise, returns `nil`.
  
- **`function Next: TGraphObject;`** \
  During enumeration, returns the next item of a forward enumeration. 
  Before calling this method for the first time, the `First` method should be called. 

  Returns next item in the list or `nil` if end of the list is reached.

- **`function Prior: TGraphObject;`** \
  During enumeration, returns the next item of a backward enumeration. 
  Before calling this method for the first time, the `Last` method should be called. 

  Returns previous item in the list or `nil` if begin of the list is reached.

- **`function Push: Boolean;`** \
  Saves the current enumeration state. 

  Returns `true` if an enumeration state is saved; otherwise, `false`.

- **`function Pop: Boolean;`** \
  Restores the last saved enumeration state.

  Returns `true` if an enumeration state is restored; otherwise, `false`.

Events
------
The `TGraphObjectList` class has the following event:

- **`OnChange: TGraphObjectListEvent`** \
  `TGraphObjectListEvent = procedure(Sender: TObject; GraphObject: TGraphObject; Action: TGraphObjectListAction) of object` \
  Occurs when the list has been changed.

  | Parameter   | Description                                                                |
  |-------------|----------------------------------------------------------------------------|
  | Sender      | The `TGraphObjectList` instance that generated the event                   |
  | GraphObject | The [TGraphObject](TGraphObject.md) instance that was target of the change |
  | Action      | The action that caused the event                                           |

  The action parameter can have one of the following values:

  | Value       | Description                                                                |
  |-------------|----------------------------------------------------------------------------|
  | glAdded     | The item has been added to the list                                        |
  | glRemoved   | The item has been removed from the list                                    |
  | glReordered | The position of the item in the list has been changed                      |
