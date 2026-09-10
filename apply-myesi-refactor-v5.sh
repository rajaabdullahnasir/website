#!/bin/bash
set -e
echo "Applying round 5: remove blogs & events, service/training detail pages, partner portal/compare, about/exec team rewrite, careers page..."

# Remove blogs and events entirely
rm -f "src/pages/BlogsPage.tsx" "src/pages/BlogPostPage.tsx" "src/data/blogData.ts" "src/pages/connect/EventsPage.tsx" "src/components/BlogNews.tsx"

mkdir -p "$(dirname "src/App.tsx")"
cat > "src/App.tsx" << 'R5FILEEOF_0'
/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

import { useEffect } from 'react';
import { BrowserRouter as Router, Routes, Route, useLocation } from 'react-router-dom';
import Navbar from './components/Navbar';
import Hero from './components/Hero';
import ExploreGrid from './components/ExploreGrid';
import PCATeaser from './components/PCATeaser';
import TrustedBy from './components/TrustedBy';
import PartnersSlider from './components/PartnersSlider';
import Footer from './components/Footer';
import AboutPage from './pages/AboutPage';
import ProductPage from './pages/ProductPage';
import FeaturesPage from './pages/FeaturesPage';
import PackagesPage from './pages/PackagesPage';
import SupportPage from './pages/SupportPage';
import ContactPage from './pages/ContactPage';
import PCAPage from './pages/PCAPage';
import MyesiLoginPage from './pages/MyesiLoginPage';
import LegalPage from './pages/LegalPage';
import PrivacyPolicyPage from './pages/PrivacyPolicyPage';
import TermsOfServicePage from './pages/TermsOfServicePage';
import CookiePolicyPage from './pages/CookiePolicyPage';
import DemoPage from './pages/DemoPage';
import AllReportsPage from './pages/AllReportsPage';
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
import CareersPage from './pages/CareersPage';
import ServiceDetailPage from './pages/ServiceDetailPage';
import TrainingDetailPage from './pages/TrainingDetailPage';
import ComparePlansPage from './pages/partners/ComparePlansPage';

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
      <ExploreGrid />
      <PCATeaser />
      <TrustedBy />
      <PartnersSlider />
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
              <Route path="/about" element={<AboutPage />} />
              <Route path="/myesi" element={<ProductPage />} />
              <Route path="/features" element={<FeaturesPage />} />
              <Route path="/packages" element={<PackagesPage />} />
              <Route path="/support" element={<SupportPage />} />
              <Route path="/contact" element={<ContactPage />} />
              <Route path="/pca" element={<PCAPage />} />
              <Route path="/myesi/login" element={<MyesiLoginPage />} />
              <Route path="/legal" element={<LegalPage />} />
              <Route path="/privacy" element={<PrivacyPolicyPage />} />
              <Route path="/terms" element={<TermsOfServicePage />} />
              <Route path="/cookies" element={<CookiePolicyPage />} />
              <Route path="/demo" element={<DemoPage />} />
              <Route path="/reports" element={<AllReportsPage />} />
              <Route path="/compliance/:id" element={<CompliancePage />} />
              <Route path="/services" element={<ServicesPage />} />
              <Route path="/services/:slug" element={<ServiceDetailPage />} />
              <Route path="/careers" element={<CareersPage />} />
              <Route path="/partners/become-a-partner" element={<BecomePartnerPage />} />
              <Route path="/partners/find-a-partner" element={<FindPartnerPage />} />
              <Route path="/partners/portal" element={<PartnerPortalPage />} />
              <Route path="/partners/programs" element={<PartnerProgramsPage />} />
              <Route path="/partners/compare-plans" element={<ComparePlansPage />} />
              <Route path="/resources/training" element={<TrainingPage />} />
              <Route path="/resources/training/:slug" element={<TrainingDetailPage />} />
              <Route path="/resources/documentation" element={<DocumentationPage />} />
              <Route path="/resources/community" element={<CommunityPage />} />
              <Route path="/resources/trust" element={<TrustPage />} />
              <Route path="/company/executive-team" element={<ExecutiveTeamPage />} />
              <Route path="/company/investor-relations" element={<InvestorRelationsPage />} />
            </Routes>
          </main>
          <Footer />
        </div>
      </div>
    </Router>
  );
}
R5FILEEOF_0

mkdir -p "$(dirname "src/components/About.tsx")"
cat > "src/components/About.tsx" << 'R5FILEEOF_1'
import { motion } from 'motion/react';
import { Target, ShieldCheck, Zap, Globe, Users, Award } from 'lucide-react';

