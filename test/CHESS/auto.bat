for /l %%i in (1,1,20) do md "test%%i"
for /l %%i in (1,1,20) do move "test%%i\BAI4.INP" "test%%i\CHESS.INP"
for /l %%i in (1,1,20) do move "test%%i\BAI4.OUT" "test%%i\CHESS.OUT"