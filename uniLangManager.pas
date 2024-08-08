{ @file
  NGC_LangManager contains utils for Language management for the NGC Client
}
unit uniLangManager;

interface

uses
  System.Generics.Collections, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, System.Classes,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Forms, System.SysUtils;

type
  TRPropSet = record
    FComp: TComponent;
    FProp: string;
    FPath: string;
  end;

  PXMLDocument = ^TXMLDocument;
  PForm = ^TForm;
  TFLangToString = reference to function(const ALangIndex: Integer): string;
  TFOnUpdate = reference to procedure(var AForm: TForm);

  TLangManager = class(TObject)
  const
    // Non-Enum Define of Fallback const
    Fallback = 0;

    { Child Node Names used in XML Lang Files }
    CNameList = 'list';         //< List node name string in Lang XML
    CNameIndex = 'index';       //< Index node name string in Lang XML
    CNameImports = 'imports';   //< Imports node name string in Lang XML

    { Pathing Delimiter used by GetTranslatedString }
    CDelimPathing = '.';
    
    { Delimiter of List String }
    CDelimListSeparator = ';';
    CDelimListProperty = ':';
    CDelimListPathing = CDelimPathing;

    { Halting codes of Fatal Errors }
    CHaltingCode_ListNotFound =    253; //< The List Node of langMain.xml may not be absent!
    CHaltingCode_IndexNotFound =   252; //< The Index Node of langMain.xml may not be absent!

  private
    FPropList: TList<TRPropSet>;
    FPXMLDoc: PXMLDocument;
    FPForm: PForm;
    FActiveLangIndex: Integer;

    FFLangToString: TFLangToString;
    FFOnUpdate: TFOnUpdate;

    procedure SetActiveLang(const ANew: Integer);
    procedure XMLGetLanguages;
    { @abstract A procedure that fetches component instances by parsing List Node

      The procedure XMLGetComponents parses the XML-Language-File's List node,
      which is an arbitrarily long string.
      By default, those strings may look as follows:
      <List>Test</List>
    }
    procedure XMLGetComponents;

  public
    constructor Create(APXML: PXMLDocument; AForm: PForm);
    destructor Destroy; override;

    procedure UpdateLanguage;
    function GetTranslatedString(const APath: string; AUseFallback: Boolean = False): string;

    property ActiveLang: Integer read FActiveLangIndex write SetActiveLang;
    property LangToString: TFLangToString read FFLangToString write FFLangToString;
    property OnUpdate: TFOnUpdate read FFOnUpdate write FFOnUpdate;
  end;

resourcestring
  RExcept_ListNodeNotFound =                        'Fatal Error: List node could not be found in langMain.xml!';
  RExcept_ImportsNodeNotFound =                     'Fatal Error: Imports node could not be found in langMain.xml!';
  RExcept_IndexNodeNotFound =                       'Fatal Error: Index node could not be found in langMain.xml!';
  RExcept_ObjOrPropertyNotFound =                   'Translation Component Setup: Could not find ''%s'' or component''s Property';

var
  gLangMgr: TLangManager;

implementation

uses
  System.TypInfo, System.Variants;

{ TLangManager }

constructor TLangManager.Create(APXML: PXMLDocument; AForm: PForm);
begin
  FPropList := TList<TRPropSet>.Create;
  FPXMLDoc := APXML;
  FPForm := AForm;

  XMLGetLanguages;
  XMLGetComponents;
end;

destructor TLangManager.Destroy;
begin
  FPropList.Free;
end;

function TLangManager.GetTranslatedString(const APath: string;
  AUseFallback: Boolean): string;
var
  { Child node iterators }
  LCNode: IXMLNode;
  LSPath: TArray<string>;

begin
  //! General Fallback checkup
  if AUseFallback then
    LCNode := FPXMLDoc^.DocumentElement.ChildNodes[CNameIndex].ChildNodes[LangToString(Fallback)]
  else
    try
      LCNode := FPXMLDoc^.DocumentElement.ChildNodes[CNameIndex].ChildNodes[LangToString(ActiveLang)];
    except begin
      LCNode := FPXMLDoc^.DocumentElement.ChildNodes[CNameIndex].ChildNodes[LangToString(Fallback)];
      AUseFallback := True;
    end; end;

  LSPath := APath.Split([CDelimPathing]);
  Result := 'An error has occured!'; //<! Default message for now.
  
  try
    //! Navigation through child nodes by iteration
    for var I := 0 to Length(LSPath) - 1 do
    begin
      LCNode := LCNode.ChildNodes[LSPath[I]];
    end;
    
    //! Checkup that, if null, triggers Fallback, if not already active
    if LCNode.NodeValue = null then
    begin
      if AUseFallback then
        raise Exception.Create('Language string output is nil')
      else
        Result := GetTranslatedString(APath, True).Replace('{AMPERSAND}', '&');
    end
    else
      Result := VarToStr(LCNode.NodeValue).Replace('{AMPERSAND}', '&');
      
  except begin
    //! Trigger Fallback, if not already active in except block
    //! Unlikely to get here, unless a path is incorrect or non-existent!
    if AUseFallback then
      raise
    else
      Result := GetTranslatedString(APath, True).Replace('{AMPERSAND}', '&');
  end; end;
