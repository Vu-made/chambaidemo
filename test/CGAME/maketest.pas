uses    crt,sysutils;
var     k,N,i,l,r,tg:longint;
	a:array[1..100000] of longint;
        id:integer;
        ok : boolean;
BEGIN
        randomize;
        assign(output,'CGAME.INP'); rewrite(output);

        id := StrToInt(ParamStr(1));
        n := 100000;
	if (id <= 3) then n := random(15) + 2
        else 	if (id <= 6) then n := random(100) + 2
        	else if (id <= 8) then n := random(10000) + 40000;
        for i:=1 to n do a[i] := i;
        k := random(n*10) + 1;
        for i:=1 to k do
        begin
        	r := random(n) + 1;
                l := random(r) + 1;
                tg := a[l]; a[l] := a[r]; a[r] := tg;
        end;
        writeln(n);
        for i:=1 to n do write(a[i],' ');
        close(output);
END.
