#!/bin/bash
cat << 'INNER' > src/pages/Properties.tsx
import { motion } from 'framer-motion';
import { properties } from '@/data/dummyData';
import { Link } from 'react-router-dom';
import { MapPin, BedDouble, Bath, SlidersHorizontal } from 'lucide-react';
import { useState } from 'react';

export default function Properties() {
  const [filter, setFilter] = useState('All');

  return (
    <div className="pt-32 pb-24 px-6 bg-background min-h-screen">
      <div className="max-w-7xl mx-auto">
        <div className="flex flex-col md:flex-row justify-between items-end mb-12 gap-6">
          <div>
            <h1 className="text-4xl font-serif font-bold text-primary mb-4">Properties</h1>
            <p className="text-primary/70 max-w-xl">
              Explore our curated selection of Kuwait's most prestigious real estate offerings, from beachfront villas to skyline penthouses.
            </p>
          </div>
          <button className="flex items-center gap-2 px-6 py-3 bg-white border border-slate-200 rounded-lg text-primary font-medium hover:bg-slate-50 transition-colors">
            <SlidersHorizontal className="w-5 h-5" /> Filters
          </button>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          {properties.map((prop, idx) => (
            <motion.div 
              key={prop.id}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: (idx % 6) * 0.1 }}
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
    </div>
  );
}
INNER

cat << 'INNER' > src/pages/PropertyDetails.tsx
import { useParams, Link } from 'react-router-dom';
import { properties } from '@/data/dummyData';
import { MapPin, BedDouble, Bath, Maximize, Heart, Share2, Calendar, Phone } from 'lucide-react';
import { motion } from 'framer-motion';

export default function PropertyDetails() {
  const { id } = useParams();
  const property = properties.find(p => p.id === id) || properties[0];

  return (
    <div className="bg-background min-h-screen">
      {/* Gallery Header */}
      <div className="relative h-[60vh] w-full">
        <img src={property.image} alt={property.title} className="w-full h-full object-cover" />
        <div className="absolute inset-0 bg-gradient-to-t from-primary/80 to-transparent" />
        <div className="absolute bottom-0 left-0 right-0 p-8 md:p-12 max-w-7xl mx-auto flex flex-col md:flex-row justify-between items-end gap-6">
          <div className="text-white">
            <div className="flex gap-3 mb-4">
              <span className="bg-accent text-primary text-xs font-bold px-3 py-1.5 rounded-full uppercase tracking-wider">
                For {property.status}
              </span>
              <span className="bg-white/20 backdrop-blur-md text-white text-xs font-bold px-3 py-1.5 rounded-full uppercase tracking-wider">
                {property.type}
              </span>
            </div>
            <h1 className="text-4xl md:text-5xl font-serif font-bold mb-4">{property.title}</h1>
            <p className="flex items-center gap-2 text-white/80 text-lg">
              <MapPin className="w-5 h-5 text-accent" /> {property.location}
            </p>
          </div>
          <div className="flex flex-col items-end gap-4">
            <span className="text-4xl font-bold text-white">${property.price.toLocaleString()}</span>
            <div className="flex gap-3">
              <button className="p-3 bg-white/10 backdrop-blur-md rounded-full text-white hover:bg-white/20 transition-colors">
                <Heart className="w-5 h-5" />
              </button>
              <button className="p-3 bg-white/10 backdrop-blur-md rounded-full text-white hover:bg-white/20 transition-colors">
                <Share2 className="w-5 h-5" />
              </button>
            </div>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-6 py-16 grid grid-cols-1 lg:grid-cols-3 gap-12">
        {/* Main Content */}
        <div className="lg:col-span-2 space-y-12">
          {/* Key Features */}
          <div className="flex flex-wrap gap-8 py-8 border-b border-slate-200">
            <div className="flex items-center gap-4">
              <div className="p-4 bg-slate-50 rounded-xl"><BedDouble className="w-6 h-6 text-primary" /></div>
              <div>
                <p className="text-sm text-primary/60">Bedrooms</p>
                <p className="font-bold text-xl">{property.beds}</p>
              </div>
            </div>
            <div className="flex items-center gap-4">
              <div className="p-4 bg-slate-50 rounded-xl"><Bath className="w-6 h-6 text-primary" /></div>
              <div>
                <p className="text-sm text-primary/60">Bathrooms</p>
                <p className="font-bold text-xl">{property.baths}</p>
              </div>
            </div>
            <div className="flex items-center gap-4">
              <div className="p-4 bg-slate-50 rounded-xl"><Maximize className="w-6 h-6 text-primary" /></div>
              <div>
                <p className="text-sm text-primary/60">Area</p>
                <p className="font-bold text-xl">{property.area} sqm</p>
              </div>
            </div>
          </div>

          {/* Description */}
          <div>
            <h2 className="text-2xl font-serif font-bold text-primary mb-6">Property Overview</h2>
            <p className="text-primary/70 leading-relaxed text-lg">
              {property.description}
              <br/><br/>
              This exceptional property offers an unprecedented standard of living. Designed with the utmost attention to detail, the spaces flow seamlessly together, creating an environment that is both grand and intimate.
            </p>
          </div>

          {/* Amenities */}
          <div>
            <h2 className="text-2xl font-serif font-bold text-primary mb-6">Amenities</h2>
            <div className="grid grid-cols-2 md:grid-cols-3 gap-4">
              {property.amenities.map(item => (
                <div key={item} className="flex items-center gap-3 p-4 bg-white border border-slate-100 rounded-xl shadow-sm">
                  <div className="w-2 h-2 bg-accent rounded-full" />
                  <span className="text-primary font-medium">{item}</span>
                </div>
              ))}
            </div>
          </div>
          
          {/* Virtual Tour / Map Placeholder */}
          <div>
             <h2 className="text-2xl font-serif font-bold text-primary mb-6">Location Map</h2>
             <div className="w-full h-80 bg-slate-200 rounded-2xl flex items-center justify-center border border-slate-300">
               <span className="text-slate-500 font-medium">Google Maps Integration Placeholder</span>
             </div>
          </div>
        </div>

        {/* Sidebar */}
        <div className="lg:col-span-1">
          <div className="sticky top-32 bg-white rounded-2xl p-8 shadow-xl border border-slate-100">
            <h3 className="text-xl font-serif font-bold text-primary mb-6">Schedule a Visit</h3>
            <form className="space-y-4" onSubmit={e => e.preventDefault()}>
              <input type="text" placeholder="Your Name" className="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:border-primary transition-colors" />
              <input type="email" placeholder="Your Email" className="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:border-primary transition-colors" />
              <input type="tel" placeholder="Phone Number" className="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:border-primary transition-colors" />
              <textarea placeholder="Message" rows={4} className="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:border-primary transition-colors resize-none"></textarea>
              <button className="w-full bg-primary text-white font-bold py-4 rounded-xl flex items-center justify-center gap-2 hover:bg-primary/90 transition-all">
                <Calendar className="w-5 h-5" /> Request Tour
              </button>
              <button className="w-full bg-slate-50 text-primary font-bold py-4 rounded-xl flex items-center justify-center gap-2 hover:bg-slate-100 transition-all border border-slate-200">
                <Phone className="w-5 h-5" /> Contact Agent
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
}
INNER

cat << 'INNER' > src/pages/Agents.tsx
import { motion } from 'framer-motion';
import { agents } from '@/data/dummyData';
import { Phone, Mail, Award, Star } from 'lucide-react';

export default function Agents() {
  return (
    <div className="pt-32 pb-24 px-6 bg-background min-h-screen">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-16">
          <span className="text-accent font-semibold tracking-wider uppercase text-sm mb-2 block">Our Team</span>
          <h1 className="text-4xl md:text-5xl font-serif font-bold text-primary mb-6">Meet Our Luxury Advisors</h1>
          <p className="text-primary/70 max-w-2xl mx-auto text-lg">
            Our distinguished team of real estate professionals combines local expertise with a global perspective to deliver unparalleled service.
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          {agents.map((agent, idx) => (
            <motion.div
              key={agent.id}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: idx * 0.1 }}
              className="bg-white rounded-2xl overflow-hidden shadow-sm hover:shadow-xl transition-all group border border-slate-100"
            >
              <div className="h-72 overflow-hidden">
                <img src={agent.image} alt={agent.name} className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105" />
              </div>
              <div className="p-6">
                <h3 className="text-xl font-serif font-bold text-primary">{agent.name}</h3>
                <p className="text-accent font-medium text-sm mb-4">{agent.designation}</p>
                
                <div className="flex items-center justify-between py-4 border-y border-slate-100 mb-4">
                  <div className="text-center">
                    <p className="font-bold text-primary text-lg">{agent.propertiesSold}</p>
                    <p className="text-xs text-primary/50 uppercase tracking-wider">Sold</p>
                  </div>
                  <div className="w-px h-8 bg-slate-200" />
                  <div className="text-center">
                    <p className="font-bold text-primary text-lg flex items-center justify-center gap-1">
                      {agent.rating} <Star className="w-3 h-3 fill-accent text-accent" />
                    </p>
                    <p className="text-xs text-primary/50 uppercase tracking-wider">Rating</p>
                  </div>
                  <div className="w-px h-8 bg-slate-200" />
                  <div className="text-center">
                    <p className="font-bold text-primary text-lg">{agent.experience.split(' ')[0]}</p>
                    <p className="text-xs text-primary/50 uppercase tracking-wider">Years</p>
                  </div>
                </div>

                <div className="space-y-3">
                  <a href={\`tel:\${agent.phone}\`} className="flex items-center gap-3 text-primary/70 hover:text-primary transition-colors text-sm">
                    <div className="p-2 bg-slate-50 rounded-full"><Phone className="w-4 h-4" /></div>
                    {agent.phone}
                  </a>
                  <a href={\`mailto:\${agent.email}\`} className="flex items-center gap-3 text-primary/70 hover:text-primary transition-colors text-sm">
                    <div className="p-2 bg-slate-50 rounded-full"><Mail className="w-4 h-4" /></div>
                    <span className="truncate">{agent.email}</span>
                  </a>
                </div>
              </div>
            </motion.div>
          ))}
        </div>
      </div>
    </div>
  );
}
INNER

cat << 'INNER' > src/pages/About.tsx
import { motion } from 'framer-motion';

export default function About() {
  return (
    <div className="pt-32 pb-24 px-6 bg-background min-h-screen">
      <div className="max-w-4xl mx-auto text-center">
        <h1 className="text-5xl font-serif font-bold text-primary mb-6">About Elite Prime</h1>
        <p className="text-primary/70 text-lg leading-relaxed mb-12">
          Founded on the principles of integrity, excellence, and bespoke service, Elite Prime Properties represents the finest real estate in Kuwait and beyond. We are more than an agency; we are your trusted advisors in luxury living.
        </p>
        <div className="aspect-video w-full rounded-3xl overflow-hidden shadow-2xl">
           <img src="https://images.unsplash.com/photo-1600607687931-ceeb66d13463?auto=format&fit=crop&q=80" alt="Office" className="w-full h-full object-cover" />
        </div>
      </div>
    </div>
  );
}
INNER
