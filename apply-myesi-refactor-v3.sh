#!/bin/bash
set -e
echo "Applying round 3: pages for all sections, PCA, trusted-by, partners slider..."

# BlogNews homepage teaser is now unused (Reports has its own page); remove it
rm -f "src/components/BlogNews.tsx"

mkdir -p "$(dirname "src/App.tsx")"
cat > "src/App.tsx" << 'R3FILEEOF_0'
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
R3FILEEOF_0

mkdir -p "$(dirname "src/components/ExploreGrid.tsx")"
cat > "src/components/ExploreGrid.tsx" << 'R3FILEEOF_1'
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
  { icon: ShieldCheck, title: 'MyESI', desc: 'Our flagship product', to: '/myesi' },
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
            Everything About <span className="text-emerald-400">MyESI</span>
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
R3FILEEOF_1

mkdir -p "$(dirname "src/components/PCATeaser.tsx")"
cat > "src/components/PCATeaser.tsx" << 'R3FILEEOF_2'
import { motion } from 'motion/react';
import { Users, ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';

export default function PCATeaser() {
  return (
    <section id="pca" className="py-24 relative z-10">
      <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="glass-card rounded-2xl border border-white/10 p-8 md:p-12 flex flex-col md:flex-row items-center gap-8"
        >
          <div className="w-16 h-16 shrink-0 rounded-2xl bg-emerald-400/10 flex items-center justify-center">
            <Users className="w-8 h-8 text-emerald-400" />
          </div>
          <div className="flex-1 text-center md:text-left">
            <span className="text-emerald-400 text-xs font-bold tracking-widest uppercase">Community Initiative</span>
            <h3 className="text-2xl md:text-3xl font-bold text-white mt-2 mb-2">Pakistan Cybersecurity Alliance</h3>
            <p className="text-gray-400 max-w-xl">
              A community platform connecting cybersecurity professionals, students, and institutions across Pakistan.
            </p>
          </div>
          <div className="flex flex-col sm:flex-row gap-3">
            <Link
              to="/pca"
              className="flex items-center justify-center gap-2 px-6 py-3 rounded-full bg-emerald-500 hover:bg-emerald-600 text-white font-semibold transition-all hover:scale-105 whitespace-nowrap"
            >
              Explore PCA
              <ArrowRight className="w-4 h-4" />
            </Link>
            <a
              href="mailto:info@iseewaves.pk?subject=Join%20Pakistan%20Cybersecurity%20Alliance"
              className="flex items-center justify-center gap-2 px-6 py-3 rounded-full glass-card text-white font-semibold hover:bg-white/10 transition-all whitespace-nowrap"
            >
              Join Us
            </a>
          </div>
        </motion.div>
      </div>
    </section>
  );
}
R3FILEEOF_2

mkdir -p "$(dirname "src/components/TrustedBy.tsx")"
cat > "src/components/TrustedBy.tsx" << 'R3FILEEOF_3'
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
          className="text-center text-gray-500 text-sm font-semibold tracking-widest uppercase mb-10"
        >
          Trusted By
        </motion.p>
        <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-6 gap-6">
          {trustedBy.map((org, idx) => (
            <motion.div
              key={org.short}
              initial={{ opacity: 0, y: 15 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: idx * 0.05 }}
              className="glass-card rounded-xl border border-white/10 flex flex-col items-center justify-center py-6 px-3 grayscale hover:grayscale-0 opacity-70 hover:opacity-100 transition-all"
              title={org.full}
            >
              <span className="text-lg font-black text-white tracking-tight">{org.short}</span>
              <span className="text-[10px] text-gray-500 text-center mt-1 leading-tight">{org.full}</span>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
R3FILEEOF_3

mkdir -p "$(dirname "src/components/PartnersSlider.tsx")"
cat > "src/components/PartnersSlider.tsx" << 'R3FILEEOF_4'
import { motion } from 'motion/react';

const partners = [
  'Omnitell Tech Pakistan',
  'The Vision Bridge',
  'Pakistan Cybersecurity Alliance',
  'P@SHA',
  'NICAT',
  'Ignite National Technology Fund',
];

const loopPartners = [...partners, ...partners];

export default function PartnersSlider() {
  return (
    <section className="py-20 relative z-10 border-t border-white/5 overflow-hidden">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <motion.p
          initial={{ opacity: 0, y: 10 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="text-center text-gray-500 text-sm font-semibold tracking-widest uppercase mb-10"
        >
          Our Partners
        </motion.p>
      </div>

      <div className="relative w-full">
        <div className="absolute left-0 top-0 bottom-0 w-24 bg-gradient-to-r from-[#050505] to-transparent z-10 pointer-events-none" />
        <div className="absolute right-0 top-0 bottom-0 w-24 bg-gradient-to-l from-[#050505] to-transparent z-10 pointer-events-none" />
        <div className="partner-marquee-track flex items-center gap-6 w-max">
          {loopPartners.map((name, idx) => (
            <div
              key={`${name}-${idx}`}
              className="glass-card rounded-xl border border-white/10 px-8 py-5 flex items-center justify-center shrink-0 grayscale hover:grayscale-0 opacity-70 hover:opacity-100 transition-all"
            >
              <span className="text-white font-semibold whitespace-nowrap text-sm md:text-base">{name}</span>
            </div>
          ))}
        </div>
      </div>

      <style>{`
        .partner-marquee-track {
          animation: partner-marquee 28s linear infinite;
        }
        @keyframes partner-marquee {
          0% { transform: translateX(0); }
          100% { transform: translateX(-50%); }
        }
      `}</style>
    </section>
  );
}
R3FILEEOF_4

mkdir -p "$(dirname "src/components/Navbar.tsx")"
cat > "src/components/Navbar.tsx" << 'R3FILEEOF_5'
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
              to="/contact"
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
R3FILEEOF_5

mkdir -p "$(dirname "src/components/Footer.tsx")"
cat > "src/components/Footer.tsx" << 'R3FILEEOF_6'
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
              <li><Link to="/blogs" className="hover:text-emerald-400 transition-colors">Blogs</Link></li>
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
              <li><Link to="/connect/events" className="hover:text-emerald-400 transition-colors">Meet us at an event</Link></li>
              <li><Link to="/contact" className="hover:text-emerald-400 transition-colors">Join us</Link></li>
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
R3FILEEOF_6

mkdir -p "$(dirname "src/components/Hero.tsx")"
cat > "src/components/Hero.tsx" << 'R3FILEEOF_7'
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
          My Enterprise Security Intelligence, by iSeeWaves. An automated, SBOM-based platform that uncovers hidden vulnerabilities in your software supply chain and validates your SSDLC line by line.
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
            Explore MyESI
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
R3FILEEOF_7

mkdir -p "$(dirname "src/components/Packages.tsx")"
cat > "src/components/Packages.tsx" << 'R3FILEEOF_8'
import { motion } from 'motion/react';
import { Link } from 'react-router-dom';
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
              <Link
                to="/support"
                className={`text-center px-6 py-3 rounded-full font-semibold transition-all hover:scale-105 ${
                  pkg.highlight
                    ? 'bg-emerald-500 text-white hover:bg-emerald-600'
                    : 'glass-card text-white hover:bg-white/10'
                }`}
              >
                Get Started
              </Link>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
R3FILEEOF_8

mkdir -p "$(dirname "src/components/SupportSection.tsx")"
cat > "src/components/SupportSection.tsx" << 'R3FILEEOF_9'
import { useState } from 'react';
import { Link } from 'react-router-dom';
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
                <Link to="/packages" className="text-emerald-400 hover:underline">Packages</Link> section above for what is
                included in Starter, Business, and Enterprise, or talk to our team for a tailored quote.
              </p>
              <Link
                to="/packages"
                className="inline-flex items-center gap-2 px-6 py-3 rounded-full bg-emerald-500 hover:bg-emerald-600 text-white font-semibold transition-all"
              >
                View Packages
              </Link>
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
R3FILEEOF_9

mkdir -p "$(dirname "src/pages/AboutPage.tsx")"
cat > "src/pages/AboutPage.tsx" << 'R3FILEEOF_10'
import { ArrowLeft } from 'lucide-react';
import { Link } from 'react-router-dom';
import About from '../components/About';

export default function AboutPage() {
  return (
    <div className="pt-24">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-8">
        <Link to="/" className="inline-flex items-center gap-2 text-gray-400 hover:text-emerald-400 transition-colors">
          <ArrowLeft className="w-4 h-4" />
          <span>Back to Home</span>
        </Link>
      </div>
      <About />
    </div>
  );
}
R3FILEEOF_10

mkdir -p "$(dirname "src/pages/ProductPage.tsx")"
cat > "src/pages/ProductPage.tsx" << 'R3FILEEOF_11'
import { ArrowLeft } from 'lucide-react';
import { Link } from 'react-router-dom';
import Product from '../components/Product';

export default function ProductPage() {
  return (
    <div className="pt-24">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-8">
        <Link to="/" className="inline-flex items-center gap-2 text-gray-400 hover:text-emerald-400 transition-colors">
          <ArrowLeft className="w-4 h-4" />
          <span>Back to Home</span>
        </Link>
      </div>
      <Product />
    </div>
  );
}
R3FILEEOF_11

mkdir -p "$(dirname "src/pages/FeaturesPage.tsx")"
cat > "src/pages/FeaturesPage.tsx" << 'R3FILEEOF_12'
import { ArrowLeft } from 'lucide-react';
import { Link } from 'react-router-dom';
import AuditFeatures from '../components/AuditFeatures';

export default function FeaturesPage() {
  return (
    <div className="pt-24">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-8">
        <Link to="/" className="inline-flex items-center gap-2 text-gray-400 hover:text-emerald-400 transition-colors">
          <ArrowLeft className="w-4 h-4" />
          <span>Back to Home</span>
        </Link>
      </div>
      <AuditFeatures />
    </div>
  );
}
R3FILEEOF_12

mkdir -p "$(dirname "src/pages/PackagesPage.tsx")"
cat > "src/pages/PackagesPage.tsx" << 'R3FILEEOF_13'
import { ArrowLeft } from 'lucide-react';
import { Link } from 'react-router-dom';
import Packages from '../components/Packages';

export default function PackagesPage() {
  return (
    <div className="pt-24">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-8">
        <Link to="/" className="inline-flex items-center gap-2 text-gray-400 hover:text-emerald-400 transition-colors">
          <ArrowLeft className="w-4 h-4" />
          <span>Back to Home</span>
        </Link>
      </div>
      <Packages />
    </div>
  );
}
R3FILEEOF_13

mkdir -p "$(dirname "src/pages/SupportPage.tsx")"
cat > "src/pages/SupportPage.tsx" << 'R3FILEEOF_14'
import { ArrowLeft } from 'lucide-react';
import { Link } from 'react-router-dom';
import SupportSection from '../components/SupportSection';

export default function SupportPage() {
  return (
    <div className="pt-24">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-8">
        <Link to="/" className="inline-flex items-center gap-2 text-gray-400 hover:text-emerald-400 transition-colors">
          <ArrowLeft className="w-4 h-4" />
          <span>Back to Home</span>
        </Link>
      </div>
      <SupportSection />
    </div>
  );
}
R3FILEEOF_14

mkdir -p "$(dirname "src/pages/ContactPage.tsx")"
cat > "src/pages/ContactPage.tsx" << 'R3FILEEOF_15'
import { ArrowLeft } from 'lucide-react';
import { Link } from 'react-router-dom';
import ContactHiring from '../components/ContactHiring';

export default function ContactPage() {
  return (
    <div className="pt-24">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-8">
        <Link to="/" className="inline-flex items-center gap-2 text-gray-400 hover:text-emerald-400 transition-colors">
          <ArrowLeft className="w-4 h-4" />
          <span>Back to Home</span>
        </Link>
      </div>
      <ContactHiring />
    </div>
  );
}
R3FILEEOF_15

mkdir -p "$(dirname "src/pages/PCAPage.tsx")"
cat > "src/pages/PCAPage.tsx" << 'R3FILEEOF_16'
import { motion } from 'motion/react';
import { ArrowLeft, Users, Calendar, BookOpen, Handshake, ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';

export default function PCAPage() {
  const pillars = [
    {
      icon: Users,
      title: 'Community',
      body: 'A network connecting cybersecurity professionals, students, and institutions across Pakistan to learn from and support one another.',
    },
    {
      icon: Calendar,
      title: 'Events',
      body: 'Meetups, workshops, and flagship events like Threat Horizons Pakistan, bringing together government, industry, and academia.',
    },
    {
      icon: BookOpen,
      title: 'Knowledge Sharing',
      body: 'Whitepapers, research, and speaker sessions from practitioners working across offensive security, defense, and compliance.',
    },
    {
      icon: Handshake,
      title: 'Partnerships',
      body: 'Collaborations with government bodies, industry leaders, and academic institutions to strengthen Pakistan\'s cybersecurity ecosystem.',
    },
  ];

  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-400 hover:text-emerald-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="text-center mb-16">
          <span className="text-emerald-400 text-sm font-bold tracking-widest uppercase">Community Initiative</span>
          <h1 className="text-4xl md:text-6xl font-bold text-white mt-4 mb-6">
            Pakistan Cybersecurity <span className="text-emerald-400">Alliance</span>
          </h1>
          <p className="text-lg text-gray-400 max-w-2xl mx-auto">
            A community platform connecting cybersecurity professionals, students, and institutions across Pakistan,
            founded and led by the iSeeWaves team.
          </p>
        </motion.div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-16">
          {pillars.map((p, idx) => (
            <motion.div
              key={p.title}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: idx * 0.1 }}
              className="glass-card rounded-2xl border border-white/10 p-8"
            >
              <div className="w-12 h-12 rounded-xl bg-emerald-400/10 flex items-center justify-center mb-5">
                <p.icon className="w-6 h-6 text-emerald-400" />
              </div>
              <h3 className="text-xl font-bold text-white mb-2">{p.title}</h3>
              <p className="text-gray-400 leading-relaxed">{p.body}</p>
            </motion.div>
          ))}
        </div>

        <div className="glass-card rounded-2xl border border-emerald-500/20 p-10 text-center">
          <h2 className="text-2xl font-bold text-white mb-3">Get Involved</h2>
          <p className="text-gray-400 max-w-xl mx-auto mb-8">
            Whether you are a student, a practitioner, or an institution, there is a place for you in PCA.
          </p>
          <div className="flex flex-wrap items-center justify-center gap-4">
            <a
              href="mailto:info@iseewaves.pk?subject=Join%20Pakistan%20Cybersecurity%20Alliance"
              className="flex items-center gap-2 px-8 py-4 rounded-full bg-emerald-500 hover:bg-emerald-600 text-white font-semibold transition-all hover:scale-105"
            >
              Join the Community
              <ArrowRight className="w-4 h-4" />
            </a>
            <a
              href="mailto:info@iseewaves.pk?subject=PCA%20Events"
              className="flex items-center gap-2 px-8 py-4 rounded-full glass-card text-white font-semibold hover:bg-white/10 transition-all"
            >
              Upcoming Events
            </a>
            <a
              href="mailto:info@iseewaves.pk?subject=Partner%20with%20PCA"
              className="flex items-center gap-2 px-8 py-4 rounded-full glass-card text-white font-semibold hover:bg-white/10 transition-all"
            >
              Partner with PCA
            </a>
          </div>
        </div>
      </div>
    </div>
  );
}
R3FILEEOF_16

mkdir -p "$(dirname "src/pages/CompliancePage.tsx")"
cat > "src/pages/CompliancePage.tsx" << 'R3FILEEOF_17'
import React, { useState } from 'react';
import { motion, AnimatePresence } from 'motion/react';
import { Shield, ArrowRight, CheckCircle, AlertTriangle, ExternalLink, X } from 'lucide-react';
import { useParams, Navigate, Link } from 'react-router-dom';
import { complianceData } from '../data/complianceData';

export default function CompliancePage() {
  const { id } = useParams<{ id: string }>();
  const compliance = complianceData.find(c => c.id === id);
  const [showForm, setShowForm] = useState(false);
  
  const [formData, setFormData] = useState({
    firstName: '',
    lastName: '',
    email: '',
    company: '',
    location: ''
  });

  if (!compliance) {
    return <Navigate to="/" replace />;
  }

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    const subject = encodeURIComponent(`Free Trial Request for ${compliance.title}`);
    const body = encodeURIComponent(
      `Name: ${formData.firstName} ${formData.lastName}\n` +
      `Email: ${formData.email}\n` +
      `Company: ${formData.company}\n` +
      `Location: ${formData.location}\n\n` +
      `I am interested in a free trial for ${compliance.title} compliance.`
    );
    window.location.href = `mailto:info@iseewaves.pk?subject=${subject}&body=${body}`;
    setShowForm(false);
  };

  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        
        {/* Hero Section */}
        <div className="relative mb-24">
          <div className={`flex flex-col ${showForm ? 'lg:flex-row' : ''} gap-12 items-center transition-all duration-500`}>
            
            {/* Left Content */}
            <div className={`flex-1 ${showForm ? 'lg:w-1/2' : 'text-center max-w-4xl mx-auto'}`}>
              <motion.div
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                className={`inline-flex items-center gap-2 px-4 py-2 rounded-full glass-card border-emerald-500/30 text-emerald-400 text-sm font-medium mb-6 ${!showForm && 'mx-auto'}`}
              >
                <Shield className="w-4 h-4" />
                <span>Compliance Framework</span>
              </motion.div>
              
              <motion.h1
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: 0.1 }}
                className="text-5xl md:text-7xl font-bold text-white mb-6"
              >
                {compliance.title}
              </motion.h1>
              
              <motion.div
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: 0.2 }}
                className="text-xl text-gray-300 mb-8"
              >
                <p className="font-semibold text-emerald-400 mb-2">{compliance.fullName}</p>
                <p className="text-base text-gray-400">
                  Established by <a href={compliance.authorityLink} target="_blank" rel="noopener noreferrer" className="text-blue-400 hover:underline inline-flex items-center gap-1">{compliance.authority} <ExternalLink className="w-3 h-3" /></a> in {compliance.year}.
                </p>
                <p className="text-base text-gray-400 mt-2">{compliance.purpose}</p>
              </motion.div>

              <motion.div
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: 0.3 }}
                className={`flex flex-col sm:flex-row gap-4 ${!showForm && 'justify-center'}`}
              >
                {!showForm && (
                  <button
                    onClick={() => setShowForm(true)}
                    className="flex items-center justify-center gap-2 px-8 py-4 rounded-full bg-emerald-500 text-white font-semibold hover:bg-emerald-600 transition-all hover:scale-105"
                  >
                    Free Trial
                  </button>
                )}
                <Link
                  to="/contact"
                  className="flex items-center justify-center gap-2 px-8 py-4 rounded-full glass-card text-white font-semibold hover:bg-white/10 transition-all hover:scale-105"
                >
                  Let's Chat
                </Link>
              </motion.div>
            </div>

            {/* Right Form (Animated) */}
            <AnimatePresence>
              {showForm && (
                <motion.div
                  initial={{ opacity: 0, x: 50, scale: 0.9 }}
                  animate={{ opacity: 1, x: 0, scale: 1 }}
                  exit={{ opacity: 0, x: 50, scale: 0.9 }}
                  className="w-full lg:w-[450px] flex-shrink-0"
                >
                  <div className="glass-card p-8 rounded-3xl border-emerald-500/30 relative">
                    <button 
                      onClick={() => setShowForm(false)}
                      className="absolute top-4 right-4 text-gray-400 hover:text-white transition-colors"
                    >
                      <X className="w-5 h-5" />
                    </button>
                    <h3 className="text-2xl font-bold text-white mb-2">Try iSeeWaves Services</h3>
                    <p className="text-gray-400 text-sm mb-6">Start your free trial today for {compliance.title} compliance.</p>
                    
                    <form onSubmit={handleSubmit} className="space-y-4">
                      <div className="grid grid-cols-2 gap-4">
                        <div>
                          <label className="block text-sm font-medium text-gray-300 mb-1">First Name *</label>
                          <input required type="text" name="firstName" value={formData.firstName} onChange={handleInputChange} className="w-full bg-white/5 border border-white/10 rounded-lg px-4 py-2 text-white focus:outline-none focus:border-emerald-500 transition-colors" />
                        </div>
                        <div>
                          <label className="block text-sm font-medium text-gray-300 mb-1">Last Name *</label>
                          <input required type="text" name="lastName" value={formData.lastName} onChange={handleInputChange} className="w-full bg-white/5 border border-white/10 rounded-lg px-4 py-2 text-white focus:outline-none focus:border-emerald-500 transition-colors" />
                        </div>
                      </div>
                      <div>
                        <label className="block text-sm font-medium text-gray-300 mb-1">Email Address *</label>
                        <input required type="email" name="email" value={formData.email} onChange={handleInputChange} className="w-full bg-white/5 border border-white/10 rounded-lg px-4 py-2 text-white focus:outline-none focus:border-emerald-500 transition-colors" />
                      </div>
                      <div>
                        <label className="block text-sm font-medium text-gray-300 mb-1">Company *</label>
                        <input required type="text" name="company" value={formData.company} onChange={handleInputChange} className="w-full bg-white/5 border border-white/10 rounded-lg px-4 py-2 text-white focus:outline-none focus:border-emerald-500 transition-colors" />
                      </div>
                      <div>
                        <label className="block text-sm font-medium text-gray-300 mb-1">Location</label>
                        <input type="text" name="location" value={formData.location} onChange={handleInputChange} className="w-full bg-white/5 border border-white/10 rounded-lg px-4 py-2 text-white focus:outline-none focus:border-emerald-500 transition-colors" />
                      </div>
                      <button type="submit" className="w-full py-3 px-4 bg-emerald-500 hover:bg-emerald-600 text-white font-bold rounded-lg transition-colors mt-4">
                        Submit Request
                      </button>
                    </form>
                  </div>
                </motion.div>
              )}
            </AnimatePresence>
          </div>
        </div>

        {/* Details Section */}
        <motion.div
          initial={{ opacity: 0, y: 40 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-100px" }}
          className="space-y-16"
        >
          {/* Definition & Role */}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            <div className="glass-card p-8 rounded-3xl">
              <h3 className="text-2xl font-bold text-white mb-4">What is {compliance.title}?</h3>
              <p className="text-gray-400 leading-relaxed">{compliance.definition}</p>
            </div>
            <div className="glass-card p-8 rounded-3xl">
              <h3 className="text-2xl font-bold text-white mb-4">Role & Importance</h3>
              <p className="text-gray-400 leading-relaxed">{compliance.role}</p>
            </div>
          </div>

          {/* Benefits & Key Rules */}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            <div className="glass-card p-8 rounded-3xl border-emerald-500/20">
              <h3 className="text-2xl font-bold text-white mb-6">Key Benefits</h3>
              <ul className="space-y-4">
                {compliance.benefits.map((item, idx) => (
                  <li key={idx} className="flex items-start gap-3">
                    <CheckCircle className="w-5 h-5 text-emerald-400 flex-shrink-0 mt-0.5" />
                    <span className="text-gray-300">{item}</span>
                  </li>
                ))}
              </ul>
            </div>
            <div className="glass-card p-8 rounded-3xl border-blue-500/20">
              <h3 className="text-2xl font-bold text-white mb-6">Key Rules</h3>
              <ul className="space-y-4">
                {compliance.keyRules.map((item, idx) => (
                  <li key={idx} className="flex items-start gap-3">
                    <ArrowRight className="w-5 h-5 text-blue-400 flex-shrink-0 mt-0.5" />
                    <span className="text-gray-300">{item}</span>
                  </li>
                ))}
              </ul>
            </div>
          </div>

          {/* Who Must Comply & Requirements */}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            <div className="glass-card p-8 rounded-3xl">
              <h3 className="text-2xl font-bold text-white mb-6">Who Must Comply?</h3>
              <ul className="space-y-4">
                {compliance.whoMustComply.map((item, idx) => (
                  <li key={idx} className="flex items-center gap-3">
                    <div className="w-2 h-2 rounded-full bg-gray-500" />
                    <span className="text-gray-300">{item}</span>
                  </li>
                ))}
              </ul>
            </div>
            <div className="glass-card p-8 rounded-3xl">
              <h3 className="text-2xl font-bold text-white mb-6">Compliance Requirements</h3>
              <ul className="space-y-4">
                {compliance.requirements.map((item, idx) => (
                  <li key={idx} className="flex items-center gap-3">
                    <div className="w-2 h-2 rounded-full bg-gray-500" />
                    <span className="text-gray-300">{item}</span>
                  </li>
                ))}
              </ul>
            </div>
          </div>

          {/* Penalties */}
          <div className="glass-card p-8 rounded-3xl border-red-500/30 bg-red-500/5">
            <div className="flex items-center gap-3 mb-4">
              <AlertTriangle className="w-8 h-8 text-red-400" />
              <h3 className="text-2xl font-bold text-white">Penalties for Non-Compliance</h3>
            </div>
            <p className="text-gray-300 leading-relaxed">{compliance.penalties}</p>
          </div>

          {/* How iSeeWaves Supports */}
          <div className="glass-card p-10 rounded-3xl border-emerald-500/40 relative overflow-hidden">
            <div className="absolute top-0 right-0 w-64 h-64 bg-emerald-500/10 rounded-full mix-blend-screen filter blur-[50px]" />
            <h3 className="text-3xl font-bold text-white mb-8 relative z-10">How iSeeWaves Supports {compliance.title} Compliance</h3>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6 relative z-10">
              {compliance.howISeeWavesSupports.map((item, idx) => (
                <div key={idx} className="flex items-start gap-4 bg-black/20 p-4 rounded-xl">
                  <Shield className="w-6 h-6 text-emerald-400 flex-shrink-0" />
                  <span className="text-gray-200 font-medium">{item}</span>
                </div>
              ))}
            </div>
          </div>

          {/* CTA */}
          <div className="text-center pt-8">
            <h3 className="text-3xl font-bold text-white mb-6">Stay Compliant with {compliance.title}</h3>
            <p className="text-gray-400 mb-8 max-w-2xl mx-auto">Don't let compliance complexities slow down your business. Partner with iSeeWaves to ensure continuous adherence and robust security.</p>
            <button
              onClick={() => {
                window.scrollTo({ top: 0, behavior: 'smooth' });
                setShowForm(true);
              }}
              className="inline-flex items-center gap-2 px-8 py-4 rounded-full bg-emerald-500 text-white font-semibold hover:bg-emerald-600 transition-all hover:scale-105"
            >
              Start Free Trial Now
            </button>
          </div>

        </motion.div>
      </div>
    </div>
  );
}
R3FILEEOF_17

echo "Done. Now run: npm run dev"