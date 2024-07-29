const   fi='BAI4.INP';
        fo='BAI4.OUT';
        nmax = 1000;
type    mm = array[1..nmax] of longint;
var     a,b,ddA,ddB:mm;
        N,kq:longint;
        f:text;
procedure doc;
var     i:longint;
begin
        assign(f,fi); reset(f);
        readln(f,N);
        for i:=1 to N do readln(f,a[i],b[i]);
        close(f);
end;

procedure doi(var x,y:longint);
var     tg:longint;
begin
        tg := x; x:=y; y := tg;
end;

procedure sx(var c:mm);
var     i,j:longint;
begin
        for i:=1 to N-1 do
        for j:=i+1 to N do
        if c[i] > c[j] then doi(c[i],c[j]);
end;

procedure xuly;
var     i,j:longint;
begin
        for i:=1 to N do
        Begin
                ddA[i] := 0;
                ddB[i] := 0;
        end;
        kq := 0;
        for i:=1 to N do
            for j:=1 to N do
            if dda[j] = 0 then
                if b[i] > a[j] then
                begin
                        ddA[j]:=1;
                        ddB[i]:=1;
                        kq :=kq + 2;
                        break;
                end;
        for i:=1 to N do
        if ddA[i] = 0 then
            for j:=1 to N do
            if (ddB[j] = 0) and (a[i] = b[j]) then
            begin
                ddA[i] := 1;
                ddB[j] := 1;
                kq := kq + 1;
                break;
            end;
end;

procedure ghi;
begin
        assign(f,fo); rewrite(f);
        write(f,kq);
        close(f);
end;

BEGIN
        doc;
        sx(a);
        sx(b);
        xuly;
        ghi;
END.
