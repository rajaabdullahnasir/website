import { Shield, Linkedin, Twitter, Facebook, Instagram, ChevronDown, ChevronUp, MapPin, Mail } from 'lucide-react';
import { Link } from 'react-router-dom';
import { useState } from 'react';
import { complianceData } from '../data/complianceData';

export default function Footer() {
  const [showAllCompliance, setShowAllCompliance] = useState(false);
  const displayedCompliance = showAllCompliance ? complianceData : complianceData.slice(0, 4);

  return (
    <footer className="bg-white py-16 border-t border-gray-200 relative z-10">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-12">
          <div className="flex items-center gap-2 mb-4">
            <Shield className="w-8 h-8 text-teal-400" />
            <span className="text-2xl font-bold tracking-tight text-[#0B2545]">iSeeWaves</span>
          </div>
          <p className="text-gray-600 max-w-md leading-relaxed mb-6">
            Makers of MyESI, an automated software supply chain security and DevSecOps platform.
          </p>
          <div className="flex gap-4">
            <a href="https://www.linkedin.com/company/iseewaves" className="w-10 h-10 rounded-full glass-card flex items-center justify-center text-gray-600 hover:text-blue-500 transition-colors">
              <Linkedin className="w-5 h-5" />
            </a>
            <a href="https://www.facebook.com/iseewaves.pk" className="w-10 h-10 rounded-full glass-card flex items-center justify-center text-gray-600 hover:text-blue-600 transition-colors">
              <Facebook className="w-5 h-5" />
            </a>
            <a href="https://www.instagram.com/iseewaves.pk" className="w-10 h-10 rounded-full glass-card flex items-center justify-center text-gray-600 hover:text-pink-500 transition-colors">
              <Instagram className="w-5 h-5" />
            </a>
            <a href="https://x.com/iseewaves_" className="w-10 h-10 rounded-full glass-card flex items-center justify-center text-gray-600 hover:text-blue-400 transition-colors">
              <Twitter className="w-5 h-5" />
            </a>
          </div>
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-10 mb-12">
          <div>
            <h4 className="text-[#0B2545] font-semibold mb-6">Partners</h4>
            <ul className="space-y-4 text-sm text-gray-600">
              <li><Link to="/partners/become-a-partner" className="hover:text-teal-400 transition-colors">Become a partner</Link></li>
              <li><Link to="/partners/find-a-partner" className="hover:text-teal-400 transition-colors">Find a partner</Link></li>
              <li><Link to="/partners/portal" className="hover:text-teal-400 transition-colors">Partner portal</Link></li>
              <li><Link to="/partners/programs" className="hover:text-teal-400 transition-colors">Partner programs</Link></li>
            </ul>
          </div>

          <div>
            <h4 className="text-[#0B2545] font-semibold mb-6">Resources</h4>
            <ul className="space-y-4 text-sm text-gray-600">
              <li><Link to="/services" className="hover:text-teal-400 transition-colors">Services</Link></li>
              <li><Link to="/myesi#support" className="hover:text-teal-400 transition-colors">Technical support</Link></li>
              <li><Link to="/resources/training" className="hover:text-teal-400 transition-colors">Training and certifications</Link></li>
              <li><Link to="/resources/documentation" className="hover:text-teal-400 transition-colors">Product documentation</Link></li>
              <li><Link to="/resources/community" className="hover:text-teal-400 transition-colors">Customer community</Link></li>
              <li><Link to="/resources/trust" className="hover:text-teal-400 transition-colors">myESI Trust</Link></li>
              <li><Link to="/reports" className="hover:text-teal-400 transition-colors">Reports and whitepapers</Link></li>
            </ul>
          </div>

          <div>
            <h4 className="text-[#0B2545] font-semibold mb-6">Company</h4>
            <ul className="space-y-4 text-sm text-gray-600 mb-4">
              <li><Link to="/about" className="hover:text-teal-400 transition-colors">About us</Link></li>
              <li><Link to="/company/executive-team" className="hover:text-teal-400 transition-colors">Executive team</Link></li>
              <li><Link to="/company/investor-relations" className="hover:text-teal-400 transition-colors">Investor relations</Link></li>
              <li><Link to="/pca" className="hover:text-teal-400 transition-colors">Pakistan Cybersecurity Alliance</Link></li>
            </ul>
            <h5 id="compliance" className="text-[#0B2545] font-semibold mb-3 text-sm scroll-mt-32">Compliances</h5>
            <ul className="space-y-3 text-sm text-gray-600">
              {displayedCompliance.map((comp) => (
                <li key={comp.id}>
                  <Link to={`/compliance/${comp.id}`} className="hover:text-teal-400 transition-colors">
                    {comp.title}
                  </Link>
                </li>
              ))}
              <li>
                <button
                  onClick={() => setShowAllCompliance(!showAllCompliance)}
                  className="text-teal-400 hover:text-teal-300 transition-colors flex items-center gap-1 mt-1 font-medium"
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
            <h4 className="text-[#0B2545] font-semibold mb-6">Connect</h4>
            <ul className="space-y-4 text-sm text-gray-600">
              <li><Link to="/contact" className="hover:text-teal-400 transition-colors">Contact us</Link></li>
              <li><Link to="/demo" className="hover:text-teal-400 transition-colors">Try our product</Link></li>
              <li><a href="mailto:info@iseewaves.pk?subject=Chat%20with%20Sales" className="hover:text-teal-400 transition-colors">Chat with sales</a></li>
              <li><Link to="/careers" className="hover:text-teal-400 transition-colors">Join us</Link></li>
            </ul>
          </div>
        </div>

        <div className="pt-8 pb-8 border-t border-gray-200 grid grid-cols-1 md:grid-cols-3 gap-6">
          <div className="flex items-start gap-3">
            <MapPin className="w-5 h-5 text-teal-500 mt-0.5 shrink-0" />
            <div>
              <div className="text-xs text-gray-500 uppercase tracking-wide mb-1">Office - Islamabad/Rawalpindi</div>
              <div className="text-sm text-gray-600 leading-relaxed">
                NICAT, NASTP Alpha (Alpha Techno Square), Old Airport Road, Old Chaklala Cantt, Rawalpindi, Pakistan
              </div>
            </div>
          </div>
          <div className="flex items-start gap-3">
            <MapPin className="w-5 h-5 text-teal-500 mt-0.5 shrink-0" />
            <div>
              <div className="text-xs text-gray-500 uppercase tracking-wide mb-1">Office - Abbottabad</div>
              <div className="text-sm text-gray-600 leading-relaxed">Abbottabad, Pakistan</div>
            </div>
          </div>
          <div className="flex items-start gap-3">
            <Mail className="w-5 h-5 text-teal-500 mt-0.5 shrink-0" />
            <div>
              <div className="text-xs text-gray-500 uppercase tracking-wide mb-1">Email</div>
              <a href="mailto:info@iseewaves.pk" className="text-sm text-gray-600 hover:text-teal-400 transition-colors">
                info@iseewaves.pk
              </a>
            </div>
          </div>
        </div>

        <div className="pt-8 border-t border-gray-200 flex flex-col md:flex-row items-center justify-between text-sm text-gray-600 gap-4">
          <p>Copyright &copy; 2026 iSeeWaves. All rights reserved.</p>
          <div className="flex flex-wrap items-center justify-center gap-x-6 gap-y-2">
            <Link to="/privacy" className="hover:text-teal-400 transition-colors">Privacy Policy</Link>
            <Link to="/terms" className="hover:text-teal-400 transition-colors">Terms of Service</Link>
            <Link to="/cookies" className="hover:text-teal-400 transition-colors">Cookie Policy</Link>
            <Link to="/legal" className="hover:text-teal-400 transition-colors">Legal Notice</Link>
          </div>
        </div>
      </div>
    </footer>
  );
}
