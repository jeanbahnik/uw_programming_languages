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