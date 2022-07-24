unit RepDat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, ExtCtrls;

type
  TRepData = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    D2: TDateEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RepData: TRepData;

implementation

uses DataModule, RepOne;

{$R *.dfm}

procedure TRepData.Button1Click(Sender: TObject);
begin
try
 if D2.Date <> 0 then begin
    DM.RepQ.Active:=false;
    DM.RepQ.SQL.Clear;
    DM.RepQ.SQL.Add('SELECT * FROM ����������,����,������ WHERE ����������.���_����=����.���_���� AND ����������.���_������=������.���_������');
    DM.RepQ.Active:=true;
    
    RepBBTU.QRLabel3.Caption:=datetostr(D2.Date);
    RepBBTU.QuickRep1.Preview;
    RepData.Close;
 end
 else showmessage('��� ������������ ������, ����� ������� ������.');
except
on E : Exception do
      ShowMessage('��������! '+E.Message);
end;
end;

end.
