import { Shield, Linkedin, Twitter, Facebook, Instagram, ChevronDown, ChevronUp } from 'lucide-react';
import { Link } from 'react-router-dom';
import { useState } from 'react';
import { complianceData } from '../data/complianceData';


export default function Footer() {
  const [showAllCompliance, setShowAllCompliance] = useState(false);
  const displayedCompliance = showAllCompliance ? complianceData : complianceData.slice(0, 5);

  return (
    <footer className="bg-black py-12 border-t border-white/10 relative z-10">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-12 mb-12">
          <div className="md:col-span-2">
            <div className="flex items-center gap-2 mb-6">
              <Shield className="w-8 h-8 text-emerald-400" />
              <span className="text-2xl font-bold tracking-tight text-white">iSeeWaves</span>
            </div>
            <p className="text-gray-400 max-w-sm leading-relaxed mb-6">
              Redefining digital security through innovation and trust. Securing enterprises, governments, and critical infrastructure worldwide.
            </p>
            <div className="flex gap-4">
              <a href="https://www.linkedin.com/company/iseewaves" className="w-10 h-10 rounded-full glass-card flex items-center justify-center text-gray-400 hover:text-blue-500 transition-colors">
                <Linkedin className="w-5 h-5" />
              </a>
              <a href="https://www.facebook.com/iseewaves.pk" className="w-10 h-10 rounded-full glass-card flex items-center justify-center text-gray-400 hover:text-blue-600 transition-colors">
                <Facebook className="w-5 h-5" />
              </a>
              <a href="https://www.instagram.com/iseewaves.pk" className="w-10 h-10 rounded-full glass-card flex items-center justify-center text-gray-400 hover:text-pink-500 transition-colors">
                <Instagram className="w-5 h-5" />
              </a>
              <a href="https://x.com/iseewaves_" className="w-10 h-10 rounded-full glass-card flex items-center justify-center text-gray-400 hover:text-blue-400 transition-colors">
                <Twitter className="w-5 h-5" />
              </a>
            
            </div>
          </div>

          <div>
            <h4 className="text-white font-semibold mb-6">Quick Links</h4>
            <ul className="space-y-4 text-sm text-gray-400">
              <li><Link to="/#about" className="hover:text-emerald-400 transition-colors">About Us</Link></li>
              <li><Link to="/#product" className="hover:text-emerald-400 transition-colors">MyESI Product</Link></li>
              <li><Link to="/#services" className="hover:text-emerald-400 transition-colors">Services</Link></li>
              <li><Link to="/#trainings" className="hover:text-emerald-400 transition-colors">Trainings</Link></li>
              <li><Link to="/news" className="hover:text-emerald-400 transition-colors">News & Insights</Link></li>
              <li><Link to="/blogs" className="hover:text-emerald-400 transition-colors">Our Blog</Link></li>       
            </ul>
          </div>

          <div>
            <h4 className="text-white font-semibold mb-6">Compliance</h4>
            <ul className="space-y-3 text-sm text-gray-400">
              {displayedCompliance.map((comp) => (
                <li key={comp.id}>
                  <Link to={`/compliance/${comp.id}`} className="hover:text-emerald-400 transition-colors">
                    {comp.title}
                  </Link>
                </li>
              ))}
              <li>
                <button 
                  onClick={() => setShowAllCompliance(!showAllCompliance)}
                  className="text-emerald-400 hover:text-emerald-300 transition-colors flex items-center gap-1 mt-2 font-medium"
                >
                  {showAllCompliance ? (
                    <>Show Less <ChevronUp className="w-4 h-4" /></>
                  ) : (
                    <>View All ({complianceData.length}) <ChevronDown className="w-4 h-4" /></>
                  )}
                </button>
              </li>
            </ul>
          </div>

          <div>
            <h4 className="text-white font-semibold mb-6">Legal</h4>
            <ul className="space-y-4 text-sm text-gray-400">
              <li><Link to="/privacy" className="hover:text-emerald-400 transition-colors">Privacy Policy</Link></li>
              <li><Link to="/terms" className="hover:text-emerald-400 transition-colors">Terms of Service</Link></li>
              <li><Link to="/cookies" className="hover:text-emerald-400 transition-colors">Cookie Policy</Link></li>
              <li><Link to="/legal" className="hover:text-emerald-400 transition-colors">Legal Notice</Link></li>
            </ul>
          </div>
        </div>

        <div className="pt-8 border-t border-white/10 flex flex-col md:flex-row items-center justify-between text-sm text-gray-500">
          <p>Copyright &copy; 2026 iSeeWaves. All rights reserved.</p>
          <p className="mt-4 md:mt-0">Designed with precision.</p>
        </div>
      </div>
    </footer>
  );
}
