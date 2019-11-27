use "hw1-11-26-19.sml";

(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

(* int*int*int year*month*day *)
(* true if d1 is older *)
val test1 = is_older ((1,2,3),(2,3,4)) = true
val test2 = is_older ((2018,12,4),(2017,1,4)) = false
val test3 = is_older ((2017,6,3),(2017,4,4)) = false
val test4 = is_older ((2017,6,3),(2017,6,3)) = false
val test5 = is_older ((2017,6,4),(2017,6,3)) = false
val test6 = is_older ((2017,5,2),(2017,6,3)) = true
val test6b = is_older ((2018,5,2),(2017,6,3)) = false
val test7 = is_older ((2017,6,2),(2017,6,3)) = true
val test7b = is_older ((2012,2,28),(2011,3,31)) = false


val test8 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val test8b = number_in_month ([(2012,2,28),(2013,12,1),(2014,2,12)],2) = 2

val test9 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test10 = number_in_months ([],[2,3,4]) = 0
val test11 = number_in_months ([(2012,2,28),(2012,2,28),(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 5

val test12 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test13 = dates_in_month ([(2012,2,28),(2013,12,1),(2012,2,25)],2) = [(2012,2,28),(2012,2,25)]
val test14 = dates_in_month ([(2012,2,28),(2013,12,1),(2012,2,25)],5) = []

(*
val test15 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test16 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[1]) = []
val test17 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28),(2012,2,27)],[2,3,4]) = [(2012,2,28),(2012,2,27),(2011,3,31),(2011,4,28)]

val test18 = get_nth ([], 2) = ""
val test19 = get_nth (["hi"], 1) = "hi"
val test20 = get_nth (["hi", "there"], 3) = ""
val test21 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"
val test22 = get_nth (["hi", "there", "how", "are", "you"], 5) = "you"

val test23 = date_to_string (2013, 6, 1) = "June 1, 2013"

val test24 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
val test24b = number_before_reaching_sum (70, [31,28,31,44,55]) = 2
val test24c = number_before_reaching_sum (10, [9,10]) = 1

val test25 = what_month 70 = 3

val test26 = month_range (31, 34) = [1,2,2,2]
val test26b = month_range (1, 34) = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2]

val test27 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val test28 = oldest([(2011,3,31),(2011,4,28),(2012,2,28)]) = SOME (2011,3,31)
val test29 = oldest([(2011,4,28),(2012,2,28),(2011,3,31)]) = SOME (2011,3,31)
val test30 = oldest([(2011,3,31)]) = SOME (2011,3,31)
val test31 = oldest([]) = NONE
*)
(*
Challenge Problems:

- Write functions number_in_months_challenge and dates_in_months_challenge
that are like your solutions to problems 3 and 5 except having a month in the second argument multiple
times has no more effect than having it once. (Hint: Remove duplicates, then use previous work.)

- Write a function reasonable_date that takes a date and determines if it
describes a real date in the common era. A “real date” has a positive year (year 0 did not exist), a
month between 1 and 12, and a day appropriate for the month. Solutions should properly handle leap
years. Leap years are years that are either divisible by 400 or divisible by 4 but not divisible by 100.
(Do not worry about days possibly lost in the conversion to the Gregorian calendar in the Late 1500s.)

*)
