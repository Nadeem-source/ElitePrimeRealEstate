#!/bin/bash
cat << 'INNER' > src/App.tsx
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { Layout } from './components/layout/Layout';
import Home from './pages/Home';
import Properties from './pages/Properties';
import PropertyDetails from './pages/PropertyDetails';
import Agents from './pages/Agents';
import About from './pages/About';
import Contact from './pages/Contact';
import Login from './pages/Login';
import Register from './pages/Register';
import Dashboard from './pages/Dashboard';

// Placeholder Pages
const Projects = () => <div className="pt-32 pb-24 text-center min-h-screen"><h1 className="text-4xl font-serif font-bold mb-4">Projects</h1><p>Our upcoming luxury projects will be showcased here.</p></div>;
const Blog = () => <div className="pt-32 pb-24 text-center min-h-screen"><h1 className="text-4xl font-serif font-bold mb-4">Blog</h1><p>Latest insights and news from the real estate world.</p></div>;
const Testimonials = () => <div className="pt-32 pb-24 text-center min-h-screen"><h1 className="text-4xl font-serif font-bold mb-4">Testimonials</h1><p>Hear from our esteemed clients.</p></div>;
const FAQs = () => <div className="pt-32 pb-24 text-center min-h-screen"><h1 className="text-4xl font-serif font-bold mb-4">FAQs</h1><p>Frequently asked questions.</p></div>;
const PrivacyPolicy = () => <div className="pt-32 pb-24 text-center min-h-screen"><h1 className="text-4xl font-serif font-bold mb-4">Privacy Policy</h1><p>Our privacy terms and conditions.</p></div>;
const Terms = () => <div className="pt-32 pb-24 text-center min-h-screen"><h1 className="text-4xl font-serif font-bold mb-4">Terms of Service</h1><p>Legal terms and service usage rules.</p></div>;
const NotFound = () => <div className="pt-32 pb-24 text-center min-h-screen"><h1 className="text-6xl font-serif font-bold mb-4 text-accent">404</h1><p className="text-xl">Page not found.</p></div>;

export default function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Layout />}>
          <Route index element={<Home />} />
          <Route path="properties" element={<Properties />} />
          <Route path="properties/:id" element={<PropertyDetails />} />
          <Route path="agents" element={<Agents />} />
          <Route path="about" element={<About />} />
          <Route path="contact" element={<Contact />} />
          <Route path="login" element={<Login />} />
          <Route path="register" element={<Register />} />
          <Route path="dashboard" element={<Dashboard />} />
          
          <Route path="projects" element={<Projects />} />
          <Route path="blog" element={<Blog />} />
          <Route path="testimonials" element={<Testimonials />} />
          <Route path="faqs" element={<FAQs />} />
          <Route path="privacy-policy" element={<PrivacyPolicy />} />
          <Route path="terms" element={<Terms />} />
          <Route path="*" element={<NotFound />} />
        </Route>
      </Routes>
    </Router>
  );
}
INNER
