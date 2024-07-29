Program test;
uses    crt;
const   fi='SUB.IN';
        N:array[0..9] of longint = (10,50,500,1000,1000,10000,70000,50000,100000,100000);
var     i:integer;
        S:string;
        T,j:longint;
        F:Text;
BEGIN
        randomize;
        for i:=0 to 9 do
        Begin
                T:=1000000000;
                if (i < 3) then T := 50
                else  if (i < 6) then T := 500
                      else if (i < 8) then T := 100000;
                S := fi + chr(i+48);
                assign(F,S);
                rewrite(F);
                writeln(F,N[i],' ',random(T) + 1);
                for j := 1 to N[i] do
                write(F,Random(T)+1,' ');
                close(F);
        end;
END.
