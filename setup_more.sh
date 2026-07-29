#!/bin/bash
cat << 'INNER' > src/pages/Contact.tsx
import { motion } from 'framer-motion';
import { MapPin, Phone, Mail, Send } from 'lucide-react';
import { companyInfo } from '@/data/dummyData';
import { useState } from 'react';

export default function Contact() {
  const [status, setStatus] = useState('');

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    setStatus('Sending...');
    // Simulate API call to Google Apps Script
    setTimeout(() => {
      setStatus('Success! Your message has been sent.');
    }, 1500);
  };

  return (
    <div className="pt-32 pb-24 px-6 bg-background min-h-screen">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-16">
          <h1 className="text-4xl md:text-5xl font-serif font-bold text-primary mb-6">Contact Us</h1>
          <p className="text-primary/70 max-w-2xl mx-auto text-lg">
            We are here to assist you with any inquiries. Reach out to our dedicated team of professionals today.
          </p>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-12">
          {/* Contact Form */}
          <motion.div
            initial={{ opacity: 0, x: -20 }}
            animate={{ opacity: 1, x: 0 }}
            className="bg-white p-8 md:p-12 rounded-3xl shadow-xl border border-slate-100"
          >
            <h2 className="text-2xl font-serif font-bold text-primary mb-8">Send a Message</h2>
            <form onSubmit={handleSubmit} className="space-y-6">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <input required type="text" placeholder="First Name" className="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:border-primary transition-colors" />
                <input required type="text" placeholder="Last Name" className="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:border-primary transition-colors" />
              </div>
              <input required type="email" placeholder="Email Address" className="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:border-primary transition-colors" />
              <input required type="tel" placeholder="Phone Number" className="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:border-primary transition-colors" />
              <textarea required placeholder="Your Message" rows={5} className="w-full p-4 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:border-primary transition-colors resize-none"></textarea>
              <button disabled={status === 'Sending...'} className="w-full bg-primary text-white font-bold py-4 rounded-xl flex items-center justify-center gap-2 hover:bg-primary/90 transition-all disabled:opacity-70">
                <Send className="w-5 h-5" /> {status === 'Sending...' ? 'Sending...' : 'Send Message'}
              </button>
              {status === 'Success! Your message has been sent.' && (
                <p className="text-green-600 text-center font-medium">{status}</p>
              )}
            </form>
          </motion.div>

          {/* Contact Info */}
          <motion.div
             initial={{ opacity: 0, x: 20 }}
             animate={{ opacity: 1, x: 0 }}
             className="space-y-8"
          >
            <div className="bg-primary text-white p-8 rounded-3xl shadow-xl">
              <h3 className="text-2xl font-serif font-bold mb-8">Contact Information</h3>
              <div className="space-y-6">
                <div className="flex items-start gap-4">
                  <div className="p-3 bg-white/10 rounded-full"><MapPin className="w-6 h-6 text-accent" /></div>
                  <div>
                    <h4 className="font-semibold text-lg mb-1">Office Address</h4>
                    <p className="text-white/70 leading-relaxed">{companyInfo.address}</p>
                  </div>
                </div>
                <div className="flex items-start gap-4">
                  <div className="p-3 bg-white/10 rounded-full"><Phone className="w-6 h-6 text-accent" /></div>
                  <div>
                    <h4 className="font-semibold text-lg mb-1">Phone</h4>
                    <p className="text-white/70">{companyInfo.phone}</p>
                  </div>
                </div>
                <div className="flex items-start gap-4">
                  <div className="p-3 bg-white/10 rounded-full"><Mail className="w-6 h-6 text-accent" /></div>
                  <div>
                    <h4 className="font-semibold text-lg mb-1">Email</h4>
                    <p className="text-white/70">{companyInfo.email}</p>
                  </div>
                </div>
              </div>
            </div>

            <div className="h-64 bg-slate-200 rounded-3xl flex items-center justify-center border border-slate-300 overflow-hidden relative">
               <img src="https://images.unsplash.com/photo-1524661135-423995f22d0b?auto=format&fit=crop&q=80" alt="Map View" className="absolute inset-0 w-full h-full object-cover opacity-50 grayscale" />
               <div className="relative z-10 bg-white/90 backdrop-blur px-6 py-3 rounded-xl shadow-lg font-medium text-primary">
                 Interactive Map Placeholder
               </div>
            </div>
          </motion.div>
        </div>
      </div>
    </div>
  );
}
INNER

cat << 'INNER' > src/pages/Login.tsx
import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { Building, Mail, Lock, LogIn } from 'lucide-react';
import { motion } from 'framer-motion';

