require 'faker'
# Fichier à màj avec les nouvelles tables et les fakers souhaités :
# Lien vers faker : https://github.com/faker-ruby/faker

puts "Réinitialisation des tables ..."
User.destroy_all
print "Users"
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
puts "Tables réinitialisées."

puts "Création des seeds ..."

City.create(town: "Toulon")
City.create(town: "Marseille")
City.create(town: "Paris")
City.create(town: "Lyon")
City.create(town: "Rennes")
City.create(town: "Montpellier")

1.times do
  User.create(first_name: "Prénom Admin", last_name: "Nom Admin", email: "admin@admin.com", city_id: Faker::Number.between(from: 0, to: 5), is_admin: true, password: "voiture", password_confirmation: "voiture")
end

i = 1
10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: "user#{i}@#{i}.com", city_id: Faker::Number.between(from: 0, to: 5), password: "voiture", password_confirmation: "voiture")
  i += 1
end

Brand.create(trademark: "H&M")
Brand.create(trademark: "Zara")
Brand.create(trademark: "Celio")
Brand.create(trademark: "Diesel")
Brand.create(trademark: "Dior")
Brand.create(trademark: "Stradivarius")
Brand.create(trademark: "Scotch & Soda")


Colour.create(tint: "Noir")
Colour.create(tint: "Blanc")
Colour.create(tint: "Vert")
Colour.create(tint: "Bleu")
Colour.create(tint: "Rouge")


Condition.create(state: "Neuf")
Condition.create(state: "Occasion")


Size.create(measure: "Large")
Size.create(measure: "Medium")
Size.create(measure: "Small")


Fabric.create(variety: "Cotton")
Fabric.create(variety: "Synthetique")
Fabric.create(variety: "Cuir")
Fabric.create(variety: "Laine")
Fabric.create(variety: "Cellulose")


Situation.create(scope: "Privé")
Situation.create(scope: "Show")
Situation.create(scope: "À vendre")
Situation.create(scope: "À prêter")


Category.create(kind: "T-shirt")
Category.create(kind: "Chemise")
Category.create(kind: "Veste")
Category.create(kind: "Robe")


Attire.create(
      title: "Chemise Zara",
      description: Faker::ChuckNorris.fact,
      price: Faker::Number.decimal(l_digits: 2),
      category_id: Faker::Number.between(from: 0, to: 3),
      size_id: Faker::Number.between(from: 0, to: 2),
      colour_id: Faker::Number.between(from: 1, to: 10),
      fabric_id: Faker::Number.between(from: 1, to: 10),
      situation_id: Faker::Number.between(from: 1, to: 10),
      condition_id: Faker::Number.between(from: 1, to: 10),
      brand_id: Faker::Number.between(from: 1, to: 10),
      owner_id: Faker::Number.between(from: 1, to: 10)
              )

Attire.create(
      title: "Pantalon Celio",
      description: Faker::ChuckNorris.fact,
      price: Faker::Number.decimal(l_digits: 2),
      category_id: Faker::Number.between(from: 0, to: 3),
      size_id: Faker::Number.between(from: 0, to: 2),
      colour_id: Faker::Number.between(from: 1, to: 10),
      fabric_id: Faker::Number.between(from: 1, to: 10),
      situation_id: Faker::Number.between(from: 1, to: 10),
      condition_id: Faker::Number.between(from: 1, to: 10),
      brand_id: Faker::Number.between(from: 1, to: 10),
      owner_id: Faker::Number.between(from: 1, to: 10)
              )

Attire.create(
      title: "T-shirt Diesel"  ,
      description: Faker::ChuckNorris.fact,
      price: Faker::Number.decimal(l_digits: 2),
      category_id: Faker::Number.between(from: 0, to: 3),
      size_id: Faker::Number.between(from: 0, to: 2),
      colour_id: Faker::Number.between(from: 1, to: 10),
      fabric_id: Faker::Number.between(from: 1, to: 10),
      situation_id: Faker::Number.between(from: 1, to: 10),
      condition_id: Faker::Number.between(from: 1, to: 10),
      brand_id: Faker::Number.between(from: 1, to: 10),
      owner_id: Faker::Number.between(from: 1, to: 10)
              )

