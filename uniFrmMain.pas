unit uniFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Data.FMTBcd, Data.SqlExpr,
  Data.DBXMySQL, Datasnap.DBClient, Datasnap.Provider, Vcl.Mask, Vcl.ComCtrls,
  Vcl.WinXPanels, Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, Data.Win.ADODB, Vcl.DBCGrids, Xml.xmldom, Xml.XMLIntf,
  Xml.XMLDoc, uniLangManager;

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
    SettingsPage: TTabSheet;
    BSTIPEdit: TEdit;
    BSTIPLabel: TLabel;
    XMLLangDoc: TXMLDocument;
    Databind_MainformTitle: TEdit;
    BSTConnect: TButton;
    BSTUserLabel: TLabel;
    BSTUserEdit: TEdit;
    BSTPassword: TLabel;
    BSTPasswordEdit: TEdit;
    Databind_ConnectionError: TEdit;
    BEGroupEdit: TDBEdit;
    BEGroupLabel: TLabel;
    BillsTableClientGroup: TStringField;
    ViewQueryClientGroup: TStringField;
    Databind_AutoTableGenPrompt: TEdit;
    BSTLanguageSelector: TComboBox;
    BSTLanguageLabel: TLabel;
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
    procedure Databind_MainformTitleChange(Sender: TObject);
    procedure BSTConnectClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BSTLanguageSelectorChange(Sender: TObject);
  protected
    MinusCounter: Integer;
    QueryEdit: string;
    OrderStr: string;
    OrderState: Integer;
    PrevDateSelect: TDate;
    LangMgr: TLangManager;
    fConnected: Boolean;

    procedure SetConnected(const aConnected: Boolean);
    procedure UpdateQuery;
    function GetSumOfPrices: Double;
    procedure UpdateSumDiff;
    function LangToString(const ALangIndex: Integer): string;

    procedure SetUpDatabase;

    property Connected: Boolean read fConnected write SetConnected;
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshSQL;
  end;

var
  BillEditor: TBillEditor;

resourcestring
  { General SQL Query Resources }
  RS_DB_Name = 'bills';
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
  RS_BESD_GroupFieldName = 'Group';
  RS_BE_BillIDFieldName = 'BillID';
  RS_BE_DateFieldName = 'Date';
  RS_BE_StoreIDRefFieldName = 'StoreID';

  { MISC }
  RS_CHAR_ArrowDown = '↓';
  RS_CHAR_ArrowUp = '↑';
  RS_OrderDefault = 'BillID';

  { AUTO-GENERATION OF TABLES }
  RS_CREATE_RECEIPTS = 'CREATE TABLE `receipts` ( ' +
                       '`BillID` int(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, ' +
                       '`Date` date NOT NULL, ' +
                       '`StoreID` int(10) UNSIGNED NOT NULL, ' +
                       '`Price` float NOT NULL, ' +
                       '`Group` varchar(32) DEFAULT NULL); ';
  RS_CREATE_RECEIPTS_KEYS = 'ALTER TABLE `receipts` ' +
                            'ADD KEY `store_FK_1` (`StoreID`); ';
  RS_CREATE_RECEIPTS_FK_LINK = 'ALTER TABLE `receipts` ' +
                               'ADD CONSTRAINT `store_FK_1` FOREIGN KEY (`StoreID`) REFERENCES `stores` (`StoreID`); ';
  RS_CREATE_STORES = 'CREATE TABLE `stores` ( ' +
                     '`StoreID` int(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, ' +
                     '`Name` varchar(24) NOT NULL, ' +
                     '`Location` varchar(50) NOT NULL, ' +
                     '`Address` varchar(80) NOT NULL); ';
  RS_CREATE_STORES_ETC = 'INSERT INTO `stores` (`StoreID`, `Name`, `Location`, `Address`) VALUES (0, ''Etc'', ''-'', ''-''); ';
  RS_CREATE_RECEIPTS_VIEW = 'CREATE VIEW `receipts_view`  AS SELECT ' +
                            '`r`.`BillID` AS `BillID`, `r`.`Date` AS `Date`, `r`.`Price` AS `Price`, `s`.`StoreID` AS `StoreID`, ' +
                            '`s`.`Name` AS `Name`, `s`.`Location` AS `Location`, `s`.`Address` AS `Address` ' +
                            'FROM (`receipts` `r` join `stores` `s` on(`s`.`StoreID` = `r`.`StoreID`)); ';
  RS_CREATE_FILTERED_VIEW = 'CREATE VIEW `filtered_view` AS SELECT * FROM `receipts_view`; ';
  RS_CREATE_COMMIT = 'COMMIT;';

