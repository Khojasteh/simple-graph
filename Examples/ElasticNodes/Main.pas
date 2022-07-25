unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SimpleGraph, ExtCtrls;

type

  TElasticNode = class(TEllipticNode)
  private
    procedure SetCenter(const Value: TPoint);
  public
    constructor Create(AOwner: TSimpleGraph; cX, cY: Integer); reintroduce;
    function UpdatePosition: Boolean;
  end;

  TElasticEdge = class(TGraphLink)
  public
    constructor Create(AOwner: TSimpleGraph; SourceNode, TargetNode: TElasticNode); reintroduce;
  end;

  TMainForm = class(TForm)
    SimpleGraph: TSimpleGraph;
    Timer: TTimer;
    Panel: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure SimpleGraphNodeMoveResize(Graph: TSimpleGraph; Node: TGraphNode);
    procedure SimpleGraphObjectEndDrag(Graph: TSimpleGraph; 
      GraphObject: TGraphObject; HT: DWord; Canceled: Boolean);
  private
    function UpdateNodes: Boolean;
  end;

var
  MainForm: TMainForm;

implementation

uses Math;

{$R *.dfm}

{ TElasticNode }

constructor TElasticNode.Create(AOwner: TSimpleGraph; cX, cY: Integer);
begin
  inherited Create(AOwner);
  SetBounds(cX + Owner.Width div 2 - 10, cY + Owner.Height div 2 - 10, 20, 20);
  NodeOptions := NodeOptions - [gnoResizable];
  Brush.Color := clRed;
end;

procedure TElasticNode.SetCenter(const Value: TPoint);
begin
  SetBounds(Value.X - Width div 2, Value.Y - Height div 2, Width, Height);
end;

function TElasticNode.UpdatePosition;
var
  ThisCenter, OtherCenter, NewCenter: TPoint;
  xVel, yVel: Double;
  dx, dy: Integer;
  Weight, l, i: Integer;
begin
   Result := False;
   if Dragging then
     Exit;

   ThisCenter := Center;
   xVel := 0.0;
   yVel := 0.0;

   for i := 0 to Owner.Objects.Count - 1 do
   begin
     if not (Owner.Objects[i] is TElasticNode) then
       Continue;
     OtherCenter := TElasticNode(Owner.Objects[i]).Center;
     dx := ThisCenter.X - OtherCenter.X;
     dy := ThisCenter.Y - OtherCenter.Y;
     l := 2 * (dx * dx + dy * dy);
     if l > 0 then
     begin
       xVel := xVel + (dx * 150) / l;
       yVel := yVel + (dy * 150) / l;
     end;
   end;

   Weight := (LinkInputCount + LinkOutputCount + 1)  * 10;
   for i := 0 to LinkInputCount + LinkOutputCount - 1 do
   begin
     if i < LinkInputCount then
       OtherCenter := TElasticNode(LinkInputs[i].Source).Center
     else
       OtherCenter := TElasticNode(LinkOutputs[i - LinkInputCount].Target).Center;
     dx := ThisCenter.X - OtherCenter.X;
     dy := ThisCenter.Y - OtherCenter.Y;
     xVel := xVel - dx / Weight;
     yVel := yVel - dy / Weight;
   end;
   NewCenter.X := ThisCenter.X + Round(xVel);
   NewCenter.Y := ThisCenter.Y + Round(yVel);

   NewCenter.X := Min(Max(NewCenter.X, 10), Owner.ClientWidth - 10);
   NewCenter.Y := Min(Max(NewCenter.Y, 10), Owner.ClientHeight - 10);

   if (NewCenter.X <> ThisCenter.X) or (NewCenter.Y <> ThisCenter.Y) then
   begin
     SetCenter(NewCenter);
     Result := True;
   end;
end;

{ TElasticEdge }

constructor TElasticEdge.Create(AOwner: TSimpleGraph;
  SourceNode, TargetNode: TElasticNode);
begin
  inherited CreateNew(AOwner, SourceNode, [], TargetNode);
  Options := Options - [goSelectable];
  Brush.Color := Pen.Color;
  BeginStyle := lsArrow;
  EndStyle := lsArrow;
  BeginSize := 4;
  EndSize := 4;
end;

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
var
  Node1, Node2, Node3, Node4,
  Node6, Node7, Node8, Node9,
  CenterNode: TElasticNode;
begin
  Node1 := TElasticNode.Create(SimpleGraph, -50, -50);
  Node2 := TElasticNode.Create(SimpleGraph, 0, -50);
  Node3 := TElasticNode.Create(SimpleGraph, 50, -50);
  Node4 := TElasticNode.Create(SimpleGraph, -50, 0);
  CenterNode := TElasticNode.Create(SimpleGraph, 0, 0);
  Node6 := TElasticNode.Create(SimpleGraph, 50, 0);
  Node7 := TElasticNode.Create(SimpleGraph, -50, 50);
  Node8 := TElasticNode.Create(SimpleGraph, 0, 50);
  Node9 := TElasticNode.Create(SimpleGraph, 50, 50);
  TElasticEdge.Create(SimpleGraph, Node1, Node2);
  TElasticEdge.Create(SimpleGraph, Node2, Node3);
  TElasticEdge.Create(SimpleGraph, Node2, CenterNode);
  TElasticEdge.Create(SimpleGraph, Node3, Node6);
  TElasticEdge.Create(SimpleGraph, Node4, Node1);
  TElasticEdge.Create(SimpleGraph, Node4, CenterNode);
  TElasticEdge.Create(SimpleGraph, CenterNode, Node6);
  TElasticEdge.Create(SimpleGraph, CenterNode, Node8);
  TElasticEdge.Create(SimpleGraph, Node6, Node9);
  TElasticEdge.Create(SimpleGraph, Node7, Node4);
  TElasticEdge.Create(SimpleGraph, Node8, Node7);
  TElasticEdge.Create(SimpleGraph, Node9, Node8);
end;

function TMainForm.UpdateNodes: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to SimpleGraph.Objects.Count - 1 do
    if (SimpleGraph.Objects[i] is TEllipticNode) and
       TElasticNode(SimpleGraph.Objects[i]).UpdatePosition
    then
       Result := True;
end;

procedure TMainForm.TimerTimer(Sender: TObject);
begin
  Timer.Enabled := UpdateNodes;
end;

procedure TMainForm.SimpleGraphNodeMoveResize(Graph: TSimpleGraph;
  Node: TGraphNode);
begin
  Timer.Enabled := True;
end;

procedure TMainForm.SimpleGraphObjectEndDrag(Graph: TSimpleGraph;
  GraphObject: TGraphObject; HT: DWord; Canceled: Boolean);
begin
  SimpleGraph.ClearSelection;
end;

end.
