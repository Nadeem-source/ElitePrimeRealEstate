import { Link } from 'react-router-dom';
import { companyInfo } from '@/src/data/dummyData';
import { Building, Phone, Mail, MapPin, Instagram, Linkedin, Twitter, Facebook } from 'lucide-react';

export function Footer() {
  return (
    <footer className="footer-el-16">
      <div className="footer-el-17">
        <div>
          <Link to="/" className="footer-el-18">
            <div className="footer-el-19">
              <span className="footer-el-20">E</span>
            </div>
            <div className="footer-el-21">
              <span className="footer-el-22">ELITE PRIME</span>
              <span className="footer-el-23">Properties</span>
            </div>
          </Link>
          <p className="footer-el-24">
            Redefining luxury real estate in Kuwait. Discover the most exclusive properties, tailored to your distinguished lifestyle.
          </p>
          <div className="footer-el-25">
            {[Facebook, Twitter, Instagram, Linkedin].map((Icon, i) => (
              <a key={i} href="#" className="footer-el-26">
                <Icon className="footer-el-27" />
              </a>
            ))}
          </div>
        </div>

        <div>
          <h3 className="footer-el-28">Quick Links</h3>
          <ul className="footer-el-29">
            {['Home', 'About Us', 'Properties', 'Agents', 'Contact'].map((link) => (
              <li key={link}>
                <Link to={`/${link.toLowerCase().replace(' ', '-')}`} className="footer-el-30">
                  {link}
                </Link>
              </li>
            ))}
          </ul>
        </div>

        <div>
          <h3 className="footer-el-31">Contact Us</h3>
          <ul className="footer-el-32">
            <li className="footer-el-33">
              <MapPin className="footer-el-34" />
              <span>{companyInfo.address}</span>
            </li>
            <li className="footer-el-35">
              <Phone className="footer-el-36" />
              <span>{companyInfo.phone}</span>
            </li>
            <li className="footer-el-37">
              <Mail className="footer-el-38" />
              <span>{companyInfo.email}</span>
            </li>
          </ul>
        </div>

        <div>
          <h3 className="footer-el-39">Newsletter</h3>
          <p className="footer-el-40">Subscribe to receive updates on exclusive new listings.</p>
          <form className="footer-el-41" onSubmit={(e) => e.preventDefault()}>
            <input 
              type="email" 
              placeholder="Your email address" 
              className="footer-el-42"
            />
            <button className="footer-el-43">
              Subscribe
            </button>
          </form>
        </div>
      </div>

      <div className="footer-el-44">
        <p className="footer-el-45">
          © {new Date().getFullYear()} {companyInfo.name}. All rights reserved.
        </p>
        <div className="footer-el-46">
          <Link to="/privacy-policy" className="footer-el-47">Privacy Policy</Link>
          <Link to="/terms" className="footer-el-48">Terms of Service</Link>
        </div>
      </div>
    </footer>
  );
}
