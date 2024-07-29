uses    crt,sysutils;
var     k,N:longint;
        id:integer;
        ok : boolean;
BEGIN
        randomize;
        assign(output,'BAI2.INP'); rewrite(output);

        id := StrToInt(ParamStr(1));

        k := random(2);
        if k = 0 then write(output,random(1000)+1)
        else    Begin
                repeat
                        N := random(1000) + 1;
                        ok := N = sqr(trunc(sqrt(N)));
                until ok;
                write(output,N);
                end;
        close(output);
END.