export default function About() {
  const stats = [
    { icon: Globe, label: 'Global Reach', value: 'Worldwide' },
    { icon: Zap, label: 'Response Time', value: '< 4 Hours' },
    { icon: ShieldCheck, label: 'Support', value: '24/7 Remote' },
    { icon: Target, label: 'Focus', value: 'Innovation & Trust' },
  ];

  const highlights = [
    'Among the top Pakistani cybersecurity exporters',
    "Pakistan's first secure software development company",
    'Registered with SECP',
    'Incubated at the National Incubation Center for Aerospace Technologies (NICAT)',
    'Funded and supported by Ignite and the Ministry of IT & Telecom, Pakistan',
    'Building since 2025',
  ];

  const credentials = ['SECP', 'NICAT', 'Ignite', 'MOITT'];

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
            Founded by our CEO Abdullah Nasir and built by a team of security engineers, researchers, and developers,
            we are a Pakistani cybersecurity and AI technology company dedicated to securing digital assets for
            enterprises, governments, and critical infrastructure worldwide.
          </motion.p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-12 items-center mb-16">
          <motion.div
            initial={{ opacity: 0, x: -50 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            className="glass-card p-8 rounded-3xl"
          >
            <h3 className="text-2xl font-semibold text-white mb-4">Our Mission</h3>
            <p className="text-gray-400 mb-6 leading-relaxed">
              Our mission is to redefine software supply chain security through innovation and trust. We built our
              platform to give organizations a single, automated way to see exactly what is running inside their
              software, and to prove it to auditors, regulators, and partners.
            </p>
            <p className="text-gray-400 leading-relaxed">
              We're open to partnerships and collaborations where we can contribute, secure, and innovate. If you have
              a security challenge that matches our expertise, don't hesitate to contact us.
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

        {/* Highlights & Credentials */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="glass-card rounded-3xl border border-white/10 p-8 md:p-10"
        >
          <div className="flex items-center gap-3 mb-6">
            <div className="w-10 h-10 rounded-xl bg-emerald-400/10 flex items-center justify-center">
              <Award className="w-5 h-5 text-emerald-400" />
            </div>
            <h3 className="text-xl font-bold text-white">Why We're Trusted</h3>
          </div>
          <ul className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-10">
            {highlights.map((h) => (
              <li key={h} className="flex items-start gap-3 text-gray-300 text-sm">
                <div className="w-1.5 h-1.5 rounded-full bg-emerald-400 mt-2 shrink-0 shadow-[0_0_8px_currentColor]" />
                {h}
              </li>
            ))}
          </ul>
          <div className="border-t border-white/10 pt-8">
            <div className="flex items-center gap-3 mb-6">
              <div className="w-10 h-10 rounded-xl bg-blue-400/10 flex items-center justify-center">
                <Users className="w-5 h-5 text-blue-400" />
              </div>
              <h3 className="text-xl font-bold text-white">Registered & Supported By</h3>
            </div>
            <div className="flex flex-wrap items-center gap-x-10 gap-y-6">
              {credentials.map((c) => (
                <span
                  key={c}
                  className="text-xl md:text-2xl font-black text-white tracking-tight grayscale hover:grayscale-0 opacity-60 hover:opacity-100 transition-all"
                >
                  {c}
                </span>
              ))}
            </div>
          </div>
        </motion.div>
      </div>
    </section>
  );
}
R5FILEEOF_1

mkdir -p "$(dirname "src/components/ContactHiring.tsx")"
cat > "src/components/ContactHiring.tsx" << 'R5FILEEOF_2'
import { motion } from 'motion/react';
import { Send } from 'lucide-react';

export default function ContactHiring() {
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
            Have a security challenge? We'd love to hear from you.
          </motion.p>
        </div>

        <div className="max-w-3xl mx-auto">
          <motion.div
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

              <div>
                <label className="block text-sm font-medium text-gray-300 mb-2">Message / Inquiry</label>
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
                className="w-full flex items-center justify-center gap-2 py-4 rounded-xl font-bold text-white bg-emerald-500 hover:bg-emerald-600 transition-all hover:scale-[1.02]"
              >
                <Send className="w-5 h-5" />
                Send Message
              </button>
            </form>
          </motion.div>

          <p className="text-center text-gray-500 text-sm mt-6">
            Looking to join our team instead?{' '}
            <a href="/careers" className="text-emerald-400 hover:underline">Apply here</a>
          </p>
        </div>
      </div>
    </section>
  );
}
R5FILEEOF_2

mkdir -p "$(dirname "src/components/ExploreGrid.tsx")"
cat > "src/components/ExploreGrid.tsx" << 'R5FILEEOF_3'
import { motion } from 'motion/react';
import { Link } from 'react-router-dom';
import {
  Info,
  ShieldCheck,
  LayoutGrid,
  Package,
  Headset,
  FileText,
  Mail,
  Wrench,
} from 'lucide-react';

const items = [
  { icon: Info, title: 'About Us', desc: 'Who we are and our mission', to: '/about' },
  { icon: ShieldCheck, title: 'Our Platform', desc: 'Explore what we\'ve built', to: '/myesi' },
  { icon: LayoutGrid, title: '6 Audits', desc: 'SBOM, SSDLC, SCA, SAST, DAST & more', to: '/features' },
  { icon: Package, title: 'Packages', desc: 'Starter, Business, Enterprise', to: '/packages' },
  { icon: Headset, title: 'Support', desc: 'Trial, technical support & FAQs', to: '/support' },
  { icon: Wrench, title: 'Services', desc: 'Hands-on security engagements', to: '/services' },
  { icon: FileText, title: 'Reports', desc: 'Whitepapers and research', to: '/reports' },
  { icon: Mail, title: 'Contact', desc: 'Talk to our team', to: '/contact' },
];

export default function ExploreGrid() {
  return (
    <section id="explore" className="py-24 relative z-10">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-14">
          <motion.span
            initial={{ opacity: 0, y: 10 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-emerald-400 text-sm font-bold tracking-widest uppercase"
          >
            Explore
          </motion.span>
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-5xl font-bold text-white mt-4"
          >
            Everything We <span className="text-emerald-400">Offer</span>
          </motion.h2>
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          {items.map((item, idx) => (
            <motion.div
              key={item.title}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: idx * 0.05 }}
            >
              <Link
                to={item.to}
                className="group block glass-card rounded-2xl border border-white/10 hover:border-emerald-500/40 p-6 h-full transition-all duration-300"
              >
                <div className="w-11 h-11 rounded-xl bg-emerald-400/10 flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
                  <item.icon className="w-5 h-5 text-emerald-400" />
                </div>
                <h3 className="text-lg font-bold text-white mb-1">{item.title}</h3>
                <p className="text-sm text-gray-400">{item.desc}</p>
              </Link>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
R5FILEEOF_3

mkdir -p "$(dirname "src/components/Navbar.tsx")"
cat > "src/components/Navbar.tsx" << 'R5FILEEOF_4'
import { useState, useEffect, useRef } from 'react';
import { Menu, X, ChevronDown } from 'lucide-react';
import { Link, useLocation } from 'react-router-dom';

type NavItem = { name: string; href: string };

type NavEntry =
  | { type: 'link'; name: string; href: string }
  | { type: 'menu'; name: string; items: NavItem[] };

const navEntries: NavEntry[] = [
  { type: 'link', name: 'About', href: '/about' },
  {
    type: 'menu',
    name: 'Product',
    items: [
      { name: 'MyESI Overview', href: '/myesi' },
      { name: '6 Audits', href: '/features' },
      { name: 'Packages', href: '/packages' },
      { name: 'Free Trial', href: '/support' },
      { name: 'Support', href: '/support' },
    ],
  },
  {
    type: 'menu',
    name: 'Resources',
    items: [
      { name: 'Services', href: '/services' },
      { name: 'Technical Support', href: '/support' },
      { name: 'Training and Certifications', href: '/resources/training' },
      { name: 'Product Documentation', href: '/resources/documentation' },
      { name: 'Customer Community', href: '/resources/community' },
      { name: 'myESI Trust', href: '/resources/trust' },
      { name: 'Reports and Whitepapers', href: '/reports' },
    ],
  },
  {
    type: 'menu',
    name: 'Company',
    items: [
      { name: 'About Us', href: '/about' },
      { name: 'Executive Team', href: '/company/executive-team' },
      { name: 'Investor Relations', href: '/company/investor-relations' },
      { name: 'Compliances', href: '/#compliance' },
      { name: 'Pakistan Cybersecurity Alliance', href: '/pca' },
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
      { name: 'Compare Plans', href: '/partners/compare-plans' },
    ],
  },
  {
    type: 'menu',
    name: 'Connect',
    items: [
      { name: 'Contact Us', href: '/contact' },
      { name: 'Try Our Product', href: '/demo' },
      { name: 'Join Us', href: '/careers' },
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
              to="/myesi/login"
              className="ml-4 px-4 py-2 text-sm font-medium text-gray-300 hover:text-emerald-400 transition-colors"
            >
              Log In
            </Link>
            <Link
              to="/support"
              className="px-4 py-2 rounded-full bg-emerald-500/10 text-emerald-400 border border-emerald-500/20 hover:bg-emerald-500/20 transition-colors text-sm font-medium"
            >
              Register
            </Link>
            <Link
              to="/contact"
              className="px-4 py-2 rounded-full bg-emerald-500 text-white hover:bg-emerald-600 transition-colors text-sm font-medium"
            >
              Get Secured
            </Link>
          </div>

          {/* Mobile Menu Button */}
          <div className="lg:hidden flex items-center gap-3">
            <Link
              to="/myesi/login"
              className="text-sm font-medium text-gray-300 hover:text-emerald-400 transition-colors"
            >
              Log In
            </Link>
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
            <div className="pt-3 mt-2 border-t border-white/10 flex flex-col gap-2">
              <Link
                to="/support"
                onClick={() => setIsMobileMenuOpen(false)}
                className="block text-center px-4 py-3 rounded-full bg-emerald-500/10 text-emerald-400 border border-emerald-500/20 text-sm font-medium"
              >
                Register
              </Link>
              <Link
                to="/contact"
                onClick={() => setIsMobileMenuOpen(false)}
                className="block text-center px-4 py-3 rounded-full bg-emerald-500 text-white text-sm font-medium"
              >
                Get Secured
              </Link>
            </div>
          </div>
        </div>
      )}
    </nav>
  );
}
R5FILEEOF_4

mkdir -p "$(dirname "src/components/Footer.tsx")"
cat > "src/components/Footer.tsx" << 'R5FILEEOF_5'
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
              <li><Link to="/support" className="hover:text-emerald-400 transition-colors">Technical support</Link></li>
              <li><Link to="/resources/training" className="hover:text-emerald-400 transition-colors">Training and certifications</Link></li>
              <li><Link to="/resources/documentation" className="hover:text-emerald-400 transition-colors">Product documentation</Link></li>
              <li><Link to="/resources/community" className="hover:text-emerald-400 transition-colors">Customer community</Link></li>
              <li><Link to="/resources/trust" className="hover:text-emerald-400 transition-colors">myESI Trust</Link></li>
              <li><Link to="/reports" className="hover:text-emerald-400 transition-colors">Reports and whitepapers</Link></li>
            </ul>
          </div>

          <div>
            <h4 className="text-white font-semibold mb-6">Company</h4>
            <ul className="space-y-4 text-sm text-gray-400 mb-4">
              <li><Link to="/about" className="hover:text-emerald-400 transition-colors">About us</Link></li>
              <li><Link to="/company/executive-team" className="hover:text-emerald-400 transition-colors">Executive team</Link></li>
              <li><Link to="/company/investor-relations" className="hover:text-emerald-400 transition-colors">Investor relations</Link></li>
              <li><Link to="/pca" className="hover:text-emerald-400 transition-colors">Pakistan Cybersecurity Alliance</Link></li>
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
              <li><Link to="/contact" className="hover:text-emerald-400 transition-colors">Contact us</Link></li>
              <li><Link to="/demo" className="hover:text-emerald-400 transition-colors">Try our product</Link></li>
              <li><a href="mailto:info@iseewaves.pk?subject=Chat%20with%20Sales" className="hover:text-emerald-400 transition-colors">Chat with sales</a></li>
              <li><Link to="/careers" className="hover:text-emerald-400 transition-colors">Join us</Link></li>
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
R5FILEEOF_5

mkdir -p "$(dirname "src/data/servicesData.ts")"
cat > "src/data/servicesData.ts" << 'R5FILEEOF_6'
export interface ServiceDetail {
  slug: string;
  category: string;
  title: string;
  summary: string;
  description: string;
  whatWeDo: string[];
  deliverables: string[];
}

export const servicesData: ServiceDetail[] = [
  // Offensive Security
  {
    slug: 'penetration-testing',
    category: 'Offensive Security',
    title: 'Penetration Testing',
    summary: 'Simulated real-world attacks against your applications, networks, and infrastructure.',
    description:
      'Our penetration testing engagements go beyond automated scans, combining manual testing techniques with real attacker methodology to uncover exploitable weaknesses across web, mobile, network, and cloud environments before adversaries do.',
    whatWeDo: [
      'Web, mobile, API, and network penetration testing',
      'Manual exploitation, not just automated scanning',
      'Business-logic and access-control testing',
      'Retesting after remediation',
    ],
    deliverables: ['Detailed technical report', 'Executive summary', 'Risk-ranked findings with remediation guidance'],
  },
  {
    slug: 'red-teaming',
    category: 'Offensive Security',
    title: 'Red Teaming',
    summary: 'Full-scope adversary simulation to test detection and response, not just prevention.',
    description:
      'We simulate a determined, real-world adversary across your people, processes, and technology, working to achieve defined objectives without triggering alarms, so you know exactly how your organization performs under real attack conditions.',
    whatWeDo: [
      'Objective-based, multi-stage adversary simulation',
      'Testing of detection and incident response capability',
      'Physical, technical, and social attack vectors as scoped',
      'Coordinated debrief with your blue team',
    ],
    deliverables: ['Attack narrative and timeline', 'Detection gap analysis', 'Purple team recommendations'],
  },
  {
    slug: 'social-engineering',
    category: 'Offensive Security',
    title: 'Social Engineering',
    summary: 'Testing the human layer of your security through realistic phishing and pretexting.',
    description:
      'People remain the most targeted attack surface. We run controlled social engineering campaigns, from phishing to phone-based pretexting, to measure real susceptibility and strengthen your human firewall.',
    whatWeDo: [
      'Phishing and spear-phishing simulations',
      'Vishing (phone-based) and pretexting exercises',
      'Physical access and tailgating tests as scoped',
      'Awareness metrics and reporting',
    ],
    deliverables: ['Campaign results and click/report rates', 'Risk-by-department breakdown', 'Awareness recommendations'],
  },
  // Defensive Security
  {
    slug: 'ransomware-protection',
    category: 'Defensive Security',
    title: 'Ransomware Protection',
    summary: 'Hardening your environment against ransomware and validating your recovery plan.',
    description:
      'We assess your exposure to ransomware across endpoints, backups, and network segmentation, then help you close the gaps that turn a single compromised machine into an organization-wide incident.',
    whatWeDo: [
      'Ransomware exposure and attack-path assessment',
      'Backup and recovery validation',
      'Endpoint and network segmentation hardening',
      'Incident response playbook development',
    ],
    deliverables: ['Exposure assessment report', 'Hardening roadmap', 'Tested recovery plan'],
  },
  {
    slug: 'network-security',
    category: 'Defensive Security',
    title: 'Network Security',
    summary: 'Architecture review and hardening of your network perimeter and internal segmentation.',
    description:
      'We review your network architecture end to end, from perimeter firewalls to internal segmentation, identifying misconfigurations and design weaknesses that could let an attacker move freely once inside.',
    whatWeDo: [
      'Firewall and network architecture review',
      'Segmentation and access control assessment',
      'Configuration hardening for network devices',
      'VPN and remote access security review',
    ],
    deliverables: ['Architecture review report', 'Hardening checklist', 'Prioritized remediation plan'],
  },
  {
    slug: 'endpoint-hardening',
    category: 'Defensive Security',
    title: 'Endpoint Hardening',
    summary: 'Locking down laptops, servers, and workstations against common attack techniques.',
    description:
      'Endpoints are usually the first foothold an attacker gets. We harden operating system configurations, review your EDR coverage, and close off the techniques most commonly used for initial access and persistence.',
    whatWeDo: [
      'OS and configuration hardening baselines',
      'EDR/antivirus coverage review',
      'Privilege and local admin rights review',
      'Patch and update management review',
    ],
    deliverables: ['Hardening baseline document', 'Endpoint risk report', 'Implementation support'],
  },
  // vCISO
  {
    slug: 'security-strategy',
    category: 'vCISO',
    title: 'Security Strategy',
    summary: 'Executive-level security leadership without the cost of a full-time hire.',
    description:
      'Our vCISO service gives you access to experienced security leadership to define strategy, prioritize investment, and align security with business objectives, on a schedule that fits your organization.',
    whatWeDo: [
      'Security roadmap and strategy development',
      'Risk-based investment prioritization',
      'Security program maturity assessment',
      'Ongoing advisory and leadership support',
    ],
    deliverables: ['Security strategy document', 'Prioritized roadmap', 'Quarterly review cadence'],
  },
  {
    slug: 'board-level-reporting',
    category: 'vCISO',
    title: 'Board-Level Reporting',
    summary: 'Translating security posture into language your board and executives can act on.',
    description:
      'We prepare and present security posture, risk, and investment updates in a format built for board and executive audiences, so security stays visible and understood at the leadership level.',
    whatWeDo: [
      'Board-ready security posture reporting',
      'Risk register and heat-map presentation',
      'Incident and audit summary briefings',
      'Ongoing executive advisory sessions',
    ],
    deliverables: ['Board report template and cadence', 'Executive briefing sessions', 'Risk visualization materials'],
  },
  {
    slug: 'risk-governance',
    category: 'vCISO',
    title: 'Risk Governance',
    summary: 'Building the governance structure that keeps security decisions accountable.',
    description:
      'We help you establish the policies, ownership, and review cadence needed to manage security risk as a continuous governance function, not a one-time project.',
    whatWeDo: [
      'Risk register setup and ownership assignment',
      'Governance policy and framework development',
      'Risk acceptance and exception processes',
      'Periodic governance review facilitation',
    ],
    deliverables: ['Risk governance framework', 'Policy documentation', 'Review cadence and templates'],
  },
  // Compliance & GRC
  {
    slug: 'grc',
    category: 'Compliance & GRC',
    title: 'GRC',
    summary: 'Governance, risk, and compliance programs built to fit how your organization actually works.',
    description:
      'We design and implement GRC programs that map controls to the frameworks that matter to you, without burying your team in process for its own sake.',
    whatWeDo: [
      'GRC program design and implementation',
      'Control mapping to relevant frameworks',
      'Third-party and vendor risk assessment',
      'Ongoing GRC program management support',
    ],
    deliverables: ['GRC program documentation', 'Control matrix', 'Implementation support'],
  },
  {
    slug: 'policy-documentation',
    category: 'Compliance & GRC',
    title: 'Policy Documentation',
    summary: 'Clear, audit-ready security policies tailored to your organization.',
    description:
      'We write and structure the security policies and procedures your organization needs for audits, certifications, and day-to-day operations, in language your teams will actually follow.',
    whatWeDo: [
      'Security policy suite development',
      'Procedure and standard documentation',
      'Policy gap analysis against target frameworks',
      'Periodic policy review and updates',
    ],
    deliverables: ['Complete policy suite', 'Gap analysis report', 'Review and update schedule'],
  },
  {
    slug: 'risk-reports',
    category: 'Compliance & GRC',
    title: 'Risk Reports',
    summary: 'Regular, structured risk reporting for compliance and internal visibility.',
    description:
      'We produce structured risk reports that give you a clear, current picture of your risk posture, formatted for the auditors, regulators, or leadership who need to see it.',
    whatWeDo: [
      'Periodic risk assessment and reporting',
      'Framework-mapped risk documentation',
      'Audit-ready evidence packaging',
      'Trend reporting across review cycles',
    ],
    deliverables: ['Structured risk reports', 'Audit evidence package', 'Trend dashboards'],
  },
  // Cloud & AI Security
  {
    slug: 'cloud-security-audits',
    category: 'Cloud & AI Security',
    title: 'Cloud Security Audits',
    summary: 'Configuration and architecture review across AWS, Azure, and GCP environments.',
    description:
      'We audit your cloud environment against best-practice benchmarks and real attacker techniques, identifying misconfigurations, excessive permissions, and exposed resources before they become incidents.',
    whatWeDo: [
      'Cloud configuration review (AWS/Azure/GCP)',
      'IAM and permissions audit',
      'Exposed resource and storage review',
      'Cloud architecture security assessment',
    ],
    deliverables: ['Cloud audit report', 'Prioritized remediation plan', 'Benchmark compliance summary'],
  },
  {
    slug: 'ai-security',
    category: 'Cloud & AI Security',
    title: 'AI Security',
    summary: 'Security assessment for AI and machine learning systems and pipelines.',
    description:
      'As AI systems move into production, they bring new attack surfaces. We assess model pipelines, data handling, and integration points for the security risks specific to AI-driven systems.',
    whatWeDo: [
      'AI/ML pipeline security assessment',
      'Model and data exposure review',
      'Prompt injection and abuse testing for LLM integrations',
      'Secure AI deployment recommendations',
    ],
    deliverables: ['AI security assessment report', 'Risk-ranked findings', 'Secure deployment guidance'],
  },
  {
    slug: 'devsecops',
    category: 'Cloud & AI Security',
    title: 'DevSecOps',
    summary: 'Embedding security directly into your development and deployment pipelines.',
    description:
      'We help you integrate security tooling and practices directly into your CI/CD pipeline, so vulnerabilities are caught before release instead of after, without slowing your teams down.',
    whatWeDo: [
      'CI/CD pipeline security integration',
      'Automated security tooling setup (SAST/DAST/SCA)',
      'Secure development workflow design',
      'Developer security training',
    ],
    deliverables: ['Pipeline integration', 'Tooling configuration', 'Team enablement session'],
  },
];

export function getServiceBySlug(slug: string) {
  return servicesData.find((s) => s.slug === slug);
}
R5FILEEOF_6

mkdir -p "$(dirname "src/data/trainingData.ts")"
cat > "src/data/trainingData.ts" << 'R5FILEEOF_7'
export interface TrainingDetail {
  slug: string;
  title: string;
  summary: string;
  description: string;
  topics: string[];
  format: string;
}

export const trainingData: TrainingDetail[] = [
  {
    slug: 'corporate-training',
    title: 'Corporate Training',
    summary: 'Organization-wide security awareness and readiness training for your workforce.',
    description:
      'We deliver corporate training programs that build a security-first culture across your organization, covering the everyday risks employees actually face, tailored to your industry and team structure.',
    topics: ['Security awareness fundamentals', 'Password and access hygiene', 'Data handling and privacy basics', 'Incident reporting procedures'],
    format: 'On-site or remote, half-day to multi-day formats available',
  },
  {
    slug: 'phishing-simulation',
    title: 'Phishing & Social Engineering Awareness',
    summary: 'Simulated phishing campaigns paired with training to reduce human-layer risk.',
    description:
      'We run controlled phishing simulations across your organization, then follow up with targeted training for the people and departments who need it most, turning results into measurable improvement over time.',
    topics: ['Simulated phishing campaigns', 'Vishing and pretexting awareness', 'Reporting culture building', 'Before/after risk metrics'],
    format: 'Ongoing campaign-based engagement or one-time assessment',
  },
  {
    slug: 'ethical-hacking',
    title: 'Ethical Hacking Training',
    summary: 'Hands-on offensive security training for aspiring and practicing security professionals.',
    description:
      'A practical, hands-on curriculum covering reconnaissance, exploitation, and reporting, built for students and professionals who want real offensive security skills, not just theory.',
    topics: ['Reconnaissance and OSINT', 'Web and network exploitation', 'Privilege escalation techniques', 'Professional reporting standards'],
    format: 'Cohort-based or individual, in-person or remote',
  },
  {
    slug: 'digital-forensics',
    title: 'Digital Forensics Training',
    summary: 'Investigative training for incident response and digital evidence handling.',
    description:
      'This program covers the fundamentals and practical tooling of digital forensics, from evidence acquisition to analysis and chain-of-custody, for teams building internal incident response capability.',
    topics: ['Evidence acquisition and chain of custody', 'Disk and memory forensics', 'Log and network artifact analysis', 'Forensic tooling (Autopsy, and others)'],
    format: 'Cohort-based or individual, in-person or remote',
  },
  {
    slug: 'specialized-personalized-training',
    title: 'Specialized & Personalized Training',
    summary: 'Custom-built training designed around your team, tools, and specific goals.',
    description:
      'When off-the-shelf training doesn\'t fit, we build a program around your specific stack, threat model, and skill gaps, whether that is one engineer or an entire department.',
    topics: ['Curriculum built around your environment', 'Flexible pacing and depth', 'One-on-one or small group formats', 'Follow-up support after training'],
    format: 'Fully customized, scheduled around your team',
  },
];

export function getTrainingBySlug(slug: string) {
  return trainingData.find((t) => t.slug === slug);
}
R5FILEEOF_7

mkdir -p "$(dirname "src/pages/ServicesPage.tsx")"
cat > "src/pages/ServicesPage.tsx" << 'R5FILEEOF_8'
import { motion } from 'motion/react';
import { ShieldAlert, ShieldCheck, FileCheck, Cloud, UserCog, ArrowLeft, ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';
import { servicesData } from '../data/servicesData';

const categoryMeta: Record<string, { icon: any; color: string; bg: string; border: string }> = {
  'Offensive Security': { icon: ShieldAlert, color: 'text-red-400', bg: 'bg-red-400/10', border: 'border-red-400/20' },
  'Defensive Security': { icon: ShieldCheck, color: 'text-blue-400', bg: 'bg-blue-400/10', border: 'border-blue-400/20' },
  'vCISO': { icon: UserCog, color: 'text-amber-400', bg: 'bg-amber-400/10', border: 'border-amber-400/20' },
  'Compliance & GRC': { icon: FileCheck, color: 'text-purple-400', bg: 'bg-purple-400/10', border: 'border-purple-400/20' },
  'Cloud & AI Security': { icon: Cloud, color: 'text-emerald-400', bg: 'bg-emerald-400/10', border: 'border-emerald-400/20' },
};

export default function ServicesPage() {
  const categories = Array.from(new Set(servicesData.map((s) => s.category)));

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
            A focused set of cybersecurity services for organizations that need hands-on expertise. Click any service for details and to request it.
          </motion.p>
        </div>

        <div className="space-y-14">
          {categories.map((category) => {
            const meta = categoryMeta[category];
            const items = servicesData.filter((s) => s.category === category);
            return (
              <div key={category}>
                <div className="flex items-center gap-3 mb-6">
                  <div className={`w-10 h-10 rounded-xl ${meta.bg} flex items-center justify-center`}>
                    <meta.icon className={`w-5 h-5 ${meta.color}`} />
                  </div>
                  <h2 className="text-2xl font-bold text-white">{category}</h2>
                </div>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                  {items.map((item, idx) => (
                    <motion.div
                      key={item.slug}
                      initial={{ opacity: 0, y: 20 }}
                      whileInView={{ opacity: 1, y: 0 }}
                      viewport={{ once: true }}
                      transition={{ delay: idx * 0.08 }}
                    >
                      <Link
                        to={`/services/${item.slug}`}
                        className={`group block glass-card p-6 rounded-2xl border ${meta.border} hover:border-opacity-60 transition-all duration-300 h-full`}
                      >
                        <h3 className="text-lg font-bold text-white mb-2">{item.title}</h3>
                        <p className="text-sm text-gray-400 mb-4">{item.summary}</p>
                        <span className={`inline-flex items-center gap-1 text-sm font-medium ${meta.color}`}>
                          View Details
                          <ArrowRight className="w-3.5 h-3.5 group-hover:translate-x-1 transition-transform" />
                        </span>
                      </Link>
                    </motion.div>
                  ))}
                </div>
              </div>
            );
          })}
        </div>

        <div className="text-center mt-16">
          <Link
            to="/contact"
            className="inline-flex items-center gap-2 px-8 py-4 rounded-full bg-emerald-500 hover:bg-emerald-600 text-white font-semibold transition-all hover:scale-105"
          >
            Discuss a Service
          </Link>
        </div>
      </div>
    </div>
  );
}
R5FILEEOF_8

mkdir -p "$(dirname "src/pages/ServiceDetailPage.tsx")"
cat > "src/pages/ServiceDetailPage.tsx" << 'R5FILEEOF_9'
import { motion } from 'motion/react';
import { ArrowLeft, Send, CheckCircle2 } from 'lucide-react';
import { Link, useParams, Navigate } from 'react-router-dom';
import { getServiceBySlug } from '../data/servicesData';

export default function ServiceDetailPage() {
  const { slug } = useParams<{ slug: string }>();
  const service = slug ? getServiceBySlug(slug) : undefined;

  if (!service) {
    return <Navigate to="/services" replace />;
  }

  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/services" className="inline-flex items-center gap-2 text-gray-400 hover:text-emerald-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Services</span>
          </Link>
        </div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="mb-12">
          <span className="text-emerald-400 text-sm font-bold tracking-widest uppercase">{service.category}</span>
          <h1 className="text-3xl md:text-5xl font-bold text-white mt-4 mb-4">{service.title}</h1>
          <p className="text-lg text-gray-400 max-w-2xl">{service.summary}</p>
        </motion.div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8 mb-16">
          <div className="lg:col-span-2 space-y-8">
            <div className="glass-card rounded-2xl border border-white/10 p-8">
              <h2 className="text-xl font-bold text-white mb-3">Overview</h2>
              <p className="text-gray-400 leading-relaxed">{service.description}</p>
            </div>
            <div className="glass-card rounded-2xl border border-white/10 p-8">
              <h2 className="text-xl font-bold text-white mb-4">What We Do</h2>
              <ul className="space-y-3">
                {service.whatWeDo.map((item) => (
                  <li key={item} className="flex items-start gap-3 text-gray-300 text-sm">
                    <CheckCircle2 className="w-4 h-4 text-emerald-400 mt-0.5 shrink-0" />
                    {item}
                  </li>
                ))}
              </ul>
            </div>
            <div className="glass-card rounded-2xl border border-white/10 p-8">
              <h2 className="text-xl font-bold text-white mb-4">Deliverables</h2>
              <ul className="space-y-3">
                {service.deliverables.map((item) => (
                  <li key={item} className="flex items-start gap-3 text-gray-300 text-sm">
                    <CheckCircle2 className="w-4 h-4 text-blue-400 mt-0.5 shrink-0" />
                    {item}
                  </li>
                ))}
              </ul>
            </div>
          </div>

          <div className="lg:col-span-1">
            <div className="glass-card rounded-2xl border border-emerald-500/20 p-6 sticky top-28">
              <h2 className="text-lg font-bold text-white mb-2">Request This Service</h2>
              <p className="text-sm text-gray-400 mb-6">
                Tell us about your environment and requirements. We'll follow up by email.
              </p>
              <form
                action="mailto:info@iseewaves.pk"
                method="post"
                encType="text/plain"
                className="space-y-4"
              >
                <input type="hidden" name="subject" value={`Service Request: ${service.title}`} />
                <input type="hidden" name="service" value={service.title} />
                <div>
                  <label className="block text-xs font-medium text-gray-400 mb-1.5">Full Name</label>
                  <input required name="name" type="text" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white/5 border border-white/10 text-white focus:outline-none focus:border-emerald-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-400 mb-1.5">Company</label>
                  <input required name="company" type="text" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white/5 border border-white/10 text-white focus:outline-none focus:border-emerald-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-400 mb-1.5">Work Email</label>
                  <input required name="email" type="email" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white/5 border border-white/10 text-white focus:outline-none focus:border-emerald-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-400 mb-1.5">Phone</label>
                  <input name="phone" type="tel" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white/5 border border-white/10 text-white focus:outline-none focus:border-emerald-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-400 mb-1.5">Environment Size (e.g. team, assets, scope)</label>
                  <input name="environment" type="text" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white/5 border border-white/10 text-white focus:outline-none focus:border-emerald-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-400 mb-1.5">Preferred Timeline</label>
                  <input name="timeline" type="text" placeholder="e.g. within 2 weeks" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white/5 border border-white/10 text-white focus:outline-none focus:border-emerald-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-400 mb-1.5">Requirements</label>
                  <textarea name="requirements" rows={4} className="w-full px-3 py-2.5 text-sm rounded-lg bg-white/5 border border-white/10 text-white focus:outline-none focus:border-emerald-500" />
                </div>
                <button
                  type="submit"
                  className="w-full flex items-center justify-center gap-2 px-6 py-3 rounded-full bg-emerald-500 hover:bg-emerald-600 text-white font-semibold transition-all"
                >
                  Send Request
                  <Send className="w-4 h-4" />
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
R5FILEEOF_9

mkdir -p "$(dirname "src/pages/SimplePage.tsx")"
cat > "src/pages/SimplePage.tsx" << 'R5FILEEOF_10'
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
  secondaryCtaLabel?: string;
  secondaryCtaHref?: string;
}

export default function SimplePage({ eyebrow, title, subtitle, icon: Icon, sections, ctaLabel, ctaHref, secondaryCtaLabel, secondaryCtaHref }: SimplePageProps) {
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

        {(ctaLabel && ctaHref) || (secondaryCtaLabel && secondaryCtaHref) ? (
          <div className="mt-12 text-center flex flex-wrap items-center justify-center gap-4">
            {ctaLabel && ctaHref && (
              <a
                href={ctaHref}
                className="inline-flex items-center gap-2 px-8 py-4 rounded-full bg-emerald-500 hover:bg-emerald-600 text-white font-semibold transition-all hover:scale-105"
              >
                {ctaLabel}
              </a>
            )}
            {secondaryCtaLabel && secondaryCtaHref && (
              <a
                href={secondaryCtaHref}
                className="inline-flex items-center gap-2 px-8 py-4 rounded-full glass-card text-white font-semibold hover:bg-white/10 transition-all hover:scale-105"
              >
                {secondaryCtaLabel}
              </a>
            )}
          </div>
        ) : null}
      </div>
    </div>
  );
}
R5FILEEOF_10

mkdir -p "$(dirname "src/pages/CareersPage.tsx")"
cat > "src/pages/CareersPage.tsx" << 'R5FILEEOF_11'
import { motion } from 'motion/react';
import { ArrowLeft, Send, Briefcase } from 'lucide-react';
import { Link } from 'react-router-dom';

export default function CareersPage() {
  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-400 hover:text-emerald-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="text-center mb-14">
          <div className="w-14 h-14 rounded-xl bg-blue-400/10 flex items-center justify-center mx-auto mb-6">
            <Briefcase className="w-7 h-7 text-blue-400" />
          </div>
          <span className="text-blue-400 text-sm font-bold tracking-widest uppercase">Careers</span>
          <h1 className="text-3xl md:text-5xl font-bold text-white mt-4 mb-4">Join the Team</h1>
          <p className="text-lg text-gray-400 max-w-xl mx-auto">
            We're always looking for people who care about doing security work properly. Tell us about yourself.
          </p>
        </motion.div>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.1 }}
          className="glass-card p-8 md:p-12 rounded-3xl"
        >
          <form
            action="mailto:info@iseewaves.pk"
            method="POST"
            encType="text/plain"
            className="space-y-6"
          >
            <input type="hidden" name="subject" value="Career Application" />
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <label className="block text-sm font-medium text-gray-300 mb-2">Full Name</label>
                <input
                  type="text"
                  name="name"
                  required
                  className="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-blue-500 transition-colors"
                  placeholder="John Doe"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-300 mb-2">Email Address</label>
                <input
                  type="email"
                  name="email"
                  required
                  className="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-blue-500 transition-colors"
                  placeholder="john@example.com"
                />
              </div>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-300 mb-2">Position Applied For</label>
              <select
                name="position"
                className="w-full bg-[#1a1a1a] border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-blue-500 transition-colors"
              >
                <option value="penetration-tester">Penetration Tester</option>
                <option value="ai-developer">AI Developer</option>
                <option value="security-engineer">Security Engineer</option>
                <option value="grc-consultant">GRC Consultant</option>
                <option value="software-engineer">Software Engineer</option>
                <option value="business-developer">Business Developer</option>
                <option value="marketing-specialist">Marketing Specialist</option>
                <option value="intern">Intern</option>
                <option value="other">Other</option>
              </select>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-300 mb-2">LinkedIn / Portfolio (optional)</label>
              <input
                type="text"
                name="portfolio"
                className="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-blue-500 transition-colors"
                placeholder="https://"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-300 mb-2">Cover Letter / Experience</label>
              <textarea
                name="message"
                required
                rows={6}
                className="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-blue-500 transition-colors resize-none"
                placeholder="Tell us about yourself and why you'd be a good fit..."
              ></textarea>
            </div>

            <button
              type="submit"
              className="w-full flex items-center justify-center gap-2 py-4 rounded-xl font-bold text-white bg-blue-500 hover:bg-blue-600 transition-all hover:scale-[1.02]"
            >
              <Send className="w-5 h-5" />
              Submit Application
            </button>
          </form>
        </motion.div>
      </div>
    </div>
  );
}
R5FILEEOF_11

mkdir -p "$(dirname "src/pages/AllReportsPage.tsx")"
cat > "src/pages/AllReportsPage.tsx" << 'R5FILEEOF_12'
import { motion } from 'motion/react';
import { FileText, ExternalLink, ArrowLeft } from 'lucide-react';
import { Link } from 'react-router-dom';

const reports = [
  {
    title: 'The BBC AI Incident: Open-Source Blind Spots',
    date: 'Feb 24, 2026',
    type: 'Briefing',
    desc: 'Our latest threat brief decomposes how "Shadow Code" in open-source AI libraries compromised professional workflows at the BBC. With a 742% increase in supply chain attacks, traditional firewalls are no longer enough.',
    report: '/Reserches-Report/The AI Supply Chain Crisis.pdf'
  },
  {
    title: 'Bluetooth Patch Accountability: Securing Consumer Wireless Devices Against Real-World Attacks',
    date: 'Jan 28, 2026',
    type: 'Research Report',
    desc: 'Consumer Bluetooth devices often suffer from vendor abandonment, leaving millions of users vulnerable to eavesdropping and tracking long after support ends. We propose the Bluetooth Security Health Descriptor (BSHD), a novel framework that shifts security enforcement from the peripheral to the host OS. This introduces accountability and risk-enforced security to the wireless ecosystem.',
    report: '/Reserches-Report/bt.pdf'
  },
  {
    title: 'Pakistan\u2019s First SBOM Driven Vulnerability Intelligence Platform',
    date: 'Nov 10, 2025',
    type: 'Product Report',
    desc: 'We are proud to introduce myESI (My Enterprise Security Intelligence). Pakistan\u2019s first SBOM-powered vulnerability intelligence platform, designed to make software security measurable, automated and compliant with modern standards.',
    report: '/Reserches-Report/myesi.pdf'
  },
  {
    title: 'iSeeWaves and BetaCodes (Formerly Forbmax) Strategic Insight Session to Strengthen “MyESI - My Enterprise Security Intelligence” platform with Industry Experts',
    date: 'Dec 12, 2025',
    type: 'Insight Report',
    desc: 'This session with Zubair Elahi, CCO BetaCodes focused on a shared vision to strengthen the "MyESI - My Enterprise Security Intelligence" platform, moving beyond traditional digital defense toward an intelligent, self-learning future.',
    report: '/Reserches-Report/forbmax.pdf'
  },
  {
    title: 'The Future of Spatial Awareness: Wi-Fi Signals as a New Lens',
    date: 'Sep 8, 2025',
    type: 'Whitepaper',
    desc: 'A pioneering Wi-Fi-based human presence detection system designed to function without cameras. Developed in Pakistan by a multidisciplinary team of young innovators, it is built to support emergency response, secure zones, smart homes, and industrial safety.',
    report: '/Reserches-Report/whitepaper.pdf'
  },
];

export default function AllReportsPage() {
  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-400 hover:text-emerald-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <div className="text-center mb-16">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-full glass-card border-emerald-500/30 text-emerald-400 text-sm font-medium mb-6"
          >
            <FileText className="w-4 h-4" />
            <span>Research & Reports</span>
          </motion.div>
          <motion.h1
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.1 }}
            className="text-4xl md:text-6xl font-bold text-white mb-6"
          >
            All <span className="text-emerald-400">Reports</span>
          </motion.h1>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.2 }}
            className="text-lg text-gray-400 max-w-2xl mx-auto"
          >
            Browse our full library of whitepapers, research reports, and security guides.
          </motion.p>
        </div>

        <div className="space-y-6">
          {reports.map((report, idx) => (
            <motion.div
              key={idx}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: idx * 0.1 + 0.3 }}
              className="glass-card p-6 rounded-2xl group hover:border-emerald-500/50 transition-colors"
            >
              <div className="flex justify-between items-start mb-3">
                <span className="text-xs font-mono text-emerald-400 bg-emerald-400/10 px-2 py-1 rounded-full">
                  {report.type}
                </span>
                <span className="text-sm text-gray-500">{report.date}</span>
              </div>
              <h4 className="text-xl font-bold text-white mb-2 group-hover:text-emerald-400 transition-colors">
                {report.title}
              </h4>
              <p className="text-gray-400 mb-4">{report.desc}</p>
              <a href={report.report} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-2 text-emerald-400 hover:text-emerald-300 font-medium text-sm">
                Read Full Report <ExternalLink className="w-4 h-4" />
              </a>
            </motion.div>
          ))}
        </div>
      </div>
    </div>
  );
}
R5FILEEOF_12

