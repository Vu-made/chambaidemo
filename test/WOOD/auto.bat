for /l %%i in (0,1,9) do md "test%%i"
for /l %%i in (0,1,9) do move "sub.in%%i" "test%%i\WOOD.INP"
for /l %%i in (0,1,9) do move "sub.ou%%i" "test%%i\WOOD.OUT"