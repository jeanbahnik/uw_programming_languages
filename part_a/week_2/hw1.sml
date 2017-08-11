fun is_older (d1: int*int*int, d2: int*int*int) =
    (#1 d1 < #1 d2)
    orelse (#1 d1 = #1 d2 andalso #2 d1 < #2 d2)
    orelse (#1 d1 = #1 d2 andalso #2 d1 = #2 d2 andalso #3 d1 < #3 d2)

    (*if #1 d1 < #1 d2 then true
    else if #1 d1 > #1 d2 then false
    else if #1 d1 = #1 d2 andalso #2 d1 < #2 d2 then true
    else if #1 d1 = #1 d2 andalso #2 d1 > #2 d2 then false
    else if #2 d2 = #2 d2 andalso #3 d1 < #3 d2 then true
    else false*)

fun number_in_month (dates: (int*int*int) list, month: int) =
    if null dates then 0
    else if #2 (hd dates) = month then 1 + number_in_month(tl dates, month)
    else number_in_month(tl dates, month)

fun number_in_months (dates: (int*int*int) list, months: int list) =
    if null dates then 0
    else if null months then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)

fun dates_in_month (dates: (int*int*int) list, month: int) =
    if null dates then []
    else if #2 (hd dates) = month then hd dates :: dates_in_month(tl dates, month)
    else dates_in_month(tl dates, month)

fun dates_in_months (dates: (int*int*int) list, months: int list) =
    if null dates then []
    else if null months then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

fun get_nth (strings: string list,pos: int) =
    if null strings then ""
    else if pos = 1 then hd strings
    else get_nth(tl strings, pos - 1)

fun date_to_string(y: int, m: int, d: int) =
    let
        val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in
        get_nth(months, m) ^ " " ^ Int.toString(d) ^ ", " ^ Int.toString(y)
    end

fun number_before_reaching_sum (sum: int, numbers: int list) =
    if hd numbers >= sum
    then 0
    else 1 + number_before_reaching_sum(sum - (hd numbers), tl numbers)

fun what_month (day: int) =
    let
        val days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
        1 + number_before_reaching_sum(day, days_in_month)
    end

fun month_range(day1: int, day2: int) =
    if day1 > day2 then []
    else
        let
            fun iterate(from: int, to: int) =
                if from = to
                then (what_month(to)) :: []
                else (what_month(from)) :: iterate(from+1, to)
        in
            iterate(day1, day2)
        end

fun oldest (dates: (int*int*int) list) =
    if null dates then NONE
    else
        let
            fun iterate(date: (int*int*int), tl_dates: (int*int*int) list) =
                if null tl_dates then SOME date
                else if is_older(date, hd tl_dates) then iterate(date, tl tl_dates)
                else iterate(hd tl_dates, tl tl_dates)
        in
            iterate(hd dates, tl dates)
        end

(*
- Challenge Problem: Write functions number_in_months_challenge and dates_in_months_challenge
that are like your solutions to problems 3 and 5 except having a month in the second argument multiple
times has no more effect than having it once. (Hint: Remove duplicates, then use previous work.)

- Challenge Problem: Write a function reasonable_date that takes a date and determines if it
describes a real date in the common era. A “real date” has a positive year (year 0 did not exist), a
month between 1 and 12, and a day appropriate for the month. Solutions should properly handle leap
years. Leap years are years that are either divisible by 400 or divisible by 4 but not divisible by 100.
(Do not worry about days possibly lost in the conversion to the Gregorian calendar in the Late 1500s.)
*)
