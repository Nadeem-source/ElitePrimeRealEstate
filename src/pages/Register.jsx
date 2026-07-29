import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { Building, Mail, Lock, UserPlus, User } from 'lucide-react';
import { motion } from 'framer-motion';
import { loginWithGoogle } from '@/src/lib/firebase';
import { createUserWithEmailAndPassword, updateProfile } from 'firebase/auth';
import { auth } from '@/src/lib/firebase';

export default function Register() {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const navigate = useNavigate();

  const handleRegister = async (e) => {
    e.preventDefault();
    try {
      const userCred = await createUserWithEmailAndPassword(auth, email, password);
      await updateProfile(userCred.user, { displayName: name });
      navigate('/dashboard');
    } catch (err) {
      setError(err.message);
    }
  };

  const handleGoogleLogin = async () => {
    try {
      await loginWithGoogle();
      navigate('/dashboard');
    } catch (err) {
      setError(err.message);
    }
  };

  return (
    <div className="register-el-363">
      <div className="register-el-364">
        <motion.div 
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          className="register-el-365"
        >
          <div className="register-el-366">
            <Building className="register-el-367" />
            <span className="register-el-368">
              Elite Prime
            </span>
          </div>
          
          <h1 className="register-el-369">Create Account</h1>
          <p className="register-el-370">Join us to save your favorite properties.</p>

          {error && <div className="register-el-371">{error}</div>}

          <form onSubmit={handleRegister} className="register-el-372">
            <div className="register-el-373">
              <User className="register-el-374" />
              <input 
                type="text" 
                required
                value={name}
                onChange={e => setName(e.target.value)}
                placeholder="Full Name" 
                className="register-el-375" 
              />
            </div>
            <div className="register-el-376">
              <Mail className="register-el-377" />
              <input 
                type="email" 
                required
                value={email}
                onChange={e => setEmail(e.target.value)}
                placeholder="Email Address" 
                className="register-el-378" 
              />
            </div>
            <div className="register-el-379">
              <Lock className="register-el-380" />
              <input 
                type="password" 
                required
                value={password}
                onChange={e => setPassword(e.target.value)}
                placeholder="Password" 
                className="register-el-381" 
              />
            </div>
            <button type="submit" className="register-el-382">
              <UserPlus className="register-el-383" /> Register
            </button>
            
            <div className="register-el-384">
              <div className="register-el-385">
                <div className="register-el-386"></div>
              </div>
              <div className="register-el-387">
                <span className="register-el-388">Or continue with</span>
              </div>
            </div>

            <button type="button" onClick={handleGoogleLogin} className="register-el-389">
              <svg className="register-el-390" viewBox="0 0 24 24">
                <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4"/>
                <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/>
                <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05"/>
                <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/>
              </svg>
              Google
            </button>

            <p className="register-el-391">
              Already have an account? <Link to="/login" className="register-el-392">Sign In</Link>
            </p>
          </form>
        </motion.div>
      </div>
      <div className="register-el-393">
         <img src="https://images.unsplash.com/photo-1600210492486-724fe5c67fb0?auto=format&fit=crop&q=80" alt="Register Background" className="register-el-394" />
         <div className="register-el-395" />
      </div>
    </div>
  );
}
