import { motion } from 'framer-motion';
import { agents } from '@/src/data/dummyData';
import { Phone, Mail, Award, Star } from 'lucide-react';

export default function Agents() {
  return (
    <div className="agents-el-76">
      <div className="agents-el-77">
        <div className="agents-el-78">
          <span className="agents-el-79">Our Team</span>
          <h1 className="agents-el-80">Meet Our Luxury Advisors</h1>
          <p className="agents-el-81">
            Our distinguished team of real estate professionals combines local expertise with a global perspective to deliver unparalleled service.
          </p>
        </div>

        <div className="agents-el-82">
          {agents.map((agent, idx) => (
            <motion.div
              key={agent.id}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: idx * 0.1 }}
              className="agents-el-83"
            >
              <div className="agents-el-84">
                <img src={agent.image} alt={agent.name} className="agents-el-85" />
              </div>
              <div className="agents-el-86">
                <h3 className="agents-el-87">{agent.name}</h3>
                <p className="agents-el-88">{agent.designation}</p>
                
                <div className="agents-el-89">
                  <div className="agents-el-90">
                    <p className="agents-el-91">{agent.propertiesSold}</p>
                    <p className="agents-el-92">Sold</p>
                  </div>
                  <div className="agents-el-93" />
                  <div className="agents-el-94">
                    <p className="agents-el-95">
                      {agent.rating} <Star className="agents-el-96" />
                    </p>
                    <p className="agents-el-97">Rating</p>
                  </div>
                  <div className="agents-el-98" />
                  <div className="agents-el-99">
                    <p className="agents-el-100">{agent.experience.split(' ')[0]}</p>
                    <p className="agents-el-101">Years</p>
                  </div>
                </div>

                <div className="agents-el-102">
                  <a href={`tel:${agent.phone}`} className="agents-el-103">
                    <div className="agents-el-104"><Phone className="agents-el-105" /></div>
                    {agent.phone}
                  </a>
                  <a href={`mailto:${agent.email}`} className="agents-el-106">
                    <div className="agents-el-107"><Mail className="agents-el-108" /></div>
                    <span className="agents-el-109">{agent.email}</span>
                  </a>
                </div>
              </div>
            </motion.div>
          ))}
        </div>
      </div>
    </div>
  );
}
