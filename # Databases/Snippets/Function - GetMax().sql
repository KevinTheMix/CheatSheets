-- See https://stackoverflow.com/questions/71022/sql-max-of-multiple-columns
CREATE FUNCTION [DBMTools].[GetMax](@a float, @b float, @c float, @d float)
RETURNS float
BEGIN
	RETURN CASE
		WHEN @a > @b AND @a > ISNULL(@c,0) AND @a > ISNULL(@d,0) THEN @a
		WHEN @b > ISNULL(@c,0) AND @b > ISNULL(@d,0) THEN @b
		WHEN @c > ISNULL(@d,0) THEN @c
		ELSE @d END
END