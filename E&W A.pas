var
  tb_c: integer;
  left_to_close: integer;
  ST: System.DateTime;

procedure MessageBox(hWnd: System.IntPtr; lpText, lpCaption: string; uType: cardinal);
external 'User32.dll' name 'MessageBox';

function Rand<T>(params v: array of T) := v[Random(v.Length)];

function GetRandomTitle := 
Rand(
  'A critical error occurred',
  'DO NOT CLOSE THIS! READ CAREFULLY!!!!!!!!!!!', 
  'just another warning... nobody cares about me(((',
  'You can close me, but others will come!',
  ''
);

function GetRandomMassage := 
Rand(
   'trololo',
  $'There is bomb under your bed!{#10}Better find it and threw it out of the window...{#10}You have no time to close me!',
   'no please, i don''t want to die((((((',
   'Is there a heaven for Message Box''s?',
   ''
);

procedure ShowResults := 
while left_to_close <> 0 do
begin
  Sleep(50);
  System.Console.Clear;
  writeln($'There is only {left_to_close} MessageBox''s left.');
  writeln($'You have allready spend {System.DateTime.Now - ST} on this.');
end;

procedure CreateMessageBox := 
MessageBox(System.IntPtr.Zero, GetRandomMassage, GetRandomTitle, 
  Rand($2, $6, $0, $1, $5, $4, $3, $4000) or
  Rand($30, $40, $20, $10) or
  Rand($000, $100, $200, $300) or
  Rand($0000, $1000, $2000) or
  Rand($020000, $080000, $100000, $010000, $040000, $200000)
);

begin
  
  var DT := new System.Threading.Thread(ShowResults);
  
  while true do
  begin
    var s := ReadlnString('Enter difficulty: ');
    if TryStrToInt(s, tb_c) then break;
    System.Console.Clear;
  end;
  
  left_to_close := tb_c;
  
  DT.Start;
  
  ST := System.DateTime.Now;
  
  loop tb_c do
  begin
    CreateMessageBox;
    left_to_close -= 1;
  end;
  
  var t := System.DateTime.Now - ST;
  Sleep(100);
  System.Console.Clear;
  writeln($'Congratulations, you have closed {tb_c} Message Box''s in {t}!');
  writeln('Now close this piece of art and go rethink your life....');
  readln;
  
end.