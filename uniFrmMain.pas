unit uniFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Data.FMTBcd, Data.SqlExpr,
  Data.DBXMySQL, Datasnap.DBClient, Datasnap.Provider, Vcl.Mask, Vcl.ComCtrls,
  Vcl.WinXPanels, Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, Data.Win.ADODB, Vcl.DBCGrids;

type
  TBillEditor = class(TForm)
    StoresDataSource: TDataSource;
    MySQLConnector: TSQLConnection;
    StoresTableSelector: TSQLDataSet;
    StoresTableProvider: TDataSetProvider;
    StoresTableClient: TClientDataSet;
    StoresTableClientName: TStringField;
    StoresTableClientLocation: TStringField;
    StoresTableClientAddress: TStringField;
    StoresTableClientStoreID: TAutoIncField;
    MultiPage: TPageControl;
    BillsOverview: TTabSheet;
    BillsEditor: TTabSheet;
    StoreEditor: TTabSheet;
    SEDBGrid: TDBGrid;
    SEStoreIDEdit: TDBEdit;
    SENameEdit: TDBEdit;
    SELocationEdit: TDBEdit;
    SEAddressEdit: TDBEdit;
    SEStoreIDLabel: TLabel;
    SENameLabel: TLabel;
    SELocationLabel: TLabel;
    SEAddressLabel: TLabel;
    SEStoreNavigator: TDBNavigator;
    ESETopP: TPanel;
    ESETopButtonsP: TPanel;
    SEStoreCancelButton: TButton;
    SEStoreSaveButton: TButton;
    ESETopStackP: TStackPanel;
    ESETopNavigatorP: TPanel;
    ESETopLeftP: TPanel;
    ESETopRightP: TPanel;
    EBETopButtonsP: TPanel;
    EBETopStackP: TStackPanel;
    BEBillsSaveButton: TButton;
    BEBillsCancelButton: TButton;
    EBETopNavigatorP: TPanel;
    DBNavigator1: TDBNavigator;
    EBETopP: TPanel;
    BEDBGrid: TDBGrid;
    BillsTableSelector: TSQLDataSet;
    BillsTableProvider: TDataSetProvider;
    BEBillIDLabel: TLabel;
    BEBillIDEdit: TDBEdit;
    BEDateLabel: TLabel;
    BEPriceLabel: TLabel;
    BEPriceEdit: TDBEdit;
    BEStoreIDRefLabel: TLabel;
    BEStoreIDRefEdit: TDBEdit;
    BENameLabel: TLabel;
    BELocationLabel: TLabel;
    BEAddressLabel: TLabel;
    BillsTableClient: TClientDataSet;
    BillsTableClientBillID: TIntegerField;
    BillsTableClientDate: TDateField;
    BillsTableClientStoreID: TIntegerField;
    BillsTableClientPrice: TSingleField;
    BillsDataSource: TDataSource;
    BENameDisplay: TEdit;
    BELocationDisplay: TEdit;
    BEAddressDisplay: TEdit;
    BindingsList1: TBindingsList;
    BEDateTimePicker: TDateTimePicker;
    BindSourceDB1: TBindSourceDB;
    LinkControlToFieldDate: TLinkControlToField;
    ViewDBGrid: TDBGrid;
    ViewSelector: TSQLDataSet;
    ViewProvider: TDataSetProvider;
    ViewClient: TClientDataSet;
    IntegerField1: TIntegerField;
    DateField1: TDateField;
    SingleField1: TSingleField;
    IntegerField2: TIntegerField;
    ViewDataSource: TDataSource;
    ViewClientName: TStringField;
    ViewClientLocation: TStringField;
    ViewClientAddress: TStringField;
    ViewQuery: TSQLQuery;
    ViewQueryDataSource: TDataSource;
    ViewQueryProvider: TDataSetProvider;
    ViewQueryClient: TClientDataSet;
    IntegerField3: TIntegerField;
    DateField2: TDateField;
    SingleField2: TSingleField;
    IntegerField4: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    EViewTopP: TPanel;
    MonthCalendar1: TMonthCalendar;
    OverviewClearDate: TButton;
    QueryFilterEdit: TEdit;
    QFilterApply: TButton;
    QFilterClear: TButton;
    SumLabel: TLabel;
    SumValue1: TLabel;
    SumCopyDown: TButton;
    SumValue2: TLabel;
    SumLabelDiff: TLabel;
    SumValueDiff: TLabel;
    btnDebugFallback: TButton;
    DebugVisiToggler: TPanel;
    procedure BEBillsSaveButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SEStoreSaveButtonClick(Sender: TObject);
    procedure SEStoreCancelButtonClick(Sender: TObject);
    procedure BEBillsCancelButtonClick(Sender: TObject);
    procedure BEStoreIDRefEditChange(Sender: TObject);
    procedure BillsTableClientNewRecord(DataSet: TDataSet);
    procedure OverviewDateClick(Sender: TObject);
    procedure QFilterCtrlClick(Sender: TObject);
    procedure ViewDBGridTitleClick(Column: TColumn);
    procedure QueryFilterEditKeyPress(Sender: TObject; var Key: Char);
    procedure SumCopyDownClick(Sender: TObject);
    procedure btnDebugFallbackClick(Sender: TObject);
    procedure DebugVisiTogglerDblClick(Sender: TObject);
  protected
    MinusCounter: Integer;
    QueryEdit: string;
    OrderStr: string;
    OrderState: Integer;
    PrevDateSelect: TDate;

    procedure UpdateQuery;
    function GetSumOfPrices: Double;
    procedure UpdateSumDiff;
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshSQL;
  end;

