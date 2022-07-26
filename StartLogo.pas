unit StartLogo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxGIF, ExtCtrls, Animate, GIFCtrl, ComCtrls;

type
  TStartLog = class(TForm)
    gif: TRxGIFAnimator;
    Timer1: TTimer;
    ProgressBar1: TProgressBar;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StartLog: TStartLog;
  i:integer;

implementation

uses MainMenu, Authoriz;

{$R *.dfm}

//плавное появление логотипа
procedure TStartLog.Timer1Timer(Sender: TObject);
begin
StartLog.AlphaBlendValue:=i;
inc(i);
if i >= 150 then begin
progressbar1.Visible:=true;
progressbar1.Position:=i-150;
end;
if progressbar1.Position = 100 then begin
timer1.Enabled:=false;
Authorization.Visible:=true;
Authorization.show;
StartLog.Visible:=false;
end;

end;

end.
