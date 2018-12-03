declare @ex3_table table
(
	Src int,
	Dest int
)

insert @ex3_table
Select 1, 0 union all
Select 2, 1 union all
Select 3, 2 union all 
Select 4, 2 union all
Select 5, 0 ;

 with arbore
  as
 (
	Select *
	from @ex3_table
	where Src = 3
Union all
	select ex.*
	from @ex3_table ex
	join arbore on ex.src = arbore.Dest
 )
 select * from arbore
