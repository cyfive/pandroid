object fcxStylesEditorDialog: TfcxStylesEditorDialog
  Left = 594
  Top = 294
  BorderStyle = bsDialog
  Caption = 'fcxStylesEditorDialog'
  ClientHeight = 304
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lbStyles: TListBox
    Left = 8
    Top = 8
    Width = 369
    Height = 97
    ItemHeight = 13
    TabOrder = 0
    OnClick = lbStylesClick
  end
  inline StyleFrame: TfcxStyleEditorFrame
    Left = 8
    Top = 112
    Width = 370
    Height = 154
    AutoSize = True
    TabOrder = 1
  end
  object OkBtn: TButton
    Left = 224
    Top = 272
    Width = 75
    Height = 25
    Caption = 'OkBtn'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object CancelBtn: TButton
    Left = 304
    Top = 272
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'CancelBtn'
    ModalResult = 2
    TabOrder = 3
  end
end
