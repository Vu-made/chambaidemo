var     a:array[1..100] of longint;
        i,n:longint;
begin
        readln(n);
        for i:=1 to n do
                read(a[i]);
        for i:=1 to n do write(a[i],' ');
end.