users_count = User.where(email: 'louis@test.com').size

if users_count == 0
  company = Company.create!(name: 'MyKliin', phone: '+233540000', email: 'comp@g.com')
  user = User.create!(email: 'louis@test.com',uid: 'louis@test.com', password: 'changeme', first_name: 'Louis', last_name: 'Adj', company: company)
end