implementation

uses
  ActiveX, Math, uniFrmManualChange, System.StrUtils, System.UITypes;

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

procedure TBillEditor.BSTConnectClick(Sender: TObject);
begin
  Connected := not Connected;
end;

procedure TBillEditor.BSTLanguageSelectorChange(Sender: TObject);
begin
  LangMgr.ActiveLang := BSTLanguageSelector.ItemIndex;
  if fConnected then
  begin
    try
      BSTConnect.Caption := SplitString(BSTConnect.Hint, '|')[1];
    except
      BSTConnect.Caption := BSTConnect.Hint;
    end;
  end
  else
    BSTConnect.Caption := SplitString(BSTConnect.Hint, '|')[0];
end;

procedure TBillEditor.btnDebugFallbackClick(Sender: TObject);
begin
  DialogChange.Show;
end;

procedure TBillEditor.Button1Click(Sender: TObject);
begin
  if fConnected then
  begin
    ShowMessage('Manu setting up');
    SetUpDatabase;
  end;
end;

procedure TBillEditor.Databind_MainformTitleChange(Sender: TObject);
begin
  Caption := Databind_MainformTitle.Text;
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

function TBillEditor.LangToString(const ALangIndex: Integer): string;
begin
  case ALangIndex of
    1: Exit('German');
  end;
  Result := 'Fallback';
end;

procedure TBillEditor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CoUninitialize;
end;

procedure TBillEditor.FormCreate(Sender: TObject);
begin
  CoInitialize(nil);
  XMLLangDoc.Active := True;
  LangMgr := TLangManager.Create(@XMLLangDoc, @Self);
  LangMgr.LangToString := LangToString;
  LangMgr.ActiveLang := LangMgr.Fallback;

  fConnected := True;
  Connected := False;
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


procedure TBillEditor.SetConnected(const aConnected: Boolean);
var
  _Ctrl: TControl;
begin
  if fConnected <> aConnected then
  begin
    fConnected := aConnected;
    try
      if fConnected then
      begin
        MySQLConnector.Params.Values['HostName'] := BSTIPEdit.Text;
        MySQLConnector.Params.Values['User_Name'] := BSTUserEdit.Text;
        MySQLConnector.Params.Values['Password'] := BSTPasswordEdit.Text;
        MySQLConnector.Params.Values['Database'] := RS_DB_Name;
      end
      else if Assigned(uniFrmManualChange.DialogChange) then
      begin
        uniFrmManualChange.DialogChange.Close;
        uniFrmManualChange.DialogChange.Connected := fConnected;
      end;
      MySQLConnector.Connected := fConnected;
    except on e: Exception do begin
      ShowMessage(Format(Databind_ConnectionError.Text, [e.ClassType.ClassName, e.ToString]));
      fConnected := False;
    end; end;


    // Give Bills Dialog
    if fConnected then
      SetUpDatabase;

    // set the enable state of every element
    for _Ctrl in [
      QueryFilterEdit, QFilterApply, QFilterClear, OverviewClearDate, MonthCalendar1,
      DBNavigator1, BEBillsSaveButton, BEBillsCancelButton, BEBillIDEdit, BEStoreIDRefEdit, BEPriceEdit, BEDateTimePicker, btnDebugFallback,
      SEStoreNavigator, SEStoreIDEdit, SENameEdit, SEAddressEdit, SELocationEdit, SEStoreCancelButton, SEStoreSaveButton
    ] do
      _Ctrl.Enabled := fConnected;

    // Set query and table selectors
    BillsTableSelector.Active := fConnected;
    StoresTableSelector.Active := fConnected;
    ViewQuery.Active := fConnected;
    StoresTableClient.Active := fConnected;
    BillsTableClient.Active := fConnected;
    ViewQueryClient.Active := fConnected;

    if fConnected then
    begin
      try
        BSTConnect.Caption := SplitString(BSTConnect.Hint, '|')[1];
      except
        BSTConnect.Caption := BSTConnect.Hint;
      end;
      OverviewDateClick(OverviewClearDate);
    end
    else
      BSTConnect.Caption := SplitString(BSTConnect.Hint, '|')[0];
  end;
