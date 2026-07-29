import { motion } from 'framer-motion';
import { properties } from '@/src/data/dummyData';
import { Link } from 'react-router-dom';
import { MapPin, BedDouble, Bath, SlidersHorizontal } from 'lucide-react';
import { useState } from 'react';

export default function Properties() {
  const [filter, setFilter] = useState('All');

  return (
    <div className="properties-el-271">
      <div className="properties-el-272">
        <div className="properties-el-273">
          <div>
            <h1 className="properties-el-274">Properties</h1>
            <p className="properties-el-275">
              Explore our curated selection of Kuwait's most prestigious real estate offerings, from beachfront villas to skyline penthouses.
            </p>
          </div>
          <button className="properties-el-276">
            <SlidersHorizontal className="properties-el-277" /> Filters
          </button>
        </div>

        <div className="properties-el-278">
          {properties.map((prop, idx) => (
            <motion.div 
              key={prop.id}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: (idx % 6) * 0.1 }}
              className="properties-el-279"
            >
              <div className="properties-el-280">
                <div className="properties-el-281">
                  {prop.status}
                </div>
                <div className="properties-el-282">
                  {prop.type}
                </div>
                <img src={prop.image} alt={prop.title} className="properties-el-283" />
              </div>
              <div className="properties-el-284">
                <div className="properties-el-285">
                  <h3 className="properties-el-286">{prop.title}</h3>
                  <span className="properties-el-287">${prop.price.toLocaleString()}</span>
                </div>
                <p className="properties-el-288">
                  <MapPin className="properties-el-289" /> {prop.location}
                </p>
                <div className="properties-el-290">
                  <div className="properties-el-291">
                    <div className="properties-el-292"></div>
                    <span className="properties-el-293">{prop.beds} Beds</span>
                  </div>
                  <div className="properties-el-294">
                    <div className="properties-el-295"></div>
                    <span className="properties-el-296">{prop.baths} Baths</span>
                  </div>
                  <div className="properties-el-297">
                    <div className="properties-el-298"></div>
                    <span className="properties-el-299">{prop.area} sq.ft</span>
                  </div>
                </div>
                <Link to={`/properties/${prop.id}`} className="properties-el-300">
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
