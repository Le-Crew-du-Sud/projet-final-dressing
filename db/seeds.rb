require 'faker'
# Fichier à màj avec les nouvelles tables et les fakers souhaités :
# Lien vers faker : https://github.com/faker-ruby/faker

puts "Réinitialisation des tables ..."
User.destroy_all
print "Users"
Attire.destroy_all
print ", Attires"
City.destroy_all
print ", Cities"
Brand.destroy_all
print ", Brands"
Category.destroy_all
print ", Categories"
Colour.destroy_all
print ", Colours"
Fabric.destroy_all
print ", Fabrics"
Situation.destroy_all
print ", Situations"
Size.destroy_all
print ", Sizes"
Condition.destroy_all
puts ", Conditions."

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

puts "Tables reseted"

puts "Creating seed"

City.create(town: "Toulon")
City.create(town: "Marseille")
City.create(town: "Paris")
City.create(town: "Lyon")
City.create(town: "Rennes")
City.create(town: "Montpellier")

1.times do
  User.create(first_name: "Prénom Admin", last_name: "Nom Admin", email: "admin@admin.com", city_id: City.all.sample.id, is_admin: true, password: "voiture", password_confirmation: "voiture")
end
print "."
i = 1
10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: "user#{i}@user#{i}.com", city_id: City.all.sample.id, password: "voiture", password_confirmation: "voiture")
  i += 1
end
print "."
Brand.create(trademark: "H&M")
Brand.create(trademark: "Zara")
Brand.create(trademark: "Celio")
Brand.create(trademark: "Diesel")
Brand.create(trademark: "Dior")
Brand.create(trademark: "Stradivarius")
Brand.create(trademark: "Scotch & Soda")
print "."

Colour.create(tint: "Noir")
Colour.create(tint: "Blanc")
Colour.create(tint: "Vert")
Colour.create(tint: "Bleu")
Colour.create(tint: "Rouge")
print "."

Condition.create(state: "Neuf")
Condition.create(state: "Occasion")
print "."

Size.create(measure: "Large")
Size.create(measure: "Medium")
Size.create(measure: "Small")
print "."

Fabric.create(variety: "Cotton")
Fabric.create(variety: "Synthetique")
Fabric.create(variety: "Cuir")
Fabric.create(variety: "Laine")
Fabric.create(variety: "Cellulose")
print "."

Situation.create(scope: "Privé")
Situation.create(scope: "Show")
Situation.create(scope: "À vendre")
Situation.create(scope: "À prêter")
print "."

Category.create(kind: "T-shirt")
Category.create(kind: "Chemise")
Category.create(kind: "Veste")
Category.create(kind: "Robe")
print "."


a = Attire.create(
      title: "Pantalon Celio", description: Faker::ChuckNorris.fact, price:Faker::Number.within(range: 1..999), category_id: Category.all.sample.id, size_id: Size.all.sample.id, colour_id: Colour.all.sample.id, fabric_id: Fabric.all.sample.id, situation_id: Situation.all.sample.id, condition_id: Condition.all.sample.id, brand_id: Brand.all.sample.id, owner_id: (2..10).to_a.sample)
puts ">>> #{a.errors.messages}".red
b = Attire.create(
      title: "T-shirt Diesel", description: Faker::ChuckNorris.fact, price:Faker::Number.within(range: 1..999), category_id: Category.all.sample.id, size_id: Size.all.sample.id, colour_id: Colour.all.sample.id, fabric_id: Fabric.all.sample.id, situation_id: Situation.all.sample.id, condition_id: Condition.all.sample.id, brand_id: Brand.all.sample.id, owner_id: (2..10).to_a.sample)
puts ">>> #{b.errors.messages}".red
c = Attire.create(
      title: "Short de sport Décathlon", description: Faker::ChuckNorris.fact, price:Faker::Number.within(range: 1..999), category_id: Category.all.sample.id, size_id: Size.all.sample.id, colour_id: Colour.all.sample.id, fabric_id: Fabric.all.sample.id, situation_id: Situation.all.sample.id, condition_id: Condition.all.sample.id, brand_id: Brand.all.sample.id, owner_id: (2..10).to_a.sample)
puts ">>> #{c.errors.messages}".red
d = Attire.create(
      title: "Robe Le temps des cerises", description: Faker::ChuckNorris.fact, price:Faker::Number.within(range: 1..999), category_id: Category.all.sample.id, size_id: Size.all.sample.id, colour_id: Colour.all.sample.id, fabric_id: Fabric.all.sample.id, situation_id: Situation.all.sample.id, condition_id: Condition.all.sample.id, brand_id: Brand.all.sample.id, owner_id: (2..10).to_a.sample)
puts ">>> #{d.errors.messages}".red
e = Attire.create(
      title: "Jean Levis", description: Faker::ChuckNorris.fact, price:Faker::Number.within(range: 1..999), category_id: Category.all.sample.id, size_id: Size.all.sample.id, colour_id: Colour.all.sample.id, fabric_id: Fabric.all.sample.id, situation_id: Situation.all.sample.id, condition_id: Condition.all.sample.id, brand_id: Brand.all.sample.id, owner_id: (2..10).to_a.sample)
puts ">>> #{e.errors.messages}".red
f = Attire.create(
      title: "Chemise Levis", description: Faker::ChuckNorris.fact, price:Faker::Number.within(range: 1..999), category_id: Category.all.sample.id, size_id: Size.all.sample.id, colour_id: Colour.all.sample.id, fabric_id: Fabric.all.sample.id, situation_id: Situation.all.sample.id, condition_id: Condition.all.sample.id, brand_id: Brand.all.sample.id, owner_id: (2..10).to_a.sample)
puts ">>> #{f.errors.messages}".red
g = Attire.create(
      title: "Hoodie NY", description: Faker::ChuckNorris.fact, price:Faker::Number.within(range: 1..999), category_id: Category.all.sample.id, size_id: Size.all.sample.id, colour_id: Colour.all.sample.id, fabric_id: Fabric.all.sample.id, situation_id: Situation.all.sample.id, condition_id: Condition.all.sample.id, brand_id: Brand.all.sample.id, owner_id: (2..10).to_a.sample)
puts ">>> #{g.errors.messages}".red
h = Attire.create(
      title: "Casquette Lakers", description: Faker::ChuckNorris.fact, price:Faker::Number.within(range: 1..999), category_id: Category.all.sample.id, size_id: Size.all.sample.id, colour_id: Colour.all.sample.id, fabric_id: Fabric.all.sample.id, situation_id: Situation.all.sample.id, condition_id: Condition.all.sample.id, brand_id: Brand.all.sample.id, owner_id: (2..10).to_a.sample)
puts ">>> #{h.errors.messages}".red
i = Attire.create(
      title: "Chemise Zara", description: Faker::ChuckNorris.fact, price:Faker::Number.within(range: 1..999), category_id: Category.all.sample.id, size_id: Size.all.sample.id, colour_id: Colour.all.sample.id, fabric_id: Fabric.all.sample.id, situation_id: Situation.all.sample.id, condition_id: Condition.all.sample.id, brand_id: Brand.all.sample.id, owner_id: (2..10).to_a.sample)
      puts ">>> #{i.errors.messages}".red


puts "Seed generated!"
