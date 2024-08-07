unit uniSettingsMgr;

interface

uses
  System.Classes, System.Generics.Collections, Vcl.ExtCtrls, Vcl.StdCtrls;

type

  TOptionBase = class(TPanel)
  const
    C_LABEL_NAME = 'optionNameLabel';
    C_DESC_NAME = 'optionDescLabel';
  protected
    fValue: Variant;
    fMinValue: Variant;
    fMaxValue: Variant;
    fDefaultValue: Variant;

    fName: string;
    fSection: string;
    fDebug: Boolean;

    fOnUserChange: TNotifyEvent;
    fOnChange: TNotifyEvent;
    fBeforeSave: TNotifyEvent;
    fAfterSave: TNotifyEvent;
    fBeforeLoad: TNotifyEvent;
    fAfterLoad: TNotifyEvent;

  public
    constructor Create(aOwner: TComponent; const aName, aSection: string; const aDefaultValue, aMinValue, aMaxValue: Variant; const aDebug: Boolean = False); reintroduce;

  end;


  TOptionInt = class(TOptionBase)

  end;


  TOptionBool = class(TOptionBase)

  end;


  TOptionFloat = class(TOptionBase)

  end;


  TOptionString = class(TOptionBase)

  end;


  TOptionEnum = class(TOptionBase)

  end;


  TSettings = class(TComponent)
  protected
    fOptList: TList<TOptionBase>;

  public
    constructor Create(aOwner: TComponent); reintroduce;
    destructor Destroy; override;
  end;


implementation

{ TSettings }

constructor TSettings.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  fOptList := TList<TOptionBase>.Create;
end;

destructor TSettings.Destroy;
begin
  fOptList.Clear;
  fOptList.Free;

  inherited;
end;

{ TOptionBase }

constructor TOptionBase.Create(aOwner: TComponent; const aName,
  aSection: string; const aDefaultValue, aMinValue, aMaxValue: Variant;
  const aDebug: Boolean);
begin
  inherited Create(aOwner);

  fName := aName;
  fSection := aSection;
  fDefaultValue := aDefaultValue;
  fMinValue := aMinValue;
  fMaxValue := aMaxValue;
  fDebug := aDebug;

  // Base components such as labels

end;

end.
