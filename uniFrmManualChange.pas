unit uniFrmManualChange;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.Generics.Collections,
  Vcl.NumberBox, Data.SqlExpr, Data.DBXMySQL, Data.DB, Vcl.WinXPanels;

type
  TDialogChange = class(TForm)
    TableStatement: TComboBox;
    OperationStatement: TComboBox;
    Errlbl: TLabel;
    UpdateContents: TPanel;
    DeleteContents: TPanel;
    DelLabel: TLabel;
    DelNB: TNumberBox;
    pnlBot: TPanel;
    BtnOk: TButton;
    btnCancel: TButton;
    UpdateLbl: TLabel;
    UpdateWhereLbl: TLabel;
    UpdateNB: TNumberBox;
    ScrollBox1: TScrollBox;
    FieldStacker: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnClick(Sender: TObject);
    procedure TableStatementChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OperationStatementChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure UpdateNBChangeValue(Sender: TObject);
  protected
    { Private declarations }

    fList: TList<TPanel>;
    fConnected: Boolean;

    function GetOperation: string;
    function GetTable: string;
    function GetTableID: string;
    function ByFieldID(const aFieldName: string): TControl;
    procedure SetConnected(const aConnected: Boolean);
  public
    property Connected: Boolean read fConnected write SetConnected;
    { Public declarations }
  end;

var
  DialogChange: TDialogChange;

implementation

uses Math, uniFrmMain;

{$R *.dfm}

procedure TDialogChange.btnClick(Sender: TObject);
var
  _addComma: Boolean;
begin
  _addComma := False;
  if Sender = BtnOk then
  begin
    var LQ: TSQLQuery := TSQLQuery.Create(nil);
    try
      LQ.SQLConnection := uniFrmMain.BillEditor.MySQLConnector;

      LQ.SQL.Text := GetOperation + GetTable;

      case OperationStatement.ItemIndex of
        0: begin
          LQ.SQL.Text := LQ.SQL.Text + 'SET ';
          for var p: TPanel in fList do
          begin
            var _str: string := string(p.Name).Replace('pnlOfField_', '');
            var _edit: TControl := p.FindChildControl('fieldEdit');

            if _addComma then
              LQ.SQL.Add(',');
            _addComma := True;

            LQ.SQL.Add(_str + ' = :value_' + _str);

            if _edit is TEdit then
            begin
              LQ.Params.ParamByName('value_' + _str).DataType := ftString;
              LQ.Params.ParamByName('value_' + _str).Value := TEdit(_edit).Text;
            end
            else if _edit is TNumberBox then
            begin
              if TNumberBox(_edit).Mode = nbmInteger then
              begin
                LQ.Params.ParamByName('value_' + _str).DataType := ftInteger;
                LQ.Params.ParamByName('value_' + _str).Value := TNumberBox(_edit).ValueInt;
              end
              else if TNumberBox(_edit).Mode = nbmFloat then
              begin
                LQ.Params.ParamByName('value_' + _str).DataType := ftFloat;
                LQ.Params.ParamByName('value_' + _str).Value := TNumberBox(_edit).ValueFloat;
              end;
            end;

          end;

          LQ.SQL.Add('WHERE ' + GetTableID + '= ' + UpdateNB.ValueInt.ToString);
        end;
        1: begin
          LQ.SQL.Text := LQ.SQL.Text + 'WHERE ' + GetTableID + '= ' + DelNB.ValueInt.ToString;
        end;
        // else handing already in GetOperation method up there ^
      end;

      try
        LQ.Open;
      except
      end;
    finally
      LQ.Free;
    end;
  end;

  DialogChange.Close;
end;

procedure TDialogChange.FormDestroy(Sender: TObject);
begin
  for var t: TPanel in fList do
    t.Free;
  fList.Clear;
  fList.Free;
end;

function TDialogChange.GetOperation: string;
begin
  case OperationStatement.ItemIndex of
    0: Exit('UPDATE ');
    1: Exit('DELETE FROM ');
  end;
  raise Exception.Create('NO VALID OPERATION!');
end;

function TDialogChange.GetTable: string;
begin
  case TableStatement.ItemIndex of
    0: Exit('receipts ');
    1: Exit('stores ');
  end;
  raise Exception.Create('NO VALID TABLE!');
end;

function TDialogChange.GetTableID: string;
begin
  case TableStatement.ItemIndex of
    0: Exit('BillID ');
    1: Exit('StoreID ');
  end;
  raise Exception.Create('NO VALID TABLE!');
end;

procedure TDialogChange.OperationStatementChange(Sender: TObject);
begin
  UpdateContents.Visible := False;
  DeleteContents.Visible := False;

  case OperationStatement.ItemIndex of
    0: UpdateContents.Visible := True;
    1: DeleteContents.Visible := True;
    else raise Exception.Create('NO VALID OPERATION!');
  end;
