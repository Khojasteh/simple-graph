unit AboutDelphiArea;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TAbout = class(TForm)
    Bevel1: TBevel;
    btnOk: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    Shape1: TShape;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
  end;


implementation

{$R *.dfm}

procedure TAbout.FormCreate(Sender: TObject);
begin
  SetBounds(Screen.Width - Width - 30, 50, Width, Height);
end;

end.
