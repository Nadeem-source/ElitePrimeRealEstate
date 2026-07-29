#!/bin/bash
mkdir -p src/components/layout src/components/ui src/pages src/data src/lib src/contexts

# Utils
cat << 'INNER' > src/lib/utils.ts
import { type ClassValue, clsx } from 'clsx';
import { twMerge } from 'tailwind-merge';

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}
INNER

# Dummy Data
cat << 'INNER' > src/data/dummyData.ts
export const properties = Array.from({ length: 24 }).map((_, i) => ({
  id: \`prop-\${i + 1}\`,
  title: [
    "Luxury Beachfront Villa", "Modern Penthouse Suite", "Elegant Townhouse",
    "Commercial Office Space", "Skyline Apartment", "Grand Estate"
  ][i % 6] + \` in \${["Kuwait City", "Salmiya", "Hawally", "Farwaniya"][i % 4]}\`,
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
  id: \`agent-\${i + 1}\`,
  name: ["Sarah Al-Fadhel", "Ahmad Yaseen", "Nadia Kamal", "Tariq Mansour"][i],
  designation: ["Senior Luxury Broker", "Commercial Specialist", "Residential Expert", "Investment Advisor"][i],
  phone: \`+965 6000 \${1000 + i}\`,
  email: \`\${["sarah", "ahmad", "nadia", "tariq"][i]}@eliteprimeproperties.com\`,
  experience: \`\${5 + (i * 2)} Years\`,
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
INNER

# Layout Components
cat << 'INNER' > src/components/layout/Navbar.tsx
import { useState, useEffect } from 'react';
import { Link, useLocation } from 'react-router-dom';
import { Menu, X, User, Building } from 'lucide-react';
import { cn } from '@/lib/utils';
import { companyInfo } from '@/data/dummyData';

export function Navbar() {
  const [isScrolled, setIsScrolled] = useState(false);
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);
  const location = useLocation();

  useEffect(() => {
    const handleScroll = () => {
      setIsScrolled(window.scrollY > 20);
    };
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  const navLinks = [
    { name: 'Home', path: '/' },
    { name: 'Properties', path: '/properties' },
    { name: 'Agents', path: '/agents' },
    { name: 'About', path: '/about' },
    { name: 'Contact', path: '/contact' },
  ];

  return (
    <nav className={cn(
      "fixed top-0 left-0 right-0 z-50 transition-all duration-300",
      isScrolled ? "glass py-4" : "bg-transparent py-6"
    )}>
      <div className="max-w-7xl mx-auto px-6 flex items-center justify-between">
        <Link to="/" className="flex items-center gap-2">
          <Building className={cn("w-8 h-8", isScrolled ? "text-primary" : "text-white")} />
          <span className={cn(
            "font-serif text-2xl font-bold tracking-tight",
            isScrolled ? "text-primary" : "text-white"
          )}>
            Elite Prime
          </span>
        </Link>

        {/* Desktop Nav */}
        <div className="hidden md:flex items-center gap-8">
          {navLinks.map((link) => (
            <Link
              key={link.name}
              to={link.path}
              className={cn(
                "text-sm font-medium tracking-wide transition-colors",
                isScrolled ? "text-primary/80 hover:text-accent" : "text-white/90 hover:text-white",
                location.pathname === link.path && (isScrolled ? "text-accent" : "text-white font-semibold")
              )}
            >
              {link.name}
            </Link>
          ))}
          <Link
            to="/login"
            className={cn(
              "flex items-center gap-2 px-5 py-2.5 rounded-full font-medium transition-colors",
              isScrolled 
                ? "bg-primary text-white hover:bg-primary/90" 
                : "bg-white/10 text-white backdrop-blur-sm border border-white/20 hover:bg-white/20"
            )}
          >
            <User className="w-4 h-4" />
            Sign In
          </Link>
        </div>

        {/* Mobile Menu Button */}
        <button 
          className="md:hidden"
          onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
        >
          {isMobileMenuOpen ? (
            <X className={cn("w-6 h-6", isScrolled ? "text-primary" : "text-white")} />
          ) : (
            <Menu className={cn("w-6 h-6", isScrolled ? "text-primary" : "text-white")} />
          )}
        </button>
      </div>

      {/* Mobile Nav */}
      {isMobileMenuOpen && (
        <div className="md:hidden absolute top-full left-0 right-0 glass-dark border-t border-white/10 animate-in slide-in-from-top-4">
          <div className="flex flex-col p-6 gap-4">
            {navLinks.map((link) => (
              <Link
                key={link.name}
                to={link.path}
                onClick={() => setIsMobileMenuOpen(false)}
                className="text-white/90 text-lg font-medium py-2 border-b border-white/10"
              >
                {link.name}
              </Link>
            ))}
            <Link
              to="/login"
              onClick={() => setIsMobileMenuOpen(false)}
              className="mt-4 flex items-center justify-center gap-2 px-5 py-3 rounded-lg bg-accent text-primary font-bold"
            >
              <User className="w-5 h-5" />
              Sign In / Register
            </Link>
          </div>
        </div>
      )}
    </nav>
  );
}
INNER

cat << 'INNER' > src/components/layout/Footer.tsx
import { Link } from 'react-router-dom';
import { companyInfo } from '@/data/dummyData';
import { Building, Phone, Mail, MapPin, Instagram, Linkedin, Twitter, Facebook } from 'lucide-react';

export function Footer() {
  return (
    <footer className="bg-primary text-white pt-24 pb-12 px-6">
      <div className="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-12 mb-16">
        <div>
          <Link to="/" className="flex items-center gap-2 mb-6">
            <Building className="w-8 h-8 text-accent" />
            <span className="font-serif text-2xl font-bold tracking-tight text-white">
              Elite Prime
            </span>
          </Link>
          <p className="text-white/70 leading-relaxed mb-8">
            Redefining luxury real estate in Kuwait. Discover the most exclusive properties, tailored to your distinguished lifestyle.
          </p>
          <div className="flex gap-4">
            {[Facebook, Twitter, Instagram, Linkedin].map((Icon, i) => (
              <a key={i} href="#" className="w-10 h-10 rounded-full bg-white/5 flex items-center justify-center text-white/80 hover:bg-accent hover:text-primary transition-colors">
                <Icon className="w-5 h-5" />
              </a>
            ))}
          </div>
        </div>

        <div>
          <h3 className="text-xl font-serif font-semibold mb-6">Quick Links</h3>
          <ul className="space-y-4">
            {['Home', 'About Us', 'Properties', 'Agents', 'Contact'].map((link) => (
              <li key={link}>
                <Link to={\`/\${link.toLowerCase().replace(' ', '-')}\`} className="text-white/70 hover:text-accent transition-colors">
                  {link}
                </Link>
              </li>
            ))}
          </ul>
        </div>

        <div>
          <h3 className="text-xl font-serif font-semibold mb-6">Contact Us</h3>
          <ul className="space-y-4">
            <li className="flex gap-3 text-white/70">
              <MapPin className="w-5 h-5 text-accent shrink-0" />
              <span>{companyInfo.address}</span>
            </li>
            <li className="flex gap-3 text-white/70">
              <Phone className="w-5 h-5 text-accent shrink-0" />
              <span>{companyInfo.phone}</span>
            </li>
            <li className="flex gap-3 text-white/70">
              <Mail className="w-5 h-5 text-accent shrink-0" />
              <span>{companyInfo.email}</span>
            </li>
          </ul>
        </div>

        <div>
          <h3 className="text-xl font-serif font-semibold mb-6">Newsletter</h3>
          <p className="text-white/70 mb-4">Subscribe to receive updates on exclusive new listings.</p>
          <form className="flex flex-col gap-3" onSubmit={(e) => e.preventDefault()}>
            <input 
              type="email" 
              placeholder="Your email address" 
              className="bg-white/5 border border-white/10 rounded-lg px-4 py-3 text-white placeholder:text-white/40 focus:outline-none focus:border-accent"
            />
            <button className="bg-accent text-primary font-semibold py-3 rounded-lg hover:bg-accent/90 transition-colors">
              Subscribe
            </button>
          </form>
        </div>
      </div>

      <div className="max-w-7xl mx-auto pt-8 border-t border-white/10 flex flex-col md:flex-row items-center justify-between gap-4">
        <p className="text-white/50 text-sm">
          © {new Date().getFullYear()} {companyInfo.name}. All rights reserved.
        </p>
        <div className="flex gap-6 text-sm">
          <Link to="/privacy-policy" className="text-white/50 hover:text-white transition-colors">Privacy Policy</Link>
          <Link to="/terms" className="text-white/50 hover:text-white transition-colors">Terms of Service</Link>
        </div>
      </div>
    </footer>
  );
}
INNER

cat << 'INNER' > src/components/layout/Layout.tsx
import { Outlet } from 'react-router-dom';
import { Navbar } from './Navbar';
import { Footer } from './Footer';
import { useEffect } from 'react';
import { useLocation } from 'react-router-dom';

export function Layout() {
  const { pathname } = useLocation();

  useEffect(() => {
    window.scrollTo(0, 0);
  }, [pathname]);

  return (
    <div className="min-h-screen flex flex-col">
      <Navbar />
      <main className="flex-1">
        <Outlet />
      </main>
      <Footer />
    </div>
  );
}
INNER

cat << 'INNER' > src/pages/Home.tsx
import { motion } from 'framer-motion';
import { ArrowRight, Search, MapPin, Building, BedDouble, Bath } from 'lucide-react';
import { properties } from '@/data/dummyData';
import { Link, useNavigate } from 'react-router-dom';

export default function Home() {
  const navigate = useNavigate();
  const featuredProperties = properties.filter(p => p.featured).slice(0, 3);

  const handleSearch = (e: React.FormEvent) => {
    e.preventDefault();
    navigate('/properties');
  };

  return (
    <div className="w-full">
      {/* Hero Section */}
      <section className="relative h-screen flex items-center justify-center overflow-hidden">
        <div className="absolute inset-0 z-0">
          <img 
            src="https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?auto=format&fit=crop&q=80" 
            alt="Luxury Real Estate" 
            className="w-full h-full object-cover"
          />
          <div className="absolute inset-0 bg-primary/60 mix-blend-multiply" />
          <div className="absolute inset-0 bg-gradient-to-t from-primary/90 via-transparent to-transparent" />
        </div>

        <div className="relative z-10 max-w-7xl mx-auto px-6 w-full flex flex-col items-center text-center mt-20">
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8, ease: "easeOut" }}
          >
            <span className="inline-block px-4 py-1.5 rounded-full bg-white/10 backdrop-blur-md border border-white/20 text-accent text-sm font-semibold tracking-widest uppercase mb-6">
              Exceptional Living
            </span>
            <h1 className="text-5xl md:text-7xl font-serif font-bold text-white mb-6 leading-tight">
              Discover Your <br />
              <span className="text-gradient">Dream Property</span>
            </h1>
            <p className="text-lg md:text-xl text-white/80 max-w-2xl mx-auto mb-12">
              The premier destination for luxury real estate in Kuwait. Explore our exclusive portfolio of bespoke properties.
            </p>
          </motion.div>

          <motion.div 
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8, delay: 0.2, ease: "easeOut" }}
            className="w-full max-w-4xl"
          >
            <div className="glass rounded-2xl p-4 md:p-6 shadow-2xl">
              <form onSubmit={handleSearch} className="flex flex-col md:flex-row gap-4">
                <div className="flex-1 bg-white/50 rounded-xl p-3 flex items-center border border-white/30">
                  <MapPin className="w-5 h-5 text-primary/50 mx-2" />
                  <input type="text" placeholder="Location, Area..." className="bg-transparent border-none outline-none w-full text-primary placeholder:text-primary/50" />
                </div>
                <div className="flex-1 bg-white/50 rounded-xl p-3 flex items-center border border-white/30">
                  <Building className="w-5 h-5 text-primary/50 mx-2" />
                  <select className="bg-transparent border-none outline-none w-full text-primary">
                    <option value="">Property Type</option>
                    <option value="villa">Villa</option>
                    <option value="apartment">Apartment</option>
                    <option value="penthouse">Penthouse</option>
                  </select>
                </div>
                <button type="submit" className="bg-primary text-white rounded-xl px-8 py-4 font-semibold flex items-center justify-center gap-2 hover:bg-primary/90 transition-all hover:shadow-lg">
                  <Search className="w-5 h-5" />
                  Search
                </button>
              </form>
            </div>
          </motion.div>
        </div>
      </section>

      {/* Featured Properties */}
      <section className="py-24 bg-background px-6">
        <div className="max-w-7xl mx-auto">
          <div className="flex justify-between items-end mb-16">
            <div>
              <span className="text-accent font-semibold tracking-wider uppercase text-sm mb-2 block">Exclusive Portfolio</span>
              <h2 className="text-4xl font-serif font-bold text-primary">Featured Properties</h2>
            </div>
            <Link to="/properties" className="hidden md:flex items-center gap-2 text-primary font-medium hover:text-accent transition-colors pb-2 border-b-2 border-transparent hover:border-accent">
              View All <ArrowRight className="w-4 h-4" />
            </Link>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            {featuredProperties.map((prop, idx) => (
              <motion.div 
                key={prop.id}
                initial={{ opacity: 0, y: 30 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                transition={{ delay: idx * 0.1 }}
                className="bg-white rounded-2xl overflow-hidden shadow-sm hover:shadow-xl transition-shadow group border border-slate-100"
              >
                <div className="relative h-64 overflow-hidden">
                  <div className="absolute top-4 left-4 z-10 bg-primary text-white text-xs font-bold px-3 py-1.5 rounded-full uppercase tracking-wider">
                    For {prop.status}
                  </div>
                  <div className="absolute top-4 right-4 z-10 bg-white/90 backdrop-blur text-primary text-xs font-bold px-3 py-1.5 rounded-full uppercase tracking-wider shadow-sm">
                    {prop.type}
                  </div>
                  <img src={prop.image} alt={prop.title} className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110" />
                </div>
                <div className="p-6">
                  <h3 className="text-xl font-serif font-bold text-primary mb-2 line-clamp-1">{prop.title}</h3>
                  <p className="text-primary/60 flex items-center gap-2 text-sm mb-4">
                    <MapPin className="w-4 h-4" /> {prop.location}
                  </p>
                  <div className="flex items-center justify-between border-t border-slate-100 pt-4 mb-4">
                    <div className="flex gap-4 text-primary/70 text-sm">
                      <span className="flex items-center gap-1.5"><BedDouble className="w-4 h-4 text-accent" /> {prop.beds} Beds</span>
                      <span className="flex items-center gap-1.5"><Bath className="w-4 h-4 text-accent" /> {prop.baths} Baths</span>
                    </div>
                    <span className="font-bold text-lg text-primary">${prop.price.toLocaleString()}</span>
                  </div>
                  <Link to={\`/properties/\${prop.id}\`} className="block w-full text-center bg-slate-50 text-primary font-medium py-3 rounded-lg hover:bg-primary hover:text-white transition-colors">
                    View Details
                  </Link>
                </div>
              </motion.div>
            ))}
          </div>
        </div>
      </section>
    </div>
  );
}
INNER
