unit LinkProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, SimpleGraph, ExtCtrls, StdCtrls, CheckLst, ComCtrls;

type
  TLinkProperties = class(TForm)
    Label1: TLabel;
    LinkLabel: TEdit;
    Style: TGroupBox;
    StyleSolid: TRadioButton;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    StyleDash: TRadioButton;
    StyleDot: TRadioButton;
    Colors: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    LinkLineColor: TPanel;
    LinkStyleColor: TPanel;
    btnChangeFont: TButton;
    btnOK: TButton;
    btnCancel: TButton;
    Bevel1: TBevel;
    FontDialog: TFontDialog;
    ColorDialog: TColorDialog;
    btnApply: TButton;
    Label4: TLabel;
    AllOptions: TCheckListBox;
    LabelPlacement: TGroupBox;
    Edit4: TEdit;
    LabelPosition: TUpDown;
    Size: TGroupBox;
    Edit1: TEdit;
    PenWidth: TUpDown;
    LineBegin: TGroupBox;
    Label5: TLabel;
    LineBeginStyle: TComboBox;
    Label6: TLabel;
    Edit2: TEdit;
    LineBeginSize: TUpDown;
    LineEnd: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    LineEndStyle: TComboBox;
    Edit3: TEdit;
    LineEndSize: TUpDown;
    LineColor: TShape;
    StyleColor: TShape;
    Label9: TLabel;
    Label10: TLabel;
    Edit5: TEdit;
    LabelSpacing: TUpDown;
    procedure LinkLineColorClick(Sender: TObject);
    procedure LinkStyleColorClick(Sender: TObject);
    procedure btnChangeFontClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    S: TSimpleGraph;
    L: TGraphObjectList;
    procedure SetObjectOptions(Value: TGraphObjectOptions);
    function GetObjectOptions: TGraphObjectOptions;
    procedure SetLinkOptions(Value: TGraphLinkOptions);
    function GetLinkOptions: TGraphLinkOptions;
    procedure ApplyChanges;
  public
    class function Execute(Links: TGraphObjectList): Boolean;
  end;

implementation

{$R *.dfm}

{ TLinkProperties }

class function TLinkProperties.Execute(Links: TGraphObjectList): Boolean;
begin
  Result := False;
  with Create(Application) do
    try
      L := Links;
      with TGraphLink(Links[0]) do
      begin
        S := Owner;
        LinkLabel.Text := Text;
        LabelPosition.Position := TextPosition;
        LabelSpacing.Position := TextSpacing;
        PenWidth.Position := Pen.Width;
        case Pen.Style of
          psSolid: StyleSolid.Checked := True;
          psDash: StyleDash.Checked := True;
          psDot: StyleDot.Checked := True;
        end;
        LineColor.Brush.Color := Pen.Color;
        StyleColor.Brush.Color := Brush.Color;
        LineBeginStyle.ItemIndex := Ord(BeginStyle);
        LineBeginSize.Position := BeginSize;
        LineEndStyle.ItemIndex := Ord(EndStyle);
        LineEndSize.Position := EndSize;
        FontDialog.Font := Font;
        SetObjectOptions(Options);
        SetLinkOptions(LinkOptions);
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

procedure TLinkProperties.ApplyChanges;
var
  I: Integer;
begin
  S.BeginUpdate;
  try
    for I := 0 to L.Count - 1 do
      with TGraphLink(L[I]) do
      begin
        BeginUpdate;
        try
          Text := LinkLabel.Text;
          TextPosition := LabelPosition.Position;
          TextSpacing := LabelSpacing.Position;
          Pen.Width := PenWidth.Position;
          if StyleSolid.Checked then
            Pen.Style := psSolid
          else if StyleDash.Checked then
            Pen.Style := psDash
          else if StyleDot.Checked then
            Pen.Style := psDot;
          Pen.Color := LineColor.Brush.Color;
          Brush.Color := StyleColor.Brush.Color;
          BeginStyle := TLinkBeginEndStyle(LineBeginStyle.ItemIndex);
          BeginSize := LineBeginSize.Position;
          EndStyle := TLinkBeginEndStyle(LineEndStyle.ItemIndex);
          EndSize := LineEndSize.Position;
          Font := FontDialog.Font;
          Options := GetObjectOptions;
          LinkOptions := GetLinkOptions;
        finally
          EndUpdate;
        end;
      end;
  finally
    S.EndUpdate;
  end;
end;

procedure TLinkProperties.LinkLineColorClick(Sender: TObject);
begin
  ColorDialog.Color := LineColor.Brush.Color;
  if ColorDialog.Execute then
    LineColor.Brush.Color := ColorDialog.Color;
end;

procedure TLinkProperties.LinkStyleColorClick(Sender: TObject);
begin
  ColorDialog.Color := StyleColor.Brush.Color;
  if ColorDialog.Execute then
    StyleColor.Brush.Color := ColorDialog.Color;
end;

procedure TLinkProperties.btnChangeFontClick(Sender: TObject);
begin
  FontDialog.Execute;
end;

procedure TLinkProperties.btnApplyClick(Sender: TObject);
begin
  ApplyChanges;
end;

procedure TLinkProperties.FormCreate(Sender: TObject);
begin
  SetBounds(Screen.Width - Width - 30, 50, Width, Height);
end;

function TLinkProperties.GetObjectOptions: TGraphObjectOptions;
var
  Option: TGraphObjectOption;
begin
  Result := [];
  for Option := Low(TGraphObjectOption) to High(TGraphObjectOption) do
    if AllOptions.Checked[Ord(Option)] then
      Include(Result, Option);
end;

procedure TLinkProperties.SetObjectOptions(Value: TGraphObjectOptions);
var
  Option: TGraphObjectOption;
begin
  for Option := Low(TGraphObjectOption) to High(TGraphObjectOption) do
    AllOptions.Checked[Ord(Option)] := Option in Value;
end;

function TLinkProperties.GetLinkOptions: TGraphLinkOptions;
var
  Option: TGraphLinkOption;
begin
  Result := [];
  for Option := Low(TGraphLinkOption) to High(TGraphLinkOption) do
    if AllOptions.Checked[Ord(Option) + Ord(High(TGraphObjectOption)) + 1] then
      Include(Result, Option);
end;

procedure TLinkProperties.SetLinkOptions(Value: TGraphLinkOptions);
var
  Option: TGraphLinkOption;
begin
  for Option := Low(TGraphLinkOption) to High(TGraphLinkOption) do
    AllOptions.Checked[Ord(Option) + Ord(High(TGraphObjectOption)) + 1] := Option in Value;
end;

end.
