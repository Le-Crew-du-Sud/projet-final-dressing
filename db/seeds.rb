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
puts "Tables reseted"

puts "Creating seed"

City.create(town: "Toulon")
City.create(town: "Marseille")
City.create(town: "Paris")
City.create(town: "Lyon")
City.create(town: "Rennes")
City.create(town: "Montpellier")

1.times do
  User.create(first_name: "Prénom Admin", last_name: "Nom Admin", email: "admin@admin.com", city_id: Faker::Number.between(from: 0, to: 5), is_admin: true, password: "voiture", password_confirmation: "voiture")
end
print "."
i = 1
10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: "user#{i}@user#{i}.com", city_id: Faker::Number.between(from: 0, to: 5), password: "voiture", password_confirmation: "voiture")
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

Attire.create(title: "Chemise Zara", description: Faker::ChuckNorris.fact, price:Faker::Number.within(range: 1..999), category_id: Faker::Number.between(from: 1, to: 4), size_id: Faker::Number.between(from: 1, to: 3), colour_id: Faker::Number.between(from: 1, to: 5), fabric_id: Faker::Number.between(from: 1, to: 5), situation_id: Faker::Number.between(from: 1, to: 4), condition_id: Faker::Number.between(from: 1, to: 2), brand_id: Faker::Number.between(from: 1, to: 7), owner_id: Faker::Number.between(from: 2, to: 11))
print "."

Attire.create(
      title: "Pantalon Celio", description: Faker::ChuckNorris.fact, price:Faker::Number.within(range: 1..999), category_id: Faker::Number.between(from: 1, to: 4), size_id: Faker::Number.between(from: 1, to: 3), colour_id: Faker::Number.between(from: 1, to: 5), fabric_id: Faker::Number.between(from: 1, to: 5), situation_id: Faker::Number.between(from: 1, to: 4), condition_id: Faker::Number.between(from: 1, to: 2), brand_id: Faker::Number.between(from: 1, to: 7), owner_id: Faker::Number.between(from: 2, to: 11))

Attire.create(
      title: "T-shirt Diesel", description: Faker::ChuckNorris.fact, price:Faker::Number.within(range: 1..999), category_id: Faker::Number.between(from: 1, to: 4), size_id: Faker::Number.between(from: 1, to: 3), colour_id: Faker::Number.between(from: 1, to: 5), fabric_id: Faker::Number.between(from: 1, to: 5), situation_id: Faker::Number.between(from: 1, to: 4), condition_id: Faker::Number.between(from: 1, to: 2), brand_id: Faker::Number.between(from: 1, to: 7), owner_id: Faker::Number.between(from: 2, to: 11))
Attire.create(
      title: "Short de sport Décathlon", description: Faker::ChuckNorris.fact, price:Faker::Number.within(range: 1..999), category_id: Faker::Number.between(from: 1, to: 4), size_id: Faker::Number.between(from: 1, to: 3), colour_id: Faker::Number.between(from: 1, to: 5), fabric_id: Faker::Number.between(from: 1, to: 5), situation_id: Faker::Number.between(from: 1, to: 4), condition_id: Faker::Number.between(from: 1, to: 2), brand_id: Faker::Number.between(from: 1, to: 7), owner_id: Faker::Number.between(from: 2, to: 11))

Attire.create(
      title: "Robe Le temps des cerises", description: Faker::ChuckNorris.fact, price:Faker::Number.within(range: 1..999), category_id: Faker::Number.between(from: 1, to: 4), size_id: Faker::Number.between(from: 1, to: 3), colour_id: Faker::Number.between(from: 1, to: 5), fabric_id: Faker::Number.between(from: 1, to: 5), situation_id: Faker::Number.between(from: 1, to: 4), condition_id: Faker::Number.between(from: 1, to: 2), brand_id: Faker::Number.between(from: 1, to: 7), owner_id: Faker::Number.between(from: 2, to: 11))

Attire.create(
      title: "Jean Levis", description: Faker::ChuckNorris.fact, price:Faker::Number.within(range: 1..999), category_id: Faker::Number.between(from: 1, to: 4), size_id: Faker::Number.between(from: 1, to: 3), colour_id: Faker::Number.between(from: 1, to: 5), fabric_id: Faker::Number.between(from: 1, to: 5), situation_id: Faker::Number.between(from: 1, to: 4), condition_id: Faker::Number.between(from: 1, to: 2), brand_id: Faker::Number.between(from: 1, to: 7), owner_id: Faker::Number.between(from: 2, to: 11))

Attire.create(
      title: "Chemise Levis", description: Faker::ChuckNorris.fact, price:Faker::Number.within(range: 1..999), category_id: Faker::Number.between(from: 1, to: 4), size_id: Faker::Number.between(from: 1, to: 3), colour_id: Faker::Number.between(from: 1, to: 5), fabric_id: Faker::Number.between(from: 1, to: 5), situation_id: Faker::Number.between(from: 1, to: 4), condition_id: Faker::Number.between(from: 1, to: 2), brand_id: Faker::Number.between(from: 1, to: 7), owner_id: Faker::Number.between(from: 2, to: 11))

Attire.create(
      title: "Hoodie NY", description: Faker::ChuckNorris.fact, price:Faker::Number.within(range: 1..999), category_id: Faker::Number.between(from: 1, to: 4), size_id: Faker::Number.between(from: 1, to: 3), colour_id: Faker::Number.between(from: 1, to: 5), fabric_id: Faker::Number.between(from: 1, to: 5), situation_id: Faker::Number.between(from: 1, to: 4), condition_id: Faker::Number.between(from: 1, to: 2), brand_id: Faker::Number.between(from: 1, to: 7), owner_id: Faker::Number.between(from: 2, to: 11))

Attire.create(
      title: "Casquette Lakers", description: Faker::ChuckNorris.fact, price:Faker::Number.within(range: 1..999), category_id: Faker::Number.between(from: 1, to: 4), size_id: Faker::Number.between(from: 1, to: 3), colour_id: Faker::Number.between(from: 1, to: 5), fabric_id: Faker::Number.between(from: 1, to: 5), situation_id: Faker::Number.between(from: 1, to: 4), condition_id: Faker::Number.between(from: 1, to: 2), brand_id: Faker::Number.between(from: 1, to: 7), owner_id: Faker::Number.between(from: 2, to: 11))
print "."


puts "Seed generated!"
