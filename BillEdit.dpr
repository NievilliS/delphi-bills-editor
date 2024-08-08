program BillEdit;

uses
  Vcl.Forms,
  uniFrmMain in 'uniFrmMain.pas' {BillEditor},
  uniFrmManualChange in 'uniFrmManualChange.pas' {DialogChange},
  uniSettingsMgr in 'uniSettingsMgr.pas',
  uniLangManager in 'uniLangManager.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TBillEditor, BillEditor);
  Application.CreateForm(TDialogChange, DialogChange);
  Application.Run;
end.
