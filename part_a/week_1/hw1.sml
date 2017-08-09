(* int*int*int year*month*day *)

(* Write a function is_older that takes two dates and evaluates to true or false. It evaluates to true if
the first argument is a date that comes before the second argument. (If the two dates are the same,
the result is false.) *)

fun is_older (date1: int*int*int, date2: int*int*int) =
  (#1 date1 < #1 date2) orelse (#2 date1 < #2 date2) orelse (#3 date1 < #3 date2)
