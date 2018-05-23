
procedure MessageBox(hWnd: System.IntPtr; lpText, lpCaption: string; uType: cardinal);
external 'User32.dll' name 'MessageBox';

function Rand<T>(params v: array of T) := v[Random(v.Length)];

var
  nn: integer;
  ST: System.DateTime;

procedure Timer :=
try
  while true do
  begin
    Sleep(50);
    System.Console.Clear;
    writeln($'There is only {nn} MessageBox''s left.');
    writeln($'You have allready spend {System.DateTime.Now - ST} on this.');
  end;
except
end;

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
  'There is bomb under your bed! Better find it and threw it out of the window... You have no time to close me!',
  'no please, is don''t want to die((((((',
  'Is there a heaven for Message Box''s?',
  ''
);

const
  max_mb = 10;

procedure CreateMessageBoxs;
begin
  while nn >= max_mb do
  begin
    MessageBox(System.IntPtr.Zero, GetRandomMassage, GetRandomTitle, 
      Rand($2, $6, $0, $1, $5, $4, $3, $4000) or
      Rand($30, $40, $20, $10) or
      Rand($000, $100, $200, $300) or
      Rand($0000, $1000, $2000) or
      Rand($020000, $080000, $100000, $010000, $040000, $200000)
    );
    
    nn -= 1;
  end;
end;

begin
  
  var DT := new System.Threading.Thread(Timer);
  
  var n: integer;
  begin
    var s := ReadlnString('Enter difficulty: ');
    if not TryStrToInt(s, n) then
    begin
      Exec(GetEXEFileName);
      exit;
    end;
  end;
  nn := n;
  
  DT.Start;
  
  ST := System.DateTime.Now;
  
  {
  var r: integer;
  var d := System.Math.DivRem(n, max_mb, r);
  loop r do (new System.Threading.Thread(procedure->CreateMessageBoxs(d + 1))).Start;
  loop max_mb - r do (new System.Threading.Thread(procedure->CreateMessageBoxs(d))).Start;
  }
  loop max_mb do (new System.Threading.Thread(CreateMessageBoxs)).Start;
  
  while nn > 0 do Sleep(10);
  
  var t := System.DateTime.Now - ST;
  DT.Abort;
  Sleep(100);
  System.Console.Clear;
  writeln('Congratulations, you have closed ', n, ' Messag Box''s in ', t, '!');
  writeln('Now close this piece of art and go rethink your life....');
  readln;
  
end.