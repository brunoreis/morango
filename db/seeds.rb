# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Nutrientes básicos do morango
nutrients = [
  { name: 'Nitrogênio', chemical_symbol: 'N', macronutrient: true },
  { name: 'Fósforo', chemical_symbol: 'P', macronutrient: true },
  { name: 'Potássio', chemical_symbol: 'K', macronutrient: true },
  { name: 'Cálcio', chemical_symbol: 'Ca', macronutrient: true },
  { name: 'Magnésio', chemical_symbol: 'Mg', macronutrient: true },
  { name: 'Enxofre', chemical_symbol: 'S', macronutrient: true },
  { name: 'Manganês', chemical_symbol: 'Mn', macronutrient: false },
  { name: 'Boro', chemical_symbol: 'Bo', macronutrient: false },
  { name: 'Ferro', chemical_symbol: 'Fe', macronutrient: false },
  { name: 'Silício', chemical_symbol: 'Si', macronutrient: false },
  { name: 'Cobre', chemical_symbol: 'Cu', macronutrient: false },
  { name: 'Molibdênio', chemical_symbol: 'Mb', macronutrient: false }
]

nutrients.each do |attrs|
  Nutrient.find_or_create_by!(chemical_symbol: attrs[:chemical_symbol]) do |nutrient|
    nutrient.name = attrs[:name]
    nutrient.macronutrient = attrs[:macronutrient]
  end
end

# Marcas
brands = {
  "Yara" => Brand.find_or_create_by!(name: "Yara"),
  "SQM Nutrition" => Brand.find_or_create_by!(name: "SQM Nutrition"),
  "Haifa Group" => Brand.find_or_create_by!(name: "Haifa Group")
}

# Produtos e garantias nutricionais
# YaraLiva NKálcio 09-00-24
fertilizer_yara = Fertilizer.find_or_initialize_by(name: "YaraLiva NKálcio 09-00-24", brand: brands["Yara"])
fertilizer_yara.solubility = 1200
fertilizer_yara.save!
[
  ["N", 9.0],
  ["K", 24.0],
  ["Ca", 10.0],
  ["Bo", 0.17]
].each do |symbol, percent|
  nutrient = Nutrient.find_by!(chemical_symbol: symbol)
  NutritionalContent.find_or_create_by!(fertilizer: fertilizer_yara, nutrient: nutrient) do |nc|
    nc.percentage = percent
  end
end

# Ultrasol® Calcium (SQM Nutrition)
fertilizer_ultrasol = Fertilizer.find_or_initialize_by(name: "Ultrasol® Calcium", brand: brands["SQM Nutrition"])
fertilizer_ultrasol.solubility = 1200
fertilizer_ultrasol.save!
[
  ["N", 15.5],
  ["Ca", 18.8] # CaO convertido para Ca (aprox.)
].each do |symbol, percent|
  nutrient = Nutrient.find_by!(chemical_symbol: symbol)
  NutritionalContent.find_or_create_by!(fertilizer: fertilizer_ultrasol, nutrient: nutrient) do |nc|
    nc.percentage = percent
  end
end
# Nitrogênio Nítrico e Amoniacal como observação, pois não há nutrientes separados para N-NO3 e N-NH4

# Haifa Cal™ GG (Haifa Group)
fertilizer_haifa = Fertilizer.find_or_initialize_by(name: "Haifa Cal™ GG", brand: brands["Haifa Group"])
fertilizer_haifa.solubility = 1200
fertilizer_haifa.save!
[
  ["N", 15.5],
  ["Ca", 18.9] # CaO convertido para Ca (aprox. 26.5% CaO)
].each do |symbol, percent|
  nutrient = Nutrient.find_by!(chemical_symbol: symbol)
  NutritionalContent.find_or_create_by!(fertilizer: fertilizer_haifa, nutrient: nutrient) do |nc|
    nc.percentage = percent
  end
end

# Haifa BitterMag (Sulfato de Magnésio Heptahidratado)
fertilizer_bittermag = Fertilizer.find_or_initialize_by(name: "Haifa BitterMag (Sulfato de Magnésio Heptahidratado)", brand: brands["Haifa Group"])
fertilizer_bittermag.solubility = 700
fertilizer_bittermag.save!
[
  ["Mg", 9.7],
  ["S", 12.9]
].each do |symbol, percent|
  nutrient = Nutrient.find_by!(chemical_symbol: symbol)
  NutritionalContent.find_or_create_by!(fertilizer: fertilizer_bittermag, nutrient: nutrient) do |nc|
    nc.percentage = percent
  end
end

# SQM Sulfato de Magnésio (Heptahidratado)
fertilizer_sqm_mg = Fertilizer.find_or_initialize_by(name: "SQM Sulfato de Magnésio (Heptahidratado)", brand: brands["SQM Nutrition"])
fertilizer_sqm_mg.solubility = 700
fertilizer_sqm_mg.save!
[
  ["Mg", 9.9],
  ["S", 13.0]
].each do |symbol, percent|
  nutrient = Nutrient.find_by!(chemical_symbol: symbol)
  NutritionalContent.find_or_create_by!(fertilizer: fertilizer_sqm_mg, nutrient: nutrient) do |nc|
    nc.percentage = percent
  end
