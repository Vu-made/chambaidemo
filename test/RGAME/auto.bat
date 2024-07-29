for /l %%i in (0,1,9) do md "test0%%i"
for /l %%i in (0,1,9) do move "%%i.in" "test0%%i\RGAME.INP"
for /l %%i in (0,1,9) do move "%%i.out" "test0%%i\RGAME.OUT"