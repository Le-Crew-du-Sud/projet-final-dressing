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

1.times do
  User.create(email: "admin@admin.com", city_id: 1, is_admin: true, password: "voiture", password_confirmation: "voiture")
end

i = 1
10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: "user#{i}@#{i}.com", city_id: 1, password: "voiture", password_confirmation: "voiture")
  i += 1
end

Brand.create(trademark: "H&M")
Brand.create(trademark: "Zara")

Colour.create(tint: "Noir")
Colour.create(tint: "Blanc")

Condition.create(state: "Neuf")
Condition.create(state: "D'Occasion")

Size.create(measure: "Large")
Size.create(measure: "Medium")
Size.create(measure: "Petit")

Fabric.create(variety: "Cotton")
Fabric.create(variety: "Synthetique")
Fabric.create(variety: "Cuir")

Situation.create(scope: "Privé")
Situation.create(scope: "Show")
Situation.create(scope: "À vendre")
Situation.create(scope: "À prêter")

Category.create(kind: "T-shirt")
Category.create(kind: "Chaussure")
Category.create(kind: "Pantalon")

puts "Création des seeds terminées."
