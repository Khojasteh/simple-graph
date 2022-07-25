unit ObjectProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, SimpleGraph, ExtCtrls, StdCtrls, ComCtrls, CheckLst;

type
  TObjectProperties = class(TForm)
    Label1: TLabel;
    Colors: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    ObjectFillColor: TPanel;
    ObjectLineColor: TPanel;
    btnChangeFont: TButton;
    btnOK: TButton;
    btnCancel: TButton;
    Bevel1: TBevel;
    FontDialog: TFontDialog;
    ColorDialog: TColorDialog;
    ObjectText: TMemo;
    btnApply: TButton;
    PublicOptions: TCheckListBox;
    Label4: TLabel;
    FillColor: TShape;
    LineColor: TShape;
    procedure ObjectFillColorClick(Sender: TObject);
    procedure ObjectLineColorClick(Sender: TObject);
    procedure btnChangeFontClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    S: TSimpleGraph;
    O: TGraphObjectList;
    procedure SetObjectOptions(Value: TGraphObjectOptions);
    function GetObjectOptions: TGraphObjectOptions;
    procedure ApplyChanges;
  public
    class function Execute(Objects: TGraphObjectList): Boolean;
  end;

implementation

{$R *.dfm}

{ TObjectProperties }

class function TObjectProperties.Execute(Objects: TGraphObjectList): Boolean;
begin
  Result := False;
  with Create(Application) do
    try
      O := Objects;
      with Objects[0] do
      begin
        S := Owner;
        ObjectText.Lines.Text := Text;
        FillColor.Brush.Color := Brush.Color;
        LineColor.Brush.Color := Pen.Color;
        FontDialog.Font := Font;
        SetObjectOptions(Options);
      end;
      if ShowModal = mrOK then
      begin
        ApplyChanges;
        Result := True;
      end;
    finally
      Free;
    end;
end;

procedure TObjectProperties.ApplyChanges;
var
  I: Integer;
begin
  S.BeginUpdate;
  try
    for I := 0 to O.Count - 1 do
      with O[I] do
      begin
        BeginUpdate;
        try
          Text := ObjectText.Lines.Text;
          Brush.Color := FillColor.Brush.Color;
          Pen.Color := LineColor.Brush.Color;
          Font := FontDialog.Font;
          Options := GetObjectOptions;
        finally
          EndUpdate;
        end;
      end;
  finally
    S.EndUpdate;
  end;
end;

procedure TObjectProperties.ObjectFillColorClick(Sender: TObject);
begin
  ColorDialog.Color := FillColor.Brush.Color;
  if ColorDialog.Execute then
    FillColor.Brush.Color := ColorDialog.Color;
end;

procedure TObjectProperties.ObjectLineColorClick(Sender: TObject);
begin
  ColorDialog.Color := LineColor.Brush.Color;
  if ColorDialog.Execute then
    LineColor.Brush.Color := ColorDialog.Color;
end;

procedure TObjectProperties.btnChangeFontClick(Sender: TObject);
begin
  FontDialog.Execute;
end;

procedure TObjectProperties.btnApplyClick(Sender: TObject);
begin
  ApplyChanges;
end;

procedure TObjectProperties.FormCreate(Sender: TObject);
begin
  SetBounds(Screen.Width - Width - 30, 50, Width, Height);
end;

function TObjectProperties.GetObjectOptions: TGraphObjectOptions;
var
  Option: TGraphObjectOption;
begin
  Result := [];
  for Option := Low(TGraphObjectOption) to High(TGraphObjectOption) do
    if PublicOptions.Checked[Ord(Option)] then
      Include(Result, Option);
end;

procedure TObjectProperties.SetObjectOptions(Value: TGraphObjectOptions);
var
  Option: TGraphObjectOption;
begin
  for Option := Low(TGraphObjectOption) to High(TGraphObjectOption) do
    PublicOptions.Checked[Ord(Option)] := Option in Value;
end;

end.