mkdir -p "$(dirname "src/pages/DemoPage.tsx")"
cat > "src/pages/DemoPage.tsx" << 'R5FILEEOF_13'
import { motion } from 'motion/react';
import { Shield, Play, ArrowLeft } from 'lucide-react';
import { Link } from 'react-router-dom';
import { useRef, useState } from 'react';

export default function DemoPage() {
  const videoRef = useRef<HTMLVideoElement>(null);
  const [playing, setPlaying] = useState(false);

  const handlePlay = () => {
    if (videoRef.current) {
      videoRef.current.play();
      setPlaying(true);
    }
  };

  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/myesi" className="inline-flex items-center gap-2 text-gray-400 hover:text-emerald-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Product</span>
          </Link>
        </div>

        <div className="text-center mb-16">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-full glass-card border-emerald-500/30 text-emerald-400 text-sm font-medium mb-6"
          >
            <Shield className="w-4 h-4" />
            <span>MyESI Platform</span>
          </motion.div>
          <motion.h1
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.1 }}
            className="text-4xl md:text-6xl font-bold text-white mb-6"
          >
            Watch <span className="text-emerald-400">Demo</span>
          </motion.h1>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.2 }}
            className="text-lg text-gray-400 max-w-2xl mx-auto"
          >
            See how MyESI secures your code by uncovering hidden vulnerabilities in modules, third-party frameworks, and APIs.
          </motion.p>
        </div>

        <motion.div
          initial={{ opacity: 0, scale: 0.95 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ delay: 0.3 }}
          className="glass-card rounded-3xl overflow-hidden border-emerald-500/30 relative aspect-video w-full flex items-center justify-center group cursor-pointer"
          onClick={handlePlay}
        >
          {/* Actual video */}
          <video
            ref={videoRef}
            className="absolute inset-0 w-full h-full object-cover"
            loop
            playsInline
            onPlay={() => setPlaying(true)}
            onPause={() => setPlaying(false)}
          >
            <source src="/Demo/Demo.mp4" type="video/mp4" />
          </video>

          {/* Overlay — hidden once playing */}
          {!playing && (
            <>
              <div className="absolute inset-0 bg-gradient-to-br from-emerald-900/20 to-black/80 z-10" />
              <div className="relative z-20 flex flex-col items-center">
                <div className="w-20 h-20 rounded-full bg-emerald-500/20 backdrop-blur-md flex items-center justify-center mb-4 group-hover:scale-110 group-hover:bg-emerald-500/40 transition-all duration-300 border border-emerald-400/30">
                  <Play className="w-8 h-8 text-emerald-400 ml-1" />
                </div>
                <p className="text-white font-medium tracking-wide">Click to Play Video</p>
              </div>
            </>
          )}
        </motion.div>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.4 }}
          className="mt-16 grid grid-cols-1 md:grid-cols-3 gap-8"
        >
          <div className="glass-card p-6 rounded-2xl border-white/5">
            <h3 className="text-xl font-bold text-white mb-3">Line-by-Line Validation</h3>
            <p className="text-gray-400 text-sm">Watch how MyESI validates the SSDLC process line-by-line, going beyond simple library checks.</p>
          </div>
          <div className="glass-card p-6 rounded-2xl border-white/5">
            <h3 className="text-xl font-bold text-white mb-3">Real-time Heatmaps</h3>
            <p className="text-gray-400 text-sm">See the automated evidence collection for SBP or PCI-DSS audits in action.</p>
          </div>
          <div className="glass-card p-6 rounded-2xl border-white/5">
            <h3 className="text-xl font-bold text-white mb-3">SBOM Generation</h3>
            <p className="text-gray-400 text-sm">Learn how to generate verifiable SBOMs and security attestations with a single click.</p>
          </div>
        </motion.div>
      </div>
    </div>
  );
}
R5FILEEOF_13

