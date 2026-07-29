export const properties = Array.from({ length: 24 }).map((_, i) => ({
  id: `prop-${i + 1}`,
  title: [
    "Luxury Beachfront Villa", "Modern Penthouse Suite", "Elegant Townhouse",
    "Commercial Office Space", "Skyline Apartment", "Grand Estate"
  ][i % 6] + ` in ${["Kuwait City", "Salmiya", "Hawally", "Farwaniya"][i % 4]}`,
  price: 500000 + (i * 150000),
  location: ["Kuwait City", "Salmiya", "Hawally", "Farwaniya"][i % 4],
  type: ["Villa", "Penthouse", "Townhouse", "Office", "Apartment"][i % 5],
  status: i % 3 === 0 ? 'Rent' : 'Buy',
  beds: 2 + (i % 5),
  baths: 2 + (i % 4),
  area: 150 + (i * 50),
  description: "Experience the pinnacle of luxury living with breathtaking views, premium finishes, and exclusive amenities in this stunning property. Masterfully designed for those who appreciate the finer things in life.",
  image: [
    "https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1512917774080-9991f1c4c750?auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1600607687931-ceeb66d13463?auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1600566753190-17f0baa2a6c3?auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1600210492486-724fe5c67fb0?auto=format&fit=crop&q=80"
  ][i % 6],
  amenities: ["Swimming Pool", "Smart Home", "Security 24/7", "Gym", "Parking", "Balcony"].slice(0, 3 + (i % 3)),
  featured: i < 6
}));

export const agents = Array.from({ length: 4 }).map((_, i) => ({
  id: `agent-${i + 1}`,
  name: ["Sarah Al-Fadhel", "Ahmad Yaseen", "Nadia Kamal", "Tariq Mansour"][i],
  designation: ["Senior Luxury Broker", "Commercial Specialist", "Residential Expert", "Investment Advisor"][i],
  phone: `+965 6000 ${1000 + i}`,
  email: `${["sarah", "ahmad", "nadia", "tariq"][i]}@eliteprimeproperties.com`,
  experience: `${5 + (i * 2)} Years`,
  propertiesSold: 40 + (i * 15),
  rating: 4.8 + (i * 0.05),
  image: [
    "https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1560250097-0b93528c311a?auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1580489944761-15a19d654956?auto=format&fit=crop&q=80",
    "https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?auto=format&fit=crop&q=80"
  ][i]
}));

export const testimonials = [
  {
    id: 1,
    name: "Hassan Ali",
    role: "CEO, TechFlow",
    content: "Elite Prime Properties found the perfect commercial space for our headquarters. Their professionalism and attention to detail are unmatched in Kuwait.",
    rating: 5
  },
  {
    id: 2,
    name: "Fatima Al-Sabah",
    role: "Property Investor",
    content: "I have worked with many agencies, but the level of service and exclusive listings provided by Elite Prime is truly on another level.",
    rating: 5
  },
  {
    id: 3,
    name: "James Wilson",
    role: "Expat Executive",
    content: "Moving to Kuwait was seamless thanks to their team. They found a stunning beachfront villa that perfectly matched my family's needs.",
    rating: 5
  }
];

export const companyInfo = {
  name: "Elite Prime Properties",
  phone: "+965 6000 1234",
  email: "info@eliteprimeproperties.com",
  address: "Office 1201, Skyline Business Tower, Kuwait City, Kuwait",
  website: "www.eliteprimeproperties.com"
};
