puts "🗑️ Deleting all existing data..."

# Delete ActiveStorage (important when re-seeding images)
ActiveStorage::Attachment.delete_all
ActiveStorage::Blob.delete_all

PageSection.delete_all
Page.delete_all
ProductDocument.delete_all
Product.delete_all
Category.delete_all
Faq.delete_all
Testimonial.delete_all
Setting.delete_all
ContactSubmission.delete_all

puts "✔️ All old data removed."

# Helpers ----------------------------------------
def file_image(name)
  File.open(Rails.root.join("db/seed_files/images/#{name}"))
end

def file_pdf(name)
  File.open(Rails.root.join("db/seed_files/pdfs/#{name}"))
end

puts "📦 Creating fresh data..."

# ------------------------------------------------
# CATEGORIES
# ------------------------------------------------
cat1 = Category.create!(name: "Pain Relief", slug: "pain-relief")
cat2 = Category.create!(name: "Antibiotics", slug: "antibiotics")
cat3 = Category.create!(name: "Vitamins & Supplements", slug: "vitamins-supplements")

# ------------------------------------------------
# PRODUCTS
# ------------------------------------------------
p1 = Product.create!(
  name: "Paracetamol 500mg",
  slug: "paracetamol-500",
  brand: "MediCure",
  short_description: "Relief from pain & fever.",
  description: "Paracetamol helps reduce fever and mild pain.",
  composition: { amount: "500mg", ingredient: "Paracetamol" },
  indications: { uses: ["Pain", "Fever"] },
  dosage: { adult: "1 tablet every 6 hours" },
  published: true,
  category: cat1
)
p1.images.attach(io: file_image("product1.jpg"), filename: "product1.jpg")
p1_doc = p1.product_documents.create!(title: "Paracetamol Leaflet", document_type: "leaflet")
p1_doc.file.attach(io: file_pdf("leaflet.pdf"), filename: "leaflet.pdf")

p2 = Product.create!(
  name: "Amoxicillin 250mg",
  slug: "amoxicillin-250",
  brand: "MediCure",
  short_description: "Broad-spectrum antibiotic.",
  description: "Useful for many bacterial infections.",
  composition: { amount: "250mg", ingredient: "Amoxicillin" },
  indications: { uses: ["Throat infection", "Ear infection"] },
  dosage: { adult: "3 times daily" },
  published: true,
  category: cat2
)
p2.images.attach(io: file_image("product2.jpg"), filename: "product2.jpg")

p3 = Product.create!(
  name: "Vitamin C 500mg",
  slug: "vitamin-c-500",
  brand: "NutriPlus",
  short_description: "Boost immunity.",
  description: "Vitamin C for antioxidant support.",
  composition: { amount: "500mg", ingredient: "Ascorbic Acid" },
  indications: { uses: ["Immunity support"] },
  dosage: { adult: "1 daily" },
  published: true,
  category: cat3
)
p3.images.attach(io: file_image("product3.jpg"), filename: "product3.jpg")

# ------------------------------------------------
# FAQ
# ------------------------------------------------
Faq.create!([
  { question: "Are your products WHO-GMP certified?", answer: "Yes, all products follow WHO-GMP.", position: 1 },
  { question: "Do you offer doctor samples?", answer: "Yes, available upon request.", position: 2 }
])

# ------------------------------------------------
# TESTIMONIALS
# ------------------------------------------------
t1 = Testimonial.create!(
  author: "Dr. Rahul Sharma",
  designation: "General Physician",
  quote: "Great quality and consistency.",
  approved: true
)
t1.photo.attach(io: file_image("doctor1.jpg"), filename: "doctor1.jpg")

# ------------------------------------------------
# PAGES + SECTIONS
# ------------------------------------------------

home = Page.create!(
  title: "Home",
  slug: "home",
  meta_title: "Welcome to Pharma",
  meta_description: "High-quality medicines",
  settings: {},
  published: true
)
home.images.attach(io: file_image("hero.jpg"), filename: "hero.jpg")

home.page_sections.create!(
  position: 1,
  section_type: "hero",
  content: { heading: "Quality Healthcare", subheading: "Trusted Medicines" }
)

home.page_sections.create!(
  position: 2,
  section_type: "rich_text",
  content: { html: "<p>We manufacture high-quality pharma products.</p>" }
)

about = Page.create!(
  title: "About Us",
  slug: "about-us",
  meta_title: "About Our Company",
  meta_description: "Trusted pharmaceutical manufacturer",
  settings: {},
  published: true
)

about.page_sections.create!(
  position: 1,
  section_type: "hero",
  content: { heading: "About Our Company", subheading: "Delivering quality since 1998" }
)

# ------------------------------------------------
# SETTINGS
# ------------------------------------------------
Setting.create!(
  key: "company_info",
  value: { email: "info@pharma.com", phone: "9999999999", address: "Indore, India" }
)

puts "🎉 SEEDING COMPLETE!"
