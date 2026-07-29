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
const Projects = () => <div className="app-el-1"><h1 className="app-el-2">Projects</h1><p>Our upcoming luxury projects will be showcased here.</p></div>;
const Blog = () => <div className="app-el-3"><h1 className="app-el-4">Blog</h1><p>Latest insights and news from the real estate world.</p></div>;
const Testimonials = () => <div className="app-el-5"><h1 className="app-el-6">Testimonials</h1><p>Hear from our esteemed clients.</p></div>;
const FAQs = () => <div className="app-el-7"><h1 className="app-el-8">FAQs</h1><p>Frequently asked questions.</p></div>;
const PrivacyPolicy = () => <div className="app-el-9"><h1 className="app-el-10">Privacy Policy</h1><p>Our privacy terms and conditions.</p></div>;
const Terms = () => <div className="app-el-11"><h1 className="app-el-12">Terms of Service</h1><p>Legal terms and service usage rules.</p></div>;
const NotFound = () => <div className="app-el-13"><h1 className="app-el-14">404</h1><p className="app-el-15">Page not found.</p></div>;

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
