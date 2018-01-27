# prefixes single digits with a zero
def zero(num)
  num >= 10 ? num : "0#{num}"
end

#converts to a format the unix' `time` binary likes
def to_unix(time)
  month = zero(time.month)
  day   = zero(time.day)
  hour  = zero(time.hour)
  min   = zero(time.min)
  year  = time.year % 2000

  "#{month}#{day}#{hour}#{min}#{year}"
end
