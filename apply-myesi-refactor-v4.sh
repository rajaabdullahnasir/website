#!/bin/bash
set -e
echo "Applying round 4: no MyESI mentions on homepage, login/register buttons, plain trusted-by logos..."

mkdir -p "$(dirname "src/App.tsx")"
cat > "src/App.tsx" << 'R4FILEEOF_0'
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
R4FILEEOF_0

mkdir -p "$(dirname "src/components/Hero.tsx")"
cat > "src/components/Hero.tsx" << 'R4FILEEOF_1'
import { motion } from 'motion/react';
import { ShieldAlert, ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';

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
          An automated, SBOM-based platform that uncovers hidden vulnerabilities in your software supply chain and validates your secure development lifecycle line by line.
        </motion.p>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.6 }}
          className="flex flex-col sm:flex-row items-center justify-center gap-4"
        >
          <Link
            to="/myesi"
            className="flex items-center gap-2 px-8 py-4 rounded-full bg-emerald-500 text-white font-semibold hover:bg-emerald-600 transition-all hover:scale-105"
          >
            Explore Our Platform
            <ArrowRight className="w-5 h-5" />
          </Link>
          <Link
            to="/contact"
            className="flex items-center gap-2 px-8 py-4 rounded-full glass-card text-white font-semibold hover:bg-white/10 transition-all hover:scale-105"
          >
            Contact Us
          </Link>
        </motion.div>
      </div>
    </section>
  );
}
R4FILEEOF_1

mkdir -p "$(dirname "src/components/ExploreGrid.tsx")"
cat > "src/components/ExploreGrid.tsx" << 'R4FILEEOF_2'
import { motion } from 'motion/react';
import { Link } from 'react-router-dom';
import {
  Info,
  ShieldCheck,
  LayoutGrid,
  Package,
  Headset,
  FileText,
  Newspaper,
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
  { icon: Newspaper, title: 'Blogs', desc: 'News and insights', to: '/blogs' },
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
R4FILEEOF_2

mkdir -p "$(dirname "src/components/Navbar.tsx")"
cat > "src/components/Navbar.tsx" << 'R4FILEEOF_3'
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
      { name: 'Blogs', href: '/blogs' },
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
    ],
  },
  {
    type: 'menu',
    name: 'Connect',
    items: [
      { name: 'Contact Us', href: '/contact' },
      { name: 'Try Our Product', href: '/demo' },
      { name: 'Meet Us at an Event', href: '/connect/events' },
      { name: 'Join Us', href: '/contact' },
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
R4FILEEOF_3

mkdir -p "$(dirname "src/components/TrustedBy.tsx")"
cat > "src/components/TrustedBy.tsx" << 'R4FILEEOF_4'
import { motion } from 'motion/react';

const trustedBy = [
  { short: 'MOITT', full: 'Ministry of IT & Telecom' },
  { short: 'Ignite', full: 'Ignite National Technology Fund' },
  { short: 'NICAT', full: 'National Incubation Center' },
  { short: 'NACK', full: 'NACK' },
  { short: 'NCERT', full: 'National CERT' },
  { short: 'IIUI', full: 'International Islamic University Islamabad' },
];

export default function TrustedBy() {
  return (
    <section id="trusted-by" className="py-20 relative z-10 border-t border-white/5">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <motion.p
          initial={{ opacity: 0, y: 10 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="text-center text-gray-500 text-sm font-semibold tracking-widest uppercase mb-12"
        >
          Trusted By
        </motion.p>
        <div className="flex flex-wrap items-center justify-center gap-x-14 gap-y-8">
          {trustedBy.map((org, idx) => (
            <motion.div
              key={org.short}
              initial={{ opacity: 0, y: 15 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: idx * 0.05 }}
              className="flex flex-col items-center grayscale hover:grayscale-0 opacity-60 hover:opacity-100 transition-all duration-300"
              title={org.full}
            >
              <span className="text-2xl md:text-3xl font-black text-white tracking-tight">{org.short}</span>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
R4FILEEOF_4

mkdir -p "$(dirname "src/pages/MyesiLoginPage.tsx")"
cat > "src/pages/MyesiLoginPage.tsx" << 'R4FILEEOF_5'
import { motion } from 'motion/react';
import { ArrowLeft, LogIn } from 'lucide-react';
import { Link } from 'react-router-dom';

export default function MyesiLoginPage() {
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
            <LogIn className="w-6 h-6 text-emerald-400" />
          </div>
          <h1 className="text-2xl font-bold text-white mb-2">Sign In</h1>
          <p className="text-sm text-gray-400 mb-8">
            Access your customer portal. If you don't have login access yet, request it from our team.
          </p>

          <form
            action="mailto:info@iseewaves.pk"
            method="post"
            encType="text/plain"
            className="space-y-5"
          >
            <input type="hidden" name="subject" value="Portal Login Assistance" />
            <div>
              <label className="block text-sm font-medium text-gray-300 mb-2">Email Address</label>
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
            Don't have an account?{' '}
            <Link to="/support" className="text-emerald-400 hover:underline">Register for a free trial</Link>
          </p>
        </motion.div>
      </div>
    </div>
  );
}
R4FILEEOF_5

echo "Done. Now run: npm run dev"