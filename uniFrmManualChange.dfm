object DialogChange: TDialogChange
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Manual SQL'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PopupMode = pmExplicit
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Errlbl: TLabel
    Left = 0
    Top = 0
    Width = 628
    Height = 28
    Align = alTop
    Alignment = taCenter
    Caption = 'Error while trying to Apply Updates - Change Manually'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 478
  end
  object TableStatement: TComboBox
    Left = 159
    Top = 48
    Width = 145
    Height = 23
    ItemIndex = 0
    TabOrder = 0
    Text = 'Bills'
    OnChange = TableStatementChange
    Items.Strings = (
      'Bills'
      'Stores')
  end
  object OperationStatement: TComboBox
    Left = 8
    Top = 48
    Width = 145
    Height = 23
    ItemIndex = 0
    TabOrder = 1
    Text = 'UPDATE'
    OnChange = OperationStatementChange
    Items.Strings = (
      'UPDATE'
      'DELETE FROM')
  end
  object UpdateContents: TPanel
    Left = 0
    Top = 77
    Width = 304
    Height = 324
    Caption = 'UpdateContents'
    ShowCaption = False
    TabOrder = 2
    DesignSize = (
      304
      324)
    object UpdateLbl: TLabel
      Left = 8
      Top = 8
      Width = 18
      Height = 15
      Caption = 'SET'
    end
    object UpdateWhereLbl: TLabel
      Left = 7
      Top = 295
      Width = 133
      Height = 15
      Hint = 'WHERE <table_id_key>= '
      Anchors = [akLeft, akBottom]
      Caption = 'WHERE <table_id_key>= '
    end
    object UpdateNB: TNumberBox
      Left = 146
      Top = 292
      Width = 121
      Height = 23
      TabOrder = 0
      OnChangeValue = UpdateNBChangeValue
    end
    object ScrollBox1: TScrollBox
      Left = 32
      Top = 0
      Width = 272
      Height = 273
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      object FieldStacker: TPanel
        Left = 0
        Top = 0
        Width = 251
        Height = 273
        Align = alTop
        AutoSize = True
        BevelOuter = bvNone
        Caption = 'FieldStacker'
        ShowCaption = False
        TabOrder = 0
      end
    end
  end
  object DeleteContents: TPanel
    Left = 310
    Top = 77
    Width = 318
    Height = 324
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 3
    object DelLabel: TLabel
      Left = 16
      Top = 8
      Width = 133
      Height = 15
      Hint = 'WHERE <table_id_key>= '
      Caption = 'WHERE <table_id_key>= '
    end
    object DelNB: TNumberBox
      Left = 158
      Top = 5
      Width = 121
      Height = 23
      TabOrder = 0
    end
  end
  object pnlBot: TPanel
    Left = 0
    Top = 401
    Width = 628
    Height = 41
    Align = alBottom
    Caption = 'pnlBot'
    ShowCaption = False
    TabOrder = 4
    ExplicitTop = 400
    ExplicitWidth = 624
    DesignSize = (
      628
      41)
    object BtnOk: TButton
      Left = 537
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Confirm'
      TabOrder = 0
      OnClick = btnClick
      ExplicitLeft = 533
    end
    object btnCancel: TButton
      Left = 442
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnClick
      ExplicitLeft = 438
    end
  end
  object MySQLConnector: TSQLConnection
    ConnectionName = 'MySQLConnection'
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver280.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver280.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=24.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMYSQL'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'HostName=localhost'
      'User_Name=delphAcc'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'Database=bills'
      'Password=2004')
    Connected = True
    Left = 568
    Top = 32
  end
end
