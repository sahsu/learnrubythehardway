require 'erb'

a = Dir.entries('.')
b = a.find_all { |q| !File.zero? q }.sort.find_all { |q| q.include? 'rb' }
last = b.count - 1
total = last / 52.0
totalp = total.truncate(2) * 100
fn = 'ex' + last.to_s + '.rb'
date = File.mtime(fn)

template = ERB.new <<~EOF

  <% puts "# Me and https://learnrubythehardway.org/." %>
  <% puts "" %>
  <% puts "## Currently Status " +  totalp.to_s + "%, in " + date.to_s %>
  <% puts "" %>
  <%  for i in 1..b.count - 1 do %>
    <% puts "## ex" + i.to_s %>
   <% puts "![ex" + i.to_s + ".rb](./image/ex" + i.to_s + ".jpg \'ex" + i.to_s + ".rb result\')" %>
  <% end %>
EOF

puts template.result(binding)
