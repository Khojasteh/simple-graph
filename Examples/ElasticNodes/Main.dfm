object MainForm: TMainForm
  Left = 192
  Top = 151
  Width = 559
  Height = 527
  Caption = 'Elastic Nodes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SimpleGraph: TSimpleGraph
    Left = 0
    Top = 0
    Width = 543
    Height = 489
    Align = alClient
    HideSelection = True
    HorzScrollBar.Visible = False
    ShowGrid = False
    SnapToGrid = False
    TabOrder = 0
    VertScrollBar.Visible = False
    OnObjectEndDrag = SimpleGraphObjectEndDrag
    OnNodeMoveResize = SimpleGraphNodeMoveResize
    object Panel: TPanel
      Left = 0
      Top = 0
      Width = 543
      Height = 41
      Align = alTop
      Caption = 'Drag a node!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object Timer: TTimer
    Enabled = False
    Interval = 30
    OnTimer = TimerTimer
    Left = 8
    Top = 48
  end
end
