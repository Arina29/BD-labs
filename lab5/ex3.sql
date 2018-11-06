Declare @N1 Int, @N2 int, @N3 int;
Declare @Mai_mare int;
Set @N1 = 60 * Rand();
Set @N2 = 60 * Rand();
Set @N3 = 60 * Rand();

Set @Mai_mare = Case
		When @N1 > @N2 and @N1 > @N3 Then @N1
		When @N2 > @N3 Then @N2
		Else @N3
	END;

Print @N1;
Print @N2;
Print @N3;
Print 'Mai mare = ' + Cast(@Mai_mare as VARCHAR(2));