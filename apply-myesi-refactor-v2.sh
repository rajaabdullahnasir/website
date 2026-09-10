#!/bin/bash
set -e
echo "Applying myESI product page (round 2: features, packages, support, mega-nav, footer)..."

# Remove files superseded in this round (none this time - all additive or overwritten)

mkdir -p "$(dirname "src/App.tsx")"
cat > "src/App.tsx" << 'R2FILEEOF_0'
/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

import { useEffect } from 'react';
import { BrowserRouter as Router, Routes, Route, useLocation } from 'react-router-dom';
import Navbar from './components/Navbar';
import Hero from './components/Hero';
import About from './components/About';
import Product from './components/Product';
import AuditFeatures from './components/AuditFeatures';
import Packages from './components/Packages';
import SupportSection from './components/SupportSection';
import BlogNews from './components/BlogNews';
import ContactHiring from './components/ContactHiring';
import Footer from './components/Footer';
import LegalPage from './pages/LegalPage';
import PrivacyPolicyPage from './pages/PrivacyPolicyPage';
import TermsOfServicePage from './pages/TermsOfServicePage';
import CookiePolicyPage from './pages/CookiePolicyPage';
import DemoPage from './pages/DemoPage';
import AllReportsPage from './pages/AllReportsPage';
import BlogsPage from './pages/BlogsPage';
import BlogPostPage from './pages/BlogPostPage';
import CompliancePage from './pages/CompliancePage';
import ServicesPage from './pages/ServicesPage';
import BecomePartnerPage from './pages/partners/BecomePartnerPage';
import FindPartnerPage from './pages/partners/FindPartnerPage';
import PartnerPortalPage from './pages/partners/PartnerPortalPage';
import PartnerProgramsPage from './pages/partners/PartnerProgramsPage';
import TrainingPage from './pages/resources/TrainingPage';
import DocumentationPage from './pages/resources/DocumentationPage';
import CommunityPage from './pages/resources/CommunityPage';
import TrustPage from './pages/resources/TrustPage';
import ExecutiveTeamPage from './pages/company/ExecutiveTeamPage';
import InvestorRelationsPage from './pages/company/InvestorRelationsPage';
import EventsPage from './pages/connect/EventsPage';

function ScrollToHash() {
  const { hash } = useLocation();

  useEffect(() => {
    if (hash) {
      setTimeout(() => {
        const element = document.getElementById(hash.replace('#', ''));
        if (element) {
          element.scrollIntoView({ behavior: 'smooth' });
        }
      }, 100);
    } else {
      window.scrollTo(0, 0);
    }
  }, [hash]);

  return null;
}

function Home() {
  return (
    <>
      <Hero />
      <About />
      <Product />
      <AuditFeatures />
      <Packages />
      <SupportSection />
      <BlogNews />
      <ContactHiring />
    </>
  );
}

export default function App() {
  return (
    <Router>
      <ScrollToHash />
      <div className="min-h-screen bg-[#050505] text-slate-50 font-sans selection:bg-emerald-500/30 relative overflow-hidden">
        {/* Global Background Blobs for Glassmorphism Depth */}
        <div className="fixed inset-0 z-0 pointer-events-none overflow-hidden">
          <div className="absolute top-[-10%] left-[-10%] w-[40vw] h-[40vw] rounded-full bg-emerald-600/30 mix-blend-screen filter blur-[120px] animate-pulse" style={{ animationDuration: '10s' }} />
          <div className="absolute top-[20%] right-[-5%] w-[35vw] h-[35vw] rounded-full bg-blue-600/20 mix-blend-screen filter blur-[100px] animate-pulse" style={{ animationDuration: '12s', animationDelay: '2s' }} />
          <div className="absolute bottom-[-10%] left-[20%] w-[45vw] h-[45vw] rounded-full bg-purple-600/20 mix-blend-screen filter blur-[130px] animate-pulse" style={{ animationDuration: '14s', animationDelay: '4s' }} />
        </div>

        <div className="relative z-10">
          <Navbar />
          <main>
            <Routes>
              <Route path="/" element={<Home />} />
              <Route path="/legal" element={<LegalPage />} />
              <Route path="/privacy" element={<PrivacyPolicyPage />} />
              <Route path="/terms" element={<TermsOfServicePage />} />
              <Route path="/cookies" element={<CookiePolicyPage />} />
              <Route path="/demo" element={<DemoPage />} />
              <Route path="/reports" element={<AllReportsPage />} />
              <Route path="/blogs" element={<BlogsPage />} />
              <Route path="/blogs/:id" element={<BlogPostPage />} />
              <Route path="/compliance/:id" element={<CompliancePage />} />
              <Route path="/services" element={<ServicesPage />} />
              <Route path="/partners/become-a-partner" element={<BecomePartnerPage />} />
              <Route path="/partners/find-a-partner" element={<FindPartnerPage />} />
              <Route path="/partners/portal" element={<PartnerPortalPage />} />
              <Route path="/partners/programs" element={<PartnerProgramsPage />} />
              <Route path="/resources/training" element={<TrainingPage />} />
              <Route path="/resources/documentation" element={<DocumentationPage />} />
              <Route path="/resources/community" element={<CommunityPage />} />
              <Route path="/resources/trust" element={<TrustPage />} />
              <Route path="/company/executive-team" element={<ExecutiveTeamPage />} />
              <Route path="/company/investor-relations" element={<InvestorRelationsPage />} />
              <Route path="/connect/events" element={<EventsPage />} />
            </Routes>
          </main>
          <Footer />
        </div>
      </div>
    </Router>
  );
}
R2FILEEOF_0

mkdir -p "$(dirname "src/components/About.tsx")"
cat > "src/components/About.tsx" << 'R2FILEEOF_1'
import { motion } from 'motion/react';
import { Target, ShieldCheck, Zap, Globe } from 'lucide-react';