end

# Yara Krista™ MgS (Sulfato de Magnésio)
fertilizer_yara_mgs = Fertilizer.find_or_initialize_by(name: "Yara Krista™ MgS (Sulfato de Magnésio)", brand: brands["Yara"])
fertilizer_yara_mgs.solubility = 750
fertilizer_yara_mgs.save!
[
  ["Mg", 9.6],
  ["S", 13.0]
].each do |symbol, percent|
  nutrient = Nutrient.find_by!(chemical_symbol: symbol)
  NutritionalContent.find_or_create_by!(fertilizer: fertilizer_yara_mgs, nutrient: nutrient) do |nc|
    nc.percentage = percent
  end
end

# Haifa Multi-K™ (Nitrato de Potássio)
fertilizer_haifa_multik = Fertilizer.find_or_initialize_by(name: "Haifa Multi-K™ (Nitrato de Potássio)", brand: brands["Haifa Group"])
fertilizer_haifa_multik.solubility = 320
fertilizer_haifa_multik.save!
[
  ["K", 38.2],
  ["N", 13.5]
].each do |symbol, percent|
  nutrient = Nutrient.find_by!(chemical_symbol: symbol)
  NutritionalContent.find_or_create_by!(fertilizer: fertilizer_haifa_multik, nutrient: nutrient) do |nc|
    nc.percentage = percent
  end
end

# SQM Qrop® K (Nitrato de Potássio)
fertilizer_sqm_qropk = Fertilizer.find_or_initialize_by(name: "SQM Qrop® K (Nitrato de Potássio)", brand: brands["SQM Nutrition"])
fertilizer_sqm_qropk.solubility = 320
fertilizer_sqm_qropk.save!
[
  ["K", 38.2],
  ["N", 13.5]
].each do |symbol, percent|
  nutrient = Nutrient.find_by!(chemical_symbol: symbol)
  NutritionalContent.find_or_create_by!(fertilizer: fertilizer_sqm_qropk, nutrient: nutrient) do |nc|
    nc.percentage = percent
  end
end

# Yara Krista™ K Plus (Nitrato de Potássio)
fertilizer_yara_kplus = Fertilizer.find_or_initialize_by(name: "Yara Krista™ K Plus (Nitrato de Potássio)", brand: brands["Yara"])
fertilizer_yara_kplus.solubility = 320
fertilizer_yara_kplus.save!
[
  ["K", 38.2],
  ["N", 13.7]
].each do |symbol, percent|
  nutrient = Nutrient.find_by!(chemical_symbol: symbol)
  NutritionalContent.find_or_create_by!(fertilizer: fertilizer_yara_kplus, nutrient: nutrient) do |nc|
    nc.percentage = percent
  end
end

# Haifa Poly-Feed™ / Multi-K™ SOP (Sulfato de Potássio)
fertilizer_haifa_sop = Fertilizer.find_or_initialize_by(name: "Haifa Poly-Feed™ / Multi-K™ SOP (Sulfato de Potássio)", brand: brands["Haifa Group"])
fertilizer_haifa_sop.solubility = 115
fertilizer_haifa_sop.save!
[
  ["K", 41.5],
  ["S", 17.5]
].each do |symbol, percent|
  nutrient = Nutrient.find_by!(chemical_symbol: symbol)
  NutritionalContent.find_or_create_by!(fertilizer: fertilizer_haifa_sop, nutrient: nutrient) do |nc|
    nc.percentage = percent
  end
end

# SQM K-Sul (Sulfato de Potássio)
fertilizer_sqm_ksul = Fertilizer.find_or_initialize_by(name: "SQM K-Sul (Sulfato de Potássio)", brand: brands["SQM Nutrition"])
fertilizer_sqm_ksul.solubility = 115
fertilizer_sqm_ksul.save!
[
  ["K", 41.5],
  ["S", 17.5]
].each do |symbol, percent|
  nutrient = Nutrient.find_by!(chemical_symbol: symbol)
  NutritionalContent.find_or_create_by!(fertilizer: fertilizer_sqm_ksul, nutrient: nutrient) do |nc|
    nc.percentage = percent
  end
end

# Yara Krista™ SOP (Sulfato de Potássio)
fertilizer_yara_sop = Fertilizer.find_or_initialize_by(name: "Yara Krista™ SOP (Sulfato de Potássio)", brand: brands["Yara"])
fertilizer_yara_sop.solubility = 115
fertilizer_yara_sop.save!
[
  ["K", 41.5],
  ["S", 17.5]
].each do |symbol, percent|
  nutrient = Nutrient.find_by!(chemical_symbol: symbol)
  NutritionalContent.find_or_create_by!(fertilizer: fertilizer_yara_sop, nutrient: nutrient) do |nc|
    nc.percentage = percent
  end
end