end;

procedure TBillEditor.SetUpDatabase;

  function CheckException(AQ: TSQLQuery; const aSql: string): Boolean;
  begin
    try
      AQ.SQL.Text := aSql;
      AQ.Open;
      AQ.Close;
    except
      Exit(False);
    end;
    Result := True;
  end;

  procedure DoSQL(AQ: TSQLQuery; const aSql: string);
  begin
    try
      AQ.SQL.Text := aSql;
      AQ.Open;
      AQ.Close;
    except
    end;
  end;

const
  _TBLMX = 3;
  _TABLES: array[0.._TBLMX] of string = ('receipts', 'stores', 'receipts_view', 'filtered_view');
var
  LQ: TSQLQuery;
  _TablesExist: array[0.._TBLMX] of Boolean;
  i: Integer;
  _TmpBool: Boolean;
  _TmpStr: string;
begin
  if not fConnected then exit;

  LQ := TSQLQuery.Create(nil);
  _TmpBool := True;
  _TmpStr := '';

  try
    LQ.SQLConnection := MySQLConnector; //< Already set to Database. Unfortunately it does not seem like you can create the database in this here.
    for i := 0 to _TBLMX do //< Check if any of the Tables/View are missing
    begin
      _TablesExist[i] := CheckException(LQ, RS_Q_SelectAllFrom_ + _TABLES[i] + ' LIMIT 1');
      _TmpBool := _TmpBool and _TablesExist[i];
    end;

    if _TmpBool then exit;

    for i := 0 to _TBLMX do
      if not _TablesExist[i] then
        _TmpStr := _TmpStr + _TABLES[i] + ', ';

    if Vcl.Dialogs.MessageDlg(Format(Databind_AutoTableGenPrompt.Text, [_TmpStr]), TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0, TMsgDlgBtn.mbYes) = mrYes then
    begin
      if not _TablesExist[0] then
      begin
        DoSQL(LQ, RS_CREATE_RECEIPTS);
        DoSQL(LQ, RS_CREATE_RECEIPTS_KEYS);
      end;

      if not _TablesExist[1] then
      begin
        DoSQL(LQ, RS_CREATE_STORES);
        DoSQL(LQ, RS_CREATE_STORES_ETC);
      end;

      if not _TablesExist[0] then //< This must be done after!
      begin
        DoSQL(LQ, RS_CREATE_RECEIPTS_FK_LINK);
      end;

      if not _TablesExist[2] then
      begin
        DoSQL(LQ, RS_CREATE_RECEIPTS_VIEW);
      end;

      if not _TablesExist[3] then
      begin
        DoSQL(LQ, RS_CREATE_FILTERED_VIEW);
      end;

      DoSQL(LQ, RS_CREATE_COMMIT);

      // Now check once more!
      for i := 0 to _TBLMX do
        if not CheckException(LQ, RS_Q_SelectAllFrom_ + _TABLES[i] + ' LIMIT 1') then
          ShowMessage('Failed to create ' + _TABLES[i]);
    end;
  finally
    LQ.Free;
  end;
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
  if not fConnected then exit;


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