export default function About() {
  const stats = [
    { icon: Globe, label: 'Global Reach', value: 'Worldwide' },
    { icon: Zap, label: 'Response Time', value: '< 4 Hours' },
    { icon: ShieldCheck, label: 'Support', value: '24/7 Remote' },
    { icon: Target, label: 'Focus', value: 'Innovation & Trust' },
  ];

  return (
    <section id="about" className="py-24 relative overflow-hidden">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="text-center mb-16">
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-5xl font-bold text-white mb-4"
          >
            About <span className="text-emerald-400">iSeeWaves</span>
          </motion.h2>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.2 }}
            className="text-lg text-gray-400 max-w-3xl mx-auto"
          >
            Founded by Abdullah, our CEO, we are a global cybersecurity and AI technology company dedicated to securing digital assets for enterprises, governments, and critical infrastructure worldwide.
          </motion.p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
          <motion.div
            initial={{ opacity: 0, x: -50 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            className="glass-card p-8 rounded-3xl"
          >
            <h3 className="text-2xl font-semibold text-white mb-4">Our Mission</h3>
            <p className="text-gray-400 mb-6 leading-relaxed">
              Our mission is to redefine software supply chain security through innovation and trust. We built MyESI to give organizations a single, automated way to see exactly what is running inside their software, and to prove it to auditors, regulators, and partners.
            </p>
            <p className="text-gray-400 leading-relaxed">
              We're open to partnerships and collaborations where we can contribute, secure, and innovate. If you have a security challenge that matches our expertise, don't hesitate to contact us.
            </p>
          </motion.div>

          <motion.div
            initial={{ opacity: 0, x: 50 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            className="grid grid-cols-2 gap-4"
          >
            {stats.map((stat, index) => (
              <div key={index} className="glass-card p-6 rounded-2xl flex flex-col items-center justify-center text-center">
                <stat.icon className="w-8 h-8 text-emerald-400 mb-3" />
                <div className="text-2xl font-bold text-white mb-1">{stat.value}</div>
                <div className="text-sm text-gray-400 font-medium">{stat.label}</div>
              </div>
            ))}
          </motion.div>
        </div>
      </div>
    </section>
  );
}
R2FILEEOF_1

mkdir -p "$(dirname "src/components/AuditFeatures.tsx")"
cat > "src/components/AuditFeatures.tsx" << 'R2FILEEOF_2'
import { useState } from 'react';
import { motion } from 'motion/react';
import { FileStack, GitBranch, PackageSearch, Code2, Bug, ClipboardCheck, Plus, Minus } from 'lucide-react';

const audits = [
  {
    key: 'sbom',
    icon: FileStack,
    title: 'SBOM',
    subtitle: 'Software Bill of Materials',
    description:
      'Automatically generates a complete, machine-readable inventory of every component, library, and dependency in your software, so you always know exactly what is running in production.',
  },
  {
    key: 'ssdlc',
    icon: GitBranch,
    title: 'SSDLC',
    subtitle: 'Secure Software Development Lifecycle',
    description:
      'Validates that security controls are enforced at every stage of your development pipeline, from design and coding through build, testing, and release.',
  },
  {
    key: 'sca',
    icon: PackageSearch,
    title: 'SCA',
    subtitle: 'Software Composition Analysis',
    description:
      'Scans open-source and third-party components for known vulnerabilities, license risks, and outdated versions before they reach production.',
  },
  {
    key: 'sast',
    icon: Code2,
    title: 'SAST',
    subtitle: 'Static Application Security Testing',
    description:
      'Analyzes your source code line by line to catch insecure coding patterns, injection flaws, and logic vulnerabilities before you ever run the application.',
  },
  {
    key: 'dast',
    icon: Bug,
    title: 'DAST',
    subtitle: 'Dynamic Application Security Testing',
    description:
      'Tests your running application and compiled binaries the way an attacker would, uncovering runtime vulnerabilities that static analysis alone can miss.',
  },
  {
    key: 'tcc',
    icon: ClipboardCheck,
    title: 'Technology Controls Compliance',
    subtitle: 'Framework & Regulatory Mapping',
    description:
      'Maps your technical controls directly against the frameworks you are audited on, so compliance evidence is generated automatically instead of assembled by hand.',
  },
];

export default function AuditFeatures() {
  const [openKey, setOpenKey] = useState<string | null>('sbom');

  return (
    <section id="features" className="py-24 relative z-10">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-16">
          <motion.span
            initial={{ opacity: 0, y: 10 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-emerald-400 text-sm font-bold tracking-widest uppercase"
          >
            One Platform, Six Audits
          </motion.span>
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-5xl font-bold text-white mt-4 mb-4"
          >
            6 Different Audits, <span className="text-emerald-400">One Click</span>
          </motion.h2>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-gray-400 max-w-2xl mx-auto"
          >
            MyESI runs a full software supply chain audit in a single pass, replacing six separate tools and reports with one automated workflow.
          </motion.p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {audits.map((audit, idx) => {
            const isOpen = openKey === audit.key;
            return (
              <motion.div
                key={audit.key}
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                transition={{ delay: idx * 0.08 }}
                className="glass-card rounded-2xl border border-white/10 hover:border-emerald-500/30 transition-all duration-300"
              >
                <button
                  onClick={() => setOpenKey(isOpen ? null : audit.key)}
                  className="w-full text-left p-6 flex items-start gap-4"
                >
                  <div className="w-12 h-12 shrink-0 rounded-xl bg-emerald-400/10 flex items-center justify-center">
                    <audit.icon className="w-6 h-6 text-emerald-400" />
                  </div>
                  <div className="flex-1">
                    <h3 className="text-lg font-bold text-white">{audit.title}</h3>
                    <p className="text-xs text-gray-500 mt-1">{audit.subtitle}</p>
                  </div>
                  <div className="text-emerald-400 mt-2">
                    {isOpen ? <Minus className="w-5 h-5" /> : <Plus className="w-5 h-5" />}
                  </div>
                </button>
                {isOpen && (
                  <motion.div
                    initial={{ opacity: 0, height: 0 }}
                    animate={{ opacity: 1, height: 'auto' }}
                    exit={{ opacity: 0, height: 0 }}
                    className="px-6 pb-6"
                  >
                    <p className="text-sm text-gray-400 leading-relaxed border-t border-white/10 pt-4">
                      {audit.description}
                    </p>
                  </motion.div>
                )}
              </motion.div>
            );
          })}
        </div>
      </div>
    </section>
  );
}
R2FILEEOF_2

mkdir -p "$(dirname "src/components/ContactHiring.tsx")"
cat > "src/components/ContactHiring.tsx" << 'R2FILEEOF_3'
import { useState } from 'react';
import { motion } from 'motion/react';
import { Send, Briefcase, MessageSquare } from 'lucide-react';

export default function ContactHiring() {
  const [activeTab, setActiveTab] = useState<'contact' | 'hiring'>('contact');

  return (
    <section id="contact" className="py-24 relative overflow-hidden bg-white/5">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="text-center mb-16">
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-5xl font-bold text-white mb-4"
          >
            Get in <span className="text-emerald-400">Touch</span>
          </motion.h2>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.2 }}
            className="text-lg text-gray-400 max-w-3xl mx-auto"
          >
            Whether you have a security challenge or want to join our team, we'd love to hear from you.
          </motion.p>
        </div>

        <div className="max-w-3xl mx-auto">
          {/* Tabs */}
          <div className="flex justify-center gap-4 mb-10">
            <button
              onClick={() => setActiveTab('contact')}
              className={`flex items-center gap-2 px-6 py-3 rounded-full font-medium transition-all ${
                activeTab === 'contact'
                  ? 'bg-emerald-500 text-white'
                  : 'glass-card text-gray-400 hover:text-white'
              }`}
            >
              <MessageSquare className="w-5 h-5" />
              Contact Us
            </button>
            <button
              onClick={() => setActiveTab('hiring')}
              className={`flex items-center gap-2 px-6 py-3 rounded-full font-medium transition-all ${
                activeTab === 'hiring'
                  ? 'bg-blue-500 text-white'
                  : 'glass-card text-gray-400 hover:text-white'
              }`}
            >
              <Briefcase className="w-5 h-5" />
              Join the Team
            </button>
          </div>

          {/* Forms */}
          <motion.div
            key={activeTab}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.4 }}
            className="glass-card p-8 md:p-12 rounded-3xl"
          >
            <form
              action="mailto:info@iseewaves.pk"
              method="POST"
              encType="text/plain"
              className="space-y-6"
            >
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                  <label className="block text-sm font-medium text-gray-300 mb-2">Full Name</label>
                  <input
                    type="text"
                    name="name"
                    required
                    className="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-emerald-500 transition-colors"
                    placeholder="John Doe"
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-300 mb-2">Email Address</label>
                  <input
                    type="email"
                    name="email"
                    required
                    className="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-emerald-500 transition-colors"
                    placeholder="john@example.com"
                  />
                </div>
              </div>

              {activeTab === 'hiring' && (
                <div>
                  <label className="block text-sm font-medium text-gray-300 mb-2">Position Applied For</label>
                  <select
                    name="position"
                    className="w-full bg-[#1a1a1a] border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-blue-500 transition-colors"
                  >
                    <option value="penetration-tester">Penetration Tester</option>
                    <option value="software-engineer">AI Developer</option>
                    <option value="security-engineer">Security Engineer</option>
                    <option value="grc-consultant">GRC Consultant</option>
                    <option value="software-engineer">Software Engineer</option>
                    <option value="business-developer">Business Developer</option>
                    <option value="marketing-specialist">Marketing Specialist</option>
                    <option value="grc-consultant">Inter</option>
                    <option value="other">Other</option>
                  </select>
                </div>
              )}

              <div>
                <label className="block text-sm font-medium text-gray-300 mb-2">
                  {activeTab === 'contact' ? 'Message / Inquiry' : 'Cover Letter / Experience'}
                </label>
                <textarea
                  name="message"
                  required
                  rows={5}
                  className="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-emerald-500 transition-colors resize-none"
                  placeholder="Tell us about your requirements..."
                ></textarea>
              </div>

              <button
                type="submit"
                className={`w-full flex items-center justify-center gap-2 py-4 rounded-xl font-bold text-white transition-all hover:scale-[1.02] ${
                  activeTab === 'contact' ? 'bg-emerald-500 hover:bg-emerald-600' : 'bg-blue-500 hover:bg-blue-600'
                }`}
              >
                <Send className="w-5 h-5" />
                {activeTab === 'contact' ? 'Send Message' : 'Submit Application'}
              </button>
            </form>
          </motion.div>
        </div>
      </div>
    </section>
  );
}
R2FILEEOF_3

