import { motion } from 'framer-motion';
import { User, Heart, Calendar, LogOut } from 'lucide-react';
import { Link, useNavigate } from 'react-router-dom';
import { useEffect, useState } from 'react';
import { auth, logout } from '@/src/lib/firebase';
import { onAuthStateChanged } from 'firebase/auth';

export default function Dashboard() {
  const navigate = useNavigate();
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const unsubscribe = onAuthStateChanged(auth, (currentUser) => {
      if (!currentUser) {
        navigate('/login');
      } else {
        setUser(currentUser);
      }
      setLoading(false);
    });

    return () => unsubscribe();
  }, [navigate]);

  const handleLogout = async () => {
    try {
      await logout();
      navigate('/');
    } catch (error) {
      console.error(error);
    }
  };

  if (loading) {
    return <div className="dashboard-el-148"><div className="dashboard-el-149"></div></div>;
  }

  if (!user) return null;

  return (
    <div className="dashboard-el-150">
      <div className="dashboard-el-151">
        {/* Sidebar */}
        <div className="dashboard-el-152">
          <div className="dashboard-el-153">
            <div className="dashboard-el-154">
              {user.photoURL ? (
                <img src={user.photoURL} alt="Profile" className="dashboard-el-155" />
              ) : (
                <User className="dashboard-el-156" />
              )}
            </div>
            <h3 className="dashboard-el-157">{user.displayName || 'User'}</h3>
            <p className="dashboard-el-158">{user.email}</p>
          </div>
          
          <nav className="dashboard-el-159">
            <button className="dashboard-el-160">
              <User className="dashboard-el-161" /> Profile
            </button>
            <button className="dashboard-el-162">
              <Heart className="dashboard-el-163" /> Saved Properties
            </button>
            <button className="dashboard-el-164">
              <Calendar className="dashboard-el-165" /> Appointments
            </button>
            <button onClick={handleLogout} className="dashboard-el-166">
              <LogOut className="dashboard-el-167" /> Sign Out
            </button>
          </nav>
        </div>

        {/* Content */}
        <div className="dashboard-el-168">
          <div className="dashboard-el-169">
             <h2 className="dashboard-el-170">Profile Information</h2>
             <div className="dashboard-el-171">
                <div>
                  <label className="dashboard-el-172">Full Name</label>
                  <input type="text" defaultValue={user.displayName || ''} className="dashboard-el-173" />
                </div>
                <div>
                  <label className="dashboard-el-174">Email</label>
                  <input type="email" defaultValue={user.email || ''} disabled className="dashboard-el-175" />
                </div>
                <div>
                  <label className="dashboard-el-176">Phone</label>
                  <input type="tel" placeholder="+965 XXXX XXXX" className="dashboard-el-177" />
                </div>
             </div>
             <button className="dashboard-el-178">
               Save Changes
             </button>
          </div>

          <div className="dashboard-el-179">
             <h2 className="dashboard-el-180">Recent Activity</h2>
             <div className="dashboard-el-181">
               <Calendar className="dashboard-el-182" />
               <p>No recent appointments or activity.</p>
             </div>
          </div>
        </div>
      </div>
    </div>
  );
}
