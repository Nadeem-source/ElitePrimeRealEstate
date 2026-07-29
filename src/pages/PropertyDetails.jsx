import { useParams, Link } from 'react-router-dom';
import { properties } from '@/src/data/dummyData';
import { MapPin, BedDouble, Bath, Maximize, Heart, Share2, Calendar, Phone } from 'lucide-react';
import { motion } from 'framer-motion';
import React, { useState } from 'react';
import { submitToGoogleSheets } from '@/src/lib/submitForm';

export default function PropertyDetails() {
  const { id } = useParams();
  const property = properties.find(p => p.id === id) || properties[0];
  const [status, setStatus] = useState('');
  const [formData, setFormData] = useState({
    Name: '',
    Email: '',
    Phone: '',
    PreferredDate: '',
    PreferredTime: '',
    Property: property.title,
    Message: ''
  });

  const handleSubmit = async (e) => {
    e.preventDefault();
    setStatus('Sending...');
    try {
      await submitToGoogleSheets(formData, 'Appointments');
      setStatus('Success! Appointment requested.');
      setFormData(prev => ({ ...prev, Name: '', Email: '', Phone: '', PreferredDate: '', PreferredTime: '', Message: '' }));
    } catch (error) {
      setStatus('Failed to send. Try again.');
    }
  };

  const handleChange = (e) => {
    setFormData(prev => ({ ...prev, [e.target.name]: e.target.value }));
  };

  return (
    <div className="propertydetails-el-301">
      {/* Gallery Header */}
      <div className="propertydetails-el-302">
        <img src={property.image} alt={property.title} className="propertydetails-el-303" />
        <div className="propertydetails-el-304" />
        <div className="propertydetails-el-305">
          <div className="propertydetails-el-306">
            <div className="propertydetails-el-307">
              <span className="propertydetails-el-308">
                {property.status}
              </span>
              <span className="propertydetails-el-309">
                {property.type}
              </span>
            </div>
            <h1 className="propertydetails-el-310">{property.title}</h1>
            <p className="propertydetails-el-311">
              <MapPin className="propertydetails-el-312" /> {property.location}
            </p>
          </div>
          <div className="propertydetails-el-313">
            <span className="propertydetails-el-314">${property.price.toLocaleString()}</span>
            <div className="propertydetails-el-315">
              <button className="propertydetails-el-316">
                <Heart className="propertydetails-el-317" />
              </button>
              <button className="propertydetails-el-318">
                <Share2 className="propertydetails-el-319" />
              </button>
            </div>
          </div>
        </div>
      </div>

      <div className="propertydetails-el-320">
        {/* Main Content */}
        <div className="propertydetails-el-321">
          {/* Key Features */}
          <div className="propertydetails-el-322">
            <div className="propertydetails-el-323">
              <div className="propertydetails-el-324"><BedDouble className="propertydetails-el-325" /></div>
              <div>
                <p className="propertydetails-el-326">Bedrooms</p>
                <p className="propertydetails-el-327">{property.beds}</p>
              </div>
            </div>
            <div className="propertydetails-el-328">
              <div className="propertydetails-el-329"><Bath className="propertydetails-el-330" /></div>
              <div>
                <p className="propertydetails-el-331">Bathrooms</p>
                <p className="propertydetails-el-332">{property.baths}</p>
              </div>
            </div>
            <div className="propertydetails-el-333">
              <div className="propertydetails-el-334"><Maximize className="propertydetails-el-335" /></div>
              <div>
                <p className="propertydetails-el-336">Area</p>
                <p className="propertydetails-el-337">{property.area} sqm</p>
              </div>
            </div>
          </div>

          {/* Description */}
          <div>
            <h2 className="propertydetails-el-338">Property Overview</h2>
            <p className="propertydetails-el-339">
              {property.description}
              <br/><br/>
              This exceptional property offers an unprecedented standard of living. Designed with the utmost attention to detail, the spaces flow seamlessly together, creating an environment that is both grand and intimate.
            </p>
          </div>

          {/* Amenities */}
          <div>
            <h2 className="propertydetails-el-340">Amenities</h2>
            <div className="propertydetails-el-341">
              {property.amenities.map(item => (
                <div key={item} className="propertydetails-el-342">
                  <div className="propertydetails-el-343" />
                  <span className="propertydetails-el-344">{item}</span>
                </div>
              ))}
            </div>
          </div>
          
          {/* Virtual Tour / Map Placeholder */}
          <div>
             <h2 className="propertydetails-el-345">Location Map</h2>
             <div className="propertydetails-el-346">
               <span className="propertydetails-el-347">Google Maps Integration Placeholder</span>
             </div>
          </div>
        </div>

        {/* Sidebar */}
        <div className="propertydetails-el-348">
          <div className="propertydetails-el-349">
            <h3 className="propertydetails-el-350">Schedule a Visit</h3>
            <form className="propertydetails-el-351" onSubmit={handleSubmit}>
              <input required name="Name" value={formData.Name} onChange={handleChange} type="text" placeholder="Your Name" className="propertydetails-el-352" />
              <input required name="Email" value={formData.Email} onChange={handleChange} type="email" placeholder="Your Email" className="propertydetails-el-353" />
              <input required name="Phone" value={formData.Phone} onChange={handleChange} type="tel" placeholder="Phone Number" className="propertydetails-el-354" />
              <div className="propertydetails-el-355">
                <input required name="PreferredDate" value={formData.PreferredDate} onChange={handleChange} type="date" className="propertydetails-el-356" />
                <input required name="PreferredTime" value={formData.PreferredTime} onChange={handleChange} type="time" className="propertydetails-el-357" />
              </div>
              <textarea name="Message" value={formData.Message} onChange={handleChange} placeholder="Message" rows={4} className="propertydetails-el-358"></textarea>
              <button disabled={status === 'Sending...'} className="propertydetails-el-359">
                <Calendar className="propertydetails-el-360" /> {status === 'Sending...' ? 'Sending...' : 'Request Tour'}
              </button>
              {status && (
                <p className={`contact-status ${status.includes('Success') ? 'status-success' : (status.includes('Failed') ? 'status-error' : 'status-default')}`}>{status}</p>
              )}
              <button type="button" className="propertydetails-el-361">
                <Phone className="propertydetails-el-362" /> Contact Agent
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
}
