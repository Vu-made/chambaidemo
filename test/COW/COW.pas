const   fi = 'COW.INP';
        fo = 'COW.OUT';
        nmax = 100001;
var     a,b:array[1..nmax] of longint;
        n,d,Smax:longint;
procedure nhap;
var     f:text;
        i:longint;
begin
        assign(f,fi); reset(f);
        read(f,n,d);
        for i:=1 to n do readln(f,a[i],b[i]);
        close(f);
end;

procedure hoandoi(var x,y:longint);
var     tg:longint;
begin
        tg := x; x := y; y:=tg;
end;

procedure QS(d,c:longint);
var     i,j,chot:longint;
begin
        i := d; j := c; chot := a[(i+j) div 2];
        repeat
                while (a[i] < chot) do inc(i);
                while (chot < a[j]) do dec(j);
                if (i <= j) then
                begin
                        hoandoi(a[i],a[j]);
                        hoandoi(b[i],b[j]);
                        inc(i); dec(j);
                end;
        until i > j;
        if (i < c) then QS(i,c);
        if (d < j) then QS(d,j);
end;


procedure xuly;
var     S,i,j:longint;
begin
        QS(1,n);
        i := 1; j:=2;
        S := b[1]; Smax := b[1];
        while (i <= j) and (j <= n) do
        begin
                if (a[j] - a[i] <= d) then
                begin
                        S := S + b[j];
                        inc(j);
                        if (Smax < S) then Smax := S;
                end
                else    begin
                                S := S - b[i];
                                inc(i);
                        end;
        end;
end;

procedure ghi;
var     f:text;
begin
        assign(f,fo); rewrite(f);
        write(f,Smax);
        close(f);
end;

Begin
        nhap;
        xuly;
        ghi;
end.