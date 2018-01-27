#! /usr//bin/env ruby

require 'chronic'
require './helpers'

# Saturday marks the last day of a full week (column)
# on the github commit activity chart, so it makes a
# good starting point when dealing with relative dates
last_sat = Chronic.parse('last saturday')
time_anchor = Time.local(last_sat.year, last_sat.month, last_sat.day, 16)

puts "Fueling Mr Fusion"
sleep 0.2
puts "Warming Flux Capacitor"
sleep 0.2
puts "Accelerating to 88 miles per hour..."
sleep 0.2
`git init && touch file && git add file`

# days since the bottom right corner of the chart
# this is what creates the message displayed
square_days = [*58..62, 64, 70, 71, 77, *78..84, *92..98, 102, 110, *113..119,  127, 133, 134, 137, 140, 141, 144, 147, *148..154, 162, 168,  *169..175, 176, 182, 190, 191, 194, 195, 199, 200, 203, 207,  210, *211..217, 231, 235, 238, 242, 245, *246..252, 267, 273,  *274..280, 281, 287, *295..301, 305, 312, *316..322]

square_days.each do |square_day|
  new_date = to_unix(Chronic.parse("#{square_day-1} days ago", now: time_anchor))

  puts "Going back #{square_day} days in time.", "Executing: date #{new_date}"
  `date #{new_date}`

  50.times do
    hash = [*1..9, *'A'..'Z'].sample(6).join
    `echo #{hash} >> file && git commit -am '#{hash}' &>/dev/null`
  end
end

