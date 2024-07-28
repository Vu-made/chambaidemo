uses    crt,sysutils;
var     dem,k,N,lim,i,vitridau,jump:longint;
	x,c:array[1..100005] of longint;
        id:integer;
        ok : boolean;
BEGIN
        randomize;
        assign(output,'PHOTO.INP'); rewrite(output);

        id := StrToInt(ParamStr(1));

        k := random(2);
        n := 100000;
        vitridau := random(10) + 1;
        jump := 5000;
        if id <= 5 then
        begin
        	n := random(20) + 5;
                vitridau := random(10)+1;
                jump := 10;
        end
        else 	if id <= 10 then
        	begin
                	n := random(30) + 70;
                        vitridau := random(50) + 1;
                        jump := 20;
                end
                else	if id <= 13 then
                	begin
                        	n := random(500) + 500;
                                vitridau := random(30) + 1;
                                jump := 100;
                        end
                        else	if id <= 16 then
                        	begin
                                	n := random(1000) + 4001;
                                        vitridau := random(50) + 1;
                                        jump := 100;
                                end
                                else	if id <= 18 then
                                	begin
                                        	n := random(30000) + 40001;
                                                vitridau := random(50) + 1;
                                                jump := 1000;
                                        end;
        writeln(n);
        x[1] := vitridau;
        c[1] := random(3) + 1;
        dem := 1;  i:=2;
        while (i <= n) do
        begin
                k := random(2);
                if k = 0 then
                begin
                	x[i] := x[i-1] + random(jump) + 1;
                	c[i] := c[i-1];
                        inc(dem);
                        inc(i);
                end
                else 	if dem > 7 then
                	begin
                		repeat
                			c[i] := random(3) + 1;
                		until c[i] <> c[i-1];
                                x[i] := x[i-1] + random(jump) + 1;
                                dem := 1;
                                inc(i);
                	end;
        end;
        for i:=1 to n do writeln(x[i],' ',c[i]);
        close(output);
END.
