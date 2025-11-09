defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
      {:ok, noon} = NaiveDateTime.new(NaiveDateTime.to_date(datetime), ~T[12:00:00.000])
      NaiveDateTime.before?(datetime, noon)
  end

  def return_date(checkout_datetime) do
    cond do
      LibraryFees.before_noon?(checkout_datetime) -> NaiveDateTime.to_date(NaiveDateTime.add(checkout_datetime, 28, :day))
      true -> NaiveDateTime.to_date(NaiveDateTime.add(checkout_datetime, 29, :day))
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    diff = Date.diff(NaiveDateTime.to_date(actual_return_datetime), planned_return_date)
    if diff > 0 do
      diff
    else
      0
    end
  end

  def monday?(datetime) do
    date = NaiveDateTime.to_date(datetime)
    {weekday, 1, 7} = Calendar.ISO.day_of_week(date.year, date.month, date.day, :monday)
    weekday == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    planned_return_dt = LibraryFees.return_date(LibraryFees.datetime_from_string(checkout))
    return_dt = LibraryFees.datetime_from_string(return)
    days_late = LibraryFees.days_late(planned_return_dt, return_dt) |>IO.inspect()
    cond do 
      days_late == 0 -> 0
      LibraryFees.monday?(return_dt) -> div(days_late * rate, 2)
      true -> days_late * rate
    end
  end
end
