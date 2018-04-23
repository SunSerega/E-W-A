
procedure MessageBox(hWnd: System.IntPtr; lpText, lpCaption: string; uType: cardinal);
external 'User32.dll' name 'MessageBox';

function Rand(params v:array of integer):=v[Random(v.Length)];

begin
  
  var ST: System.DateTime;
  var nn:integer;
  
  var DT := new System.Threading.Thread(()->begin
  
    try
      while true do
      begin
        Sleep(50);
        System.Console.Clear;
        writeln('осталось ',nn,' окон, времени прошло:',System.DateTime.Now - ST);
      end;
    except
    end;
    
  end);
  
  var n := ReadlnInteger('¬ведите сложность');
  nn := n;
  
  ST := System.DateTime.Now;
  DT.Start;
  
  loop n do
  begin
    MessageBox(System.IntPtr.Zero, '', '', 
    Rand($2,$6,$0,$1,$5,$4,$3,$4000)+
    Rand($30,$40,$20,$10)+
    Rand($000,$100,$200,$300)+
    Rand($0000,$1000,$2000)+
    Rand($020000,$080000,$100000,$010000,$040000,$200000));
    
    nn-=1;
  end;
  
  var t := System.DateTime.Now - ST;
  DT.Abort;
  Sleep(100);
  System.Console.Clear;
  writeln('ѕоздравл€ю, вы закрыли ', n, ' сообщений винды за ', t, '!');
  writeln('“еперь закрывайте эту недоигру и идите думайте нафига вы это скачали.');
  readln;
  
end.