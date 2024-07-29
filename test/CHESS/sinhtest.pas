uses    crt;
var     test,N,i:longint;
        s:string;
        f:text;
begin
        for test :=10 to 19 do
        begin
                str(test,s);
                s := s + '.inp';
                assign(f,s); rewrite(f);
                N := random(20)+1;
                writeln(f,N);
                for i:=1 to N do writeln(f,random(20)+1,' ', random(20)+1);
                close(f);
        end;
end.