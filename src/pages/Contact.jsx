import { motion } from 'framer-motion';
import { MapPin, Phone, Mail, Send } from 'lucide-react';
import { companyInfo } from '@/src/data/dummyData';
import React, { useState } from 'react';
import { submitToGoogleSheets } from '@/src/lib/submitForm';

export default function Contact() {
  const [status, setStatus] = useState('');
  const [formData, setFormData] = useState({
    Name: '',
    Phone: '',
    Email: '',
    Subject: 'General Inquiry',
    Message: ''
  });

  const handleSubmit = async (e) => {
    e.preventDefault();
    setStatus('Sending...');
    try {
      await submitToGoogleSheets(formData, 'Contact Form');
      setStatus('Success! Your message has been sent.');
      setFormData({ Name: '', Phone: '', Email: '', Subject: 'General Inquiry', Message: '' });
    } catch (error) {
      setStatus('Failed to send message. Please try again.');
    }
  };

  const handleChange = (e) => {
    setFormData(prev => ({ ...prev, [e.target.name]: e.target.value }));
  };

  return (
    <div className="contact-el-110">
      <div className="contact-el-111">
        <div className="contact-el-112">
          <h1 className="contact-el-113">Contact Us</h1>
          <p className="contact-el-114">
            We are here to assist you with any inquiries. Reach out to our dedicated team of professionals today.
          </p>
        </div>

        <div className="contact-el-115">
          {/* Contact Form */}
          <motion.div
            initial={{ opacity: 0, x: -20 }}
            animate={{ opacity: 1, x: 0 }}
            className="contact-el-116"
          >
            <h2 className="contact-el-117">Send a Message</h2>
            <form onSubmit={handleSubmit} className="contact-el-118">
              <div className="contact-el-119">
                <input required name="Name" value={formData.Name} onChange={handleChange} type="text" placeholder="Full Name" className="contact-el-120" />
                <input required name="Phone" value={formData.Phone} onChange={handleChange} type="tel" placeholder="Phone Number" className="contact-el-121" />
              </div>
              <input required name="Email" value={formData.Email} onChange={handleChange} type="email" placeholder="Email Address" className="contact-el-122" />
              <textarea required name="Message" value={formData.Message} onChange={handleChange} placeholder="Your Message" rows={5} className="contact-el-123"></textarea>
              <button disabled={status === 'Sending...'} className="contact-el-124">
                <Send className="contact-el-125" /> {status === 'Sending...' ? 'Sending...' : 'Send Message'}
              </button>
              {status && (
                <p className={`contact-status ${status.includes('Success') ? 'status-success' : (status.includes('Failed') ? 'status-error' : 'status-default')}`}>{status}</p>
              )}
            </form>
          </motion.div>

          {/* Contact Info */}
          <motion.div
             initial={{ opacity: 0, x: 20 }}
             animate={{ opacity: 1, x: 0 }}
             className="contact-el-126"
          >
            <div className="contact-el-127">
              <h3 className="contact-el-128">Contact Information</h3>
              <div className="contact-el-129">
                <div className="contact-el-130">
                  <div className="contact-el-131"><MapPin className="contact-el-132" /></div>
                  <div>
                    <h4 className="contact-el-133">Office Address</h4>
                    <p className="contact-el-134">{companyInfo.address}</p>
                  </div>
                </div>
                <div className="contact-el-135">
                  <div className="contact-el-136"><Phone className="contact-el-137" /></div>
                  <div>
                    <h4 className="contact-el-138">Phone</h4>
                    <p className="contact-el-139">{companyInfo.phone}</p>
                  </div>
                </div>
                <div className="contact-el-140">
                  <div className="contact-el-141"><Mail className="contact-el-142" /></div>
                  <div>
                    <h4 className="contact-el-143">Email</h4>
                    <p className="contact-el-144">{companyInfo.email}</p>
                  </div>
                </div>
              </div>
            </div>

            <div className="contact-el-145">
               <img src="https://images.unsplash.com/photo-1524661135-423995f22d0b?auto=format&fit=crop&q=80" alt="Map View" className="contact-el-146" />
               <div className="contact-el-147">
                 Interactive Map Placeholder
               </div>
            </div>
          </motion.div>
        </div>
      </div>
    </div>
  );
}
