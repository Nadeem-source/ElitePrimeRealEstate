import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { Building, Mail, Lock, LogIn } from 'lucide-react';
import { motion } from 'framer-motion';
import { loginWithGoogle } from '@/src/lib/firebase';
import { signInWithEmailAndPassword } from 'firebase/auth';
import { auth } from '@/src/lib/firebase';

export default function Login() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const navigate = useNavigate();

  const handleEmailLogin = async (e) => {
    e.preventDefault();
    try {
      await signInWithEmailAndPassword(auth, email, password);
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
    <div className="login-el-239">
      <div className="login-el-240">
        <motion.div 
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          className="login-el-241"
        >
          <div className="login-el-242">
            <Building className="login-el-243" />
            <span className="login-el-244">
              Elite Prime
            </span>
          </div>
          
          <h1 className="login-el-245">Welcome Back</h1>
          <p className="login-el-246">Please enter your details to sign in.</p>

          {error && <div className="login-el-247">{error}</div>}

          <form onSubmit={handleEmailLogin} className="login-el-248">
            <div className="login-el-249">
              <Mail className="login-el-250" />
              <input 
                type="email" 
                required
                value={email}
                onChange={e => setEmail(e.target.value)}
                placeholder="Email Address" 
                className="login-el-251" 
              />
            </div>
            <div className="login-el-252">
              <Lock className="login-el-253" />
              <input 
                type="password" 
                required
                value={password}
                onChange={e => setPassword(e.target.value)}
                placeholder="Password" 
                className="login-el-254" 
              />
            </div>
            <div className="login-el-255">
              <a href="#" className="login-el-256">Forgot Password?</a>
            </div>
            <button type="submit" className="login-el-257">
              <LogIn className="login-el-258" /> Sign In
            </button>
            
            <div className="login-el-259">
              <div className="login-el-260">
                <div className="login-el-261"></div>
              </div>
              <div className="login-el-262">
                <span className="login-el-263">Or continue with</span>
              </div>
            </div>

            <button type="button" onClick={handleGoogleLogin} className="login-el-264">
              <svg className="login-el-265" viewBox="0 0 24 24">
                <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4"/>
                <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/>
                <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05"/>
                <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/>
              </svg>
              Google
            </button>

            <p className="login-el-266">
              Don't have an account? <Link to="/register" className="login-el-267">Register</Link>
            </p>
          </form>
        </motion.div>
      </div>
      <div className="login-el-268">
         <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&q=80" alt="Login Background" className="login-el-269" />
         <div className="login-el-270" />
      </div>
    </div>
  );
}