mkdir -p "$(dirname "src/pages/resources/TrainingPage.tsx")"
cat > "src/pages/resources/TrainingPage.tsx" << 'R5FILEEOF_14'
import { motion } from 'motion/react';
import { GraduationCap, ArrowLeft, ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';
import { trainingData } from '../../data/trainingData';

export default function TrainingPage() {
  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-400 hover:text-emerald-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="mb-12">
          <div className="w-14 h-14 rounded-xl bg-emerald-400/10 flex items-center justify-center mb-6">
            <GraduationCap className="w-7 h-7 text-emerald-400" />
          </div>
          <span className="text-emerald-400 text-sm font-bold tracking-widest uppercase">Resources</span>
          <h1 className="text-3xl md:text-5xl font-bold text-white mt-4 mb-4">Training and Certifications</h1>
          <p className="text-lg text-gray-400 max-w-2xl">
            We provide corporate trainings, phishing and social engineering awareness programs, ethical hacking and
            digital forensics training, and fully specialized, personalized training built around your team.
          </p>
        </motion.div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {trainingData.map((t, idx) => (
            <motion.div
              key={t.slug}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: idx * 0.08 }}
            >
              <Link
                to={`/resources/training/${t.slug}`}
                className="group block glass-card rounded-2xl border border-white/10 hover:border-emerald-500/40 p-6 h-full transition-all"
              >
                <h3 className="text-lg font-bold text-white mb-2">{t.title}</h3>
                <p className="text-sm text-gray-400 mb-4">{t.summary}</p>
                <span className="inline-flex items-center gap-1 text-sm font-medium text-emerald-400">
                  View & Book
                  <ArrowRight className="w-3.5 h-3.5 group-hover:translate-x-1 transition-transform" />
                </span>
              </Link>
            </motion.div>
          ))}
        </div>
      </div>
    </div>
  );
}
R5FILEEOF_14

