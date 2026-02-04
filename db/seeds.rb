PageSection.destroy_all
Page.destroy_all

IMAGE_DIR = Rails.root.join("db", "seed_files", "images")

def attach_image(record, filename)
  path = IMAGE_DIR.join(filename)

  return unless File.exist?(path)

  record.images.attach(
    io: File.open(path),
    filename: filename,
    content_type: "image/jpeg"
  )
end

# =========================
# HOME PAGE
# =========================
home = Page.create!(
  title: "Home",
  slug: "home",
  meta_title: "Brew Café | Fresh Coffee",
  meta_description: "Best coffee and cozy vibes",
  published: true
)
attach_image(home, "hero.jpg")

home_hero = PageSection.create!(
  page: home,
  section_type: "hero",
  position: 1,
  content: {
    heading: "Brew Café",
    subheading: "Fresh coffee • Cozy vibes",
    cta_text: "View Menu",
    cta_link: "/menu"
  }
)
attach_image(home_hero, "hero.jpg")

home_text = PageSection.create!(
  page: home,
  section_type: "text",
  position: 2,
  content: {
    title: "Welcome to Brew Café",
    description: "A cozy place to enjoy handcrafted coffee and snacks."
  }
)
attach_image(home_text, "leaflet.jpg")


# =========================
# GALLERY PAGE
# =========================
gallery = Page.create!(
  title: "Gallery",
  slug: "gallery",
  meta_title: "Gallery | Brew Café",
  meta_description: "Moments at Brew Café",
  published: true
)
attach_image(gallery, "product3.jpg")

gallery_section = PageSection.create!(
  page: gallery,
  section_type: "gallery",
  position: 1,
  content: {
    title: "Our Café Moments"
  }
)

%w[product1.jpg product2.jpg product3.jpg hero.jpg].each do |img|
  attach_image(gallery_section, img)
end




# =========================
# ABOUT PAGE
# =========================
about = Page.create!(
  title: "About Us",
  slug: "about",
  meta_title: "About Us | Brew Café",
  meta_description: "Know more about Brew Café",
  published: true
)
attach_image(about, "about.jpg")

about_section = PageSection.create!(
  page: about,
  section_type: "text",
  position: 1,
  content: {
    title: "Our Story",
    description: "We started Brew Café to bring people together over great coffee."
  }
)
attach_image(about_section, "about.jpg")

# =========================
# LOCATION PAGE
# =========================
location = Page.create!(
  title: "Location",
  slug: "location",
  meta_title: "Location | Brew Café",
  meta_description: "Find Brew Café near you",
  published: true
)
attach_image(location, "leaflet.jpg")

location_section = PageSection.create!(
  page: location,
  section_type: "location",
  position: 1,
  content: {
    address: "Indore, Madhya Pradesh",
    hours: "9 AM – 11 PM",
    map_embed_url: "https://maps.google.com"
  }
)
attach_image(location_section, "leaflet.jpg")

# =========================
# MENU PAGE
# =========================
menu = Page.create!(
  title: "Menu",
  slug: "menu",
  meta_title: "Menu | Brew Café",
  meta_description: "Explore our coffee menu",
  published: true
)
attach_image(menu, "product1.jpg")

menu_section = PageSection.create!(
  page: menu,
  section_type: "menu",
  position: 1,
  content: {
    items: [
      { name: "Espresso", price: 120 },
      { name: "Cappuccino", price: 150 },
      { name: "Latte", price: 160 },
      { name: "Cold Coffee", price: 180 }
    ]
  }
)
attach_image(menu_section, "product2.jpg")


# =========================
# MERCHANDISE PAGE
# =========================
merch = Page.create!(
  title: "Merchandise",
  slug: "merchandise",
  meta_title: "Merchandise | Brew Café",
  meta_description: "Brew Café merchandise",
  published: true
)
attach_image(merch, "product1.jpg")

merch_section = PageSection.create!(
  page: merch,
  section_type: "merchandise",
  position: 1,
  content: {
    items: [
      { name: "Coffee Mug", price: 499 },
      { name: "T-Shirt", price: 799 }
    ]
  }
)
attach_image(merch_section, "product2.jpg")

# =========================
# CONTACT PAGE
# =========================
contact = Page.create!(
  title: "Contact Us",
  slug: "contact",
  meta_title: "Contact | Brew Café",
  meta_description: "Get in touch with Brew Café",
  published: true
)
attach_image(contact, "about.jpg")

contact_section = PageSection.create!(
  page: contact,
  section_type: "contact",
  position: 1,
  content: {
    address: "Indore, Madhya Pradesh",
    phone: "+91 99999 99999",
    email: "brewcafe@gmail.com"
  }
)
attach_image(contact_section, "about.jpg")

puts "✅ All café pages seeded with correct images"
