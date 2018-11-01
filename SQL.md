## INSERT
### Multiple
	INSERT INTO [Table] ([Column A], [Column B], ...) VALUES ([Value A], [Value B],...),([Value C], [Value D],...)

## Tips
Check if exists
	IF EXISTS (SELECT TOP 1 1 FROM [Table])