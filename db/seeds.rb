require 'csv'
require 'iconv'

file = File.read("#{Rails.root}/spec/support/candidatos.csv")
file = Iconv.conv('utf-8', 'iso8859-1', file)


CSV.parse(file, headers: false, col_sep: ";").each do |col|
  Candidate.create!(
    name: col[0], 
    party: col[4], 
    coalition_composition: col[7], 
    gender: col[9], 
    schooling_level: col[13]
  )
end