mkdir -p "$(dirname "src/pages/TrainingDetailPage.tsx")"
cat > "src/pages/TrainingDetailPage.tsx" << 'R5FILEEOF_15'
import { motion } from 'motion/react';
import { ArrowLeft, Send, CheckCircle2 } from 'lucide-react';
import { Link, useParams, Navigate } from 'react-router-dom';
import { getTrainingBySlug } from '../data/trainingData';

export default function TrainingDetailPage() {
  const { slug } = useParams<{ slug: string }>();
  const training = slug ? getTrainingBySlug(slug) : undefined;

  if (!training) {
    return <Navigate to="/resources/training" replace />;
  }

  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/resources/training" className="inline-flex items-center gap-2 text-gray-400 hover:text-emerald-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Training</span>
          </Link>
        </div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="mb-12">
          <span className="text-emerald-400 text-sm font-bold tracking-widest uppercase">Training Program</span>
          <h1 className="text-3xl md:text-5xl font-bold text-white mt-4 mb-4">{training.title}</h1>
          <p className="text-lg text-gray-400 max-w-2xl">{training.summary}</p>
        </motion.div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          <div className="lg:col-span-2 space-y-8">
            <div className="glass-card rounded-2xl border border-white/10 p-8">
              <h2 className="text-xl font-bold text-white mb-3">Overview</h2>
              <p className="text-gray-400 leading-relaxed">{training.description}</p>
            </div>
            <div className="glass-card rounded-2xl border border-white/10 p-8">
              <h2 className="text-xl font-bold text-white mb-4">What's Covered</h2>
              <ul className="space-y-3">
                {training.topics.map((topic) => (
                  <li key={topic} className="flex items-start gap-3 text-gray-300 text-sm">
                    <CheckCircle2 className="w-4 h-4 text-emerald-400 mt-0.5 shrink-0" />
                    {topic}
                  </li>
                ))}
              </ul>
            </div>
            <div className="glass-card rounded-2xl border border-white/10 p-8">
              <h2 className="text-xl font-bold text-white mb-2">Format</h2>
              <p className="text-gray-400 text-sm">{training.format}</p>
            </div>
          </div>

          <div className="lg:col-span-1">
            <div className="glass-card rounded-2xl border border-emerald-500/20 p-6 sticky top-28">
              <h2 className="text-lg font-bold text-white mb-2">Book This Training</h2>
              <p className="text-sm text-gray-400 mb-6">
                Tell us about your team and goals, we'll follow up to schedule.
              </p>
              <form
                action="mailto:info@iseewaves.pk"
                method="post"
                encType="text/plain"
                className="space-y-4"
              >
                <input type="hidden" name="subject" value={`Training Booking: ${training.title}`} />
                <input type="hidden" name="training" value={training.title} />
                <div>
                  <label className="block text-xs font-medium text-gray-400 mb-1.5">Full Name</label>
                  <input required name="name" type="text" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white/5 border border-white/10 text-white focus:outline-none focus:border-emerald-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-400 mb-1.5">Organization</label>
                  <input required name="company" type="text" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white/5 border border-white/10 text-white focus:outline-none focus:border-emerald-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-400 mb-1.5">Work Email</label>
                  <input required name="email" type="email" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white/5 border border-white/10 text-white focus:outline-none focus:border-emerald-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-400 mb-1.5">Phone</label>
                  <input name="phone" type="tel" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white/5 border border-white/10 text-white focus:outline-none focus:border-emerald-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-400 mb-1.5">Number of Participants</label>
                  <input name="participants" type="text" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white/5 border border-white/10 text-white focus:outline-none focus:border-emerald-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-400 mb-1.5">Preferred Dates</label>
                  <input name="dates" type="text" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white/5 border border-white/10 text-white focus:outline-none focus:border-emerald-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-400 mb-1.5">Goals / Notes</label>
                  <textarea name="notes" rows={4} className="w-full px-3 py-2.5 text-sm rounded-lg bg-white/5 border border-white/10 text-white focus:outline-none focus:border-emerald-500" />
                </div>
                <button
                  type="submit"
                  className="w-full flex items-center justify-center gap-2 px-6 py-3 rounded-full bg-emerald-500 hover:bg-emerald-600 text-white font-semibold transition-all"
                >
                  Request Booking
                  <Send className="w-4 h-4" />
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
R5FILEEOF_15

mkdir -p "$(dirname "src/pages/partners/PartnerPortalPage.tsx")"
cat > "src/pages/partners/PartnerPortalPage.tsx" << 'R5FILEEOF_16'
import { motion } from 'motion/react';
import { ArrowLeft, LayoutDashboard } from 'lucide-react';
import { Link } from 'react-router-dom';

export default function PartnerPortalPage() {
  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10 flex items-center justify-center">
      <div className="max-w-md w-full px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-400 hover:text-emerald-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          className="glass-card rounded-2xl border border-white/10 p-8"
        >
          <div className="w-12 h-12 rounded-xl bg-emerald-400/10 flex items-center justify-center mb-6">
            <LayoutDashboard className="w-6 h-6 text-emerald-400" />
          </div>
          <h1 className="text-2xl font-bold text-white mb-2">Partner Portal</h1>
          <p className="text-sm text-gray-400 mb-8">
            Sign in to access deal registration, resources, and partner-tier pricing.
          </p>

          <form
            action="mailto:info@iseewaves.pk"
            method="post"
            encType="text/plain"
            className="space-y-5"
          >
            <input type="hidden" name="subject" value="Partner Portal Login Assistance" />
            <div>
              <label className="block text-sm font-medium text-gray-300 mb-2">Partner Email</label>
              <input required name="email" type="email" className="w-full px-4 py-3 rounded-lg bg-white/5 border border-white/10 text-white focus:outline-none focus:border-emerald-500" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-300 mb-2">Password</label>
              <input required name="password" type="password" className="w-full px-4 py-3 rounded-lg bg-white/5 border border-white/10 text-white focus:outline-none focus:border-emerald-500" />
            </div>
            <button
              type="submit"
              className="w-full px-6 py-3 rounded-full bg-emerald-500 hover:bg-emerald-600 text-white font-semibold transition-all"
            >
              Sign In
            </button>
          </form>

          <p className="text-sm text-gray-500 mt-6 text-center">
            Not a partner yet?{' '}
            <Link to="/partners/become-a-partner" className="text-emerald-400 hover:underline">Become a partner</Link>
          </p>
        </motion.div>
      </div>
    </div>
  );
}
R5FILEEOF_16

