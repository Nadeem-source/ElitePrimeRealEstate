import { useState, useEffect } from 'react';
import { Link, useLocation } from 'react-router-dom';
import { Menu, X, User, Building } from 'lucide-react';
import { companyInfo } from '@/src/data/dummyData';

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
    <nav className="navbar-el-51">
      <Link to="/" className="navbar-el-52">
        <div className="navbar-el-53">
          <span className="navbar-el-54">E</span>
        </div>
        <div className="navbar-el-55">
          <span className="navbar-el-56">
            ELITE PRIME
          </span>
          <span className="navbar-el-57">Properties</span>
        </div>
      </Link>

      {/* Desktop Nav */}
      <div className="navbar-el-58">
        {navLinks.map((link) => (
          <Link
            key={link.name}
            to={link.path}
            className={`nav-link ${location.pathname === link.path ? 'nav-link-active' : ''}`}
          >
            {link.name}
          </Link>
        ))}
      </div>

      <div className="navbar-el-59">
        <Link to="/login" className="navbar-el-60">
          Login
        </Link>
        <Link
          to="/contact"
          className="navbar-el-61"
        >
          Enquire Now
        </Link>
      </div>

      {/* Mobile Menu Button */}
      <div className="navbar-el-62">
        <button 
          onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
        >
          {isMobileMenuOpen ? (
            <X className="navbar-el-63" />
          ) : (
            <Menu className="navbar-el-64" />
          )}
        </button>
      </div>

      {/* Mobile Nav */}
      {isMobileMenuOpen && (
        <div className="navbar-el-65">
          <div className="navbar-el-66">
            {navLinks.map((link) => (
              <Link
                key={link.name}
                to={link.path}
                onClick={() => setIsMobileMenuOpen(false)}
                className="navbar-el-67"
              >
                {link.name}
              </Link>
            ))}
            <Link
              to="/login"
              onClick={() => setIsMobileMenuOpen(false)}
              className="navbar-el-68"
            >
              <User className="navbar-el-69" />
              Sign In / Register
            </Link>
          </div>
        </div>
      )}
    </nav>
  );
}