end;

procedure TLangManager.SetActiveLang(const ANew: Integer);
begin
  FActiveLangIndex := ANew;
  UpdateLanguage;
end;

procedure TLangManager.UpdateLanguage;
begin
  //! Iterate through lang objects
  for var C: TRPropSet in FPropList do
  begin
    SetPropValue(C.FComp, C.FProp, GetTranslatedString(C.FPath));
  end;

  //! User Update
  if Assigned(OnUpdate) then
    OnUpdate(Self.FPForm^);
end;

procedure TLangManager.XMLGetComponents;
var
  { Pre-Parse }
  LSList: string;
  LSAList: TArray<string>;
  LCurStr: string;

  { Parsing Vars }
  LObjPath, LObjID, LObjProp: string;

begin
  //! Safe init of List Node, used to point to component names for registering
  try
    //! Empty list case -> No components
    if VarIsNull(FPXMLDoc^.DocumentElement.ChildValues[CNameList]) then
      Exit;

    LSList := FPXMLDoc^.DocumentElement.ChildValues[CNameList];
  except
    try
      raise Exception.Create(RExcept_ListNodeNotFound);
    finally
      Halt(CHaltingCode_ListNotFound);
    end;
  end;

  try
    LSAList := LSList.Split([CDelimListSeparator]);

    for var I: Integer := 0 to Length(LSAList) - 1 do
    begin
      LCurStr   := LSAList[I].Trim;                                                 //<! Removing all whitespace via Trim
      LObjPath  := LCurStr.Split([CDelimListProperty])[0];                          //<! Full path used by LangGetStr
      LObjID    := LObjPath.Substring(LCurStr.LastIndexOf(CDelimListPathing) + 1);  //<! Component Name to be used to fetch Component instance
      LObjProp  := LCurStr.Split([CDelimListProperty])[1];                          //<! Property of Component to be changed

      var LRObj: TRPropSet;
      LRObj.FComp := FPForm^.FindComponent(LObjID);
      LRObj.FProp := LObjProp;
      LRObj.FPath := LObjPath;

      if (LRObj.FComp <> nil) and (IsPublishedProp(LRObj.FComp, LRObj.FProp)) then
        FPropList.Add(LRObj)
      (*else
        raise Exception.Create(Format(RExcept_ObjOrPropertyNotFound, [LObjPath]))*);
    end;
  except
    raise;
  end;
end;

procedure TLangManager.XMLGetLanguages;
var
  { Nodes of Main File }
  LImports, LIndex: IXMLNode;

  { Importer Vars of Language Subfiles }
  LIXMLImporter: TXMLDocument;
  LImportIter: IXMLNode;

begin
  //!! Safe init of Import node, used to read file paths from.
  try
    LImports := FPXMLDoc^.DocumentElement.ChildNodes[CNameImports];
  except
    try
      raise Exception.Create(RExcept_ImportsNodeNotFound);
    finally
      //! While the missing imports node is not desireable,
      //! it will be treated as Fallback-Only-Mode
    end;     
    Exit;
  end;

  //! Safe init of Index node, used for displayed texts of each language.
  try
    LIndex := FPXMLDoc^.DocumentElement.ChildNodes[CNameIndex];
  except
    try
      raise Exception.Create(RExcept_IndexNodeNotFound);
    finally
      Halt(CHaltingCode_IndexNotFound);
    end;
  end;

  //! List all lang files stated by Import node.
  //! Import those nodes and put them into Index node.
  LIXMLImporter := TXMLDocument.Create(FPXMLDoc^);
  try
    try
      for var I: Integer := 0 to LImports.ChildNodes.Count - 1 do
      begin
        //! Open XMLs
        LImportIter := LImports.ChildNodes[I];
        LIXMLImporter.FileName := LImportIter.NodeValue;
        LIXMLImporter.LoadFromFile(LIXMLImporter.FileName);
        LIXMLImporter.Active := True;

        //! Deep-Copy doc nodes to main
        LIndex.ChildNodes.Add(LIXMLImporter.DocumentElement.CloneNode(True));

        //! Close old XML
        LIXMLImporter.Active := False;
      end;

    except
      raise;
    end;
  finally
    LIXMLImporter.Free;
  end;
end;

end.