mkdir -p "$(dirname "src/pages/partners/BecomePartnerPage.tsx")"
cat > "src/pages/partners/BecomePartnerPage.tsx" << 'R5FILEEOF_17'
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
      secondaryCtaLabel="Partner Portal"
      secondaryCtaHref="/partners/portal"
    />
  );
}
R5FILEEOF_17

mkdir -p "$(dirname "src/pages/partners/FindPartnerPage.tsx")"
cat > "src/pages/partners/FindPartnerPage.tsx" << 'R5FILEEOF_18'
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
      secondaryCtaLabel="Partner Portal"
      secondaryCtaHref="/partners/portal"
    />
  );
}
R5FILEEOF_18

mkdir -p "$(dirname "src/pages/partners/PartnerProgramsPage.tsx")"
cat > "src/pages/partners/PartnerProgramsPage.tsx" << 'R5FILEEOF_19'
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
      ctaLabel="Compare Plans"
      ctaHref="/partners/compare-plans"
      secondaryCtaLabel="Apply Now"
      secondaryCtaHref="mailto:info@iseewaves.pk?subject=Partner%20Programs"
    />
  );
}
R5FILEEOF_19

mkdir -p "$(dirname "src/pages/partners/ComparePlansPage.tsx")"
cat > "src/pages/partners/ComparePlansPage.tsx" << 'R5FILEEOF_20'
import { motion } from 'motion/react';
import { ArrowLeft, Check, Minus } from 'lucide-react';
import { Link } from 'react-router-dom';

