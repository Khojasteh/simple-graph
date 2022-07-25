unit UsageHelp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  THelpOnActions = class(TForm)
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    btnClose: TButton;
  public
    class procedure Execute;
  end;

implementation

{$R *.dfm}

{ THelpOnActions }

class procedure THelpOnActions.Execute;
begin
  with Create(Application) do
    try
      RichEdit1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Keyboard.rtf');
      RichEdit2.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Mouse.rtf');
      ShowModal;
    finally
      Free;
    end;
end;

end.