# Haifa MAP™ (Fosfato Monoamônico)
fertilizer_haifa_map = Fertilizer.find_or_initialize_by(name: "Haifa MAP™ (Fosfato Monoamônico)", brand: brands["Haifa Group"])
fertilizer_haifa_map.solubility = 370
fertilizer_haifa_map.save!
[
  ["N", 12.0],
  ["P", 27.0]
].each do |symbol, percent|
  nutrient = Nutrient.find_by!(chemical_symbol: symbol)
  NutritionalContent.find_or_create_by!(fertilizer: fertilizer_haifa_map, nutrient: nutrient) do |nc|
    nc.percentage = percent
  end
end

# SQM Ultrasol® MAP (Fosfato Monoamônico)
fertilizer_sqm_map = Fertilizer.find_or_initialize_by(name: "SQM Ultrasol® MAP (Fosfato Monoamônico)", brand: brands["SQM Nutrition"])
fertilizer_sqm_map.solubility = 370
fertilizer_sqm_map.save!
[
  ["N", 12.0],
  ["P", 27.0]
].each do |symbol, percent|
  nutrient = Nutrient.find_by!(chemical_symbol: symbol)
  NutritionalContent.find_or_create_by!(fertilizer: fertilizer_sqm_map, nutrient: nutrient) do |nc|
    nc.percentage = percent
  end
end

# YaraTera KRISTA™ MAP (Fosfato Monoamônico)
fertilizer_yara_map = Fertilizer.find_or_initialize_by(name: "YaraTera KRISTA™ MAP (Fosfato Monoamônico)", brand: brands["Yara"])
fertilizer_yara_map.solubility = 370
fertilizer_yara_map.save!
[
  ["N", 12.0],
  ["P", 27.0]
].each do |symbol, percent|
  nutrient = Nutrient.find_by!(chemical_symbol: symbol)
  NutritionalContent.find_or_create_by!(fertilizer: fertilizer_yara_map, nutrient: nutrient) do |nc|
    nc.percentage = percent
  end
end

# Haifa MKP™ (Fosfato Monopotássico)
fertilizer_haifa_mkp = Fertilizer.find_or_initialize_by(name: "Haifa MKP™ (Fosfato Monopotássico)", brand: brands["Haifa Group"])
fertilizer_haifa_mkp.solubility = 230
fertilizer_haifa_mkp.save!
[
  ["P", 22.7],
  ["K", 28.5]
].each do |symbol, percent|
  nutrient = Nutrient.find_by!(chemical_symbol: symbol)
  NutritionalContent.find_or_create_by!(fertilizer: fertilizer_haifa_mkp, nutrient: nutrient) do |nc|
    nc.percentage = percent
  end
end

# SQM Ultrasol® MKP (Fosfato Monopotássico)
fertilizer_sqm_mkp = Fertilizer.find_or_initialize_by(name: "SQM Ultrasol® MKP (Fosfato Monopotássico)", brand: brands["SQM Nutrition"])
fertilizer_sqm_mkp.solubility = 230
fertilizer_sqm_mkp.save!
[
  ["P", 22.7],
  ["K", 28.5]
].each do |symbol, percent|
  nutrient = Nutrient.find_by!(chemical_symbol: symbol)
  NutritionalContent.find_or_create_by!(fertilizer: fertilizer_sqm_mkp, nutrient: nutrient) do |nc|
    nc.percentage = percent
  end
end

# YaraTera KRISTA™ MKP (Fosfato Monopotássico)
fertilizer_yara_mkp = Fertilizer.find_or_initialize_by(name: "YaraTera KRISTA™ MKP (Fosfato Monopotássico)", brand: brands["Yara"])
fertilizer_yara_mkp.solubility = 230
fertilizer_yara_mkp.save!
[
  ["P", 22.7],
  ["K", 28.5]
].each do |symbol, percent|
  nutrient = Nutrient.find_by!(chemical_symbol: symbol)
  NutritionalContent.find_or_create_by!(fertilizer: fertilizer_yara_mkp, nutrient: nutrient) do |nc|
    nc.percentage = percent
  end
end

# Fertilizantes sem marca (micronutrientes)
micronutrient_fertilizers = [
  { name: "Molibidato de sódio", nutrients: [["Mb", 39.0]] },
  { name: "Sulfato de cobre", nutrients: [["Cu", 25.0]] },
  { name: "Ácido bórico", nutrients: [["Bo", 17.0]] },
  { name: "Sulfato de manganês", nutrients: [["Mn", 31.0]] },
  { name: "Sulfato de zinco", nutrients: [["Zn", 35.0]] },
  { name: "Sulfato de cobalto", nutrients: [["Co", 20.0]] }
]

micronutrient_fertilizers.each do |fert|
  fertilizer = Fertilizer.find_or_initialize_by(name: fert[:name], brand: nil)
  fertilizer.save!
  fert[:nutrients].each do |symbol, percent|
    nutrient = Nutrient.find_by(chemical_symbol: symbol)
    next unless nutrient
    nc = NutritionalContent.find_or_initialize_by(fertilizer: fertilizer, nutrient: nutrient)
    nc.percentage = percent
    nc.save!
  end
end