mkdir -p "$(dirname "src/components/Footer.tsx")"
cat > "src/components/Footer.tsx" << 'R2FILEEOF_4'
import { Shield, Linkedin, Twitter, Facebook, Instagram, ChevronDown, ChevronUp } from 'lucide-react';
import { Link } from 'react-router-dom';
import { useState } from 'react';
import { complianceData } from '../data/complianceData';

export default function Footer() {
  const [showAllCompliance, setShowAllCompliance] = useState(false);
  const displayedCompliance = showAllCompliance ? complianceData : complianceData.slice(0, 4);

  return (
    <footer className="bg-black py-16 border-t border-white/10 relative z-10">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-12">
          <div className="flex items-center gap-2 mb-4">
            <Shield className="w-8 h-8 text-emerald-400" />
            <span className="text-2xl font-bold tracking-tight text-white">iSeeWaves</span>
          </div>
          <p className="text-gray-400 max-w-md leading-relaxed mb-6">
            Makers of MyESI, an automated software supply chain security and DevSecOps platform.
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

        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-10 mb-12">
          <div>
            <h4 className="text-white font-semibold mb-6">Partners</h4>
            <ul className="space-y-4 text-sm text-gray-400">
              <li><Link to="/partners/become-a-partner" className="hover:text-emerald-400 transition-colors">Become a partner</Link></li>
              <li><Link to="/partners/find-a-partner" className="hover:text-emerald-400 transition-colors">Find a partner</Link></li>
              <li><Link to="/partners/portal" className="hover:text-emerald-400 transition-colors">Partner portal</Link></li>
              <li><Link to="/partners/programs" className="hover:text-emerald-400 transition-colors">Partner programs</Link></li>
            </ul>
          </div>

          <div>
            <h4 className="text-white font-semibold mb-6">Resources</h4>
            <ul className="space-y-4 text-sm text-gray-400">
              <li><Link to="/services" className="hover:text-emerald-400 transition-colors">Services</Link></li>
              <li><Link to="/#support" className="hover:text-emerald-400 transition-colors">Technical support</Link></li>
              <li><Link to="/resources/training" className="hover:text-emerald-400 transition-colors">Training and certifications</Link></li>
              <li><Link to="/resources/documentation" className="hover:text-emerald-400 transition-colors">Product documentation</Link></li>
              <li><Link to="/resources/community" className="hover:text-emerald-400 transition-colors">Customer community</Link></li>
              <li><Link to="/resources/trust" className="hover:text-emerald-400 transition-colors">myESI Trust</Link></li>
              <li><Link to="/reports" className="hover:text-emerald-400 transition-colors">Reports and whitepapers</Link></li>
              <li><Link to="/blogs" className="hover:text-emerald-400 transition-colors">Blogs</Link></li>
            </ul>
          </div>

          <div>
            <h4 className="text-white font-semibold mb-6">Company</h4>
            <ul className="space-y-4 text-sm text-gray-400 mb-4">
              <li><Link to="/#about" className="hover:text-emerald-400 transition-colors">About us</Link></li>
              <li><Link to="/company/executive-team" className="hover:text-emerald-400 transition-colors">Executive team</Link></li>
              <li><Link to="/company/investor-relations" className="hover:text-emerald-400 transition-colors">Investor relations</Link></li>
            </ul>
            <h5 id="compliance" className="text-white font-semibold mb-3 text-sm scroll-mt-32">Compliances</h5>
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
                  className="text-emerald-400 hover:text-emerald-300 transition-colors flex items-center gap-1 mt-1 font-medium"
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
            <h4 className="text-white font-semibold mb-6">Connect</h4>
            <ul className="space-y-4 text-sm text-gray-400">
              <li><Link to="/#contact" className="hover:text-emerald-400 transition-colors">Contact us</Link></li>
              <li><Link to="/demo" className="hover:text-emerald-400 transition-colors">Try our product</Link></li>
              <li><a href="mailto:info@iseewaves.pk?subject=Chat%20with%20Sales" className="hover:text-emerald-400 transition-colors">Chat with sales</a></li>
              <li><Link to="/connect/events" className="hover:text-emerald-400 transition-colors">Meet us at an event</Link></li>
              <li><Link to="/#contact" className="hover:text-emerald-400 transition-colors">Join us</Link></li>
            </ul>
          </div>
        </div>

        <div className="pt-8 border-t border-white/10 flex flex-col md:flex-row items-center justify-between text-sm text-gray-500 gap-4">
          <p>Copyright &copy; 2026 iSeeWaves. All rights reserved.</p>
          <div className="flex flex-wrap items-center justify-center gap-x-6 gap-y-2">
            <Link to="/privacy" className="hover:text-emerald-400 transition-colors">Privacy Policy</Link>
            <Link to="/terms" className="hover:text-emerald-400 transition-colors">Terms of Service</Link>
            <Link to="/cookies" className="hover:text-emerald-400 transition-colors">Cookie Policy</Link>
            <Link to="/legal" className="hover:text-emerald-400 transition-colors">Legal Notice</Link>
          </div>
        </div>
      </div>
    </footer>
  );
}
R2FILEEOF_4

mkdir -p "$(dirname "src/components/Hero.tsx")"
cat > "src/components/Hero.tsx" << 'R2FILEEOF_5'
import { motion } from 'motion/react';
import { ShieldAlert, ArrowRight } from 'lucide-react';

export default function Hero() {
  return (
    <section className="relative min-h-screen flex items-center justify-center pt-20 overflow-hidden">
      {/* Abstract Background */}
      <div className="absolute inset-0 z-0">
        <div className="absolute top-1/4 left-1/4 w-96 h-96 bg-emerald-500/20 rounded-full mix-blend-screen filter blur-[100px] animate-pulse" />
        <div className="absolute bottom-1/4 right-1/4 w-96 h-96 bg-blue-500/20 rounded-full mix-blend-screen filter blur-[100px] animate-pulse" style={{ animationDelay: '2s' }} />
      </div>

      <div className="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8 }}
          className="flex justify-center mb-10"
        >
        </motion.div>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.1 }}
          className="inline-flex items-center gap-2 px-6 py-2 rounded-full glass-card border-emerald-500/50 text-emerald-400 text-sm font-bold tracking-widest uppercase mb-8 shadow-[0_0_20px_rgba(16,185,129,0.2)]"
        >
          <ShieldAlert className="w-5 h-5" />
          <span>Next-Gen Cybersecurity</span>
        </motion.div>

        <motion.h1
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.2 }}
          className="text-5xl md:text-7xl lg:text-8xl font-black tracking-tighter text-white mb-6 uppercase leading-tight"
        >
          Sleep Tight, <br />
          <span className="text-transparent bg-clip-text bg-gradient-to-r from-emerald-400 to-blue-500 drop-shadow-[0_0_30px_rgba(16,185,129,0.4)]">
            We Guard Your Byte!
          </span>
        </motion.h1>

        <motion.p
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.4 }}
          className="max-w-2xl mx-auto text-lg md:text-xl text-gray-400 mb-10"
        >
          My Enterprise Security Intelligence, by iSeeWaves. An automated, SBOM-based platform that uncovers hidden vulnerabilities in your software supply chain and validates your SSDLC line by line.
        </motion.p>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.6 }}
          className="flex flex-col sm:flex-row items-center justify-center gap-4"
        >
          <a
            href="#product"
            className="flex items-center gap-2 px-8 py-4 rounded-full bg-emerald-500 text-white font-semibold hover:bg-emerald-600 transition-all hover:scale-105"
          >
            Explore MyESI
            <ArrowRight className="w-5 h-5" />
          </a>
          <a
            href="#contact"
            className="flex items-center gap-2 px-8 py-4 rounded-full glass-card text-white font-semibold hover:bg-white/10 transition-all hover:scale-105"
          >
            Contact Us
          </a>
        </motion.div>
      </div>
    </section>
  );
}
R2FILEEOF_5

