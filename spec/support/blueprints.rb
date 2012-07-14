require 'machinist/active_record'

Candidate.blueprint do 
  name    { "Name #{sn}"}
  gender  { "Masculino" }
  party   { "PT"}
  coalition_composition { "PT, PSDB, PMDB" }
  schooling_level       { "Superior completo" }
end
