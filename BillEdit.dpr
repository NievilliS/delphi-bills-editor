program BillEdit;

uses
  Vcl.Forms,
  uniFrmMain in 'uniFrmMain.pas' {BillEditor},
  uniFrmManualChange in 'uniFrmManualChange.pas' {DialogChange};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TBillEditor, BillEditor);
  Application.CreateForm(TDialogChange, DialogChange);
  Application.Run;
end.