export default function Login() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const navigate = useNavigate();

  const handleLogin = (e: React.FormEvent) => {
    e.preventDefault();
    // Dummy login
    navigate('/dashboard');
  };

  return (
    <div className="min-h-screen flex bg-background">
      <div className="w-full lg:w-1/2 flex items-center justify-center p-6 sm:p-12">
        <motion.div 
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          className="w-full max-w-md bg-white p-10 rounded-3xl shadow-xl border border-slate-100"
        >
          <div className="flex items-center gap-2 mb-8 justify-center">
            <Building className="w-8 h-8 text-primary" />
            <span className="font-serif text-2xl font-bold tracking-tight text-primary">
              Elite Prime
            </span>
          </div>
          
          <h1 className="text-3xl font-serif font-bold text-primary text-center mb-2">Welcome Back</h1>
          <p className="text-primary/60 text-center mb-8">Please enter your details to sign in.</p>

          <form onSubmit={handleLogin} className="space-y-5">
            <div className="relative">
              <Mail className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-primary/40" />
              <input 
                type="email" 
                required
                value={email}
                onChange={e => setEmail(e.target.value)}
                placeholder="Email Address" 
                className="w-full pl-12 pr-4 py-4 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:border-primary transition-colors" 
              />
            </div>
            <div className="relative">
              <Lock className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-primary/40" />
              <input 
                type="password" 
                required
                value={password}
                onChange={e => setPassword(e.target.value)}
                placeholder="Password" 
                className="w-full pl-12 pr-4 py-4 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:border-primary transition-colors" 
              />
            </div>
            <div className="flex justify-end">
              <a href="#" className="text-sm font-medium text-primary hover:text-accent transition-colors">Forgot Password?</a>
            </div>
            <button type="submit" className="w-full bg-primary text-white font-bold py-4 rounded-xl flex items-center justify-center gap-2 hover:bg-primary/90 transition-all">
              <LogIn className="w-5 h-5" /> Sign In
            </button>
            
            <p className="text-center text-primary/60 mt-6">
              Don't have an account? <Link to="/register" className="text-primary font-bold hover:text-accent transition-colors">Register</Link>
            </p>
          </form>
        </motion.div>
      </div>
      <div className="hidden lg:block w-1/2 relative">
         <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&q=80" alt="Login Background" className="w-full h-full object-cover" />
         <div className="absolute inset-0 bg-primary/40 mix-blend-multiply" />
      </div>
    </div>
  );
}
INNER

cat << 'INNER' > src/pages/Register.tsx
import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { Building, Mail, Lock, UserPlus, User } from 'lucide-react';
import { motion } from 'framer-motion';

export default function Register() {
  const navigate = useNavigate();

  const handleRegister = (e: React.FormEvent) => {
    e.preventDefault();
    navigate('/dashboard');
  };

  return (
    <div className="min-h-screen flex bg-background">
      <div className="w-full lg:w-1/2 flex items-center justify-center p-6 sm:p-12">
        <motion.div 
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          className="w-full max-w-md bg-white p-10 rounded-3xl shadow-xl border border-slate-100"
        >
          <div className="flex items-center gap-2 mb-8 justify-center">
            <Building className="w-8 h-8 text-primary" />
            <span className="font-serif text-2xl font-bold tracking-tight text-primary">
              Elite Prime
            </span>
          </div>
          
          <h1 className="text-3xl font-serif font-bold text-primary text-center mb-2">Create Account</h1>
          <p className="text-primary/60 text-center mb-8">Join us to save your favorite properties.</p>

          <form onSubmit={handleRegister} className="space-y-5">
            <div className="relative">
              <User className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-primary/40" />
              <input 
                type="text" 
                required
                placeholder="Full Name" 
                className="w-full pl-12 pr-4 py-4 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:border-primary transition-colors" 
              />
            </div>
            <div className="relative">
              <Mail className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-primary/40" />
              <input 
                type="email" 
                required
                placeholder="Email Address" 
                className="w-full pl-12 pr-4 py-4 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:border-primary transition-colors" 
              />
            </div>
            <div className="relative">
              <Lock className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-primary/40" />
              <input 
                type="password" 
                required
                placeholder="Password" 
                className="w-full pl-12 pr-4 py-4 bg-slate-50 border border-slate-200 rounded-xl focus:outline-none focus:border-primary transition-colors" 
              />
            </div>
            <button type="submit" className="w-full bg-primary text-white font-bold py-4 rounded-xl flex items-center justify-center gap-2 hover:bg-primary/90 transition-all mt-4">
              <UserPlus className="w-5 h-5" /> Register
            </button>
            
            <p className="text-center text-primary/60 mt-6">
              Already have an account? <Link to="/login" className="text-primary font-bold hover:text-accent transition-colors">Sign In</Link>
            </p>
          </form>
        </motion.div>
      </div>
      <div className="hidden lg:block w-1/2 relative">
         <img src="https://images.unsplash.com/photo-1600210492486-724fe5c67fb0?auto=format&fit=crop&q=80" alt="Register Background" className="w-full h-full object-cover" />
         <div className="absolute inset-0 bg-primary/40 mix-blend-multiply" />
      </div>
    </div>
  );
}
INNER