var
  BillEditor: TBillEditor;

resourcestring
  { General SQL Query Resources }
  RS_BE_TableName = 'receipts';
  RS_SE_TableName = 'stores';
  RS_View_ViewName = 'receipts_view';
  RS_View_FilterName = 'filtered_view';

  { General SQL Query Statements }
  RS_Q_Select_ = 'SELECT ';
  RS_Q_From_ = 'FROM ';
  RS_Q_As_ = ' AS ';
  RS_Q_SelectAllFrom_ = 'SELECT * FROM ';
  RS_Q_OrderBy_ = ' ORDER BY ';
  RS_Q_Asc_ = 'ASC';
  RS_Q_Desc_ = 'DESC';
  RS_Q_Where_ = ' WHERE ';
  RS_Q_And_ = ' AND ';
  RS_Q_Or_ = ' OR ';
  RS_Q_Not_ = ' NOT ';
  RS_Q_Sum_ = 'SUM';
  RS_Q_AlterView_ = 'ALTER VIEW ';

  { Bills Editor Resources }
  RS_BESD_NameFieldName = 'Name';
  RS_BESD_LocationFieldName = 'Location';
  RS_BESD_AddressFieldName = 'Address';
  RS_BE_BillIDFieldName = 'BillID';
  RS_BE_DateFieldName = 'Date';
  RS_BE_StoreIDRefFieldName = 'StoreID';

  { MISC }
  RS_CHAR_ArrowDown = '↓';
  RS_CHAR_ArrowUp = '↑';
  RS_OrderDefault = 'BillID';

implementation

uses
  ActiveX, Math, uniFrmManualChange;

{$R *.dfm}

procedure TBillEditor.BEBillsSaveButtonClick(Sender: TObject);
begin
  BillsTableClient.Edit;
  BillsTableClient.Post;
  if BillsTableClient.ApplyUpdates(0) <> 0 then
  begin
    BillsTableClient.Cancel;
    BillsTableClient.CancelUpdates;
    BillsTableClient.Refresh;
    DialogChange.Show;
    DialogChange.TableStatement.ItemIndex := 0;
    DialogChange.DelNB.Value := BillsTableClient.FieldByName(RS_BE_BillIDFieldName).AsInteger;
    DialogChange.UpdateNB.Value := DialogChange.DelNB.Value;
    Exit;
  end;
  BillsTableClient.Refresh;
  MinusCounter := -1;
end;

procedure TBillEditor.SEStoreCancelButtonClick(Sender: TObject);
begin
  StoresTableClient.Edit;
  StoresTableClient.Cancel;
  StoresTableClient.CancelUpdates;
  StoresTableClient.Refresh;
end;

procedure TBillEditor.BEBillsCancelButtonClick(Sender: TObject);
begin
  BillsTableClient.Edit;
  BillsTableClient.Cancel;
  BillsTableClient.CancelUpdates;
  BillsTableClient.Refresh;
  MinusCounter := -1;
