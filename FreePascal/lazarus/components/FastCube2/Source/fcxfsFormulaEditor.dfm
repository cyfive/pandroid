object fcxfsFormulaEditor: TfcxfsFormulaEditor
  Left = 500
  Top = 140
  Width = 600
  Height = 441
  Caption = 'frofsFormulaEditor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 26
    Width = 592
    Height = 388
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 1
    object Splitter: TSplitter
      Left = 403
      Top = 1
      Height = 386
      Align = alRight
    end
    object Panel2: TPanel
      Left = 406
      Top = 1
      Width = 185
      Height = 386
      Align = alRight
      BevelOuter = bvNone
      Caption = 'Panel2'
      TabOrder = 0
    end
    object ScriptPages: TPageControl
      Left = 1
      Top = 1
      Width = 402
      Height = 386
      Align = alClient
      TabOrder = 1
      OnChange = ScriptPagesChange
    end
  end
  object MainToolbar: TToolBar
    Left = 0
    Top = 0
    Width = 592
    Height = 26
    AutoSize = True
    Caption = 'MainToolbar'
    TabOrder = 0
    object btnCheckScript: TToolButton
      Left = 0
      Top = 2
      Caption = 'btnCheckScript'
      ImageIndex = 23
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCheckScriptSlick
    end
    object btnOk: TToolButton
      Left = 23
      Top = 2
      Caption = 'btnOk'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = btnOkClick
    end
    object btnCancel: TToolButton
      Left = 46
      Top = 2
      Caption = 'btnCancel'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCancelClick
    end
    object LangCB: TComboBox
      Left = 69
      Top = 2
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnClick = LangCBClick
    end
  end
end