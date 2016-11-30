{**********************************************************
Copyright (C) 2012-2016
Zeljko Cvijanovic www.zeljus.com (cvzeljko@gmail.com) &
Miran Horjak usbdoo@gmail.com
***********************************************************}
unit StdCtrls;

{$mode objfpc}{$H+}

interface

uses
  androidr15;

type
  { TOnclickNotifyEvent }
  TOnClickEvent             = procedure (Value: AVView) of object;
  TOnCreateContextMenuEvent = procedure(aContexMenu: AVContextMenu; aView: AVView; AInfo: AVContextMenu.InnerContextMenuInfo) of object;
  TOnDragEvent              = function (aView: AVView; aDragEvent: AVDragEvent): jboolean of object;
  TonFocusChangeEvent       = procedure (aView: AVView; aBoolean: jboolean) of object;
  TonGenericMotionEvent     = function (aView: AVView; aMotionEvent: AVMotionEvent): jboolean of object;
  TonHoverEvent             = function (para1: AVView; para2: AVMotionEvent): jboolean of object;
  TonKeyEvent               = function (para1: AVView; para2: jint; para3: AVKeyEvent): jboolean of object;
  TonLongClickEvent         = function (para1: AVView): jboolean of object;
  TonSystemUiVisibilityChangeEvent = procedure (para1: jint) of object;
  TonTouchEvent             = function (para1: AVView; para2: AVMotionEvent): jboolean of object;

  TOnChangeTextEvent        = procedure(para1: JLObject) of object;
  TonCheckedChangedEvent    = procedure (para1: AWCompoundButton; para2: jboolean) of object;

  TTextView = class(AWTextView)
  public

  end;

  { TEditText }

  TEditText = class(AWEditText, ATTextWatcher)
    FOnChangeText: TOnChangeTextEvent;
    procedure beforeTextChanged(charSequence: JLCharSequence; start: LongInt; lengthBefore: LongInt; lengthAfter: LongInt); overload;
    procedure onTextChanged(charSequence: JLCharSequence; start: LongInt; before: LongInt; count: LongInt); override;
    procedure afterTextChanged(editable: ATEditable); overload;
  public
    constructor create(para1: ACContext); overload;
    constructor create(para1: ACContext; para2: AUAttributeSet); overload;
    constructor create(para1: ACContext; para2: AUAttributeSet; para3: jint); overload;
  public
    property onChangeText: TOnChangeTextEvent read FOnChangeText write FOnChangeText;
    property Text;
  end;

  { TButton }

  TButton = class(AWButton,  AVView.InnerOnClickListener, AVView.InnerOnLongClickListener)
  private
    FOnclick            : TOnclickEvent;
    FonLongClick        : TonLongClickEvent;
  public
    procedure onClick(para1: AVView); overload;
    function onLongClick(para1: AVView): jboolean; overload;
  public
    constructor create(para1: ACContext); overload;
    constructor create(para1: ACContext; para2: AUAttributeSet); overload;
    constructor create(para1: ACContext; para2: AUAttributeSet; para3: jint); overload;
  public
    property onClickListener: TOnclickEvent read FOnClick write FOnClick;
    property OnLongClickListener: TonLongClickEvent read FonLongClick write FonLongClick;
  end;

  { TCheckBox }

  TCheckBox = class(AWCheckBox, AWCompoundButton.InnerOnCheckedChangeListener)
    FonCheckedChanged : TonCheckedChangedEvent;
  public
    procedure onCheckedChanged(para1: AWCompoundButton; para2: jboolean); overload;
  public
    constructor create(para1: ACContext); overload;
    constructor create(para1: ACContext; para2: AUAttributeSet); overload;
    constructor create(para1: ACContext; para2: AUAttributeSet; para3: jint); overload;
  public
    property onCheckedChangedListener: TonCheckedChangedEvent read FonCheckedChanged write FonCheckedChanged;
  end;

  { TRadioGroup }

  TRadioGroup = class(AWRadioGroup)
   property Orientation: jint read getOrientation write setOrientation; //0 horizontal;  1 vertical
   property ItemChecked: jint read getCheckedRadioButtonId;
  end;

  { TRadioButton }

  TRadioButton = class(AWRadioButton, AWCompoundButton.InnerOnCheckedChangeListener)
    FonCheckedChanged : TonCheckedChangedEvent;
  public
    procedure onCheckedChanged(para1: AWCompoundButton; para2: jboolean); overload;
  public
    constructor create(para1: ACContext); overload;
    constructor create(para1: ACContext; para2: AUAttributeSet); overload;
    constructor create(para1: ACContext; para2: AUAttributeSet; para3: jint); overload;
  public
    property onCheckedChangedListener: TonCheckedChangedEvent read FonCheckedChanged write FonCheckedChanged;
    property Checked: jboolean read isChecked write setChecked;
  end;

