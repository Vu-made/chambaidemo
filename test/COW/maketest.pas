uses    crt,sysutils;
const	nmax = 50;
	mmax = 10000;
var     k,N,d,i,j:longint;
        id:integer;
        ok : boolean;
BEGIN
        randomize;
        assign(output,'COW.INP'); rewrite(output);

       	id := StrToInt(ParamStr(1));
        n:=100000;
        k:=1000000000;
        d:=1000000000;
        if id <= 3 then
        begin
        	n := random(15) + 1;
                k := 100;
        end
        else 	if (id <= 6) then
        	begin
                	n := random(100) + 50;
                        k := 500;
                end
                else 	if (id <= 10) then
                	begin
                        	n := random(1000) + 50;
                                k := 5000;
                	end
                        else 	if (id <= 15) then
                        	Begin
                                	n := random(10000) + 5000;
                                        k := 50000;
                                end
                                else 	if (id <= 17) then
                                	Begin
                                        	n := random(50000) + 50000;
                                                k := 10000000;
                                        end;
        d := random(k div 2) + 1;
        writeln(n,' ',d);
        for i:=1 to n do writeln(random(k) + 1,' ',random(k) + 1);
        close(output);
END.
