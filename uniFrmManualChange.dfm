object DialogChange: TDialogChange
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Manual SQL'
  ClientHeight = 441
  ClientWidth = 624
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
    Width = 624
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
    Top = 400
    Width = 624
    Height = 41
    Align = alBottom
    Caption = 'pnlBot'
    ShowCaption = False
    TabOrder = 4
    ExplicitTop = 399
    ExplicitWidth = 620
    DesignSize = (
      624
      41)
    object BtnOk: TButton
      Left = 525
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Confirm'
      TabOrder = 0
      OnClick = btnClick
      ExplicitLeft = 521
    end
    object btnCancel: TButton
      Left = 430
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnClick
      ExplicitLeft = 426
    end
  end
end
