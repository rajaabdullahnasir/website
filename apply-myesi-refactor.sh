#!/bin/bash
set -e
echo "Applying myESI product-focused refactor..."

# Remove now-unused section components
rm -f src/components/Trainings.tsx src/components/Partners.tsx src/components/Locations.tsx src/components/ThreatMaps.tsx src/components/Services.tsx

mkdir -p "$(dirname "src/App.tsx")"
cat > "src/App.tsx" << 'FILEEOF_0'
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
            </Routes>
          </main>
          <Footer />
        </div>
      </div>
    </Router>
  );
}
FILEEOF_0

mkdir -p "$(dirname "src/components/About.tsx")"
cat > "src/components/About.tsx" << 'FILEEOF_1'
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
FILEEOF_1

mkdir -p "$(dirname "src/components/ContactHiring.tsx")"
cat > "src/components/ContactHiring.tsx" << 'FILEEOF_2'
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
FILEEOF_2

mkdir -p "$(dirname "src/components/Footer.tsx")"
cat > "src/components/Footer.tsx" << 'FILEEOF_3'
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
              <li><Link to="/reports" className="hover:text-emerald-400 transition-colors">Reports</Link></li>
              <li><Link to="/blogs" className="hover:text-emerald-400 transition-colors">Blogs</Link></li>
              <li><Link to="/services" className="hover:text-emerald-400 transition-colors">Services</Link></li>
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
FILEEOF_3

mkdir -p "$(dirname "src/components/Hero.tsx")"
cat > "src/components/Hero.tsx" << 'FILEEOF_4'
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
          <span>Software Supply Chain Security</span>
        </motion.div>

        <motion.h1
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.2 }}
          className="text-5xl md:text-7xl lg:text-8xl font-black tracking-tighter text-white mb-6 uppercase leading-tight"
        >
          Meet <br />
          <span className="text-transparent bg-clip-text bg-gradient-to-r from-emerald-400 to-blue-500 drop-shadow-[0_0_30px_rgba(16,185,129,0.4)]">
            MyESI
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
FILEEOF_4

mkdir -p "$(dirname "src/components/Navbar.tsx")"
cat > "src/components/Navbar.tsx" << 'FILEEOF_5'
import { useState, useEffect } from 'react';
import { Menu, X, Shield } from 'lucide-react';
import { Link, useLocation } from 'react-router-dom';

export default function Navbar() {
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
    { name: 'About', href: '#about' },
    { name: 'MyESI', href: '#product' },
    { name: 'Reports', href: '#news' },
    { name: 'Blogs', href: 'blogs', isRoute: true },
    { name: 'Contact', href: '#contact' },
  ];

  const isHome = location.pathname === '/';

  return (
    <nav
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
          <div className="hidden md:flex items-center space-x-8">
            {navLinks.map((link) => (
              isHome ? (
                <a
                  key={link.name}
                  href={link.href}
                  className="text-sm font-medium text-gray-300 hover:text-emerald-400 transition-colors"
                >
                  {link.name}
                </a>
              ) : (
                <Link
                  key={link.name}
                  to={`/${link.href}`}
                  className="text-sm font-medium text-gray-300 hover:text-emerald-400 transition-colors"
                >
                  {link.name}
                </Link>
              )
            ))}
            {isHome ? (
              <a
                href="#contact"
                className="px-4 py-2 rounded-full bg-emerald-500/10 text-emerald-400 border border-emerald-500/20 hover:bg-emerald-500/20 transition-colors text-sm font-medium"
              >
                Get Secured
              </a>
            ) : (
              <Link
                to="/#contact"
                className="px-4 py-2 rounded-full bg-emerald-500/10 text-emerald-400 border border-emerald-500/20 hover:bg-emerald-500/20 transition-colors text-sm font-medium"
              >
                Get Secured
              </Link>
            )}
          </div>

          {/* Mobile Menu Button */}
          <div className="md:hidden">
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
        <div className="md:hidden glass-panel absolute top-full left-0 right-0 border-t border-white/5">
          <div className="px-4 pt-2 pb-6 space-y-1">
            {navLinks.map((link) => (
              isHome ? (
                <a
                  key={link.name}
                  href={link.href}
                  onClick={() => setIsMobileMenuOpen(false)}
                  className="block px-3 py-3 text-base font-medium text-gray-300 hover:text-emerald-400 hover:bg-white/5 rounded-lg"
                >
                  {link.name}
                </a>
              ) : (
                <Link
                  key={link.name}
                  to={`/${link.href}`}
                  onClick={() => setIsMobileMenuOpen(false)}
                  className="block px-3 py-3 text-base font-medium text-gray-300 hover:text-emerald-400 hover:bg-white/5 rounded-lg"
                >
                  {link.name}
                </Link>
              )
            ))}
          </div>
        </div>
      )}
    </nav>
  );
}
FILEEOF_5

mkdir -p "$(dirname "src/pages/ServicesPage.tsx")"
cat > "src/pages/ServicesPage.tsx" << 'FILEEOF_6'
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
FILEEOF_6

echo "Done. Now run: npm run dev"
