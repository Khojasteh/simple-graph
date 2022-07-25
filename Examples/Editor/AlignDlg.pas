unit AlignDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, SimpleGraph, StdCtrls, ExtCtrls;

type
  TAlignDialog = class(TForm)
    Horz: TRadioGroup;
    Vert: TRadioGroup;
    btnOK: TButton;
    btnCancel: TButton;
  public
    class function Execute(out HorzAlign: THAlignOption;
      out VertAlign: TVAlignOption): Boolean;
  end;

implementation

{$R *.dfm}

class function TAlignDialog.Execute(out HorzAlign: THAlignOption;
  out VertAlign: TVAlignOption): Boolean;
begin
  Result := False;
  with Create(Application) do
    try
      if ShowModal = mrOK then
      begin
        HorzAlign := THAlignOption(Horz.ItemIndex);
        VertAlign := TVAlignOption(Vert.ItemIndex);
        Result := True;
      end;
    finally
      Free;
    end;
end;

end.
