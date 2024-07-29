uses    crt,sysutils;
const	nmax = 50;
	mmax = 10000;
var     k,N,i,j:longint;
        id:integer;
        ok : boolean;
        a:array[1..nmax,1..mmax] of longint;
        s:array[1..nmax] of longint;
BEGIN
        randomize;
        assign(output,'SUBARR.INP'); rewrite(output);

        //id := StrToInt(ParamStr(1));
        n:=500000;
	for i:=1 to nmax do
        for j:=1 to mmax - 1 do
        begin
        	a[i,j] := random(10000000) - random(10000000);
                s[i] := s[i] + a[i,j];
        end;
        for i:=1 to nmax do
        a[i,mmax] := 0 - s[i];
        writeln(n);
        for i:=1 to nmax do
        for j:=1 to mmax do write(a[i,j],' ');
        close(output);
END.
