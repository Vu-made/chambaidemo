uses    crt,sysutils;
var     k,n,m,w,h,i:longint;
        id:integer;
        ok : boolean;

BEGIN
        randomize;
        assign(output,'bonus.inp'); rewrite(output);
        id := StrToInt(ParamStr(1));
        m := 100000; n := 100000;
        w := random(m) + 1; h := random(n) + 1;
        k := 1000000;
        if (id <= 4) then
        begin
        	n := random(10) + 1;
                m := random(10) + 1;
                w := 1; h := 1;
                k := 10;
        end
        else 	if (id <= 10) then
        	begin
                	n := random(10) + 1;
                	m := random(10) + 1;
                	w := random(m)+1;
                        h := random(n)+1;
                        k := 20;	
                end
                else	if (id <= 14) then
                	Begin
                        	n := random(1000) + 1;
                                m := random(1000) + 1;
                                w := random(m)+1;
                        	h := random(n)+1;
                                k := 10000;
                        end
                        else	if (id <= 18) then
                        	begin
                                	n := random(100000) + 1;
                                	m := random(100000) + 1;
                                	w := random(m)+1;
                        		h := random(n)+1;
                                        k := 100000;	
                                end;
        writeln(m,' ',n,' ',w,' ',h);
        for i:=1 to m do write(random(k) - random(k),' ');
        writeln;
        for i:=1 to n do write(random(k) - random(k),' ');
        close(output);
END.
