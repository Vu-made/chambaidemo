const   fi = 'PHOTO.INP';
        fo = 'PHOTO.OUT';
        NMAX = trunc(1e5)+5;
var     x,c:array[1..NMAX] of longint;
        t:array[0..3] of longint;
        n,kq:longint;
procedure doc;
var     f:text;
        i:longint;
begin
        assign(f,fi); reset(f);
        readln(f,n);
        for i:=1 to n do readln(f,x[i],c[i]);
        close(f);
end;

function min(a,b:longint): longint;
begin
        if (a < b) then exit(a);
        exit(b);
end;

procedure xuly;
var     i,j:longint;
begin
        i:=1; j:=1;
        kq := trunc(2e9);
        t[c[1]] := 1;
        while (i <= j) and (j <= n) do
        begin
                if (t[1] = 0) or (t[2] = 0) or (t[3] = 0) then
                begin
                        inc(j);
                        inc(t[c[j]]);
                end
                else    begin
                                kq := min(kq, x[j] - x[i]);
                                dec(t[c[i]]);
                                inc(i);
                        end;
        end;
end;
procedure ghi;
var     f:text;
begin
        assign(f,fo); rewrite(f);
        write(f,kq);
        close(f);
end;

begin
        doc;
        xuly;
        ghi;
end.