mkdir -p "$(dirname "src/components/Navbar.tsx")"
cat > "src/components/Navbar.tsx" << 'R2FILEEOF_6'
import { useState, useEffect, useRef } from 'react';
import { Menu, X, ChevronDown } from 'lucide-react';
import { Link, useLocation } from 'react-router-dom';

type NavItem = { name: string; href: string };

type NavEntry =
  | { type: 'link'; name: string; href: string }
  | { type: 'menu'; name: string; items: NavItem[] };

const navEntries: NavEntry[] = [
  { type: 'link', name: 'About', href: '/#about' },
  {
    type: 'menu',
    name: 'Product',
    items: [
      { name: 'MyESI Overview', href: '/#product' },
      { name: '6 Audits', href: '/#features' },
      { name: 'Packages', href: '/#packages' },
      { name: 'Free Trial', href: '/#support' },
      { name: 'Support', href: '/#support' },
    ],
  },
  {
    type: 'menu',
    name: 'Resources',
    items: [
      { name: 'Services', href: '/services' },
      { name: 'Technical Support', href: '/#support' },
      { name: 'Training and Certifications', href: '/resources/training' },
      { name: 'Product Documentation', href: '/resources/documentation' },
      { name: 'Customer Community', href: '/resources/community' },
      { name: 'myESI Trust', href: '/resources/trust' },
      { name: 'Reports and Whitepapers', href: '/reports' },
      { name: 'Blogs', href: '/blogs' },
    ],
  },
  {
    type: 'menu',
    name: 'Company',
    items: [
      { name: 'About Us', href: '/#about' },
      { name: 'Executive Team', href: '/company/executive-team' },
      { name: 'Investor Relations', href: '/company/investor-relations' },
      { name: 'Compliances', href: '/#compliance' },
    ],
  },
  {
    type: 'menu',
    name: 'Partners',
    items: [
      { name: 'Become a Partner', href: '/partners/become-a-partner' },
      { name: 'Find a Partner', href: '/partners/find-a-partner' },
      { name: 'Partner Portal', href: '/partners/portal' },
      { name: 'Partner Programs', href: '/partners/programs' },
    ],
  },
  {
    type: 'menu',
    name: 'Connect',
    items: [
      { name: 'Contact Us', href: '/#contact' },
      { name: 'Try Our Product', href: '/demo' },
      { name: 'Meet Us at an Event', href: '/connect/events' },
      { name: 'Join Us', href: '/#contact' },
    ],
  },
];

function resolveHref(href: string, isHome: boolean) {
  // href values are always root-relative (start with '/'); react-router Link handles them
  // directly regardless of current page.
  return href;
}

export default function Navbar() {
  const [isScrolled, setIsScrolled] = useState(false);
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);
  const [openMenu, setOpenMenu] = useState<string | null>(null);
  const [openMobileMenu, setOpenMobileMenu] = useState<string | null>(null);
  const location = useLocation();
  const navRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const handleScroll = () => setIsScrolled(window.scrollY > 20);
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  useEffect(() => {
    const handleClickOutside = (e: MouseEvent) => {
      if (navRef.current && !navRef.current.contains(e.target as Node)) {
        setOpenMenu(null);
      }
    };
    document.addEventListener('click', handleClickOutside);
    return () => document.removeEventListener('click', handleClickOutside);
  }, []);

  const isHome = location.pathname === '/';

  return (
    <nav
      ref={navRef}
      className={`fixed top-0 left-0 right-0 z-50 transition-all duration-300 ${
        isScrolled ? 'glass-panel py-3' : 'bg-transparent py-5'
      }`}
    >
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between">
          <Link to="/" className="flex items-center gap-2">
            <img src="/images/iSeeWaves.png" alt="iSeeWaves" className="md:h-8 w-auto brightness-0 invert" />
          </Link>

          {/* Desktop Nav */}
          <div className="hidden lg:flex items-center space-x-1">
            {navEntries.map((entry) =>
              entry.type === 'link' ? (
                <Link
                  key={entry.name}
                  to={resolveHref(entry.href, isHome)}
                  className="px-3 py-2 text-sm font-medium text-gray-300 hover:text-emerald-400 transition-colors"
                >
                  {entry.name}
                </Link>
              ) : (
                <div key={entry.name} className="relative">
                  <button
                    onClick={() => setOpenMenu(openMenu === entry.name ? null : entry.name)}
                    className={`flex items-center gap-1 px-3 py-2 text-sm font-medium transition-colors ${
                      openMenu === entry.name ? 'text-emerald-400' : 'text-gray-300 hover:text-emerald-400'
                    }`}
                  >
                    {entry.name}
                    <ChevronDown className={`w-3.5 h-3.5 transition-transform ${openMenu === entry.name ? 'rotate-180' : ''}`} />
                  </button>
                  {openMenu === entry.name && (
                    <div className="absolute top-full left-0 mt-2 w-64 glass-panel rounded-xl border border-white/10 py-2 shadow-2xl">
                      {entry.items.map((item) => (
                        <Link
                          key={item.name}
                          to={resolveHref(item.href, isHome)}
                          onClick={() => setOpenMenu(null)}
                          className="block px-4 py-2.5 text-sm text-gray-300 hover:text-emerald-400 hover:bg-white/5 transition-colors"
                        >
                          {item.name}
                        </Link>
                      ))}
                    </div>
                  )}
                </div>
              )
            )}
            <Link
              to="/#contact"
              className="ml-4 px-4 py-2 rounded-full bg-emerald-500/10 text-emerald-400 border border-emerald-500/20 hover:bg-emerald-500/20 transition-colors text-sm font-medium"
            >
              Get Secured
            </Link>
          </div>

          {/* Mobile Menu Button */}
          <div className="lg:hidden">
            <button
              onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
              className="text-gray-300 hover:text-white"
            >
              {isMobileMenuOpen ? <X className="w-6 h-6" /> : <Menu className="w-6 h-6" />}
            </button>
          </div>
        </div>
      </div>

      {/* Mobile Nav */}
      {isMobileMenuOpen && (
        <div className="lg:hidden glass-panel absolute top-full left-0 right-0 border-t border-white/5 max-h-[80vh] overflow-y-auto">
          <div className="px-4 pt-2 pb-6 space-y-1">
            {navEntries.map((entry) =>
              entry.type === 'link' ? (
                <Link
                  key={entry.name}
                  to={resolveHref(entry.href, isHome)}
                  onClick={() => setIsMobileMenuOpen(false)}
                  className="block px-3 py-3 text-base font-medium text-gray-300 hover:text-emerald-400 hover:bg-white/5 rounded-lg"
                >
                  {entry.name}
                </Link>
              ) : (
                <div key={entry.name}>
                  <button
                    onClick={() => setOpenMobileMenu(openMobileMenu === entry.name ? null : entry.name)}
                    className="w-full flex items-center justify-between px-3 py-3 text-base font-medium text-gray-300 hover:text-emerald-400 hover:bg-white/5 rounded-lg"
                  >
                    {entry.name}
                    <ChevronDown className={`w-4 h-4 transition-transform ${openMobileMenu === entry.name ? 'rotate-180' : ''}`} />
                  </button>
                  {openMobileMenu === entry.name && (
                    <div className="pl-4 space-y-1">
                      {entry.items.map((item) => (
                        <Link
                          key={item.name}
                          to={resolveHref(item.href, isHome)}
                          onClick={() => {
                            setIsMobileMenuOpen(false);
                            setOpenMobileMenu(null);
                          }}
                          className="block px-3 py-2.5 text-sm text-gray-400 hover:text-emerald-400 hover:bg-white/5 rounded-lg"
                        >
                          {item.name}
                        </Link>
                      ))}
                    </div>
                  )}
                </div>
              )
            )}
          </div>
        </div>
      )}
    </nav>
  );
}
R2FILEEOF_6

