import React from "react";
import { motion } from 'framer-motion';
import { ArrowRight, Search, MapPin, Building, BedDouble, Bath } from 'lucide-react';
import { properties } from '@/src/data/dummyData';
import { Link, useNavigate } from 'react-router-dom';

export default function Home() {
  const navigate = useNavigate();
  const featuredProperties = properties.filter(p => p.featured).slice(0, 3);

  const handleSearch = (e) => {
    e.preventDefault();
    navigate('/properties');
  };

  return (
    <div className="home-el-183">
      {/* Hero Section */}
      <section className="home-el-184">
        <div className="home-el-185">
          <img 
            src="https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?auto=format&fit=crop&q=80" 
            alt="Luxury Real Estate" 
            className="home-el-186"
          />
          <div className="home-el-187" />
          <div className="home-el-188" />
        </div>

        <div className="home-el-189">
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8, ease: "easeOut" }}
          >
            <span className="home-el-190">
              <span className="home-el-191"></span> New Exclusive Listing
            </span>
            <h1 className="home-el-192">
              Redefining <br />
              <span className="home-el-193">Luxury Living</span> <br /> in Kuwait
            </h1>
            <p className="home-el-194">
              Discover our curated selection of ultra-premium estates, waterfront villas, and architectural masterpieces designed for the most discerning global citizens.
            </p>
          </motion.div>

          <motion.div 
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8, delay: 0.2, ease: "easeOut" }}
            className="home-el-195"
          >
            <div className="home-el-196">
              <form onSubmit={handleSearch} className="home-el-197">
                <div className="home-el-198">
                  <label className="home-el-199">Location</label>
                  <div className="home-el-200">
                    <MapPin className="home-el-201" />
                    <input type="text" placeholder="Location, Area..." className="home-el-202" />
                  </div>
                </div>
                <div className="home-el-203">
                  <label className="home-el-204">Property Type</label>
                  <div className="home-el-205">
                    <Building className="home-el-206" />
                    <select className="home-el-207">
                      <option value="">Any Type</option>
                      <option value="villa">Villa</option>
                      <option value="apartment">Apartment</option>
                      <option value="penthouse">Penthouse</option>
                    </select>
                  </div>
                </div>
                <button type="submit" className="home-el-208">
                  Search Inventory
                </button>
              </form>
            </div>
          </motion.div>
        </div>
      </section>

      {/* Featured Properties */}
      <section className="home-el-209">
        <div className="home-el-210">
          <div className="home-el-211">
            <div>
              <h3 className="home-el-212">Exclusive Portfolio</h3>
              <h2 className="home-el-213">Featured Properties</h2>
            </div>
            <Link to="/properties" className="home-el-214">
              View All <ArrowRight className="home-el-215" />
            </Link>
          </div>

          <div className="home-el-216">
            {featuredProperties.map((prop, idx) => (
              <motion.div 
                key={prop.id}
                initial={{ opacity: 0, y: 30 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                transition={{ delay: idx * 0.1 }}
                className="home-el-217"
              >
                <div className="home-el-218">
                  <div className="home-el-219">
                    {prop.status}
                  </div>
                  <div className="home-el-220">
                    {prop.type}
                  </div>
                  <img src={prop.image} alt={prop.title} className="home-el-221" />
                </div>
                <div className="home-el-222">
                  <div className="home-el-223">
                    <h3 className="home-el-224">{prop.title}</h3>
                    <span className="home-el-225">${prop.price.toLocaleString()}</span>
                  </div>
                  <p className="home-el-226">
                    <MapPin className="home-el-227" /> {prop.location}
                  </p>
                  <div className="home-el-228">
                    <div className="home-el-229">
                      <div className="home-el-230"></div>
                      <span className="home-el-231">{prop.beds} Beds</span>
                    </div>
                    <div className="home-el-232">
                      <div className="home-el-233"></div>
                      <span className="home-el-234">{prop.baths} Baths</span>
                    </div>
                    <div className="home-el-235">
                      <div className="home-el-236"></div>
                      <span className="home-el-237">{prop.area} sq.ft</span>
                    </div>
                  </div>
                  <Link to={`/properties/${prop.id}`} className="home-el-238">
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