cat << 'INNER' > src/pages/Dashboard.tsx
import { motion } from 'framer-motion';
import { User, Heart, Calendar, LogOut } from 'lucide-react';
import { Link, useNavigate } from 'react-router-dom';

export default function Dashboard() {
  const navigate = useNavigate();

  const handleLogout = () => {
    navigate('/');
  };

  return (
    <div className="pt-32 pb-24 px-6 bg-background min-h-screen">
      <div className="max-w-7xl mx-auto flex flex-col md:flex-row gap-8">
        {/* Sidebar */}
        <div className="w-full md:w-64 bg-white rounded-2xl shadow-sm border border-slate-100 p-6 h-fit shrink-0">
          <div className="text-center mb-8 pb-8 border-b border-slate-100">
            <div className="w-20 h-20 mx-auto bg-slate-100 rounded-full flex items-center justify-center mb-4">
              <User className="w-10 h-10 text-primary/50" />
            </div>
            <h3 className="font-serif font-bold text-xl text-primary">Demo User</h3>
            <p className="text-primary/60 text-sm">user@example.com</p>
          </div>
          
          <nav className="space-y-2">
            <button className="w-full flex items-center gap-3 px-4 py-3 bg-primary text-white rounded-lg font-medium">
              <User className="w-5 h-5" /> Profile
            </button>
            <button className="w-full flex items-center gap-3 px-4 py-3 text-primary/70 hover:bg-slate-50 hover:text-primary rounded-lg font-medium transition-colors">
              <Heart className="w-5 h-5" /> Saved Properties
            </button>
            <button className="w-full flex items-center gap-3 px-4 py-3 text-primary/70 hover:bg-slate-50 hover:text-primary rounded-lg font-medium transition-colors">
              <Calendar className="w-5 h-5" /> Appointments
            </button>
            <button onClick={handleLogout} className="w-full flex items-center gap-3 px-4 py-3 text-red-500 hover:bg-red-50 rounded-lg font-medium transition-colors mt-8">
              <LogOut className="w-5 h-5" /> Sign Out
            </button>
          </nav>
        </div>

        {/* Content */}
        <div className="flex-1 space-y-8">
          <div className="bg-white rounded-2xl shadow-sm border border-slate-100 p-8">
             <h2 className="text-2xl font-serif font-bold text-primary mb-6">Profile Information</h2>
             <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                  <label className="block text-sm font-medium text-primary/70 mb-2">Full Name</label>
                  <input type="text" defaultValue="Demo User" className="w-full p-3 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:border-primary" />
                </div>
                <div>
                  <label className="block text-sm font-medium text-primary/70 mb-2">Email</label>
                  <input type="email" defaultValue="user@example.com" disabled className="w-full p-3 bg-slate-100 border border-slate-200 rounded-lg text-primary/50 cursor-not-allowed" />
                </div>
                <div>
                  <label className="block text-sm font-medium text-primary/70 mb-2">Phone</label>
                  <input type="tel" placeholder="+965 XXXX XXXX" className="w-full p-3 bg-slate-50 border border-slate-200 rounded-lg focus:outline-none focus:border-primary" />
                </div>
             </div>
             <button className="mt-8 bg-primary text-white px-6 py-3 rounded-lg font-medium hover:bg-primary/90 transition-colors">
               Save Changes
             </button>
          </div>

          <div className="bg-white rounded-2xl shadow-sm border border-slate-100 p-8">
             <h2 className="text-2xl font-serif font-bold text-primary mb-6">Recent Activity</h2>
             <div className="text-center py-12 text-primary/50">
               <Calendar className="w-12 h-12 mx-auto mb-4 opacity-20" />
               <p>No recent appointments or activity.</p>
             </div>
          </div>
        </div>
      </div>
    </div>
  );
}
INNER
