object BillEditor: TBillEditor
  Left = 0
  Top = 0
  Caption = 'Rechnungseditor'
  ClientHeight = 611
  ClientWidth = 962
  Color = clBtnFace
  Constraints.MinWidth = 897
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object MultiPage: TPageControl
    Left = 0
    Top = 0
    Width = 962
    Height = 611
    ActivePage = BillsOverview
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 958
    ExplicitHeight = 610
    object BillsOverview: TTabSheet
      Caption = 'Bills Over&view'
      object ViewDBGrid: TDBGrid
        Left = 0
        Top = 257
        Width = 954
        Height = 324
        Align = alClient
        Constraints.MinHeight = 200
        DataSource = ViewQueryDataSource
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnTitleClick = ViewDBGridTitleClick
      end
      object EViewTopP: TPanel
        Left = 0
        Top = 0
        Width = 954
        Height = 257
        Align = alTop
        Caption = 'EViewTopP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ShowCaption = False
        TabOrder = 1
        DesignSize = (
          954
          257)
        object SumLabel: TLabel
          Left = 16
          Top = 88
          Width = 91
          Height = 15
          Alignment = taRightJustify
          Caption = 'Sum in Selection:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object SumValue1: TLabel
          Left = 113
          Top = 76
          Width = 27
          Height = 28
          Caption = '0 '#8364
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object SumValue2: TLabel
          Left = 113
          Top = 121
          Width = 27
          Height = 28
          Caption = '0 '#8364
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object SumLabelDiff: TLabel
          Left = 15
          Top = 169
          Width = 92
          Height = 15
          Alignment = taRightJustify
          Caption = 'Difference above:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object SumValueDiff: TLabel
          Left = 113
          Top = 158
          Width = 27
          Height = 28
          Caption = '0 '#8364
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object MonthCalendar1: TMonthCalendar
          Left = 722
          Top = 3
          Width = 225
          Height = 160
          Anchors = [akTop, akRight]
          Date = 45432.000000000000000000
          TabOrder = 0
          OnClick = OverviewDateClick
        end
        object OverviewClearDate: TButton
          Left = 722
          Top = 169
          Width = 225
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Clear Date Selection'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = OverviewDateClick
        end
        object QueryFilterEdit: TEdit
          Left = 16
          Top = 16
          Width = 682
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          TextHint = 'Price > 10 AND Name = "Spar"'
          OnKeyPress = QueryFilterEditKeyPress
        end
        object QFilterApply: TButton
          Left = 16
          Top = 45
          Width = 75
          Height = 25
          Caption = 'Apply Filter'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = QFilterCtrlClick
        end
        object QFilterClear: TButton
          Left = 113
          Top = 45
          Width = 75
          Height = 25
          Caption = 'Clear Filter'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = QFilterCtrlClick
        end
        object SumCopyDown: TButton
          Left = 16
          Top = 121
          Width = 75
          Height = 25
          Caption = 'Copy Down'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = SumCopyDownClick
        end
      end
    end
    object BillsEditor: TTabSheet
      Caption = '&Bills Editor'
      ImageIndex = 1
      object EBETopP: TPanel
        Left = 0
        Top = 0
        Width = 954
        Height = 193
        Align = alTop
        BevelOuter = bvNone
        Caption = 'EBETopP'
        ShowCaption = False
        TabOrder = 0
        DesignSize = (
          954
          193)
        object BEBillIDLabel: TLabel
          Left = 16
          Top = 61
          Width = 316
          Height = 15
          AutoSize = False
          Caption = 'BillID'
          FocusControl = BEBillIDEdit
        end
        object BEDateLabel: TLabel
          Left = 338
          Top = 61
          Width = 153
          Height = 15
          AutoSize = False
          Caption = 'Date'
        end
        object BEPriceLabel: TLabel
          Left = 728
          Top = 61
          Width = 210
          Height = 15
          Anchors = [akTop, akRight]
          AutoSize = False
          Caption = 'Price'
          FocusControl = BEPriceEdit
        end
        object BEStoreIDRefLabel: TLabel
          Left = 16
          Top = 123
          Width = 154
          Height = 15
          AutoSize = False
          Caption = 'StoreID'
          FocusControl = BEStoreIDRefEdit
        end
        object BENameLabel: TLabel
          Left = 176
          Top = 123
          Width = 137
          Height = 15
          AutoSize = False
          Caption = 'Name'
        end
        object BELocationLabel: TLabel
          Left = 319
          Top = 123
          Width = 172
          Height = 15
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Location'
          ExplicitWidth = 222
        end
        object BEAddressLabel: TLabel
          Left = 497
          Top = 123
          Width = 437
          Height = 15
          Anchors = [akTop, akRight]
          AutoSize = False
          Caption = 'Address'
          ExplicitLeft = 547
        end
        object BEGroupLabel: TLabel
          Left = 497
          Top = 61
          Width = 225
          Height = 15
          AutoSize = False
          Caption = 'Group'
        end
        object DebugVisiToggler: TPanel
          Left = -4
          Top = 82
          Width = 25
          Height = 15
          BevelOuter = bvNone
          Caption = 'DebugVisiToggler'
          ParentColor = True
          ShowCaption = False
          TabOrder = 10
          OnDblClick = DebugVisiTogglerDblClick
        end
        object EBETopButtonsP: TPanel
          Left = 0
          Top = 0
          Width = 954
          Height = 41
          Align = alTop
          Caption = 'ESETopButtonsP'
          ShowCaption = False
          TabOrder = 1
          object EBETopStackP: TStackPanel
            AlignWithMargins = True
            Left = 694
            Top = 4
            Width = 256
            Height = 33
            Align = alRight
            AutoSize = True
            BevelOuter = bvNone
            BiDiMode = bdLeftToRight
            Constraints.MinWidth = 256
            ControlCollection = <
              item
                Control = BEBillsSaveButton
                HorizontalPositioning = sphpRight
              end
              item
                Control = BEBillsCancelButton
                HorizontalPositioning = sphpRight
              end>
            HorizontalPositioning = sphpRight
            Orientation = spoHorizontal
            Padding.Left = 15
            Padding.Right = 15
            ParentBiDiMode = False
            Spacing = 30
            TabOrder = 0
            VerticalPositioning = spvpTop
            object BEBillsSaveButton: TButton
              Left = 15
              Top = 0
              Width = 90
              Height = 33
              Caption = '&Save'
              TabOrder = 0
              OnClick = BEBillsSaveButtonClick
            end
            object BEBillsCancelButton: TButton
              Left = 135
              Top = 0
              Width = 106
              Height = 33
              Caption = '&Cancel'
              TabOrder = 1
              OnClick = BEBillsCancelButtonClick
            end
          end
          object EBETopNavigatorP: TPanel
            Left = 1
            Top = 1
            Width = 690
            Height = 39
            Align = alClient
            AutoSize = True
            BevelOuter = bvNone
            Caption = 'ESETopNavigatorP'
            Constraints.MinWidth = 200
            ShowCaption = False
            TabOrder = 1
            object DBNavigator1: TDBNavigator
              Left = 205
              Top = 2
              Width = 280
              Height = 35
              DataSource = BillsDataSource
              Align = alCustom
              Anchors = []
              TabOrder = 0
            end
          end
        end
        object BEBillIDEdit: TDBEdit
          Left = 16
          Top = 82
          Width = 316
          Height = 23
          DataField = 'BillID'
          DataSource = BillsDataSource
          TabOrder = 2
        end
        object BEPriceEdit: TDBEdit
          Left = 728
          Top = 82
          Width = 206
          Height = 23
          Anchors = [akTop, akRight]
          Constraints.MinWidth = 60
          DataField = 'Price'
          DataSource = BillsDataSource
          TabOrder = 5
        end
        object BEStoreIDRefEdit: TDBEdit
          Left = 16
          Top = 144
          Width = 154
          Height = 23
          DataField = 'StoreID'
          DataSource = BillsDataSource
          TabOrder = 6
          OnChange = BEStoreIDRefEditChange
        end
        object BENameDisplay: TEdit
          Left = 175
          Top = 144
          Width = 136
          Height = 23
          Enabled = False
          TabOrder = 7
          Text = 'BENameDisplay'
        end
        object BELocationDisplay: TEdit
          Left = 317
          Top = 144
          Width = 174
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          Constraints.MinWidth = 100
          Enabled = False
          TabOrder = 8
          Text = 'BELocationDisplay'
        end
        object BEAddressDisplay: TEdit
          Left = 494
          Top = 144
          Width = 440
          Height = 23
          Anchors = [akTop, akRight]
          Enabled = False
          TabOrder = 9
          Text = 'BEAddressDisplay'
        end
        object BEDateTimePicker: TDateTimePicker
          Left = 338
          Top = 82
          Width = 153
          Height = 23
          Date = 45370.000000000000000000
          Time = 45370.000000000000000000
          TabOrder = 3
        end
        object btnDebugFallback: TButton
          Left = 817
          Top = 47
          Width = 133
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'DEBUG FallbackWND'
          TabOrder = 0
          TabStop = False
          Visible = False
          OnClick = btnDebugFallbackClick
        end
        object BEGroupEdit: TDBEdit
          Left = 497
          Top = 82
          Width = 225
          Height = 23
          DataField = 'Group'
          DataSource = BillsDataSource
          TabOrder = 4
        end
      end
      object BEDBGrid: TDBGrid
        Left = 0
        Top = 193
        Width = 954
        Height = 388
        Align = alClient
        Constraints.MinHeight = 100
        DataSource = BillsDataSource
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object StoreEditor: TTabSheet
      Caption = 'S&tore Editor'
      ImageIndex = 2
      object SEDBGrid: TDBGrid
        Left = 0
        Top = 185
        Width = 954
        Height = 396
        Align = alClient
        Constraints.MinHeight = 100
        DataSource = StoresDataSource
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object ESETopP: TPanel
        Left = 0
        Top = 0
        Width = 954
        Height = 185
        Align = alTop
        BevelOuter = bvNone
        Caption = 'ESETopP'
        Constraints.MinWidth = 200
        ShowCaption = False
        TabOrder = 1
        object ESETopButtonsP: TPanel
          Left = 0
          Top = 0
          Width = 954
          Height = 41
          Align = alTop
          Caption = 'ESETopButtonsP'
          ShowCaption = False
          TabOrder = 0
          object ESETopStackP: TStackPanel
            AlignWithMargins = True
            Left = 694
            Top = 4
            Width = 256
            Height = 33
            Align = alRight
            AutoSize = True
            BevelOuter = bvNone
            BiDiMode = bdLeftToRight
            Constraints.MinWidth = 256
            ControlCollection = <
              item
                Control = SEStoreSaveButton
                HorizontalPositioning = sphpRight
              end
              item
                Control = SEStoreCancelButton
                HorizontalPositioning = sphpRight
              end>
            HorizontalPositioning = sphpRight
            Orientation = spoHorizontal
            Padding.Left = 15
            Padding.Right = 15
            ParentBiDiMode = False
            Spacing = 30
            TabOrder = 0
            VerticalPositioning = spvpTop
            object SEStoreSaveButton: TButton
              Left = 15
              Top = 0
              Width = 90
              Height = 33
              Caption = '&Save'
              TabOrder = 0
              OnClick = SEStoreSaveButtonClick
            end
            object SEStoreCancelButton: TButton
              Left = 135
              Top = 0
              Width = 106
              Height = 33
              Caption = '&Cancel'
              TabOrder = 1
              OnClick = SEStoreCancelButtonClick
            end
          end
          object ESETopNavigatorP: TPanel
            Left = 1
            Top = 1
            Width = 690
            Height = 39
            Align = alClient
            AutoSize = True
            BevelOuter = bvNone
            Caption = 'ESETopNavigatorP'
            Constraints.MinWidth = 200
            ShowCaption = False
            TabOrder = 1
            object SEStoreNavigator: TDBNavigator
              Left = 205
              Top = 2
              Width = 280
              Height = 35
              DataSource = StoresDataSource
              Align = alCustom
              Anchors = []
              TabOrder = 0
            end
          end
        end
        object ESETopLeftP: TPanel
          AlignWithMargins = True
          Left = 14
          Top = 41
          Width = 200
          Height = 144
          Margins.Left = 14
          Margins.Top = 0
          Margins.Right = 14
          Margins.Bottom = 0
          Align = alLeft
          AutoSize = True
          BevelOuter = bvNone
          Caption = 'ESETopLeftP'
          ShowCaption = False
          TabOrder = 1
          DesignSize = (
            200
            144)
          object SEStoreIDLabel: TLabel
            Left = 0
            Top = 20
            Width = 145
            Height = 15
            Anchors = [akLeft]
            AutoSize = False
            Caption = 'StoreID'
          end
          object SENameLabel: TLabel
            Left = 0
            Top = 70
            Width = 200
            Height = 15
            Anchors = [akLeft]
            AutoSize = False
            Caption = 'Name'
          end
          object SEStoreIDEdit: TDBEdit
            Left = 0
            Top = 41
            Width = 100
            Height = 23
            Anchors = [akLeft]
            DataField = 'StoreID'
            DataSource = StoresDataSource
            TabOrder = 0
          end
          object SENameEdit: TDBEdit
            Left = 0
            Top = 91
            Width = 200
            Height = 23
            Anchors = [akLeft]
            DataField = 'Name'
            DataSource = StoresDataSource
            TabOrder = 1
          end
        end
        object ESETopRightP: TPanel
          Left = 228
          Top = 41
          Width = 726
          Height = 144
          Align = alClient
          BevelOuter = bvNone
          Caption = 'ESETopRightP'
          Constraints.MinWidth = 350
          ShowCaption = False
          TabOrder = 2
          DesignSize = (
            726
            144)
          object SELocationLabel: TLabel
            Left = 3
            Top = 20
            Width = 708
            Height = 15
            Anchors = [akLeft, akRight]
            AutoSize = False
            Caption = 'Location'
            Constraints.MinWidth = 350
            ExplicitWidth = 446
          end
          object SEAddressLabel: TLabel
            Left = 3
            Top = 70
            Width = 708
            Height = 15
            Anchors = [akLeft, akRight]
            AutoSize = False
            Caption = 'Address'
            ExplicitWidth = 446
          end
          object SELocationEdit: TDBEdit
            Left = 3
            Top = 41
            Width = 708
            Height = 23
            Anchors = [akLeft, akRight]
            DataField = 'Location'
            DataSource = StoresDataSource
            TabOrder = 0
          end
          object SEAddressEdit: TDBEdit
            Left = 3
            Top = 91
            Width = 708
            Height = 23
            Anchors = [akLeft, akRight]
            DataField = 'Address'
            DataSource = StoresDataSource
            TabOrder = 1
          end
        end
      end
    end
    object SettingsPage: TTabSheet
      Caption = '&Settings'
      ImageIndex = 3
      object BSTIPLabel: TLabel
        Left = 43
        Top = 19
        Width = 55
        Height = 15
        Alignment = taRightJustify
        Caption = 'IP Address'
      end
      object BSTUserLabel: TLabel
        Left = 45
        Top = 49
        Width = 53
        Height = 15
        Alignment = taRightJustify
        Caption = 'Username'
      end
      object BSTPassword: TLabel
        Left = 48
        Top = 77
        Width = 50
        Height = 15
        Alignment = taRightJustify
        Caption = 'Password'
      end
      object BSTLanguageLabel: TLabel
        Left = 384
        Top = 19
        Width = 55
        Height = 15
        Caption = 'IP Address'
      end
      object BSTIPEdit: TEdit
        Left = 104
        Top = 16
        Width = 193
        Height = 23
        Alignment = taRightJustify
        TabOrder = 0
        Text = 'localhost'
      end
      object BSTConnect: TButton
        Left = 216
        Top = 45
        Width = 81
        Height = 52
        Caption = 'BSTConnect'
        TabOrder = 1
        OnClick = BSTConnectClick
      end
      object BSTUserEdit: TEdit
        Left = 104
        Top = 45
        Width = 106
        Height = 23
        Alignment = taRightJustify
        TabOrder = 2
      end
      object BSTPasswordEdit: TEdit
        Left = 104
        Top = 74
        Width = 106
        Height = 23
        Alignment = taRightJustify
        PasswordChar = '*'
        TabOrder = 3
      end
      object BSTLanguageSelector: TComboBox
        Left = 384
        Top = 45
        Width = 145
        Height = 23
        ItemIndex = 0
        TabOrder = 4
        Text = 'English'
        OnChange = BSTLanguageSelectorChange
        Items.Strings = (
          'English'
          'German')
      end
    end
  end
  object Databind_MainformTitle: TEdit
    Left = 936
    Top = 596
    Width = 121
    Height = 23
    TabOrder = 1
    Text = 'Databind_MainformTitle'
    Visible = False
    OnChange = Databind_MainformTitleChange
  end
  object Databind_ConnectionError: TEdit
    Left = 936
    Top = 596
    Width = 121
    Height = 23
    TabOrder = 2
    Text = 'Databind_ConnectionError'
    Visible = False
  end
  object Databind_AutoTableGenPrompt: TEdit
    Left = 936
    Top = 596
    Width = 121
    Height = 23
    TabOrder = 3
    Text = 'Databind_AutoTableGenPrompt'
    Visible = False
  end
  object StoresDataSource: TDataSource
    DataSet = StoresTableClient
    Left = 56
    Top = 288
  end
  object MySQLConnector: TSQLConnection
    ConnectionName = 'MySQLConnection'
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'HostName=ServerName'
      'Database=DBNAME'
      'User_Name=user'
      'Password=password'
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
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile=')
    Left = 56
    Top = 64
  end
  object StoresTableSelector: TSQLDataSet
    CommandText = 'SELECT * FROM stores'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = MySQLConnector
    Left = 56
    Top = 120
  end
  object StoresTableProvider: TDataSetProvider
    DataSet = StoresTableSelector
    Left = 56
    Top = 176
  end
  object StoresTableClient: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'StoreID'
    Params = <>
    ProviderName = 'StoresTableProvider'
    Left = 56
    Top = 232
    object StoresTableClientStoreID: TAutoIncField
      AutoGenerateValue = arAutoInc
      DefaultExpression = '-1'
      FieldName = 'StoreID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StoresTableClientName: TStringField
      FieldName = 'Name'
      Required = True
      Size = 16
    end
    object StoresTableClientLocation: TStringField
      FieldName = 'Location'
      Required = True
      Size = 32
    end
    object StoresTableClientAddress: TStringField
      FieldName = 'Address'
      Required = True
      Size = 64
    end
  end
  object BillsTableSelector: TSQLDataSet
    CommandText = 'SELECT * FROM receipts'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = MySQLConnector
    Left = 176
    Top = 120
  end
  object BillsTableProvider: TDataSetProvider
    DataSet = BillsTableSelector
    Left = 176
    Top = 176
  end
  object BillsTableClient: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'BillID'
    Params = <>
    ProviderName = 'BillsTableProvider'
    OnNewRecord = BillsTableClientNewRecord
    Left = 176
    Top = 232
    object BillsTableClientBillID: TIntegerField
      DefaultExpression = '-1'
      FieldName = 'BillID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object BillsTableClientDate: TDateField
      FieldName = 'Date'
      Required = True
    end
    object BillsTableClientGroup: TStringField
      FieldName = 'Group'
      Size = 64
    end
    object BillsTableClientPrice: TSingleField
      FieldName = 'Price'
      Required = True
    end
    object BillsTableClientStoreID: TIntegerField
      FieldName = 'StoreID'
      Required = True
    end
  end
  object BillsDataSource: TDataSource
    DataSet = BillsTableClient
    Left = 176
    Top = 288
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 28
    Top = 541
    object LinkControlToFieldDate: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'Date'
      Control = BEDateTimePicker
      Track = True
    end
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = BillsTableClient
    ScopeMappings = <>
    Left = 304
    Top = 536
  end
  object ViewQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM receipts_view')
    SQLConnection = MySQLConnector
    Left = 272
    Top = 120
  end
  object ViewQueryDataSource: TDataSource
    DataSet = ViewQueryClient
    Left = 272
    Top = 288
  end
  object ViewQueryProvider: TDataSetProvider
    DataSet = ViewQuery
    Options = [poRetainServerOrder, poUseQuoteChar]
    Left = 272
    Top = 176
  end
  object ViewQueryClient: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'ViewQueryProvider'
    ReadOnly = True
    OnNewRecord = BillsTableClientNewRecord
    Left = 272
    Top = 232
    object IntegerField3: TIntegerField
      DefaultExpression = '-1'
      FieldName = 'BillID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object DateField2: TDateField
      FieldName = 'Date'
      Required = True
    end
    object ViewQueryClientGroup: TStringField
      FieldKind = fkCalculated
      FieldName = 'Group'
      Size = 32
      Calculated = True
    end
    object SingleField2: TSingleField
      FieldName = 'Price'
      Required = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'StoreID'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'Name'
      Required = True
      Size = 16
    end
    object StringField2: TStringField
      FieldName = 'Location'
      Required = True
      Size = 32
    end
    object StringField3: TStringField
      FieldName = 'Address'
      Required = True
      Size = 64
    end
  end
  object XMLLangDoc: TXMLDocument
    FileName = 'lang/lng.xml'
    Left = 472
    Top = 312
  end
end