Attire.create(
      title: "Short de sport Décathlon",
      description: Faker::ChuckNorris.fact,
      price: Faker::Number.decimal(l_digits: 2),
      category_id: Faker::Number.between(from: 0, to: 3),
      size_id: Faker::Number.between(from: 0, to: 2),
      colour_id: Faker::Number.between(from: 1, to: 10),
      fabric_id: Faker::Number.between(from: 1, to: 10),
      situation_id: Faker::Number.between(from: 1, to: 10),
      condition_id: Faker::Number.between(from: 1, to: 10),
      brand_id: Faker::Number.between(from: 1, to: 10),
      owner_id: Faker::Number.between(from: 1, to: 10)
              )

Attire.create(
      title: "Robe Le temps des cerises",
      description: Faker::ChuckNorris.fact,
      price: Faker::Number.decimal(l_digits: 2),
      category_id: Faker::Number.between(from: 0, to: 3),
      size_id: Faker::Number.between(from: 0, to: 2),
      colour_id: Faker::Number.between(from: 1, to: 10),
      fabric_id: Faker::Number.between(from: 1, to: 10),
      situation_id: Faker::Number.between(from: 1, to: 10),
      condition_id: Faker::Number.between(from: 1, to: 10),
      brand_id: Faker::Number.between(from: 1, to: 10),
      owner_id: Faker::Number.between(from: 1, to: 10)
              )

Attire.create(
      title: "Jean Levis"  ,
      description: Faker::ChuckNorris.fact,
      price: Faker::Number.decimal(l_digits: 2),
      category_id: Faker::Number.between(from: 0, to: 3),
      size_id: Faker::Number.between(from: 0, to: 2),
      colour_id: Faker::Number.between(from: 1, to: 10),
      fabric_id: Faker::Number.between(from: 1, to: 10),
      situation_id: Faker::Number.between(from: 1, to: 10),
      condition_id: Faker::Number.between(from: 1, to: 10),
      brand_id: Faker::Number.between(from: 1, to: 10),
      owner_id: Faker::Number.between(from: 1, to: 10)
              )

Attire.create(
      title: "Chemise Levis",
      description: Faker::ChuckNorris.fact,
      price: Faker::Number.decimal(l_digits: 2),
      category_id: Faker::Number.between(from: 0, to: 3),
      size_id: Faker::Number.between(from: 0, to: 2),
      colour_id: Faker::Number.between(from: 1, to: 10),
      fabric_id: Faker::Number.between(from: 1, to: 10),
      situation_id: Faker::Number.between(from: 1, to: 10),
      condition_id: Faker::Number.between(from: 1, to: 10),
      brand_id: Faker::Number.between(from: 1, to: 10),
      owner_id: Faker::Number.between(from: 1, to: 10)
              )

Attire.create(
      title: "Hoodie NY",
      description: Faker::ChuckNorris.fact,
      price: Faker::Number.decimal(l_digits: 2),
      category_id: Faker::Number.between(from: 0, to: 3),
      size_id: Faker::Number.between(from: 0, to: 2),
      colour_id: Faker::Number.between(from: 1, to: 10),
      fabric_id: Faker::Number.between(from: 1, to: 10),
      situation_id: Faker::Number.between(from: 1, to: 10),
      condition_id: Faker::Number.between(from: 1, to: 10),
      brand_id: Faker::Number.between(from: 1, to: 10),
      owner_id: Faker::Number.between(from: 1, to: 10)
              )

Attire.create(
      title: "Casquette Lakers"  ,
      description: Faker::ChuckNorris.fact,
      price: Faker::Number.decimal(l_digits: 2),
      category_id: Faker::Number.between(from: 0, to: 3),
      size_id: Faker::Number.between(from: 0, to: 2),
      colour_id: Faker::Number.between(from: 1, to: 10),
      fabric_id: Faker::Number.between(from: 1, to: 10),
      situation_id: Faker::Number.between(from: 1, to: 10),
      condition_id: Faker::Number.between(from: 1, to: 10),
      brand_id: Faker::Number.between(from: 1, to: 10),
      owner_id: Faker::Number.between(from: 1, to: 10)
              )










puts "Création des seeds terminées."
