fun is_older (d1 : (int*int*int), d2 : (int*int*int)) =
    (#1 d1) < (#1 d2)
    orelse ((#1 d1) = (#1 d2) andalso (#2 d1) < (#2 d2))
    orelse ((#1 d1) = (#1 d2) andalso (#2 d1) = (#2 d2) andalso (#3 d1) < (#3 d2))

(* Write a function number_in_month that takes a list of dates and a month (i.e., an int) and returns
how many dates in the list are in the given month. *)
fun number_in_month (date_list : (int * int * int) list, number : int) =
    if null date_list
    then 0
    else
        if #2 (hd date_list) = number
        then 1 + number_in_month(tl date_list, number)
        else number_in_month(tl date_list, number)

fun number_in_months (date_list : (int * int * int) list, months_list : int list) =
    if null months_list
    then 0
    else number_in_month(date_list, hd months_list) + number_in_months(date_list, tl months_list)

fun dates_in_month(dates : (int * int * int) list, month: int) =
    if null dates
    then []
    else
        if #2 (hd dates) = month
        then hd dates :: dates_in_month(tl dates, month)
        else dates_in_month(tl dates, month)

fun dates_in_months(dates: (int * int * int) list, months: int list)=
    if null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)