end;

procedure TDialogChange.SetConnected(const aConnected: Boolean);
begin
  if aConnected <> fConnected then
  begin
    fConnected := aConnected;

    if fConnected then
      TableStatementChange(Self);
  end;
end;

procedure TDialogChange.TableStatementChange(Sender: TObject);
var
  LQ: TSQLQuery;
  f: TField;
  start_index: Integer;
begin
  if not fConnected then exit;

  // Update labels
  DelLabel.Caption := DelLabel.Hint.Replace('<table_id_key>', GetTableID);
  UpdateWhereLbl.Caption := UpdateWhereLbl.Hint.Replace('<table_id_key>', GetTableID);

  if OperationStatement.ItemIndex <> 0 then
    Exit;
  start_index := 0;

  // Remove prev elements
  for var t: TPanel in fList do
    t.Free;
  fList.Clear;

  // Get Elements
  LQ := TSQLQuery.Create(nil);
  try
    LQ.SQLConnection := uniFrmMain.BillEditor.MySQLConnector;
    LQ.SQL.Text := 'SELECT * FROM ' + GetTable + ' LIMIT 1';
    LQ.Open;

    for var i: Integer := 0 to LQ.Fields.Count - 1 do
    begin
      f := LQ.Fields[i];

      if Pos(string(f.FieldName),GetTableID) <> 0 then
        start_index := f.AsInteger;

      var p: TPanel := TPanel.Create(nil);
      fList.Add(p);
      p.Name := 'pnlOfField_' + f.FieldName;
      p.ShowCaption := False;
      p.Align := alTop;

      var l: TLabel := TLabel.Create(p);
      l.Parent := p;
      l.Align := alLeft;
      l.Caption := f.FieldName + ' = ';
      l.AutoSize := True;
      l.Layout := tlCenter;

      var e: TWinControl;
      case f.DataType of
        ftInteger: e := TNumberBox.Create(p);
        ftSingle,
        ftFloat: begin
          e := TNumberBox.Create(p);
          TNumberBox(e).Mode := nbmFloat;
        end;
        else begin
         e:= TEdit.Create(p);
         TEdit(e).Text := '';
        end;
      end;
      e.Parent := p;
      e.Align := alClient;
      e.Name := 'fieldEdit';

      p.Parent := FieldStacker;
      p.Top := FieldStacker.Height + p.Height;
    end;

    // Update element contents
    UpdateNB.ValueInt := start_index;
  finally
    LQ.Free;
  end;
end;

procedure TDialogChange.UpdateNBChangeValue(Sender: TObject);
var
  LQ: TSQLQuery;
  f: TField;
begin
  LQ := TSQLQuery.Create(nil);

  try
    LQ.SQLConnection := uniFrmMain.BillEditor.MySQLConnector;
    LQ.SQL.Text := 'SELECT * FROM ' + GetTable + 'WHERE ' + GetTableID + '= ' + UpdateNB.ValueInt.ToString;
    LQ.Open;

    for var i: Integer := 0 to LQ.Fields.Count - 1 do
    begin
      f := LQ.Fields[i];

      var _edit: TControl := ByFieldID(f.FieldName);

      case f.DataType of
        ftInteger: TNumberBox(_edit).ValueInt := f.AsInteger;
        ftSingle,
        ftFloat: begin
          TNumberBox(_edit).ValueFloat := f.AsFloat;

          if Pos('price', f.FieldName.ToLower) <> 0 then
            TNumberBox(_edit).ValueFloat := RoundTo(TNumberBox(_edit).ValueFloat, -2);
        end;
        ftDate: TEdit(_edit).Text := FormatDateTime('YYYY-MM-DD', f.AsDateTime);
        else TEdit(_edit).Text := f.AsString;
      end;
    end;
  finally
    LQ.Free;
  end;
end;

procedure TDialogChange.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caHide;
  BillEditor.RefreshSQL;
end;

procedure TDialogChange.FormCreate(Sender: TObject);
var
  _h: Integer;
begin
  fList := TList<TPanel>.Create;
  _h := UpdateContents.Height;
  DeleteContents.Visible := False;
  UpdateContents.Align := alBottom;
  DeleteContents.Align := alBottom;
  UpdateContents.Height := _h;
  DeleteContents.Height := _h;
  fConnected := False;

  TableStatementChange(TableStatement);
end;


function TDialogChange.ByFieldID(const aFieldName: string): TControl;
begin
  Result := nil;

  for var p: TPanel in fList do
  begin
    if p.Name = 'pnlOfField_' + aFieldName then
      Exit(p.FindChildControl('fieldEdit'));
  end;
end;

end.