end;

procedure TBillEditor.BillsTableClientNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName(RS_BE_BillIDFieldName).Value := MinusCounter;
  MinusCounter := MinusCounter - 1;
  DataSet.FieldByName(RS_BE_DateFieldName).Value := Trunc(Now);
end;

procedure TBillEditor.btnDebugFallbackClick(Sender: TObject);
begin
  DialogChange.Show;
end;

procedure TBillEditor.DebugVisiTogglerDblClick(Sender: TObject);
begin
  btnDebugFallback.Visible := not btnDebugFallback.Visible;
end;

procedure TBillEditor.BEStoreIDRefEditChange(Sender: TObject);
var
  LQ: TSQLQuery;
  iV, iC: Integer;
begin
  BENameDisplay.Text :=     '';
  BELocationDisplay.Text := '';
  BEAddressDisplay.Text :=  '';


  Val(BEStoreIDRefEdit.Text, iV, iC);
  if iC <> 0 then
    Exit;


  LQ := TSQLQuery.Create(nil);

  try
    LQ.SQLConnection := MySQLConnector;
    LQ.SQL.Text := 'SELECT ' + RS_BESD_NameFieldName + ', '  + RS_BESD_LocationFieldName +
      ', ' + RS_BESD_AddressFieldName + ' FROM ' + RS_SE_TableName +  ' WHERE ' +
      RS_BE_StoreIDRefFieldName + ' = :integervalue';
    LQ.Params.ParamByName('integervalue').DataType := ftInteger;
    LQ.Params.ParamByName('integervalue').Value := iV;
    LQ.Open;

    BENameDisplay.Text :=     LQ.FieldByName(RS_BESD_NameFieldName).AsString;
    BELocationDisplay.Text := LQ.FieldByName(RS_BESD_LocationFieldName).AsString;
    BEAddressDisplay.Text :=  LQ.FieldByName(RS_BESD_AddressFieldName).AsString;
  finally
    LQ.Free;
  end;
end;

function TBillEditor.GetSumOfPrices: Double;
var
  LQ: TSQLQuery;
begin
  LQ := TSQLQuery.Create(nil);
  try
    LQ.SQLConnection := MySQLConnector;
    LQ.SQL.Text := RS_Q_Select_ + RS_Q_Sum_ + '(Price)' + RS_Q_As_ + 'Result ' + RS_Q_From_ + RS_View_FilterName;
    LQ.Open;
    Result := RoundTo(LQ.FieldByName('Result').AsFloat, -2);
  finally
    LQ.Free;
  end;
end;

procedure TBillEditor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CoUninitialize;
end;

procedure TBillEditor.FormCreate(Sender: TObject);
begin
  CoInitialize(nil);
  MinusCounter := -1;
  OverviewDateClick(OverviewClearDate);
  MonthCalendar1.Date := Trunc(Now);
end;

procedure TBillEditor.OverviewDateClick(Sender: TObject);
begin
  OverviewClearDate.Enabled := (Sender = MonthCalendar1) and not (MonthCalendar1.Date = 0);
  UpdateQuery;
end;

procedure TBillEditor.QFilterCtrlClick(Sender: TObject);
begin
  if Sender = QFilterApply then
  begin
    QueryEdit := QueryFilterEdit.Text;
    QueryEdit := QueryEdit.Replace('&', RS_Q_And_);
    QueryEdit := QueryEdit.Replace('|', RS_Q_Or_);
  end
  else if Sender = QFilterClear then
  begin
    QueryFilterEdit.Text := '';
    QueryEdit := '';
  end;
  UpdateQuery;
end;

procedure TBillEditor.QueryFilterEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Integer(Key) = 13 then
    QFilterCtrlClick(QFilterApply);
end;

procedure TBillEditor.SEStoreSaveButtonClick(Sender: TObject);
begin
  StoresTableClient.Edit;
  StoresTableClient.Post;
  if StoresTableClient.ApplyUpdates(0) <> 0 then
  begin
    StoresTableClient.Cancel;
    StoresTableClient.CancelUpdates;
    StoresTableClient.Refresh;
    DialogChange.Show;
    DialogChange.TableStatement.ItemIndex := 1;
    DialogChange.DelNB.Value := StoresTableClient.FieldByName(RS_BE_BillIDFieldName).AsInteger;
    DialogChange.UpdateNB.Value := DialogChange.DelNB.Value;
    Exit;
  end;
  StoresTableClient.Refresh;