const rows = [
  { label: 'Deal registration', referral: false, reseller: true, implementation: true },
  { label: 'Partner-tier pricing', referral: false, reseller: true, implementation: true },
  { label: 'Referral commission', referral: true, reseller: false, implementation: false },
  { label: 'Resell under your own contract', referral: false, reseller: true, implementation: true },
  { label: 'Technical certification required', referral: false, reseller: false, implementation: true },
  { label: 'Delivery / implementation rights', referral: false, reseller: false, implementation: true },
  { label: 'Co-marketing support', referral: true, reseller: true, implementation: true },
  { label: 'Dedicated partner manager', referral: false, reseller: true, implementation: true },
];

const plans = [
  { key: 'referral', name: 'Referral Partner', desc: 'Introduce us, we close the deal' },
  { key: 'reseller', name: 'Reseller Partner', desc: 'Sell under your own commercial relationship' },
  { key: 'implementation', name: 'Implementation Partner', desc: 'Deliver deployments as a certified partner' },
];

export default function ComparePlansPage() {
  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/partners/programs" className="inline-flex items-center gap-2 text-gray-400 hover:text-emerald-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Partner Programs</span>
          </Link>
        </div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="text-center mb-14">
          <span className="text-emerald-400 text-sm font-bold tracking-widest uppercase">Partners</span>
          <h1 className="text-3xl md:text-5xl font-bold text-white mt-4 mb-4">Compare Partner Plans</h1>
          <p className="text-lg text-gray-400 max-w-2xl mx-auto">
            Choose the partnership track that fits how you want to work with us.
          </p>
        </motion.div>

        <div className="overflow-x-auto">
          <table className="w-full min-w-[640px] border-collapse">
            <thead>
              <tr>
                <th className="text-left p-4 text-gray-500 text-sm font-medium"></th>
                {plans.map((p) => (
                  <th key={p.key} className="p-4 text-center">
                    <div className="text-white font-bold text-lg">{p.name}</div>
                    <div className="text-gray-400 text-xs font-normal mt-1">{p.desc}</div>
                  </th>
                ))}
              </tr>
            </thead>
            <tbody>
              {rows.map((row, idx) => (
                <tr key={row.label} className={idx % 2 === 0 ? 'bg-white/[0.02]' : ''}>
                  <td className="p-4 text-sm text-gray-300 border-t border-white/5">{row.label}</td>
                  {(['referral', 'reseller', 'implementation'] as const).map((key) => (
                    <td key={key} className="p-4 text-center border-t border-white/5">
                      {row[key] ? (
                        <Check className="w-5 h-5 text-emerald-400 mx-auto" />
                      ) : (
                        <Minus className="w-5 h-5 text-gray-600 mx-auto" />
                      )}
                    </td>
                  ))}
                </tr>
              ))}
            </tbody>
          </table>
        </div>

        <div className="text-center mt-14">
          <a
            href="mailto:info@iseewaves.pk?subject=Partner%20Program%20Application"
            className="inline-flex items-center gap-2 px-8 py-4 rounded-full bg-emerald-500 hover:bg-emerald-600 text-white font-semibold transition-all hover:scale-105"
          >
            Apply to a Program
          </a>
        </div>
      </div>
    </div>
  );
}
R5FILEEOF_20