mkdir -p "$(dirname "src/components/Packages.tsx")"
cat > "src/components/Packages.tsx" << 'R2FILEEOF_7'
import { motion } from 'motion/react';
import { Check } from 'lucide-react';

const packages = [
  {
    name: 'Starter',
    tagline: 'For small teams shipping their first audited release',
    price: 'Contact Us',
    highlight: false,
    features: [
      'SBOM generation',
      'SCA scanning',
      'Up to 3 repositories',
      'Email support',
      'Monthly compliance snapshot',
    ],
  },
  {
    name: 'Business',
    tagline: 'For growing engineering teams with regular releases',
    price: 'Contact Us',
    highlight: true,
    features: [
      'All 6 audits: SBOM, SSDLC, SCA, SAST, DAST, Technology Controls',
      'Up to 25 repositories',
      'CI/CD pipeline integration',
      'Priority technical support',
      'Compliance and configuration checks',
      'Quarterly reporting',
    ],
  },
  {
    name: 'Enterprise',
    tagline: 'For organizations that need on-premises control',
    price: 'Custom',
    highlight: false,
    features: [
      'Everything in Business',
      'Unlimited repositories',
      'On-premises deployment mode',
      'Dedicated support and reporting cadence',
      'Custom framework mapping',
      'SLA-backed technical support',
    ],
  },
];