end;


procedure TBillEditor.SumCopyDownClick(Sender: TObject);
begin
  SumValue2.Caption := SumValue1.Caption;
  UpdateSumDiff;
end;

procedure TBillEditor.UpdateQuery;

  function AddCond(const aStr, aCond: string): string;
  begin
    if Pos(RS_Q_Where_, aStr) > 0 then
      Result := aStr + RS_Q_And_
    else
      Result := aStr + RS_Q_Where_;
    Result := Result + aCond;
  end;

var
  _para: TParam;
begin
  ViewQuery.Params.ClearAndResetID;
  ViewQuery.ParamCheck := True;
  ViewQuery.SQL.Text := RS_Q_AlterView_ + RS_View_FilterName + RS_Q_As_ + RS_Q_SelectAllFrom_ + RS_View_ViewName;

  if OverviewClearDate.Enabled then
  begin
    ViewQuery.SQL.Text := AddCond(ViewQuery.SQL.Text, RS_BE_DateFieldName + ' = :__' + RS_BE_DateFieldName + '_value__');
    _para := ViewQuery.Params.ParamByName('__' + RS_BE_DateFieldName + '_value__');
    _para.DataType := ftDate;
    _para.Value := MonthCalendar1.Date;
  end;

  if QueryEdit <> '' then
  begin
    ViewQuery.SQL.Text := AddCond(ViewQuery.SQL.Text, QueryEdit);
  end;

  if OrderState <> 0 then
  begin
    ViewQuery.SQL.Text := ViewQuery.SQL.Text + RS_Q_OrderBy_ + OrderStr + ' ';
    if OrderState = 1 then
      ViewQuery.SQL.Text := ViewQuery.SQL.Text + RS_Q_Asc_
    else
      ViewQuery.SQL.Text := ViewQuery.SQL.Text + RS_Q_Desc_;
  end
  else
    ViewQuery.SQL.Text := ViewQuery.SQL.Text + RS_Q_OrderBy_ + RS_OrderDefault + ' ' + RS_Q_Asc_;

  try
    ViewQuery.Open;
  except
  end;

  ViewQuery.SQL.Text := RS_Q_SelectAllFrom_ + RS_View_FilterName;
  ViewQueryClient.Refresh;
  SumValue1.Caption := GetSumOfPrices.ToString + ' €';
  UpdateSumDiff;
end;

procedure TBillEditor.ViewDBGridTitleClick(Column: TColumn);

  procedure ClearSortIndic;
  var
    _col: TColumn;
    _i: Integer;
  begin
    for _i := 0 to ViewDBGrid.Columns.Count - 1 do
    begin
      _col := ViewDBGrid.Columns.Items[_i];
      _col.Title.Caption := _col.FieldName;
    end;
  end;

var
  _stCtrl: Integer;
begin
  _stCtrl := 1;
  if Column.Title.Caption[1] = RS_CHAR_ArrowDown then
    _stCtrl := 2
  else if Column.Title.Caption[1] = RS_CHAR_ArrowUp then
    _stCtrl := 0;

  ClearSortIndic;

  if _stCtrl = 1 then
    Column.Title.Caption := RS_CHAR_ArrowDown + ' ' + Column.Title.Caption
  else if _stCtrl = 2 then
    Column.Title.Caption := RS_CHAR_ArrowUp + ' ' + Column.Title.Caption;

  OrderState := _stCtrl;
  OrderStr := Column.FieldName;

  UpdateQuery;
end;

procedure TBillEditor.UpdateSumDiff;
begin
  SumValueDiff.Caption := (string(SumValue1.Caption).Substring(0, Length(SumValue1.Caption) - 2).ToDouble
                         - string(SumValue2.Caption).Substring(0, Length(SumValue2.Caption) - 2).ToDouble).ToString + ' €';
end;

procedure TBillEditor.RefreshSQL;
begin
  StoresTableClient.Refresh;
  BillsTableClient.Refresh;
  ViewQueryClient.Refresh;
end;

end.
