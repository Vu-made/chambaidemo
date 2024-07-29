uses    crt,sysutils;
var     k,N:longint;
        id:integer;
        ok : boolean;
BEGIN
        randomize;
        assign(output,'RGAME.INP'); rewrite(output);

        id := StrToInt(ParamStr(1));
        N := 100000;
	if (id <= 15) then N := random(10000) + 1
        else if (id <= 17) then N := random(50000) + 1;
        writeln(N,' ',random(N) + 1);
        write(random(N)+1);
        close(output);
END.