implementation


{ TRadioButton }

procedure TRadioButton.onCheckedChanged(para1: AWCompoundButton; para2: jboolean);
begin
    if Assigned(FonCheckedChanged) then FonCheckedChanged(para1, para2);
end;

constructor TRadioButton.create(para1: ACContext);
begin
  inherited Create(para1);
  self.setOnCheckedChangeListener(self);
end;

constructor TRadioButton.create(para1: ACContext; para2: AUAttributeSet);
begin
  inherited Create(para1, para2);
  self.setOnCheckedChangeListener(self);
end;

constructor TRadioButton.create(para1: ACContext; para2: AUAttributeSet; para3: jint);
begin
  inherited Create(para1, para2, para3);
  self.setOnCheckedChangeListener(self);
end;



{ TCheckBox }

procedure TCheckBox.onCheckedChanged(para1: AWCompoundButton; para2: jboolean);
begin
  if Assigned(FonCheckedChanged) then FonCheckedChanged(para1, para2);
end;

constructor TCheckBox.create(para1: ACContext);
begin
  inherited Create(para1);
  self.setOnCheckedChangeListener(self);
end;

constructor TCheckBox.create(para1: ACContext; para2: AUAttributeSet);
begin
  inherited Create(para1, para2);
  self.setOnCheckedChangeListener(self);
end;

constructor TCheckBox.create(para1: ACContext; para2: AUAttributeSet;
  para3: jint);
begin
  inherited Create(para1, para2, para3);
  self.setOnCheckedChangeListener(self);
end;

{ TEditText }

procedure TEditText.beforeTextChanged(charSequence: JLCharSequence;
  start: LongInt; lengthBefore: LongInt; lengthAfter: LongInt);
begin

end;

procedure TEditText.onTextChanged(charSequence: JLCharSequence; start: LongInt;
  before: LongInt; count: LongInt);
begin
  inherited onTextChanged(charSequence, start, before, count);
end;

procedure TEditText.afterTextChanged(editable: ATEditable);
begin
  if Assigned(FOnChangeText) then FOnChangeText(self);
end;


constructor TEditText.create(para1: ACContext);
begin
  inherited Create(para1);
  self.addTextChangedListener(Self);
end;

constructor TEditText.create(para1: ACContext; para2: AUAttributeSet);
begin
  inherited Create(para1, para2);
  self.addTextChangedListener(Self);
end;

constructor TEditText.create(para1: ACContext; para2: AUAttributeSet; para3: jint);
begin
    inherited Create(para1, para2, para3);
    self.addTextChangedListener(Self);
end;


{ TButton }

procedure TButton.onClick(para1: AVView);
begin
  if Assigned(FOnclick) then  FOnclick(para1);
end;

function TButton.onLongClick(para1: AVView): jboolean;
begin
  if Assigned(FonLongClick) then Result := FonLongClick(para1)
  else Result:= onLongClick(para1);
end;

constructor TButton.create(para1: ACContext);
begin
  inherited create(para1);
  self.setOnClickListener(Self);
  self.setOnLongClickListener(Self);
end;

constructor TButton.create(para1: ACContext; para2: AUAttributeSet);
begin
    inherited create(para1, para2);
    self.setOnClickListener(Self);
    self.setOnLongClickListener(Self);
end;

constructor TButton.create(para1: ACContext; para2: AUAttributeSet; para3: jint );
begin
    inherited create(para1, para2, para3);
    self.setOnClickListener(Self);
    self.setOnLongClickListener(Self);
end;

end.