mkdir -p "$(dirname "src/pages/company/ExecutiveTeamPage.tsx")"
cat > "src/pages/company/ExecutiveTeamPage.tsx" << 'R5FILEEOF_21'
import { motion } from 'motion/react';
import { ArrowLeft, Quote, Users } from 'lucide-react';
import { Link } from 'react-router-dom';

export default function ExecutiveTeamPage() {
  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-400 hover:text-emerald-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="mb-14">
          <div className="w-14 h-14 rounded-xl bg-emerald-400/10 flex items-center justify-center mb-6">
            <Users className="w-7 h-7 text-emerald-400" />
          </div>
          <span className="text-emerald-400 text-sm font-bold tracking-widest uppercase">Company</span>
          <h1 className="text-3xl md:text-5xl font-bold text-white mt-4 mb-4">Executive Team</h1>
          <p className="text-lg text-gray-400 max-w-2xl">The people leading iSeeWaves and building our platform.</p>
        </motion.div>

        {/* CEO Profile */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="glass-card rounded-3xl border border-white/10 p-8 md:p-10 mb-10"
        >
          <div className="flex flex-col md:flex-row gap-8 items-start">
            <div className="w-32 h-32 rounded-2xl bg-gradient-to-br from-emerald-500/30 to-blue-500/30 flex items-center justify-center shrink-0 border border-white/10 mx-auto md:mx-0">
              <span className="text-4xl font-black text-white">AN</span>
            </div>
            <div className="flex-1">
              <h2 className="text-2xl font-bold text-white mb-1">Abdullah Nasir</h2>
              <p className="text-emerald-400 text-sm font-semibold mb-4">Founder & CEO, iSeeWaves</p>
              <p className="text-gray-400 leading-relaxed mb-4">
                Abdullah founded iSeeWaves after previously building and exiting a cybersecurity and AI company. He
                leads product and company strategy, with hands-on experience spanning offensive security, AI
                systems, and software supply chain security. He also founded and leads the Pakistan Cybersecurity
                Alliance, a community platform connecting cybersecurity professionals, students, and institutions
                across Pakistan.
              </p>
              <p className="text-gray-400 leading-relaxed mb-4">
                He holds certifications including CEH (EC-Council), AWS Certified Cloud Practitioner, CRPO (ICTTF),
                and NIST CSF 2.0 Audit Practitioner, and was selected among the 100 Young Leaders of Pakistan
                (NLIS 2026).
              </p>
            </div>
          </div>

          <div className="mt-8 pt-8 border-t border-white/10 relative">
            <Quote className="w-8 h-8 text-emerald-400/40 absolute -top-4 left-0" />
            <p className="text-gray-300 italic leading-relaxed pl-10">
              "We started iSeeWaves because too many organizations only find out what's actually running in their
              software after something has already gone wrong. Our job is to make that visibility automatic,
              defensible, and available before the incident, not after it. Everything we build, from our platform to
              our services to the Pakistan Cybersecurity Alliance, comes back to that one idea: security that people
              can actually trust and verify."
            </p>
            <p className="text-sm text-gray-500 mt-3 pl-10">— Abdullah Nasir, Founder & CEO</p>
          </div>
        </motion.div>

        {/* Leadership Approach - detailed */}
        <motion.article
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="glass-card rounded-3xl border border-white/10 p-8 md:p-10"
        >
          <span className="text-blue-400 text-xs font-bold tracking-widest uppercase">Leadership Approach</span>
          <h2 className="text-2xl md:text-3xl font-bold text-white mt-3 mb-6">How We Lead</h2>

          <div className="prose-invert space-y-6 text-gray-400 leading-relaxed">
            <p>
              Leadership at iSeeWaves is deliberately close to the work. Rather than running strategy from a distance,
              our leadership team stays hands-on with the product, with client engagements, and with the security
              research that shapes both. That closeness means decisions about roadmap, pricing, and priorities are
              made by people who have personally run the audits, written the reports, and sat across the table from
              the customers those decisions affect.
            </p>
            <p>
              We treat engineering, security research, and go-to-market as a single team rather than three competing
              functions. A finding from a penetration test can directly influence a product feature. A pattern seen
              across client compliance reviews can reshape how we prioritize our roadmap. This tight feedback loop is
              only possible because leadership does not sit above the work, it sits inside it.
            </p>
            <p>
              We also believe accountability has to be specific. Every engagement, whether it is a platform audit, a
              services deliverable, or a training program, has a named owner who is reachable, not a support queue.
              When something goes wrong, and in security work something eventually will, our approach is to say so
              plainly, explain what we are doing about it, and follow through, rather than managing the message.
            </p>
            <p>
              Finally, we see leadership as a responsibility that extends beyond the company. Through the Pakistan
              Cybersecurity Alliance, our leadership team invests time in growing the broader security community in
              Pakistan, mentoring students, sharing research, and working alongside government and industry partners.
              We think a stronger ecosystem around us makes the work we do for our customers stronger too.
            </p>
          </div>
        </motion.article>
      </div>
    </div>
  );
}
R5FILEEOF_21

echo "Done. Now run: npm run dev"