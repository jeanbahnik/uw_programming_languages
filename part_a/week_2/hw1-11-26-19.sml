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

fun dates_in_months(dates : (int * int * int) list, months: int list)=
    if null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

fun get_nth(strings : string list, pos: int) =
    if null strings
    then ""
    else
        if pos = 1
        then hd strings
        else get_nth(tl strings, pos - 1)

fun date_to_string(year : int, month : int, day : int) =
    let val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in get_nth(months, month) ^ " " ^ Int.toString(day) ^ ", " ^ Int.toString(year)
    end

fun number_before_reaching_sum(sum: int, numbers: int list) =
    if sum - hd numbers <= 0
    then 0
    else 1 + number_before_reaching_sum(sum - hd numbers, tl numbers)

fun what_month(day : int) =
    let val days_in_month = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in 1 + number_before_reaching_sum(day, days_in_month)
    end

(* Write a function month_range that takes two days of the year day1 and day2 and returns an int list
[m1,m2,...,mn] where m1 is the month of day1, m2 is the month of day1+1, ..., and mn is the month
of day day2. Note the result will have length day2 - day1 + 1 or length 0 if day1>day2. *)
fun month_range(day1 : int, day2 : int) =
    if day2 < day1
    then []
    else what_month(day1) :: month_range(day1 + 1, day2)

(* Write a function oldest that takes a list of dates and evaluates to an (int*int*int) option. It
evaluates to NONE if the list has no dates and SOME d if the date d is the oldest date in the list. *)
fun oldest(dates : (int * int * int) list) =
    if null dates
    then NONE
    else
        let fun oldest_date (dates : (int * int * int) list) =
            if null (tl dates)
            then hd dates
            else
                let val oldest_ans = oldest_date(tl dates)
                in
                    if is_older(hd dates, oldest_ans)
                    then hd dates
                    else oldest_ans
                end
        in
            SOME (oldest_date dates)
        end