export default function Packages() {
  return (
    <section id="packages" className="py-24 relative z-10">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-16">
          <motion.span
            initial={{ opacity: 0, y: 10 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-emerald-400 text-sm font-bold tracking-widest uppercase"
          >
            Pricing
          </motion.span>
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-5xl font-bold text-white mt-4"
          >
            Choose Your <span className="text-emerald-400">Package</span>
          </motion.h2>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8 items-stretch">
          {packages.map((pkg, idx) => (
            <motion.div
              key={pkg.name}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: idx * 0.1 }}
              className={`glass-card rounded-2xl p-8 flex flex-col border ${
                pkg.highlight ? 'border-emerald-500/60 shadow-[0_0_40px_rgba(16,185,129,0.15)] scale-[1.02]' : 'border-white/10'
              }`}
            >
              {pkg.highlight && (
                <span className="self-start px-3 py-1 rounded-full bg-emerald-500/20 text-emerald-400 text-xs font-bold uppercase tracking-widest mb-4">
                  Most Popular
                </span>
              )}
              <h3 className="text-2xl font-bold text-white mb-2">{pkg.name}</h3>
              <p className="text-sm text-gray-400 mb-6">{pkg.tagline}</p>
              <div className="text-3xl font-black text-white mb-6">{pkg.price}</div>
              <ul className="space-y-3 mb-8 flex-1">
                {pkg.features.map((f) => (
                  <li key={f} className="flex items-start gap-2 text-sm text-gray-300">
                    <Check className="w-4 h-4 text-emerald-400 mt-0.5 shrink-0" />
                    <span>{f}</span>
                  </li>
                ))}
              </ul>
              <a
                href="#trial"
                className={`text-center px-6 py-3 rounded-full font-semibold transition-all hover:scale-105 ${
                  pkg.highlight
                    ? 'bg-emerald-500 text-white hover:bg-emerald-600'
                    : 'glass-card text-white hover:bg-white/10'
                }`}
              >
                Get Started
              </a>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
R2FILEEOF_7

mkdir -p "$(dirname "src/components/SupportSection.tsx")"
cat > "src/components/SupportSection.tsx" << 'R2FILEEOF_8'
import { useState } from 'react';
import { motion } from 'motion/react';
import {
  Gift,
  Headset,
  BarChart3,
  Activity,
  ShieldCheck,
  Server,
  DollarSign,
  ShoppingCart,
  HelpCircle,
  ChevronDown,
  Send,
} from 'lucide-react';

const tabs = [
  { key: 'trial', label: 'Free Trial', icon: Gift },
  { key: 'technical', label: 'Technical Support', icon: Headset },
  { key: 'reporting', label: 'Reporting', icon: BarChart3 },
  { key: 'usage', label: 'Usage', icon: Activity },
  { key: 'compliance', label: 'Compliance & Configuration Checks', icon: ShieldCheck },
  { key: 'onprem', label: 'On-Premises Mode', icon: Server },
  { key: 'price', label: 'Price', icon: DollarSign },
  { key: 'purchase', label: 'Purchase', icon: ShoppingCart },
  { key: 'faqs', label: 'FAQs', icon: HelpCircle },
];

const faqs = [
  {
    q: 'What does the 1-month free trial include?',
    a: 'Full access to all 6 audits (SBOM, SSDLC, SCA, SAST, DAST, and Technology Controls Compliance) on up to 3 repositories, with no card required to start.',
  },
  {
    q: 'Can MyESI run fully on-premises?',
    a: 'Yes. Enterprise customers can deploy MyESI entirely within their own infrastructure, with no code or scan data leaving their network.',
  },
  {
    q: 'How is MyESI priced?',
    a: 'Pricing is based on the number of repositories and the package tier (Starter, Business, or Enterprise). Contact our team for a tailored quote.',
  },
  {
    q: 'What compliance frameworks does MyESI support?',
    a: 'MyESI maps technical controls to major regulatory and industry frameworks and generates audit-ready evidence automatically. See our Compliance page for the full list.',
  },
  {
    q: 'How do I purchase MyESI?',
    a: 'Start with the free trial, then our sales team will help you choose a package and move to a paid subscription or an on-premises license.',
  },
];

export default function SupportSection() {
  const [activeTab, setActiveTab] = useState('trial');
  const [openFaq, setOpenFaq] = useState<number | null>(0);
  const [submitted, setSubmitted] = useState(false);

  return (
    <section id="support" className="py-24 relative z-10">
      <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-14">
          <motion.span
            initial={{ opacity: 0, y: 10 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-emerald-400 text-sm font-bold tracking-widest uppercase"
          >
            Support
          </motion.span>
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-5xl font-bold text-white mt-4"
          >
            Everything You Need to <span className="text-emerald-400">Get Started</span>
          </motion.h2>
        </div>

        {/* Tab bar */}
        <div className="flex flex-wrap justify-center gap-2 mb-10">
          {tabs.map((tab) => (
            <button
              key={tab.key}
              onClick={() => setActiveTab(tab.key)}
              className={`flex items-center gap-2 px-4 py-2 rounded-full text-sm font-medium transition-all ${
                activeTab === tab.key
                  ? 'bg-emerald-500 text-white'
                  : 'glass-card text-gray-400 hover:text-white hover:bg-white/10'
              }`}
            >
              <tab.icon className="w-4 h-4" />
              {tab.label}
            </button>
          ))}
        </div>

        <div className="glass-card rounded-2xl border border-white/10 p-6 md:p-10">
          {activeTab === 'trial' && (
            <div>
              <h3 className="text-2xl font-bold text-white mb-2">Start Your 1-Month Free Trial</h3>
              <p className="text-gray-400 mb-8">
                Fill this out and our team will set up your trial and get in touch on the email you provide.
              </p>
              {submitted ? (
                <div className="text-emerald-400 font-medium">
                  Thanks. Your mail client should have opened with your request. We will reach out shortly.
                </div>
              ) : (
                <form
                  action="mailto:info@iseewaves.pk"
                  method="post"
                  encType="text/plain"
                  onSubmit={() => setSubmitted(true)}
                  className="grid grid-cols-1 md:grid-cols-2 gap-6"
                >
                  <input type="hidden" name="subject" value="1-Month Free Trial Request" />
                  <div>
                    <label className="block text-sm font-medium text-gray-300 mb-2">Full Name</label>
                    <input required name="name" type="text" className="w-full px-4 py-3 rounded-lg bg-white/5 border border-white/10 text-white focus:outline-none focus:border-emerald-500" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-300 mb-2">Company</label>
                    <input required name="company" type="text" className="w-full px-4 py-3 rounded-lg bg-white/5 border border-white/10 text-white focus:outline-none focus:border-emerald-500" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-300 mb-2">Work Email</label>
                    <input required name="email" type="email" className="w-full px-4 py-3 rounded-lg bg-white/5 border border-white/10 text-white focus:outline-none focus:border-emerald-500" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-300 mb-2">Phone (optional)</label>
                    <input name="phone" type="tel" className="w-full px-4 py-3 rounded-lg bg-white/5 border border-white/10 text-white focus:outline-none focus:border-emerald-500" />
                  </div>
                  <div className="md:col-span-2">
                    <label className="block text-sm font-medium text-gray-300 mb-2">Tell us about your stack (optional)</label>
                    <textarea name="message" rows={4} className="w-full px-4 py-3 rounded-lg bg-white/5 border border-white/10 text-white focus:outline-none focus:border-emerald-500" />
                  </div>
                  <div className="md:col-span-2">
                    <button
                      type="submit"
                      className="flex items-center gap-2 px-8 py-4 rounded-full bg-emerald-500 hover:bg-emerald-600 text-white font-semibold transition-all hover:scale-105"
                    >
                      Request Free Trial
                      <Send className="w-4 h-4" />
                    </button>
                  </div>
                </form>
              )}
            </div>
          )}

          {activeTab === 'technical' && (
            <div>
              <h3 className="text-2xl font-bold text-white mb-4">Technical Support</h3>
              <p className="text-gray-400 leading-relaxed mb-4">
                Every MyESI plan includes direct access to our engineering-backed support team. Business and Enterprise
                customers get priority response times and a named point of contact for onboarding, integration, and
                incident troubleshooting.
              </p>
              <ul className="space-y-2 text-gray-300 text-sm list-disc list-inside">
                <li>Email and ticket-based support for all plans</li>
                <li>Priority response SLA for Business and Enterprise</li>
                <li>Guided CI/CD and pipeline integration support</li>
                <li>Dedicated technical account manager for Enterprise</li>
              </ul>
            </div>
          )}

          {activeTab === 'reporting' && (
            <div>
              <h3 className="text-2xl font-bold text-white mb-4">Reporting</h3>
              <p className="text-gray-400 leading-relaxed mb-4">
                MyESI generates audit-ready reports automatically after every scan, covering SBOM inventories, SAST/DAST
                findings, SCA risk summaries, and compliance mapping, exportable as PDF or shared with stakeholders on a
                schedule that fits your release cadence.
              </p>
              <ul className="space-y-2 text-gray-300 text-sm list-disc list-inside">
                <li>Automated per-scan and periodic summary reports</li>
                <li>Executive-level and engineering-level report formats</li>
                <li>Historical trend reporting across releases</li>
              </ul>
            </div>
          )}

          {activeTab === 'usage' && (
            <div>
              <h3 className="text-2xl font-bold text-white mb-4">Usage</h3>
              <p className="text-gray-400 leading-relaxed mb-4">
                A live usage dashboard shows repository coverage, scan frequency, seat allocation, and remaining quota for
                your plan, so admins always know how the platform is being used across teams.
              </p>
              <ul className="space-y-2 text-gray-300 text-sm list-disc list-inside">
                <li>Per-repository and per-team scan activity</li>
                <li>Seat and license usage tracking</li>
                <li>Usage-based alerts before you hit plan limits</li>
              </ul>
            </div>
          )}

          {activeTab === 'compliance' && (
            <div>
              <h3 className="text-2xl font-bold text-white mb-4">Compliance & Configuration Checks</h3>
              <p className="text-gray-400 leading-relaxed mb-4">
                Beyond code-level scanning, MyESI continuously checks your environment and pipeline configuration against
                your target compliance frameworks, flagging drift before it becomes an audit finding.
              </p>
              <ul className="space-y-2 text-gray-300 text-sm list-disc list-inside">
                <li>Continuous configuration drift detection</li>
                <li>Framework-mapped compliance evidence generation</li>
                <li>See the full framework list on our Compliance page</li>
              </ul>
            </div>
          )}

          {activeTab === 'onprem' && (
            <div>
              <h3 className="text-2xl font-bold text-white mb-4">On-Premises Mode</h3>
              <p className="text-gray-400 leading-relaxed mb-4">
                For organizations that cannot let source code or scan data leave their network, MyESI can be deployed
                fully on-premises. All six audits run inside your own infrastructure, under your own access controls.
              </p>
              <ul className="space-y-2 text-gray-300 text-sm list-disc list-inside">
                <li>Full deployment inside your infrastructure, air-gapped environments supported</li>
                <li>No source code or scan data leaves your network</li>
                <li>Same audit coverage and reporting as the cloud offering</li>
                <li>Available on the Enterprise package</li>
              </ul>
            </div>
          )}

          {activeTab === 'price' && (
            <div>
              <h3 className="text-2xl font-bold text-white mb-4">Price</h3>
              <p className="text-gray-400 leading-relaxed mb-6">
                Pricing scales with the number of repositories and the package tier you choose. See the{' '}
                <a href="#packages" className="text-emerald-400 hover:underline">Packages</a> section above for what is
                included in Starter, Business, and Enterprise, or talk to our team for a tailored quote.
              </p>
              <a
                href="#packages"
                className="inline-flex items-center gap-2 px-6 py-3 rounded-full bg-emerald-500 hover:bg-emerald-600 text-white font-semibold transition-all"
              >
                View Packages
              </a>
            </div>
          )}

          {activeTab === 'purchase' && (
            <div>
              <h3 className="text-2xl font-bold text-white mb-4">Purchase</h3>
              <p className="text-gray-400 leading-relaxed mb-4">
                Most customers start with the free trial above. Once you are ready to move forward, our sales team will
                walk you through package selection, deployment mode (cloud or on-premises), and contracting.
              </p>
              <a
                href="mailto:info@iseewaves.pk?subject=Purchase%20Inquiry%20-%20MyESI"
                className="inline-flex items-center gap-2 px-6 py-3 rounded-full glass-card text-white font-semibold hover:bg-white/10 transition-all"
              >
                Talk to Sales
              </a>
            </div>
          )}

          {activeTab === 'faqs' && (
            <div>
              <h3 className="text-2xl font-bold text-white mb-6">Frequently Asked Questions</h3>
              <div className="space-y-3">
                {faqs.map((faq, idx) => (
                  <div key={idx} className="border border-white/10 rounded-xl overflow-hidden">
                    <button
                      onClick={() => setOpenFaq(openFaq === idx ? null : idx)}
                      className="w-full flex items-center justify-between px-5 py-4 text-left text-white font-medium"
                    >
                      {faq.q}
                      <ChevronDown className={`w-4 h-4 text-emerald-400 transition-transform ${openFaq === idx ? 'rotate-180' : ''}`} />
                    </button>
                    {openFaq === idx && (
                      <div className="px-5 pb-4 text-sm text-gray-400 leading-relaxed">{faq.a}</div>
                    )}
                  </div>
                ))}
              </div>
            </div>
          )}
        </div>
      </div>
    </section>
  );
}
R2FILEEOF_8

mkdir -p "$(dirname "src/pages/ServicesPage.tsx")"
cat > "src/pages/ServicesPage.tsx" << 'R2FILEEOF_9'
import { motion } from 'motion/react';
import { ShieldAlert, ShieldCheck, FileCheck, Cloud, UserCog, ArrowLeft } from 'lucide-react';
import { Link } from 'react-router-dom';

export default function ServicesPage() {
  const services = [
    {
      icon: ShieldAlert,
      title: 'Offensive Security',
      items: ['Penetration Testing', 'Red Teaming', 'Social Engineering'],
      color: 'text-red-400',
      bg: 'bg-red-400/10',
      border: 'border-red-400/20',
    },
    {
      icon: ShieldCheck,
      title: 'Defensive Security',
      items: ['Ransomware Protection', 'Network Security', 'Endpoint Hardening'],
      color: 'text-blue-400',
      bg: 'bg-blue-400/10',
      border: 'border-blue-400/20',
    },
    {
      icon: UserCog,
      title: 'vCISO',
      items: ['Security Strategy', 'Board-Level Reporting', 'Risk Governance'],
      color: 'text-amber-400',
      bg: 'bg-amber-400/10',
      border: 'border-amber-400/20',
    },
    {
      icon: FileCheck,
      title: 'Compliance & GRC',
      items: ['GRC', 'Policy Documentation', 'Risk Reports'],
      color: 'text-purple-400',
      bg: 'bg-purple-400/10',
      border: 'border-purple-400/20',
    },
    {
      icon: Cloud,
      title: 'Cloud & AI Security',
      items: ['Cloud Security Audits', 'AI Security', 'DevSecOps'],
      color: 'text-emerald-400',
      bg: 'bg-emerald-400/10',
      border: 'border-emerald-400/20',
    },
  ];

  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-400 hover:text-emerald-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <div className="text-center mb-16">
          <motion.h1
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            className="text-4xl md:text-6xl font-bold text-white mb-4"
          >
            Our <span className="text-emerald-400">Services</span>
          </motion.h1>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.1 }}
            className="text-lg text-gray-400 max-w-2xl mx-auto"
          >
            Alongside MyESI, our flagship product, we offer a focused set of cybersecurity services for organizations that need hands-on expertise.
          </motion.p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {services.map((service, idx) => (
            <motion.div
              key={idx}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: idx * 0.1 }}
              className={`glass-card p-6 rounded-2xl border ${service.border} transition-all duration-300 group relative overflow-hidden`}
            >
              <div className={`w-12 h-12 rounded-xl ${service.bg} flex items-center justify-center mb-6 group-hover:scale-110 transition-transform duration-300 shadow-inner`}>
                <service.icon className={`w-6 h-6 ${service.color}`} />
              </div>
              <h3 className="text-xl font-bold text-white mb-4 relative z-10">{service.title}</h3>
              <ul className="space-y-3 relative z-10">
                {service.items.map((item, i) => (
                  <li key={i} className="flex items-center gap-2 text-gray-400 text-sm group-hover:text-gray-300 transition-colors">
                    <div className={`w-1.5 h-1.5 rounded-full ${service.bg.replace('/10', '')} shadow-[0_0_8px_currentColor]`} />
                    {item}
                  </li>
                ))}
              </ul>
            </motion.div>
          ))}
        </div>

        <div className="text-center mt-16">
          <Link
            to="/#contact"
            className="inline-flex items-center gap-2 px-8 py-4 rounded-full bg-emerald-500 hover:bg-emerald-600 text-white font-semibold transition-all hover:scale-105"
          >
            Discuss a Service
          </Link>
        </div>
      </div>
    </div>
  );
}
R2FILEEOF_9

mkdir -p "$(dirname "src/pages/SimplePage.tsx")"
cat > "src/pages/SimplePage.tsx" << 'R2FILEEOF_10'
import { motion } from 'motion/react';
import { ArrowLeft, LucideIcon } from 'lucide-react';
import { Link } from 'react-router-dom';

interface SimplePageProps {
  eyebrow: string;
  title: string;
  subtitle: string;
  icon: LucideIcon;
  sections: { heading: string; body: string }[];
  ctaLabel?: string;
  ctaHref?: string;
}

export default function SimplePage({ eyebrow, title, subtitle, icon: Icon, sections, ctaLabel, ctaHref }: SimplePageProps) {
  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-400 hover:text-emerald-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="mb-12">
          <div className="w-14 h-14 rounded-xl bg-emerald-400/10 flex items-center justify-center mb-6">
            <Icon className="w-7 h-7 text-emerald-400" />
          </div>
          <span className="text-emerald-400 text-sm font-bold tracking-widest uppercase">{eyebrow}</span>
          <h1 className="text-3xl md:text-5xl font-bold text-white mt-4 mb-4">{title}</h1>
          <p className="text-lg text-gray-400 max-w-2xl">{subtitle}</p>
        </motion.div>

        <div className="space-y-10">
          {sections.map((s, idx) => (
            <motion.div
              key={idx}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              className="glass-card rounded-2xl border border-white/10 p-8"
            >
              <h2 className="text-xl font-bold text-white mb-3">{s.heading}</h2>
              <p className="text-gray-400 leading-relaxed">{s.body}</p>
            </motion.div>
          ))}
        </div>

        {ctaLabel && ctaHref && (
          <div className="mt-12 text-center">
            <a
              href={ctaHref}
              className="inline-flex items-center gap-2 px-8 py-4 rounded-full bg-emerald-500 hover:bg-emerald-600 text-white font-semibold transition-all hover:scale-105"
            >
              {ctaLabel}
            </a>
          </div>
        )}
      </div>
    </div>
  );
}
R2FILEEOF_10

mkdir -p "$(dirname "src/pages/partners/BecomePartnerPage.tsx")"
cat > "src/pages/partners/BecomePartnerPage.tsx" << 'R2FILEEOF_11'
import { Handshake } from 'lucide-react';
import SimplePage from '../SimplePage';

export default function BecomePartnerPage() {
  return (
    <SimplePage
      eyebrow="Partners"
      title="Become a Partner"
      subtitle="Join the iSeeWaves partner network and bring MyESI's software supply chain security to your customers."
      icon={Handshake}
      sections={[
        { heading: "Why Partner With Us", body: "iSeeWaves partners get access to MyESI's automated SBOM, SSDLC, SCA, SAST, DAST, and compliance audits to offer as a value-added service, backed by our engineering team." },
        { heading: "Who We Work With", body: "We partner with system integrators, MSSPs, consultancies, and technology resellers serving enterprise and mid-market customers across regulated industries." },
        { heading: "What You Get", body: "Deal registration, partner pricing, co-marketing support, and a dedicated partner manager once you are onboarded." }
      ]}
      ctaLabel="Apply to Partner"
      ctaHref="mailto:info@iseewaves.pk?subject=Partner%20Application"
    />
  );
}
R2FILEEOF_11

mkdir -p "$(dirname "src/pages/partners/FindPartnerPage.tsx")"
cat > "src/pages/partners/FindPartnerPage.tsx" << 'R2FILEEOF_12'
import { Search } from 'lucide-react';
import SimplePage from '../SimplePage';

export default function FindPartnerPage() {
  return (
    <SimplePage
      eyebrow="Partners"
      title="Find a Partner"
      subtitle="Work with a certified iSeeWaves partner in your region to deploy and manage MyESI."
      icon={Search}
      sections={[
        { heading: "Certified Implementation Partners", body: "Our partners are trained on MyESI deployment, CI/CD integration, and on-premises rollouts, and can support your team through onboarding and beyond." },
        { heading: "Get Matched", body: "Tell us about your organization, industry, and region, and we will connect you with the right certified partner for your needs." }
      ]}
      ctaLabel="Request a Partner Match"
      ctaHref="mailto:info@iseewaves.pk?subject=Find%20a%20Partner"
    />
  );
}
R2FILEEOF_12

mkdir -p "$(dirname "src/pages/partners/PartnerPortalPage.tsx")"
cat > "src/pages/partners/PartnerPortalPage.tsx" << 'R2FILEEOF_13'
import { LayoutDashboard } from 'lucide-react';
import SimplePage from '../SimplePage';

export default function PartnerPortalPage() {
  return (
    <SimplePage
      eyebrow="Partners"
      title="Partner Portal"
      subtitle="Registered partners can access deal registration, resources, and training through the partner portal."
      icon={LayoutDashboard}
      sections={[
        { heading: "Portal Access", body: "The partner portal gives you deal registration tools, sales and technical resources, and partner-tier pricing. Access is provisioned after your partner application is approved." },
        { heading: "Not a Partner Yet?", body: "If you do not yet have portal access, start by applying to become a partner and our team will set up your account." }
      ]}
      ctaLabel="Request Portal Access"
      ctaHref="mailto:info@iseewaves.pk?subject=Partner%20Portal%20Access"
    />
  );
}
R2FILEEOF_13

mkdir -p "$(dirname "src/pages/partners/PartnerProgramsPage.tsx")"
cat > "src/pages/partners/PartnerProgramsPage.tsx" << 'R2FILEEOF_14'
import { Layers } from 'lucide-react';
import SimplePage from '../SimplePage';

export default function PartnerProgramsPage() {
  return (
    <SimplePage
      eyebrow="Partners"
      title="Partner Programs"
      subtitle="Choose the partner track that fits how you work with your customers."
      icon={Layers}
      sections={[
        { heading: "Referral Partners", body: "Introduce MyESI to your network and earn a commission on closed deals, with no technical delivery obligation." },
        { heading: "Reseller Partners", body: "Resell MyESI under your own commercial relationship with your customers, backed by partner pricing and enablement." },
        { heading: "Implementation Partners", body: "Deliver MyESI onboarding, integration, and on-premises deployments for customers as a certified technical partner." }
      ]}
      ctaLabel="Compare Programs"
      ctaHref="mailto:info@iseewaves.pk?subject=Partner%20Programs"
    />
  );
}
R2FILEEOF_14

mkdir -p "$(dirname "src/pages/resources/TrainingPage.tsx")"
cat > "src/pages/resources/TrainingPage.tsx" << 'R2FILEEOF_15'
import { GraduationCap } from 'lucide-react';
import SimplePage from '../SimplePage';

export default function TrainingPage() {
  return (
    <SimplePage
      eyebrow="Resources"
      title="Training and Certifications"
      subtitle="Get your team fluent in MyESI, from first scan to full pipeline integration."
      icon={GraduationCap}
      sections={[
        { heading: "MyESI Fundamentals", body: "A self-paced course covering SBOM, SSDLC, SCA, SAST, and DAST audits, and how to read and act on MyESI reports." },
        { heading: "Administrator Certification", body: "For platform admins managing repositories, users, and on-premises deployments." },
        { heading: "Developer Track", body: "Hands-on training for engineering teams on integrating MyESI into CI/CD pipelines and resolving findings efficiently." }
      ]}
      ctaLabel="Request Training Access"
      ctaHref="mailto:info@iseewaves.pk?subject=Training%20and%20Certifications"
    />
  );
}
R2FILEEOF_15

mkdir -p "$(dirname "src/pages/resources/DocumentationPage.tsx")"
cat > "src/pages/resources/DocumentationPage.tsx" << 'R2FILEEOF_16'
import { BookOpen } from 'lucide-react';
import SimplePage from '../SimplePage';

export default function DocumentationPage() {
  return (
    <SimplePage
      eyebrow="Resources"
      title="Product Documentation"
      subtitle="Everything you need to set up, integrate, and operate MyESI."
      icon={BookOpen}
      sections={[
        { heading: "Getting Started", body: "Step-by-step guides for connecting your first repository and running your first audit." },
        { heading: "Integrations", body: "Documentation for CI/CD integration, API access, and webhook configuration." },
        { heading: "On-Premises Deployment", body: "Infrastructure requirements and deployment guides for running MyESI inside your own environment." }
      ]}
      ctaLabel="Request Documentation Access"
      ctaHref="mailto:info@iseewaves.pk?subject=Product%20Documentation"
    />
  );
}
R2FILEEOF_16

mkdir -p "$(dirname "src/pages/resources/CommunityPage.tsx")"
cat > "src/pages/resources/CommunityPage.tsx" << 'R2FILEEOF_17'
import { Users } from 'lucide-react';
import SimplePage from '../SimplePage';

export default function CommunityPage() {
  return (
    <SimplePage
      eyebrow="Resources"
      title="Customer Community"
      subtitle="Connect with other MyESI customers, share best practices, and shape our roadmap."
      icon={Users}
      sections={[
        { heading: "Who It's For", body: "Security engineers, DevSecOps leads, and compliance teams using MyESI in production." },
        { heading: "What Happens There", body: "Peer discussions, early access to new features, and direct feedback channels to our product team." }
      ]}
      ctaLabel="Join the Community"
      ctaHref="mailto:info@iseewaves.pk?subject=Customer%20Community"
    />
  );
}
R2FILEEOF_17

mkdir -p "$(dirname "src/pages/resources/TrustPage.tsx")"
cat > "src/pages/resources/TrustPage.tsx" << 'R2FILEEOF_18'
import { ShieldCheck } from 'lucide-react';
import SimplePage from '../SimplePage';

export default function TrustPage() {
  return (
    <SimplePage
      eyebrow="Resources"
      title="myESI Trust"
      subtitle="How we secure the platform that secures your software supply chain."
      icon={ShieldCheck}
      sections={[
        { heading: "Data Handling", body: "Source code and scan data are processed only to run your audits and generate your reports, and are never used to train third-party models." },
        { heading: "Deployment Options", body: "Choose cloud-hosted MyESI or a fully on-premises deployment when your policies require code to stay inside your network." },
        { heading: "Security Practices", body: "MyESI is built by a team with hands-on offensive and defensive security experience, applying the same rigor to our own platform that we apply to your audits." }
      ]}
      ctaLabel="Request Our Trust Documentation"
      ctaHref="mailto:info@iseewaves.pk?subject=myESI%20Trust%20Documentation"
    />
  );
}
R2FILEEOF_18

mkdir -p "$(dirname "src/pages/company/ExecutiveTeamPage.tsx")"
cat > "src/pages/company/ExecutiveTeamPage.tsx" << 'R2FILEEOF_19'
import { Users } from 'lucide-react';
import SimplePage from '../SimplePage';

export default function ExecutiveTeamPage() {
  return (
    <SimplePage
      eyebrow="Company"
      title="Executive Team"
      subtitle="The team building MyESI and leading iSeeWaves."
      icon={Users}
      sections={[
        { heading: "Abdullah Nasir - Founder & CEO", body: "Leads product and company strategy for iSeeWaves and MyESI, with a background across offensive security, AI, and software supply chain security." },
        { heading: "Leadership Approach", body: "Our leadership team stays close to the product and to customers, with engineering, security research, and go-to-market working as one team." }
      ]}
    />
  );
}
R2FILEEOF_19

mkdir -p "$(dirname "src/pages/company/InvestorRelationsPage.tsx")"
cat > "src/pages/company/InvestorRelationsPage.tsx" << 'R2FILEEOF_20'
import { TrendingUp } from 'lucide-react';
import SimplePage from '../SimplePage';

export default function InvestorRelationsPage() {
  return (
    <SimplePage
      eyebrow="Company"
      title="Investor Relations"
      subtitle="Information for current and prospective investors in iSeeWaves."
      icon={TrendingUp}
      sections={[
        { heading: "Our Focus", body: "iSeeWaves builds MyESI, an automated software supply chain security and DevSecOps platform, for enterprise and regulated customers." },
        { heading: "Get in Touch", body: "For investment inquiries, partnership discussions, or to request materials, reach out to our team directly." }
      ]}
      ctaLabel="Contact Investor Relations"
      ctaHref="mailto:info@iseewaves.pk?subject=Investor%20Relations"
    />
  );
}
R2FILEEOF_20

mkdir -p "$(dirname "src/pages/connect/EventsPage.tsx")"
cat > "src/pages/connect/EventsPage.tsx" << 'R2FILEEOF_21'
import { CalendarDays } from 'lucide-react';
import SimplePage from '../SimplePage';

export default function EventsPage() {
  return (
    <SimplePage
      eyebrow="Connect"
      title="Meet Us at an Event"
      subtitle="Catch the iSeeWaves and MyESI team at industry events, or invite us to yours."
      icon={CalendarDays}
      sections={[
        { heading: "Where We Show Up", body: "We regularly participate in cybersecurity, DevSecOps, and compliance-focused conferences and community meetups." },
        { heading: "Invite Us", body: "Organizing an event and want MyESI represented, or want to book a live demo on-site? Let us know." }
      ]}
      ctaLabel="Invite Us to Your Event"
      ctaHref="mailto:info@iseewaves.pk?subject=Event%20Invitation"
    />
  );
}
R2FILEEOF_21

echo "Done. Now run: npm run dev"