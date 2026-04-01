running    = Category.find_or_create_by!(slug: "running")    { |c| c.name = "Running";    c.subtitle = "Performance et confort";  c.image_url = "https://images.unsplash.com/photo-1556906781-9a412961c28c?w=600&q=80" }
lifestyle  = Category.find_or_create_by!(slug: "lifestyle")  { |c| c.name = "Lifestyle";   c.subtitle = "Style urbain";            c.image_url = "https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=600&q=80" }
basketball = Category.find_or_create_by!(slug: "basketball") { |c| c.name = "Basketball";  c.subtitle = "Domine le terrain";      c.image_url = "https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?w=600&q=80" }

Product.destroy_all

products = [
  # ── Running ──────────────────────────────────────────────────────────────
  # Chaussures de route / compétition / trail pensées pour la performance
  {
    name: "Velocity Pegasus 40",
    category: running, price: 134,
    badge: "Best-seller", badge_color: "bg-black",
    image_url: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&q=80",
    colors: "bg-white border border-gray-300|bg-black|bg-blue-600"
  },
  {
    name: "Velocity Vaporfly 4",
    category: running, price: 259, badge: "Nouveau", badge_color: "bg-red-600",
    image_url: "https://images.unsplash.com/photo-1539185441755-769473a23570?w=500&q=80",
    colors: "bg-pink-400|bg-white border border-gray-300|bg-green-400"
  },
  {
    name: "Velocity Alphafly 3",
    category: running, price: 299, badge: "Édition lim.", badge_color: "bg-purple-600",
    image_url: "https://images.unsplash.com/photo-1549298916-b41d501d3772?w=500&q=80",
    colors: "bg-orange-500|bg-black|bg-white border border-gray-300"
  },
  {
    name: "Velocity React Infinity",
    category: running, price: 159,
    image_url: "https://images.unsplash.com/photo-1587563871167-1ee9c731aefb?w=500&q=80",
    colors: "bg-gray-800|bg-blue-500|bg-white border border-gray-300"
  },
  {
    name: "Velocity Zoom Tempo",
    category: running, price: 179, badge: "Nouveau", badge_color: "bg-red-600",
    image_url: "https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=500&q=80",
    colors: "bg-yellow-400|bg-black|bg-gray-300"
  },
  {
    name: "Velocity Wildhorse 8",
    category: running, price: 149, old_price: 169, badge: "-12%", badge_color: "bg-orange-500",
    image_url: "https://images.unsplash.com/photo-1465453869711-7e174808ace9?w=500&q=80",
    colors: "bg-stone-600|bg-orange-600|bg-black"
  },
  {
    name: "Velocity Free Run 5.0",
    category: running, price: 119,
    image_url: "https://images.unsplash.com/photo-1605348532760-6753d2c43329?w=500&q=80",
    colors: "bg-black|bg-gray-300|bg-blue-700"
  },
  {
    name: "Velocity Invincible 3",
    category: running, price: 189, badge: "Best-seller", badge_color: "bg-black",
    image_url: "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=500&q=80",
    colors: "bg-white border border-gray-300|bg-pink-300|bg-black"
  },

  # ── Lifestyle ────────────────────────────────────────────────────────────
  # Sneakers du quotidien, icônes de la culture sneaker
  {
    name: "Velocity Force One Low",
    category: lifestyle, price: 109, badge: "Best-seller", badge_color: "bg-black",
    image_url: "https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?w=500&q=80",
    colors: "bg-white border border-gray-300|bg-black|bg-red-600"
  },
  {
    name: "Velocity Max 95",
    category: lifestyle, price: 179, badge: "Nouveau", badge_color: "bg-red-600",
    image_url: "https://images.unsplash.com/photo-1512374382149-233c42b6a83b?w=500&q=80",
    colors: "bg-gray-700|bg-yellow-400|bg-white border border-gray-300"
  },
  {
    name: "Velocity Max 90",
    category: lifestyle, price: 139, old_price: 159, badge: "-13%", badge_color: "bg-orange-500",
    image_url: "https://images.unsplash.com/photo-1491553895911-0055eca6402d?w=500&q=80",
    colors: "bg-white border border-gray-300|bg-red-500|bg-black|bg-gray-300"
  },
  {
    name: "Velocity Max 270",
    category: lifestyle, price: 149,
    image_url: "https://images.unsplash.com/photo-1549298916-b41d501d3772?w=500&q=80",
    colors: "bg-black|bg-blue-500|bg-white border border-gray-300"
  },
  {
    name: "Velocity Blazer Mid",
    category: lifestyle, price: 99, badge: "Best-seller", badge_color: "bg-black",
    image_url: "https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?w=500&q=80",
    colors: "bg-white border border-gray-300|bg-black|bg-green-600"
  },
  {
    name: "Velocity Huarache OG",
    category: lifestyle, price: 119, old_price: 139, badge: "-14%", badge_color: "bg-orange-500",
    image_url: "https://images.unsplash.com/photo-1605348532760-6753d2c43329?w=500&q=80",
    colors: "bg-black|bg-red-500|bg-white border border-gray-300"
  },
  {
    name: "Velocity Cortez",
    category: lifestyle, price: 89,
    image_url: "https://images.unsplash.com/photo-1465453869711-7e174808ace9?w=500&q=80",
    colors: "bg-white border border-gray-300|bg-red-600|bg-blue-700"
  },
  {
    name: "Velocity Dunk Low",
    category: lifestyle, price: 129, badge: "Édition lim.", badge_color: "bg-purple-600",
    image_url: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&q=80",
    colors: "bg-green-600|bg-white border border-gray-300|bg-orange-500"
  },

  # ── Basketball ───────────────────────────────────────────────────────────
  # Chaussures hautes pour le terrain, inspirées des grandes séries signature
  {
    name: "Velocity I High OG",
    category: basketball, price: 179, badge: "Best-seller", badge_color: "bg-black",
    image_url: "https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?w=500&q=80",
    colors: "bg-black|bg-red-600|bg-white border border-gray-300"
  },
  {
    name: "Velocity III",
    category: basketball, price: 189,
    image_url: "https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=500&q=80",
    colors: "bg-black|bg-gray-400|bg-red-600"
  },
  {
    name: "Velocity IV Retro",
    category: basketball, price: 199, badge: "Nouveau", badge_color: "bg-red-600",
    image_url: "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=500&q=80",
    colors: "bg-white border border-gray-300|bg-red-600|bg-black|bg-blue-700"
  },
  {
    name: "Velocity VI Rings",
    category: basketball, price: 169, old_price: 199, badge: "-15%", badge_color: "bg-orange-500",
    image_url: "https://images.unsplash.com/photo-1587563871167-1ee9c731aefb?w=500&q=80",
    colors: "bg-black|bg-red-600"
  },
  {
    name: "Velocity XI Low",
    category: basketball, price: 219, badge: "Édition lim.", badge_color: "bg-purple-600",
    image_url: "https://images.unsplash.com/photo-1539185441755-769473a23570?w=500&q=80",
    colors: "bg-black|bg-white border border-gray-300|bg-red-600"
  },
  {
    name: "Velocity XIII",
    category: basketball, price: 185,
    image_url: "https://images.unsplash.com/photo-1549298916-b41d501d3772?w=500&q=80",
    colors: "bg-black|bg-red-600|bg-gray-300"
  },
  {
    name: "Velocity XXXVII",
    category: basketball, price: 195, badge: "Nouveau", badge_color: "bg-red-600",
    image_url: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&q=80",
    colors: "bg-blue-700|bg-white border border-gray-300|bg-red-600"
  },
  {
    name: "Velocity Tatum 3",
    category: basketball, price: 149, badge: "Best-seller", badge_color: "bg-black",
    image_url: "https://images.unsplash.com/photo-1605348532760-6753d2c43329?w=500&q=80",
    colors: "bg-green-700|bg-white border border-gray-300|bg-black"
  },
]

products.each do |attrs|
  Product.create!(
    name:       attrs[:name],
    category:   attrs[:category],
    price:      attrs[:price],
    old_price:  attrs[:old_price],
    badge:      attrs[:badge],
    badge_color: attrs[:badge_color],
    image_url:  attrs[:image_url],
    colors:     attrs[:colors]
  )
end

puts "#{Product.count} produits créés (#{running.products.count} running, #{lifestyle.products.count} lifestyle, #{basketball.products.count} basketball)"
