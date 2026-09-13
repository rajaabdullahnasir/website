#!/bin/bash
set -e
echo "Applying round 13: fix broken image paths, wire real logos/photos, convert HEIC files..."

# Fix broken /public/images/ paths anywhere still using them (Vite serves public/ from site root)
find src -type f \( -name '*.tsx' -o -name '*.ts' \) -exec sed -i 's|/public/images/|/images/|g' {} +

# Rename event-picture folders to remove spaces (safer for URLs)
[ -d "public/images/PCA/Threat-Horizon-Pakistan1/Event Pictures" ] && mv "public/images/PCA/Threat-Horizon-Pakistan1/Event Pictures" "public/images/PCA/Threat-Horizon-Pakistan1/Event-Pictures"
[ -d "public/images/PCA/Threat-Horizon-Pakistan2/Event Pictures" ] && mv "public/images/PCA/Threat-Horizon-Pakistan2/Event Pictures" "public/images/PCA/Threat-Horizon-Pakistan2/Event-Pictures"

# Convert HEIC photos to JPG (HEIC does not display in Chrome/Firefox/Edge) - requires imagemagick
if command -v convert >/dev/null 2>&1; then
  find public/images/PCA -iname '*.HEIC' -exec sh -c '
    for f do
      out="${f%.*}.jpg"
      [ -f "$out" ] || convert "$f" "$out"
    done
  ' sh {} +
  echo "Converted HEIC files to JPG."
else
  echo "WARNING: imagemagick not found - HEIC files in public/images/PCA were NOT converted."
  echo "Install it (brew install imagemagick / apt install imagemagick) and re-run this script,"
  echo "or the Threat Horizon Episode 2 photos will not display in Chrome, Firefox, or Edge."
fi

mkdir -p "$(dirname "src/App.tsx")"
cat > "src/App.tsx" << 'R13FILEEOF_0'
/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

import { useEffect } from 'react';
import { BrowserRouter as Router, Routes, Route, useLocation, Navigate } from 'react-router-dom';
import Navbar from './components/Navbar';
import Hero from './components/Hero';
import Product from './components/Product';
import AuditFeatures from './components/AuditFeatures';
import Packages from './components/Packages';
import SupportSection from './components/SupportSection';
import AboutContent from './components/AboutContent';
import PCATeaser from './components/PCATeaser';
import TrustedBy from './components/TrustedBy';
import PartnersSlider from './components/PartnersSlider';
import Footer from './components/Footer';
import AboutPage from './pages/AboutPage';
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
      <Product />
      <AuditFeatures />
      <Packages />
      <SupportSection />
      <AboutContent />
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
      <div className="min-h-screen bg-[#F6F8FB] text-[#2E3A59] font-sans selection:bg-teal-500/30 relative overflow-hidden">
        {/* Global Background Blobs for Glassmorphism Depth */}
        <div className="fixed inset-0 z-0 pointer-events-none overflow-hidden">
          <div className="absolute top-[-10%] left-[-10%] w-[40vw] h-[40vw] rounded-full bg-teal-400/10 filter blur-[120px] animate-pulse" style={{ animationDuration: '10s' }} />
          <div className="absolute top-[20%] right-[-5%] w-[35vw] h-[35vw] rounded-full bg-[#00C08B]/10 filter blur-[100px] animate-pulse" style={{ animationDuration: '12s', animationDelay: '2s' }} />
          <div className="absolute bottom-[-10%] left-[20%] w-[45vw] h-[45vw] rounded-full bg-navy-400/5 filter blur-[130px] animate-pulse" style={{ animationDuration: '14s', animationDelay: '4s' }} />
        </div>

        <div className="relative z-10">
          <Navbar />
          <main>
            <Routes>
              <Route path="/" element={<Home />} />
              <Route path="/about" element={<AboutPage />} />
              <Route path="/myesi" element={<Navigate to="/#product" replace />} />
              <Route path="/features" element={<Navigate to="/#features" replace />} />
              <Route path="/packages" element={<Navigate to="/#packages" replace />} />
              <Route path="/support" element={<Navigate to="/#support" replace />} />
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
R13FILEEOF_0

mkdir -p "$(dirname "src/components/About.tsx")"
cat > "src/components/About.tsx" << 'R13FILEEOF_1'
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

  const credentials = [
    { name: 'SECP' },
    { name: 'NICAT', logo: '/images/nicat.png' },
    { name: 'Ignite', logo: '/images/ignite-logo.png' },
    { name: 'MOITT', logo: '/images/moitt-logo.png' },
  ];

  return (
    <section id="about" className="py-24 relative overflow-hidden">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="text-center mb-16">
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-5xl font-bold text-[#0B2545] mb-4"
          >
            About <span className="text-teal-400">iSeeWaves</span>
          </motion.h2>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.2 }}
            className="text-lg text-gray-600 max-w-3xl mx-auto"
          >
            Founded and built by a team of security engineers, researchers, and developers, we are a Pakistani
            cybersecurity and AI technology company dedicated to securing digital assets for enterprises,
            governments, and critical infrastructure worldwide.
          </motion.p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-12 items-center mb-16">
          <motion.div
            initial={{ opacity: 0, x: -50 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            className="glass-card p-8 rounded-3xl"
          >
            <h3 className="text-2xl font-semibold text-[#0B2545] mb-4">Our Mission</h3>
            <p className="text-gray-600 mb-6 leading-relaxed">
              Our mission is to redefine software supply chain security through innovation and trust. We built our
              platform to give organizations a single, automated way to see exactly what is running inside their
              software, and to prove it to auditors, regulators, and partners.
            </p>
            <p className="text-gray-600 leading-relaxed">
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
                <stat.icon className="w-8 h-8 text-teal-400 mb-3" />
                <div className="text-2xl font-bold text-[#0B2545] mb-1">{stat.value}</div>
                <div className="text-sm text-gray-600 font-medium">{stat.label}</div>
              </div>
            ))}
          </motion.div>
        </div>

        {/* Highlights & Credentials */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="glass-card rounded-3xl border border-gray-200 p-8 md:p-10"
        >
          <div className="flex items-center gap-3 mb-6">
            <div className="w-10 h-10 rounded-xl bg-teal-400/10 flex items-center justify-center">
              <Award className="w-5 h-5 text-teal-400" />
            </div>
            <h3 className="text-xl font-bold text-[#0B2545]">Why We're Trusted</h3>
          </div>
          <ul className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-10">
            {highlights.map((h) => (
              <li key={h} className="flex items-start gap-3 text-gray-700 text-sm">
                <div className="w-1.5 h-1.5 rounded-full bg-teal-400 mt-2 shrink-0 shadow-[0_0_8px_currentColor]" />
                {h}
              </li>
            ))}
          </ul>
          <div className="border-t border-gray-200 pt-8">
            <div className="flex items-center gap-3 mb-6">
              <div className="w-10 h-10 rounded-xl bg-blue-400/10 flex items-center justify-center">
                <Users className="w-5 h-5 text-blue-400" />
              </div>
              <h3 className="text-xl font-bold text-[#0B2545]">Registered & Supported By</h3>
            </div>
            <div className="flex flex-wrap items-center gap-x-10 gap-y-6">
              {credentials.map((c) => (
                <div
                  key={c.name}
                  title={c.name}
                  className="flex items-center justify-center grayscale hover:grayscale-0 opacity-60 hover:opacity-100 transition-all"
                >
                  {c.logo ? (
                    <img src={c.logo} alt={c.name} className="h-10 md:h-12 w-auto object-contain" />
                  ) : (
                    <span className="text-xl md:text-2xl font-black text-[#0B2545] tracking-tight">{c.name}</span>
                  )}
                </div>
              ))}
            </div>
          </div>
        </motion.div>
      </div>
    </section>
  );
}
R13FILEEOF_1

mkdir -p "$(dirname "src/components/AboutContent.tsx")"
cat > "src/components/AboutContent.tsx" << 'R13FILEEOF_2'
import { motion } from 'motion/react';
import { Quote, Gem, ShieldCheck, TrendingUp, Handshake } from 'lucide-react';
import { Link } from 'react-router-dom';
import About from './About';

export default function AboutContent() {
  const values = [
    {
      icon: Gem,
      title: 'Excellence',
      body: 'We hold our work, from a single line of code to a full audit report, to the standard we would want applied to our own systems.',
    },
    {
      icon: ShieldCheck,
      title: 'Integrity',
      body: 'We tell clients what we find, not what is convenient. Trust is the product as much as the platform is.',
    },
    {
      icon: TrendingUp,
      title: 'Innovation',
      body: 'We build MyESI from real engagements, constantly folding what we learn in the field back into the product.',
    },
    {
      icon: Handshake,
      title: 'Partnership',
      body: 'We aim to be a long-term security partner to our clients and to the wider community, not a one-time vendor.',
    },
  ];

  return (
    <>
      <About />

      {/* CEO Message */}
      <section className="py-16 relative z-10">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="glass-card rounded-3xl border border-gray-200 p-8 md:p-10"
          >
            <div className="flex flex-col md:flex-row gap-8 items-start">
              <div className="w-28 h-28 rounded-2xl bg-gradient-to-br from-teal-400/30 to-[#00C08B]/30 flex items-center justify-center shrink-0 border border-gray-200 mx-auto md:mx-0">
                <img src="/images/Founder.jpeg" alt="Founder" className="w-full h-full object-cover rounded-2xl" />
              </div>
              <div className="flex-1">
                <div className="relative">
                  <Quote className="w-8 h-8 text-teal-400/40 absolute -top-2 -left-1" />
                  <p className="text-gray-700 italic leading-relaxed pl-9">
                    "We started iSeeWaves because too many organizations only find out what's actually running in
                    their software after something has already gone wrong. Our job is to make that visibility
                    automatic, defensible, and available before the incident, not after it."
                  </p>
                </div>
                <div className="mt-6">
                  <div className="text-sm font-bold text-[#0B2545]">Founder & CEO</div>
                  <div className="text-xs text-gray-500 mt-0.5">
                    <Link to="/company/executive-team" className="text-teal-500 hover:underline">
                      Read the full message and leadership approach
                    </Link>
                  </div>
                </div>
              </div>
            </div>
          </motion.div>
        </div>
      </section>

      {/* Our Values - professional, corporate close */}
      <section className="py-16 relative z-10">
        <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} className="text-center mb-12">
            <span className="text-teal-500 text-sm font-bold tracking-widest uppercase">What Drives Us</span>
            <h2 className="text-2xl md:text-4xl font-bold text-[#0B2545] mt-3">Our Values</h2>
          </motion.div>
          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6">
            {values.map((v, idx) => (
              <motion.div
                key={v.title}
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                transition={{ delay: idx * 0.08 }}
                className="glass-card rounded-2xl border border-gray-200 p-6"
              >
                <div className="w-11 h-11 rounded-xl bg-teal-400/10 flex items-center justify-center mb-4">
                  <v.icon className="w-5 h-5 text-teal-500" />
                </div>
                <h3 className="text-base font-bold text-[#0B2545] mb-2">{v.title}</h3>
                <p className="text-sm text-gray-600 leading-relaxed">{v.body}</p>
              </motion.div>
            ))}
          </div>
        </div>
      </section>
    </>
  );
}
R13FILEEOF_2

mkdir -p "$(dirname "src/components/AuditFeatures.tsx")"
cat > "src/components/AuditFeatures.tsx" << 'R13FILEEOF_3'
import { useState } from 'react';
import { motion } from 'motion/react';
import {
  FileStack,
  ShieldCheck,
  PackageSearch,
  Code2,
  Bug,
  Plug,
  KeyRound,
  ClipboardCheck,
  Plus,
  Minus,
} from 'lucide-react';

const audits = [
  {
    key: 'sbom',
    icon: FileStack,
    title: 'Dynamic SBOM Generation',
    subtitle: 'Software Bill of Materials',
    description:
      'Automatically generates a complete, machine-readable inventory of every component, library, and dependency in your software, kept current as your codebase changes.',
  },
  {
    key: 'secure-coding',
    icon: ShieldCheck,
    title: 'Secure Coding Testing',
    subtitle: 'Secure Development Lifecycle',
    description:
      'Validates that secure coding practices and security controls are enforced at every stage of your development pipeline, from design through release.',
  },
  {
    key: 'sca',
    icon: PackageSearch,
    title: 'Software Composition Analysis',
    subtitle: 'SCA',
    description:
      'Scans open-source and third-party components for known vulnerabilities, license risks, and outdated versions before they reach production.',
  },
  {
    key: 'sast',
    icon: Code2,
    title: 'Static Application Security Testing',
    subtitle: 'SAST',
    description:
      'Analyzes your source code line by line to catch insecure coding patterns, injection flaws, and logic vulnerabilities before you ever run the application.',
  },
  {
    key: 'dast',
    icon: Bug,
    title: 'Dynamic Application Security Testing',
    subtitle: 'DAST',
    description:
      'Tests your running application and compiled binaries the way an attacker would, uncovering runtime vulnerabilities that static analysis alone can miss.',
  },
  {
    key: 'api-security',
    icon: Plug,
    title: 'API Security',
    subtitle: 'API Testing',
    description:
      'Assesses your APIs for broken authentication, excessive data exposure, and misconfigurations, the most common ways modern applications get breached.',
  },
  {
    key: 'secrets-detection',
    icon: KeyRound,
    title: 'Secrets Detection',
    subtitle: 'Credential Scanning',
    description:
      'Scans your repositories and pipelines for exposed API keys, credentials, and tokens before they leak into production or version history.',
  },
  {
    key: 'compliance-controls',
    icon: ClipboardCheck,
    title: 'Compliance Controls',
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
            className="text-teal-500 text-sm font-bold tracking-widest uppercase"
          >
            One Platform, Eight Audits
          </motion.span>
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-5xl font-bold text-[#0B2545] mt-4 mb-4"
          >
            8 Different Audits, <span className="text-teal-500">One Click</span>
          </motion.h2>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-gray-600 max-w-2xl mx-auto"
          >
            MyESI runs a full software supply chain audit in a single pass, replacing eight separate tools and reports with one automated workflow.
          </motion.p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {audits.map((audit, idx) => {
            const isOpen = openKey === audit.key;
            return (
              <motion.div
                key={audit.key}
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                transition={{ delay: idx * 0.06 }}
                className="glass-card rounded-2xl border border-gray-200 hover:border-teal-500/40 transition-all duration-300"
              >
                <button
                  onClick={() => setOpenKey(isOpen ? null : audit.key)}
                  className="w-full text-left p-6 flex items-start gap-4"
                >
                  <div className="w-12 h-12 shrink-0 rounded-xl bg-teal-400/10 flex items-center justify-center">
                    <audit.icon className="w-6 h-6 text-teal-500" />
                  </div>
                  <div className="flex-1">
                    <h3 className="text-base font-bold text-[#0B2545] leading-snug">{audit.title}</h3>
                    <p className="text-xs text-gray-500 mt-1">{audit.subtitle}</p>
                  </div>
                  <div className="text-teal-500 mt-2">
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
                    <p className="text-sm text-gray-600 leading-relaxed border-t border-gray-200 pt-4">
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
R13FILEEOF_3

mkdir -p "$(dirname "src/components/ContactHiring.tsx")"
cat > "src/components/ContactHiring.tsx" << 'R13FILEEOF_4'
import { motion } from 'motion/react';
import { Send, Loader2 } from 'lucide-react';
import { useSubmitForm } from '../hooks/useSubmitForm';
import FormToast from './FormToast';

export default function ContactHiring() {
  const { status, handleSubmit } = useSubmitForm({ subject: 'New Contact Inquiry' });

  return (
    <section id="contact" className="py-24 relative overflow-hidden bg-gray-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="text-center mb-16">
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-5xl font-bold text-[#0B2545] mb-4"
          >
            Get in <span className="text-teal-400">Touch</span>
          </motion.h2>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.2 }}
            className="text-lg text-gray-600 max-w-3xl mx-auto"
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
              onSubmit={handleSubmit}
              className="space-y-6"
            >
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">Full Name</label>
                  <input
                    type="text"
                    name="name"
                    required
                    className="w-full bg-white border border-gray-200 rounded-xl px-4 py-3 text-[#0B2545] focus:outline-none focus:border-teal-500 transition-colors"
                    placeholder="John Doe"
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">Email Address</label>
                  <input
                    type="email"
                    name="email"
                    required
                    className="w-full bg-white border border-gray-200 rounded-xl px-4 py-3 text-[#0B2545] focus:outline-none focus:border-teal-500 transition-colors"
                    placeholder="john@example.com"
                  />
                </div>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Message / Inquiry</label>
                <textarea
                  name="message"
                  required
                  rows={5}
                  className="w-full bg-white border border-gray-200 rounded-xl px-4 py-3 text-[#0B2545] focus:outline-none focus:border-teal-500 transition-colors resize-none"
                  placeholder="Tell us about your requirements..."
                ></textarea>
              </div>

              <button
                type="submit"
                disabled={status === 'sending'}
                className="w-full flex items-center justify-center gap-2 py-4 rounded-xl font-bold text-white bg-teal-500 hover:bg-teal-600 transition-all hover:scale-[1.02] disabled:opacity-60 disabled:hover:scale-100"
              >
                {status === 'sending' ? <Loader2 className="w-5 h-5 animate-spin" /> : <Send className="w-5 h-5" />}
                {status === 'sending' ? 'Sending...' : 'Send Message'}
              </button>
            </form>
          </motion.div>

          <p className="text-center text-gray-600 text-sm mt-6">
            Looking to join our team instead?{' '}
            <a href="/careers" className="text-teal-400 hover:underline">Apply here</a>
          </p>
        </div>
      </div>
      <FormToast status={status} />
    </section>
  );
}
R13FILEEOF_4

mkdir -p "$(dirname "src/components/Footer.tsx")"
cat > "src/components/Footer.tsx" << 'R13FILEEOF_5'
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
              <li><Link to="/#support" className="hover:text-teal-400 transition-colors">Technical support</Link></li>
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
R13FILEEOF_5

mkdir -p "$(dirname "src/components/FormToast.tsx")"
cat > "src/components/FormToast.tsx" << 'R13FILEEOF_6'
import { CheckCircle2, Loader2, XCircle } from 'lucide-react';
import type { SubmitStatus } from '../hooks/useSubmitForm';

export default function FormToast({ status }: { status: SubmitStatus }) {
  if (status === 'idle') return null;

  return (
    <div className="fixed bottom-6 right-6 z-[200] animate-[fadeIn_0.2s_ease]">
      {status === 'sending' && (
        <div className="flex items-center gap-3 px-5 py-4 rounded-xl bg-white shadow-2xl border border-gray-200">
          <Loader2 className="w-5 h-5 text-teal-500 animate-spin" />
          <span className="text-[#0B2545] font-medium text-sm">Sending...</span>
        </div>
      )}
      {status === 'success' && (
        <div className="flex items-center gap-3 px-5 py-4 rounded-xl bg-teal-500 shadow-2xl">
          <CheckCircle2 className="w-5 h-5 text-white" />
          <span className="text-white font-medium text-sm">Message sent successfully</span>
        </div>
      )}
      {status === 'error' && (
        <div className="flex items-center gap-3 px-5 py-4 rounded-xl bg-red-500 shadow-2xl max-w-sm">
          <XCircle className="w-5 h-5 text-white shrink-0" />
          <span className="text-white font-medium text-sm">
            Something went wrong. Please email us directly at info@iseewaves.pk
          </span>
        </div>
      )}
    </div>
  );
}
R13FILEEOF_6

mkdir -p "$(dirname "src/components/Hero.tsx")"
cat > "src/components/Hero.tsx" << 'R13FILEEOF_7'
import { motion } from 'motion/react';
import { ShieldAlert, ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';

export default function Hero() {
  return (
    <section className="relative min-h-screen flex items-center justify-center pt-20 overflow-hidden">
      {/* Abstract Background */}
      <div className="absolute inset-0 z-0">
        <div className="absolute top-1/4 left-1/4 w-96 h-96 bg-teal-500/10 rounded-full filter blur-[100px] animate-pulse" />
        <div className="absolute bottom-1/4 right-1/4 w-96 h-96 bg-[#00C08B]/10 rounded-full filter blur-[100px] animate-pulse" style={{ animationDelay: '2s' }} />
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
          className="inline-flex items-center gap-2 px-6 py-2 rounded-full glass-card border-teal-500/50 text-teal-400 text-sm font-bold tracking-widest uppercase mb-8 shadow-[0_0_20px_rgba(16,185,129,0.2)]"
        >
          <ShieldAlert className="w-5 h-5" />
          <span>Next-Gen Cybersecurity</span>
        </motion.div>

        <motion.h1
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.2 }}
          className="text-5xl md:text-7xl lg:text-8xl font-black tracking-tighter text-[#0B2545] mb-6 uppercase leading-tight"
        >
          Sleep Tight, <br />
          <span className="text-transparent bg-clip-text bg-gradient-to-r from-teal-500 to-[#00C08B] drop-shadow-[0_0_30px_rgba(16,185,129,0.4)]">
            We Guard Your Byte!
          </span>
        </motion.h1>

        <motion.p
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.4 }}
          className="max-w-2xl mx-auto text-lg md:text-xl text-gray-600 mb-10"
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
            to="/#product"
            className="flex items-center gap-2 px-8 py-4 rounded-full bg-teal-500 text-white font-semibold hover:bg-teal-600 transition-all hover:scale-105"
          >
            Explore Our Platform
            <ArrowRight className="w-5 h-5" />
          </Link>
          <Link
            to="/contact"
            className="flex items-center gap-2 px-8 py-4 rounded-full glass-card text-[#0B2545] font-semibold hover:bg-gray-100 transition-all hover:scale-105"
          >
            Contact Us
          </Link>
        </motion.div>
      </div>
    </section>
  );
}
R13FILEEOF_7

mkdir -p "$(dirname "src/components/Navbar.tsx")"
cat > "src/components/Navbar.tsx" << 'R13FILEEOF_8'
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
      { name: 'MyESI Overview', href: '/#product' },
      { name: '8 Audits', href: '/#features' },
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
            <img src="/images/iSeeWaves.png" alt="iSeeWaves" className="md:h-8 w-auto" />
          </Link>

          {/* Desktop Nav */}
          <div className="hidden lg:flex items-center space-x-1">
            {navEntries.map((entry) =>
              entry.type === 'link' ? (
                <Link
                  key={entry.name}
                  to={resolveHref(entry.href, isHome)}
                  className="px-3 py-2 text-sm font-medium text-gray-700 hover:text-teal-400 transition-colors"
                >
                  {entry.name}
                </Link>
              ) : (
                <div key={entry.name} className="relative">
                  <button
                    onClick={() => setOpenMenu(openMenu === entry.name ? null : entry.name)}
                    className={`flex items-center gap-1 px-3 py-2 text-sm font-medium transition-colors ${
                      openMenu === entry.name ? 'text-teal-400' : 'text-gray-700 hover:text-teal-400'
                    }`}
                  >
                    {entry.name}
                    <ChevronDown className={`w-3.5 h-3.5 transition-transform ${openMenu === entry.name ? 'rotate-180' : ''}`} />
                  </button>
                  {openMenu === entry.name && (
                    <div className="absolute top-full left-0 mt-2 w-64 glass-panel rounded-xl border border-gray-200 py-2 shadow-2xl">
                      {entry.items.map((item) => (
                        <Link
                          key={item.name}
                          to={resolveHref(item.href, isHome)}
                          onClick={() => setOpenMenu(null)}
                          className="block px-4 py-2.5 text-sm text-gray-700 hover:text-teal-400 hover:bg-gray-50 transition-colors"
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
              className="ml-4 px-4 py-2 text-sm font-medium text-gray-700 hover:text-teal-400 transition-colors"
            >
              Log In
            </Link>
            <Link
              to="/#support"
              className="px-4 py-2 rounded-full bg-teal-500/10 text-teal-400 border border-teal-500/20 hover:bg-teal-500/20 transition-colors text-sm font-medium"
            >
              Register
            </Link>
            <Link
              to="/contact"
              className="px-4 py-2 rounded-full bg-teal-500 text-white hover:bg-teal-600 transition-colors text-sm font-medium"
            >
              Get Secured
            </Link>
          </div>

          {/* Mobile Menu Button */}
          <div className="lg:hidden flex items-center gap-3">
            <Link
              to="/myesi/login"
              className="text-sm font-medium text-gray-700 hover:text-teal-400 transition-colors"
            >
              Log In
            </Link>
            <button
              onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
              className="text-gray-700 hover:text-[#0B2545]"
            >
              {isMobileMenuOpen ? <X className="w-6 h-6" /> : <Menu className="w-6 h-6" />}
            </button>
          </div>
        </div>
      </div>

      {/* Mobile Nav */}
      {isMobileMenuOpen && (
        <div className="lg:hidden glass-panel absolute top-full left-0 right-0 border-t border-gray-100 max-h-[80vh] overflow-y-auto">
          <div className="px-4 pt-2 pb-6 space-y-1">
            {navEntries.map((entry) =>
              entry.type === 'link' ? (
                <Link
                  key={entry.name}
                  to={resolveHref(entry.href, isHome)}
                  onClick={() => setIsMobileMenuOpen(false)}
                  className="block px-3 py-3 text-base font-medium text-gray-700 hover:text-teal-400 hover:bg-gray-50 rounded-lg"
                >
                  {entry.name}
                </Link>
              ) : (
                <div key={entry.name}>
                  <button
                    onClick={() => setOpenMobileMenu(openMobileMenu === entry.name ? null : entry.name)}
                    className="w-full flex items-center justify-between px-3 py-3 text-base font-medium text-gray-700 hover:text-teal-400 hover:bg-gray-50 rounded-lg"
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
                          className="block px-3 py-2.5 text-sm text-gray-600 hover:text-teal-400 hover:bg-gray-50 rounded-lg"
                        >
                          {item.name}
                        </Link>
                      ))}
                    </div>
                  )}
                </div>
              )
            )}
            <div className="pt-3 mt-2 border-t border-gray-200 flex flex-col gap-2">
              <Link
                to="/#support"
                onClick={() => setIsMobileMenuOpen(false)}
                className="block text-center px-4 py-3 rounded-full bg-teal-500/10 text-teal-400 border border-teal-500/20 text-sm font-medium"
              >
                Register
              </Link>
              <Link
                to="/contact"
                onClick={() => setIsMobileMenuOpen(false)}
                className="block text-center px-4 py-3 rounded-full bg-teal-500 text-white text-sm font-medium"
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
R13FILEEOF_8

mkdir -p "$(dirname "src/components/PCATeaser.tsx")"
cat > "src/components/PCATeaser.tsx" << 'R13FILEEOF_9'
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
          className="glass-card rounded-2xl border border-gray-200 p-8 md:p-12 flex flex-col md:flex-row items-center gap-8"
        >
          <div className="w-16 h-16 shrink-0 rounded-2xl bg-teal-400/10 flex items-center justify-center">
            <Users className="w-8 h-8 text-teal-400" />
          </div>
          <div className="flex-1 text-center md:text-left">
            <span className="text-teal-400 text-xs font-bold tracking-widest uppercase">Community Initiative</span>
            <h3 className="text-2xl md:text-3xl font-bold text-[#0B2545] mt-2 mb-2">Pakistan Cybersecurity Alliance</h3>
            <p className="text-gray-600 max-w-xl">
              A community platform connecting cybersecurity professionals, students, and institutions across Pakistan.
            </p>
          </div>
          <div className="flex flex-col sm:flex-row gap-3">
            <Link
              to="/pca"
              className="flex items-center justify-center gap-2 px-6 py-3 rounded-full bg-teal-500 hover:bg-teal-600 text-white font-semibold transition-all hover:scale-105 whitespace-nowrap"
            >
              Explore PCA
              <ArrowRight className="w-4 h-4" />
            </Link>
            <a
              href="https://chat.whatsapp.com/L2E27bvy7MwKVPSOtnSMB5" target="_blank" rel="noopener noreferrer"
              className="flex items-center justify-center gap-2 px-6 py-3 rounded-full glass-card text-[#0B2545] font-semibold hover:bg-gray-100 transition-all whitespace-nowrap"
            >
              Join Us
            </a>
          </div>
        </motion.div>
      </div>
    </section>
  );
}
R13FILEEOF_9

mkdir -p "$(dirname "src/components/Packages.tsx")"
cat > "src/components/Packages.tsx" << 'R13FILEEOF_10'
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
      'All 8 audits: Dynamic SBOM Generation, Secure Coding Testing, SCA, SAST, DAST, API Security, Secrets Detection, Compliance Controls',
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
            className="text-teal-400 text-sm font-bold tracking-widest uppercase"
          >
            Pricing
          </motion.span>
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-5xl font-bold text-[#0B2545] mt-4"
          >
            Choose Your <span className="text-teal-400">Package</span>
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
                pkg.highlight ? 'border-teal-500/60 shadow-[0_0_40px_rgba(16,185,129,0.15)] scale-[1.02]' : 'border-gray-200'
              }`}
            >
              {pkg.highlight && (
                <span className="self-start px-3 py-1 rounded-full bg-teal-500/20 text-teal-400 text-xs font-bold uppercase tracking-widest mb-4">
                  Most Popular
                </span>
              )}
              <h3 className="text-2xl font-bold text-[#0B2545] mb-2">{pkg.name}</h3>
              <p className="text-sm text-gray-600 mb-6">{pkg.tagline}</p>
              <div className="text-3xl font-black text-[#0B2545] mb-6">{pkg.price}</div>
              <ul className="space-y-3 mb-8 flex-1">
                {pkg.features.map((f) => (
                  <li key={f} className="flex items-start gap-2 text-sm text-gray-700">
                    <Check className="w-4 h-4 text-teal-400 mt-0.5 shrink-0" />
                    <span>{f}</span>
                  </li>
                ))}
              </ul>
              <Link
                to="/#support"
                className={`text-center px-6 py-3 rounded-full font-semibold transition-all hover:scale-105 ${
                  pkg.highlight
                    ? 'bg-teal-500 text-white hover:bg-teal-600'
                    : 'glass-card text-[#0B2545] hover:bg-gray-100'
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
R13FILEEOF_10

mkdir -p "$(dirname "src/components/PartnersSlider.tsx")"
cat > "src/components/PartnersSlider.tsx" << 'R13FILEEOF_11'
import { motion } from 'motion/react';

const partners = [
  { name: 'International Islamic University Islamabad', logo: '/images/IIUI-logos-2.jpg' },
  { name: 'Pakistan Cybersecurity Alliance', logo: '/images/PCA.png' },
  { name: 'P@SHA Startup Hub', logo: '/images/pasha-startup-hub.png' },
  { name: 'National Incubation Center for Aerospace Technologies', logo: '/images/nicat.png' },
  { name: 'Ignite National Technology Fund', logo: '/images/ignite-logo.png' },
  { name: 'Chamber of Commerce & Industry, Islamabad', logo: '/images/icci.png' },
  { name: 'HerVoice', logo: '/images/HerVoice.png' },
  { name: 'Sahiba Writing Squad - SWS', logo: '/images/SWS.jpg' },
  { name: 'Nas Fist Solutions (Private) Limited', logo: '/images/nas.png' },
  { name: 'TMUC Abbottabad', logo: '/images/TMUC-logo.png' },
  { name: 'National Youth Leadership Programme (NYLP)', logo: '/images/nylp.png' },
  { name: 'Empowerise Her', logo: '/images/Empowerise-Her.png' },
];

const loopPartners = [...partners, ...partners];

export default function PartnersSlider() {
  return (
    <section className="py-20 relative z-10 border-t border-gray-100 overflow-hidden">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <motion.p
          initial={{ opacity: 0, y: 10 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="text-center text-gray-600 text-sm font-semibold tracking-widest uppercase mb-10"
        >
          Our Partners
        </motion.p>
      </div>

      <div className="relative w-full">
        <div className="absolute left-0 top-0 bottom-0 w-24 bg-gradient-to-r from-[#F6F8FB] to-transparent z-10 pointer-events-none" />
        <div className="absolute right-0 top-0 bottom-0 w-24 bg-gradient-to-l from-[#F6F8FB] to-transparent z-10 pointer-events-none" />
        <div className="partner-marquee-track flex items-center gap-6 w-max">
          {loopPartners.map((partner, idx) => (
            <div
              key={`${partner.name}-${idx}`}
              title={partner.name}
              className="glass-card rounded-xl border border-gray-200 px-8 py-5 flex items-center justify-center shrink-0 grayscale hover:grayscale-0 opacity-70 hover:opacity-100 transition-all h-20 w-40"
            >
              <img src={partner.logo} alt={partner.name} className="max-h-12 max-w-full object-contain" />
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
R13FILEEOF_11

mkdir -p "$(dirname "src/components/Product.tsx")"
cat > "src/components/Product.tsx" << 'R13FILEEOF_12'
import { motion } from 'motion/react';
import { Shield, AlertTriangle, CheckCircle, FileText, Activity, Server, ExternalLink, Play } from 'lucide-react';
import { Link } from 'react-router-dom';

export default function Product() {
  const problems = [
    { title: 'Problem 1', desc: '90% MODERN APPLICATIONS RELY ON OPEN-SOURCE COMPONENTS' },
    { title: 'Problem 2', desc: '96% APPLICATIONS STILL INCLUDE AT LEAST ONE OPEN-SOURCE DEPENDENCY' },
    { title: 'Problem 3', desc: '30% DEVELOPERS ARE ESTIMATED TO FOLLOW FORMAL SECURE CODING PRACTICES CONSISTENTLY' },
  ];

  const attacks = [
    { 
      name: 'LOG4J Vulnerability', 
      year: '2021/2022', 
      desc: 'The Log4j crisis proved that a single hidden flaw in a \'trusted\' background library can compromise billions of devices, even if your own code is perfect.',
      source: 'CNBC - Dec 17, 2021',
      link: 'https://www.cnbc.com/video/2021/12/16/log4j-vulnerability-the-most-serious-ive-seen-in-my-decades-long-career-says-cisa-director.html',
      image: '/images/news.jpg'
    },
    { 
      name: 'SolarWinds Orion Compromise', 
      year: '2020', 
      desc: 'Malicious code was inserted into SolarWinds Orion updates, affecting thousands of organizations worldwide, including government agencies.',
      source: 'IBM - May 10, 2024',
      link: 'https://www.ibm.com/docs/en/randori?topic=2022-solarwinds-orion-cve-2020-10148',
      image: '/images/3500.webp'
    },
    { 
      name: '3CX Desktop App Supply Chain Attack', 
      year: '2023', 
      desc: 'A multi-stage attack where hackers first compromised a software package from a third-party vendor to pivot into 3CX network and poisoned the build process.',
      source: 'The Hacker News - Mar 8, 2023',
      link: 'https://thehackernews.com/2023/03/3cx-supply-chain-attack-heres-what-we.html',
      image: '/images/3cx.png'
    },
    { 
      name: 'XZ Utils Backdoor', 
      year: '2024', 
      desc: 'A sophisticated operation where an attacker spent over two years earning trust as a maintainer of the open-source XZ Utils compression library, then introduced a backdoor.',
      source: 'Akamai Blog - Sep 23, 2025',
      link: 'https://www.akamai.com/blog/security-research/critical-linux-backdoor-xz-utils-discovered-what-to-know',
      image: '/images/Blog-CVE-2024-3094-v.2_2x-1.png'
    },
    { 
      name: 'Polyfill.io Service Compromise', 
      year: '2024', 
      desc: 'The cdn.polyfill.io domain, used by over 100,000 websites, was sold to a new owner who changed the code to redirect users to malicious sites.',
      source: 'Qualys Blog - Jun 23, 2025',
      link: 'https://blog.qualys.com/vulnerabilities-threat-research/2024/06/28/polyfill-io-supply-chain-attack',
      image: '/images/Horizontal-Blog-Image-Template_Polyfill.io_.png'
    },
    { 
      name: 'Shai-Hulud npm Worm', 
      year: '2025', 
      desc: 'Malicious versions of popular Node.js packages were published to exploit developer environments, steal secrets, and automatically publish more malicious packages.',
      source: 'CISA Alert - Sep 23, 2025',
      link: 'https://www.cisa.gov/news-events/alerts/2025/09/23/widespread-supply-chain-compromise-impacting-npm-ecosystem',
      image: '/images/1758030724-shai-hulud.webp'
    },
  ];

  const purposes = [
    { icon: FileText, title: 'Export Compliance & Licensing', desc: 'Generate verifiable SBOMs and security attestations required to close high-value contracts in US/EU markets.' },
    { icon: CheckCircle, title: 'SSDLC Validation Engine', desc: 'Existing tools only check what libraries you use. MyESI checks how you used them and validates the SSDLC process line-by-line.' },
    { icon: Activity, title: 'Developer Hygiene Monitoring', desc: 'Track SSDLC adherence across teams to ensure security isn\'t sacrificed for speed during rapid development cycles.' },
    { icon: Server, title: 'Banking & OT Infrastructure Audit', desc: 'Automate the evidence collection for SBP or PCI-DSS audits with real-time risk heatmaps.' },
  ];

  return (
    <section id="product" className="py-24 relative overflow-hidden bg-gray-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="text-center mb-16">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-full glass-card border-teal-500/30 text-teal-400 text-sm font-medium mb-6"
          >
            <Shield className="w-4 h-4" />
            <span>Hero Product</span>
          </motion.div>
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.1 }}
            className="text-4xl md:text-6xl font-bold text-[#0B2545] mb-4"
          >
            MyESI
          </motion.h2>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.2 }}
            className="text-xl text-teal-400 font-medium tracking-widest uppercase mb-8"
          >
            My Enterprise Security Intelligence
          </motion.p>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.3 }}
            className="text-lg text-gray-600 max-w-4xl mx-auto mb-8"
          >
            iSeeWaves has developed MyESI, which secures your code by uncovering hidden vulnerabilities in modules, third-party frameworks, and APIs. It pinpoints risks from outdated versions, misconfigurations, and validates the SSDLC process line-by-line.
          </motion.p>
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.4 }}
            className="flex justify-center"
          >
            <Link 
              to="/demo"
              className="inline-flex items-center gap-2 px-8 py-4 rounded-full bg-teal-500 hover:bg-teal-600 text-white font-bold transition-all hover:scale-105 shadow-[0_0_20px_rgba(16,185,129,0.3)]"
            >
              <Play className="w-5 h-5 fill-current" />
              Watch Demo
            </Link>
          </motion.div>
        </div>

        {/* Why MyESI */}
        <div className="mb-20">
          <h3 className="text-3xl font-bold text-[#0B2545] mb-10 text-center">Why MyESI?</h3>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            {problems.map((prob, idx) => (
              <motion.div
                key={idx}
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                transition={{ delay: idx * 0.1 }}
                className="glass-card p-6 rounded-2xl border-red-500/20"
              >
                <div className="flex items-center gap-3 mb-4 text-red-400">
                  <AlertTriangle className="w-6 h-6" />
                  <h4 className="font-bold">{prob.title}</h4>
                </div>
                <p className="text-gray-700 font-medium">{prob.desc}</p>
              </motion.div>
            ))}
          </div>
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="glass-card p-6 rounded-2xl text-center border-teal-500/30"
          >
            <p className="text-xl text-teal-400 font-semibold">
              Just 14% of Organizations have reached a high level of "Security Maturity" where security is fully integrated into the development workflow.
            </p>
          </motion.div>
        </div>

        {/* Real World Attacks */}
        <div className="mb-20">
          <h3 className="text-3xl font-bold text-[#0B2545] mb-10 text-center">Real World Attacks On Software Supply Chain</h3>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            {attacks.map((attack, idx) => (
              <motion.div
                key={idx}
                initial={{ opacity: 0, scale: 0.95 }}
                whileInView={{ opacity: 1, scale: 1 }}
                viewport={{ once: true }}
                transition={{ delay: idx * 0.1 }}
                className="glass-card rounded-2xl overflow-hidden hover:border-teal-500/50 transition-all group flex flex-col"
              >
                <div className="relative h-48 overflow-hidden">
                  <img 
                    src={attack.image} 
                    alt={attack.name} 
                    className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
                    referrerPolicy="no-referrer"
                  />
                  <div className="absolute inset-0 bg-gradient-to-t from-[#050505] to-transparent opacity-80" />
                  <span className="absolute bottom-4 right-4 text-xs font-mono text-teal-400 bg-teal-400/10 backdrop-blur-md px-3 py-1.5 rounded-full border border-teal-500/20">
                    {attack.year}
                  </span>
                </div>
                <div className="p-6 flex flex-col flex-grow">
                  <h4 className="text-lg font-bold text-[#0B2545] mb-3 group-hover:text-teal-400 transition-colors">{attack.name}</h4>
                  <p className="text-sm text-gray-600 mb-6 flex-grow leading-relaxed">{attack.desc}</p>
                  <div className="pt-4 border-t border-gray-200 flex justify-between items-center mt-auto">
                    <span className="text-xs text-gray-600 font-medium">{attack.source}</span>
                    <a 
                      href={attack.link} 
                      target="_blank" 
                      rel="noopener noreferrer"
                      className="text-teal-400 hover:text-teal-300 transition-colors"
                      title="Read more"
                    >
                      <ExternalLink className="w-4 h-4" />
                    </a>
                  </div>
                </div>
              </motion.div>
            ))}
          </div>
        </div>

        {/* Primary Purposes */}
        <div>
          <h3 className="text-3xl font-bold text-[#0B2545] mb-10 text-center">Primary Purposes</h3>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            {purposes.map((purpose, idx) => (
              <motion.div
                key={idx}
                initial={{ opacity: 0, x: idx % 2 === 0 ? -20 : 20 }}
                whileInView={{ opacity: 1, x: 0 }}
                viewport={{ once: true }}
                className="glass-card p-8 rounded-3xl flex gap-6"
              >
                <div className="flex-shrink-0">
                  <div className="w-12 h-12 rounded-full bg-teal-500/20 flex items-center justify-center">
                    <purpose.icon className="w-6 h-6 text-teal-400" />
                  </div>
                </div>
                <div>
                  <h4 className="text-xl font-bold text-[#0B2545] mb-3">{purpose.title}</h4>
                  <p className="text-gray-600 leading-relaxed">{purpose.desc}</p>
                </div>
              </motion.div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
R13FILEEOF_12

mkdir -p "$(dirname "src/components/SupportSection.tsx")"
cat > "src/components/SupportSection.tsx" << 'R13FILEEOF_13'
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
  Loader2,
} from 'lucide-react';
import { useSubmitForm } from '../hooks/useSubmitForm';
import FormToast from './FormToast';

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
    a: 'Full access to all 8 audits (Dynamic SBOM Generation, Secure Coding Testing, SCA, SAST, DAST, API Security, Secrets Detection, Compliance Controls) on up to 3 repositories, with no card required to start.',
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
  const { status, handleSubmit } = useSubmitForm({ subject: '1-Month Free Trial Request' });

  return (
    <section id="support" className="py-24 relative z-10">
      <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-14">
          <motion.span
            initial={{ opacity: 0, y: 10 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-teal-400 text-sm font-bold tracking-widest uppercase"
          >
            Support
          </motion.span>
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-5xl font-bold text-[#0B2545] mt-4"
          >
            Everything You Need to <span className="text-teal-400">Get Started</span>
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
                  ? 'bg-teal-500 text-white'
                  : 'glass-card text-gray-600 hover:text-[#0B2545] hover:bg-gray-100'
              }`}
            >
              <tab.icon className="w-4 h-4" />
              {tab.label}
            </button>
          ))}
        </div>

        <div className="glass-card rounded-2xl border border-gray-200 p-6 md:p-10">
          {activeTab === 'trial' && (
            <div>
              <h3 className="text-2xl font-bold text-[#0B2545] mb-2">Start Your 1-Month Free Trial</h3>
              <p className="text-gray-600 mb-8">
                Fill this out and our team will set up your trial and get in touch on the email you provide.
              </p>
              {status === 'success' ? (
                <div className="text-teal-500 font-medium">
                  Thanks. Your trial request has been sent. We will reach out shortly.
                </div>
              ) : (
                <form
                  onSubmit={handleSubmit}
                  className="grid grid-cols-1 md:grid-cols-2 gap-6"
                >
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">Full Name</label>
                    <input required name="name" type="text" className="w-full px-4 py-3 rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">Company</label>
                    <input required name="company" type="text" className="w-full px-4 py-3 rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">Work Email</label>
                    <input required name="email" type="email" className="w-full px-4 py-3 rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">Phone (optional)</label>
                    <input name="phone" type="tel" className="w-full px-4 py-3 rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                  </div>
                  <div className="md:col-span-2">
                    <label className="block text-sm font-medium text-gray-700 mb-2">Tell us about your stack (optional)</label>
                    <textarea name="message" rows={4} className="w-full px-4 py-3 rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                  </div>
                  <div className="md:col-span-2">
                    <button
                      type="submit"
                      disabled={status === 'sending'}
                      className="flex items-center gap-2 px-8 py-4 rounded-full bg-teal-500 hover:bg-teal-600 text-white font-semibold transition-all hover:scale-105 disabled:opacity-60 disabled:hover:scale-100"
                    >
                      {status === 'sending' ? 'Sending...' : 'Request Free Trial'}
                      {status === 'sending' ? <Loader2 className="w-4 h-4 animate-spin" /> : <Send className="w-4 h-4" />}
                    </button>
                  </div>
                </form>
              )}
            </div>
          )}

          {activeTab === 'technical' && (
            <div>
              <h3 className="text-2xl font-bold text-[#0B2545] mb-4">Technical Support</h3>
              <p className="text-gray-600 leading-relaxed mb-4">
                Every MyESI plan includes direct access to our engineering-backed support team. Business and Enterprise
                customers get priority response times and a named point of contact for onboarding, integration, and
                incident troubleshooting.
              </p>
              <ul className="space-y-2 text-gray-700 text-sm list-disc list-inside">
                <li>Email and ticket-based support for all plans</li>
                <li>Priority response SLA for Business and Enterprise</li>
                <li>Guided CI/CD and pipeline integration support</li>
                <li>Dedicated technical account manager for Enterprise</li>
              </ul>
            </div>
          )}

          {activeTab === 'reporting' && (
            <div>
              <h3 className="text-2xl font-bold text-[#0B2545] mb-4">Reporting</h3>
              <p className="text-gray-600 leading-relaxed mb-4">
                MyESI generates audit-ready reports automatically after every scan, covering SBOM inventories, SAST/DAST
                findings, SCA risk summaries, and compliance mapping, exportable as PDF or shared with stakeholders on a
                schedule that fits your release cadence.
              </p>
              <ul className="space-y-2 text-gray-700 text-sm list-disc list-inside">
                <li>Automated per-scan and periodic summary reports</li>
                <li>Executive-level and engineering-level report formats</li>
                <li>Historical trend reporting across releases</li>
              </ul>
            </div>
          )}

          {activeTab === 'usage' && (
            <div>
              <h3 className="text-2xl font-bold text-[#0B2545] mb-4">Usage</h3>
              <p className="text-gray-600 leading-relaxed mb-4">
                A live usage dashboard shows repository coverage, scan frequency, seat allocation, and remaining quota for
                your plan, so admins always know how the platform is being used across teams.
              </p>
              <ul className="space-y-2 text-gray-700 text-sm list-disc list-inside">
                <li>Per-repository and per-team scan activity</li>
                <li>Seat and license usage tracking</li>
                <li>Usage-based alerts before you hit plan limits</li>
              </ul>
            </div>
          )}

          {activeTab === 'compliance' && (
            <div>
              <h3 className="text-2xl font-bold text-[#0B2545] mb-4">Compliance & Configuration Checks</h3>
              <p className="text-gray-600 leading-relaxed mb-4">
                Beyond code-level scanning, MyESI continuously checks your environment and pipeline configuration against
                your target compliance frameworks, flagging drift before it becomes an audit finding.
              </p>
              <ul className="space-y-2 text-gray-700 text-sm list-disc list-inside">
                <li>Continuous configuration drift detection</li>
                <li>Framework-mapped compliance evidence generation</li>
                <li>See the full framework list on our Compliance page</li>
              </ul>
            </div>
          )}

          {activeTab === 'onprem' && (
            <div>
              <h3 className="text-2xl font-bold text-[#0B2545] mb-4">On-Premises Mode</h3>
              <p className="text-gray-600 leading-relaxed mb-4">
                For organizations that cannot let source code or scan data leave their network, MyESI can be deployed
                fully on-premises. All six audits run inside your own infrastructure, under your own access controls.
              </p>
              <ul className="space-y-2 text-gray-700 text-sm list-disc list-inside">
                <li>Full deployment inside your infrastructure, air-gapped environments supported</li>
                <li>No source code or scan data leaves your network</li>
                <li>Same audit coverage and reporting as the cloud offering</li>
                <li>Available on the Enterprise package</li>
              </ul>
            </div>
          )}

          {activeTab === 'price' && (
            <div>
              <h3 className="text-2xl font-bold text-[#0B2545] mb-4">Price</h3>
              <p className="text-gray-600 leading-relaxed mb-6">
                Pricing scales with the number of repositories and the package tier you choose. See the{' '}
                <Link to="/packages" className="text-teal-400 hover:underline">Packages</Link> section above for what is
                included in Starter, Business, and Enterprise, or talk to our team for a tailored quote.
              </p>
              <Link
                to="/packages"
                className="inline-flex items-center gap-2 px-6 py-3 rounded-full bg-teal-500 hover:bg-teal-600 text-white font-semibold transition-all"
              >
                View Packages
              </Link>
            </div>
          )}

          {activeTab === 'purchase' && (
            <div>
              <h3 className="text-2xl font-bold text-[#0B2545] mb-4">Purchase</h3>
              <p className="text-gray-600 leading-relaxed mb-4">
                Most customers start with the free trial above. Once you are ready to move forward, our sales team will
                walk you through package selection, deployment mode (cloud or on-premises), and contracting.
              </p>
              <a
                href="mailto:info@iseewaves.pk?subject=Purchase%20Inquiry%20-%20MyESI"
                className="inline-flex items-center gap-2 px-6 py-3 rounded-full glass-card text-[#0B2545] font-semibold hover:bg-gray-100 transition-all"
              >
                Talk to Sales
              </a>
            </div>
          )}

          {activeTab === 'faqs' && (
            <div>
              <h3 className="text-2xl font-bold text-[#0B2545] mb-6">Frequently Asked Questions</h3>
              <div className="space-y-3">
                {faqs.map((faq, idx) => (
                  <div key={idx} className="border border-gray-200 rounded-xl overflow-hidden">
                    <button
                      onClick={() => setOpenFaq(openFaq === idx ? null : idx)}
                      className="w-full flex items-center justify-between px-5 py-4 text-left text-[#0B2545] font-medium"
                    >
                      {faq.q}
                      <ChevronDown className={`w-4 h-4 text-teal-400 transition-transform ${openFaq === idx ? 'rotate-180' : ''}`} />
                    </button>
                    {openFaq === idx && (
                      <div className="px-5 pb-4 text-sm text-gray-600 leading-relaxed">{faq.a}</div>
                    )}
                  </div>
                ))}
              </div>
            </div>
          )}
        </div>
      </div>
      <FormToast status={status} />
    </section>
  );
}
R13FILEEOF_13

mkdir -p "$(dirname "src/components/TrustedBy.tsx")"
cat > "src/components/TrustedBy.tsx" << 'R13FILEEOF_14'
import { motion } from 'motion/react';

const trustedBy = [
  { short: 'MOITT', full: 'Ministry of IT & Telecom', logo: '/images/moitt-logo.png' },
  { short: 'Ignite', full: 'Ignite National Technology Fund', logo: '/images/ignite-logo.png' },
  { short: 'NICAT', full: 'National Incubation Center for Aerospace Technologies', logo: '/images/nicat.png' },
  { short: 'NACK', full: 'NACK', logo: '/images/nack.png' },
  { short: 'NCERT', full: 'National CERT', logo: '/images/ncert.png' },
  { short: 'IIUI', full: 'International Islamic University Islamabad', logo: '/images/IIUI-logos-2.jpg' },
  { short: 'P@SHA', full: 'P@SHA Startup Hub.', logo: '/images/pasha-startup-hub.png' },
];

export default function TrustedBy() {
  return (
    <section id="trusted-by" className="py-20 relative z-10 border-t border-gray-100">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <motion.p
          initial={{ opacity: 0, y: 10 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="text-center text-gray-600 text-sm font-semibold tracking-widest uppercase mb-12"
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
              <img src={org.logo} alt={org.full} className="h-16 w-auto object-contain" />
              <span className="text-2xl md:text-3xl font-black text-[#0B2545] tracking-tight">{org.short}</span>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
R13FILEEOF_14

mkdir -p "$(dirname "src/data/complianceData.ts")"
cat > "src/data/complianceData.ts" << 'R13FILEEOF_15'
export interface ComplianceData {
  id: string;
  title: string;
  fullName: string;
  authority: string;
  authorityLink: string;
  year: string;
  purpose: string;
  definition: string;
  role: string;
  benefits: string[];
  keyRules: string[];
  whoMustComply: string[];
  requirements: string[];
  penalties: string;
  howISeeWavesSupports: string[];
}

export const complianceData: ComplianceData[] = [
  {
    id: 'cmmc',
    title: 'CMMC',
    fullName: 'Cybersecurity Maturity Model Certification',
    authority: 'Department of Defense (DoD)',
    authorityLink: 'https://dodcio.defense.gov/CMMC/',
    year: '2020',
    purpose: 'To protect Federal Contract Information (FCI) and Controlled Unclassified Information (CUI) within the Defense Industrial Base (DIB).',
    definition: 'CMMC is a unified cybersecurity standard for future DoD acquisitions, designed to ensure that contractors have appropriate cybersecurity practices and processes in place to protect sensitive data.',
    role: 'It standardizes cybersecurity requirements across the DoD supply chain, moving away from self-certification to third-party assessments for higher levels of data sensitivity.',
    benefits: [
      'Eligibility to bid on DoD contracts',
      'Enhanced protection against advanced persistent threats (APTs)',
      'Improved overall cybersecurity posture',
      'Standardized security expectations across the supply chain',
      'Competitive advantage in the defense sector'
    ],
    keyRules: [
      'Implement controls based on NIST SP 800-171',
      'Undergo third-party assessments (for Level 2 and above)',
      'Maintain continuous compliance and reporting',
      'Ensure flow-down of requirements to subcontractors',
      'Protect CUI and FCI across all systems'
    ],
    whoMustComply: [
      'DoD prime contractors',
      'DoD subcontractors',
      'Suppliers in the Defense Industrial Base (DIB)',
      'Organizations handling FCI or CUI'
    ],
    requirements: [
      'Access Control and Identity Management',
      'Incident Response Planning',
      'System and Information Integrity',
      'Risk Management and Assessment',
      'Security Assessment and Authorization'
    ],
    penalties: 'Failure to comply results in the inability to bid on, win, or participate in DoD contracts, effectively locking organizations out of the defense supply chain.',
    howISeeWavesSupports: [
      'CMMC readiness assessments and gap analysis',
      'Implementation of NIST SP 800-171 controls',
      'Continuous monitoring for CUI environments',
      'Preparation for C3PAO audits',
      'Automated compliance reporting and evidence collection'
    ]
  },
  {
    id: 'cmmi',
    title: 'CMMI',
    fullName: 'Capability Maturity Model Integration',
    authority: 'ISACA',
    authorityLink: 'https://www.isaca.org/enterprise/cmmi-performance-solutions',
    year: '2002',
    purpose: 'To improve organizational performance and process maturity across software engineering and system development.',
    definition: 'CMMI v2.0 (managed by ISACA since 2016) is a process improvement framework that evaluates organizational capability across five maturity levels—Level 1 (Initial), Level 2 (Managed), Level 3 (Defined), Level 4 (Quantitatively Managed), and Level 5 (Optimizing). It consolidates the formerly separate CMMI-DEV, CMMI-SVC, and CMMI-ACQ models into one unified framework organized across 25 Practice Areas, covering software development, service delivery, and supply chain management within a single appraisal system.',
    role: 'It provides a framework for evaluating and improving the maturity of an organization\'s processes, moving from ad-hoc activities to optimized, measurable processes.',
    benefits: [
      'Increased productivity and efficiency',
      'Higher quality of products and services',
      'Reduced costs and rework',
      'Improved risk management and predictability',
      'Enhanced customer satisfaction'
    ],
    keyRules: [
      'Define clear organizational processes',
      'Measure and analyze process performance',
      'Implement continuous process improvement',
      'Ensure alignment with business objectives',
      'Conduct regular appraisals and audits'
    ],
    whoMustComply: [
      'Software development companies',
      'System engineering firms',
      'IT service providers',
      'Government contractors requiring CMMI appraisal'
    ],
    requirements: [
      'Process Management',
      'Project Management',
      'Engineering Processes',
      'Support Processes',
      'Quantitative Management'
    ],
    penalties: 'While not a regulatory law with fines, lack of CMMI maturity can result in lost contracts, especially in government and defense sectors where specific maturity levels are required.',
    howISeeWavesSupports: [
      'Process mapping and maturity assessments',
      'Integration of security into CMMI processes (DevSecOps)',
      'Automated metrics collection and reporting',
      'Continuous improvement tracking',
      'Audit preparation for CMMI appraisals'
    ]
  },
  {
    id: 'peca-pakistan',
    title: 'PECA Pakistan',
    fullName: 'Prevention of Electronic Crimes Act',
    authority: 'Government of Pakistan / FIA',
    authorityLink: 'https://na.gov.pk/',
    year: '2016',
    purpose: 'To prevent unauthorized acts with respect to information systems and provide for related offenses and penalties.',
    definition: 'PECA is Pakistan\'s primary cybercrime legislation, criminalizing various acts such as unauthorized access, data damage, electronic fraud, and cyber terrorism.',
    role: 'It provides the legal framework for investigating and prosecuting cybercrimes in Pakistan, empowering the Federal Investigation Agency (FIA) to take action.',
    benefits: [
      'Legal recourse against cybercriminals',
      'Protection of critical information infrastructure',
      'Deterrence against electronic fraud and forgery',
      'Framework for international cooperation in cybercrime',
      'Protection of citizens against cyber harassment'
    ],
    keyRules: [
      'Prohibits unauthorized access to information systems or data',
      'Criminalizes interference with critical infrastructure',
      'Mandates retention of traffic data by service providers for a minimum of one year',
      'Prohibits electronic forgery and fraud',
      'Regulates the issuance of warrants for search and seizure of data'
    ],
    whoMustComply: [
      'All citizens and residents of Pakistan',
      'Service providers (ISPs, telecom operators)',
      'Organizations operating information systems in Pakistan'
    ],
    requirements: [
      'Service providers must retain specified traffic data',
      'Organizations must cooperate with law enforcement during investigations',
      'Implementation of security measures to prevent unauthorized access (best practice)',
      'Reporting of cybercrimes to the FIA'
    ],
    penalties: 'Penalties range from fines of tens of thousands of rupees to imprisonment for up to 14 years, depending on the severity of the crime (e.g., cyber terrorism carries the highest penalties).',
    howISeeWavesSupports: [
      'Forensic readiness and evidence preservation',
      'Implementation of access controls to prevent unauthorized access',
      'Log management to support investigations',
      'Incident response and coordination with law enforcement',
      'Security awareness to prevent electronic fraud'
    ]
  },
  {
    id: 'dfars',
    title: 'DFARS',
    fullName: 'Defense Federal Acquisition Regulation Supplement',
    authority: 'Department of Defense (DoD)',
    authorityLink: 'https://www.acquisition.gov/dfars',
    year: '2015',
    purpose: 'To safeguard Covered Defense Information (CDI) and report cyber incidents rapidly.',
    definition: 'DFARS Clause 252.204-7012 requires DoD contractors to implement NIST SP 800-171 security requirements to protect sensitive defense information residing on their internal IT systems.',
    role: 'It mandates baseline cybersecurity standards for defense contractors and establishes strict protocols for reporting cyber incidents to the DoD.',
    benefits: [
      'Continued eligibility for DoD contracts',
      'Protection of sensitive defense technology',
      'Clear incident response protocols',
      'Improved supply chain security',
      'Alignment with federal security standards'
    ],
    keyRules: [
      'Implement NIST SP 800-171 controls',
      'Report cyber incidents to the DoD within 72 hours',
      'Submit malicious software to the DoD Cyber Crime Center',
      'Preserve and protect images of affected systems',
      'Flow down requirements to subcontractors'
    ],
    whoMustComply: [
      'DoD prime contractors',
      'DoD subcontractors',
      'Any organization handling Covered Defense Information (CDI)'
    ],
    requirements: [
      'Adequate security on all covered contractor information systems',
      'Rapid cyber incident reporting',
      'System Security Plan (SSP) creation',
      'Plan of Action and Milestones (POA&M) tracking',
      'Media protection and physical security'
    ],
    penalties: 'Non-compliance can lead to breach of contract, termination of DoD contracts, financial damages, and potential prosecution under the False Claims Act.',
    howISeeWavesSupports: [
      'NIST SP 800-171 compliance implementation',
      '72-hour incident response and reporting capabilities',
      'System Security Plan (SSP) generation',
      'Continuous monitoring of CDI environments',
      'Forensic data preservation for DoD reporting'
    ]
  },
  {
    id: 'dora',
    title: 'DORA',
    fullName: 'Digital Operational Resilience Act',
    authority: 'European Union',
    authorityLink: 'https://www.eiopa.europa.eu/digital-operational-resilience-act-dora_en',
    year: '2023',
    purpose: 'To ensure the financial sector in Europe is resilient against severe operational disruptions and cyber threats.',
    definition: 'DORA is an EU regulation that creates a binding, comprehensive information and communication technology (ICT) risk management framework for the EU financial sector.',
    role: 'It shifts the focus from financial resilience to operational resilience, ensuring financial entities can withstand, respond to, and recover from all types of ICT-related disruptions.',
    benefits: [
      'Enhanced resilience against cyber attacks',
      'Harmonized ICT risk management across the EU',
      'Better oversight of critical third-party providers',
      'Streamlined incident reporting',
      'Increased consumer trust in financial systems'
    ],
    keyRules: [
      'Establish a comprehensive ICT risk management framework',
      'Classify and report major ICT-related incidents',
      'Conduct regular digital operational resilience testing',
      'Manage ICT third-party risk effectively',
      'Share cyber threat information and intelligence'
    ],
    whoMustComply: [
      'Banks and credit institutions',
      'Insurance companies',
      'Investment firms',
      'Crypto-asset service providers',
      'Critical ICT third-party service providers (e.g., cloud providers)'
    ],
    requirements: [
      'ICT Risk Management Framework',
      'Incident Management and Reporting',
      'Resilience Testing (including Threat-Led Penetration Testing)',
      'Third-Party Risk Management Strategy',
      'Information Sharing Arrangements'
    ],
    penalties: 'Fines can reach up to 1% of the average daily worldwide turnover of the critical ICT third-party service provider in the preceding business year, applied daily for up to six months.',
    howISeeWavesSupports: [
      'ICT risk management framework design',
      'Threat-Led Penetration Testing (TLPT)',
      'Third-party risk assessment and monitoring',
      'Automated incident classification and reporting',
      'Continuous operational resilience monitoring'
    ]
  },
  {
    id: 'dpa-philippines',
    title: 'DPA Philippines',
    fullName: 'Data Privacy Act of 2012 (Republic Act No. 10173)',
    authority: 'National Privacy Commission (NPC)',
    authorityLink: 'https://www.privacy.gov.ph/data-privacy-act/',
    year: '2012',
    purpose: 'To protect the fundamental human right of privacy of communication while ensuring free flow of information to promote innovation and growth.',
    definition: 'The DPA is a comprehensive privacy law in the Philippines that regulates the processing of personal information and sensitive personal information by public and private entities.',
    role: 'It establishes the rules for data collection, processing, and storage, and mandates the appointment of a Data Protection Officer (DPO) for organizations.',
    benefits: [
      'Protection of citizens\' personal data',
      'Alignment with international data privacy standards',
      'Increased consumer trust',
      'Clear guidelines for data breach management',
      'Fostering a secure digital economy'
    ],
    keyRules: [
      'Obtain explicit consent before processing personal data',
      'Implement reasonable and appropriate security measures',
      'Appoint a Data Protection Officer (DPO)',
      'Report data breaches to the NPC within 72 hours',
      'Respect data subjects\' rights (access, correction, erasure)'
    ],
    whoMustComply: [
      'Any individual or entity processing personal data in the Philippines',
      'Foreign entities processing data of Philippine citizens',
      'Government agencies',
      'Private corporations and businesses'
    ],
    requirements: [
      'Privacy Impact Assessments (PIA)',
      'Data sharing agreements',
      'Breach response procedures',
      'Registration of data processing systems with the NPC',
      'Organizational, physical, and technical security measures'
    ],
    penalties: 'Violations can result in imprisonment ranging from 1 to 6 years and fines from PHP 500,000 to PHP 5,000,000, depending on the nature of the offense.',
    howISeeWavesSupports: [
      'Data discovery and classification',
      'Implementation of technical security controls',
      'Automated breach detection and 72-hour reporting support',
      'Privacy Impact Assessment (PIA) facilitation',
      'Data encryption and access management'
    ]
  },
  {
    id: 'dpdpa-india',
    title: 'DPDPA India',
    fullName: 'Digital Personal Data Protection Act',
    authority: 'Data Protection Board of India',
    authorityLink: 'https://www.meity.gov.in/data-protection-framework',
    year: '2023',
    purpose: 'To provide for the processing of digital personal data in a manner that recognizes both the right of individuals to protect their personal data and the need to process such data for lawful purposes.',
    definition: 'The DPDPA is India\'s comprehensive data protection legislation, focusing on digital personal data and establishing the obligations of Data Fiduciaries and the rights of Data Principals.',
    role: 'It modernizes India\'s privacy landscape, replacing older IT rules with a robust framework that emphasizes consent, purpose limitation, and significant penalties for breaches.',
    benefits: [
      'Empowerment of Data Principals (citizens)',
      'Clear regulatory framework for businesses',
      'Facilitation of cross-border data transfers',
      'Enhanced cybersecurity posture across industries',
      'Establishment of the Data Protection Board'
    ],
    keyRules: [
      'Process data only for lawful purposes with consent',
      'Provide clear notices in multiple languages',
      'Protect personal data with reasonable security safeguards',
      'Report personal data breaches to the Board and affected individuals',
      'Special protections for children\'s data'
    ],
    whoMustComply: [
      'Data Fiduciaries processing digital personal data in India',
      'Entities processing data outside India if offering goods/services to individuals in India',
      'Significant Data Fiduciaries (subject to stricter rules)',
      'Consent Managers'
    ],
    requirements: [
      'Notice and Consent mechanisms',
      'Data breach notification protocols',
      'Appointment of a Data Protection Officer (for Significant Fiduciaries)',
      'Data Protection Impact Assessments',
      'Grievance redressal mechanisms'
    ],
    penalties: 'Fines can be substantial, reaching up to ₹250 crore (approx. $30 million USD) for failure to take reasonable security safeguards to prevent personal data breaches.',
    howISeeWavesSupports: [
      'Implementation of reasonable security safeguards',
      'Data breach detection and rapid notification workflows',
      'Data lifecycle management and secure erasure',
      'Consent management technical integration',
      'Continuous security posture monitoring'
    ]
  },
  {
    id: 'gdpr',
    title: 'GDPR',
    fullName: 'General Data Protection Regulation',
    authority: 'European Union Data Protection Authorities',
    authorityLink: 'https://gdpr.eu/',
    year: '2018',
    purpose: 'To protect the privacy and personal data of European Union citizens and reshape the way organizations across the region approach data privacy.',
    definition: 'The GDPR is a comprehensive privacy and security law that imposes strict rules on organizations anywhere in the world, so long as they target or collect data related to people in the EU.',
    role: 'It introduced extra-territorial jurisdiction under Article 3, applying to any organization worldwide that targets or monitors EU residents, and replaced 28 divergent national data protection laws with a single harmonized regulation. The "one-stop-shop" mechanism (Articles 56–60) allows multi-country organizations to deal with a single Lead Supervisory Authority. It grants data subjects enforceable rights including access (Article 15), rectification (Article 16), erasure/right to be forgotten (Article 17), and data portability (Article 20).',
    benefits: [
      'Strong protection of individual privacy rights',
      'Unified data protection rules across the EU',
      'Increased transparency in data processing',
      'Enhanced organizational cybersecurity',
      'Global influence on privacy legislation'
    ],
    keyRules: [
      'Lawfulness, fairness, and transparency in processing',
      'Purpose limitation and data minimization',
      'Accuracy and storage limitation',
      'Integrity and confidentiality (security)',
      'Accountability of the data controller'
    ],
    whoMustComply: [
      'Any organization operating within the EU',
      'Organizations outside the EU that offer goods/services to EU residents',
      'Organizations that monitor the behavior of EU residents',
      'Data controllers and data processors'
    ],
    requirements: [
      'Explicit consent for data collection',
      'Appointment of a Data Protection Officer (DPO) in certain cases',
      'Data Protection Impact Assessments (DPIA)',
      '72-hour data breach notification',
      'Implementation of Privacy by Design and Default'
    ],
    penalties: 'Fines can reach up to €20 million or 4% of the firm\'s worldwide annual revenue from the preceding financial year, whichever amount is higher.',
    howISeeWavesSupports: [
      'Data discovery and mapping for EU citizen data',
      'Implementation of Privacy by Design technical controls',
      'Automated 72-hour breach detection and reporting',
      'Data encryption and pseudonymization',
      'Right to erasure (Data Subject Access Request) technical fulfillment'
    ]
  },
  {
    id: 'hipaa',
    title: 'HIPAA',
    fullName: 'Health Insurance Portability and Accountability Act',
    authority: 'Department of Health and Human Services (HHS)',
    authorityLink: 'https://www.hhs.gov/hipaa/index.html',
    year: '1996',
    purpose: 'To protect sensitive patient health information from being disclosed without the patient\'s consent or knowledge.',
    definition: 'HIPAA is a US federal law that establishes national standards to protect individuals\' medical records and other personal health information (PHI).',
    role: 'It partitions compliance obligations between Covered Entities (healthcare providers, health plans, clearinghouses) and Business Associates (third-party vendors handling PHI), requiring mandatory Business Associate Agreements (BAAs) to extend liability down the supply chain. The HITECH Act of 2009 significantly strengthened HIPAA by making Business Associates directly and independently liable for violations, and introduced a tiered civil monetary penalty structure scaled by culpability—from unknowing violations to willful neglect.',
    benefits: [
      'Protection of sensitive health information (PHI)',
      'Patient control over health data',
      'Standardization of electronic healthcare transactions',
      'Prevention of healthcare fraud and abuse',
      'Secure transition to electronic health records (EHR)'
    ],
    keyRules: [
      'Privacy Rule: Protects PHI and sets limits on uses and disclosures',
      'Security Rule: Requires administrative, physical, and technical safeguards',
      'Breach Notification Rule: Mandates reporting of PHI breaches',
      'Minimum Necessary Standard: Limit access to what is needed',
      'Business Associate Agreements (BAA) requirement'
    ],
    whoMustComply: [
      'Healthcare providers (doctors, clinics, hospitals)',
      'Health plans (insurance companies)',
      'Healthcare clearinghouses',
      'Business Associates (vendors handling PHI)'
    ],
    requirements: [
      'Access controls and unique user identification',
      'Encryption of PHI at rest and in transit',
      'Audit controls and activity tracking',
      'Facility access controls (physical security)',
      'Regular risk analyses and management'
    ],
    penalties: 'Fines range from $141 to $71,162 per violation (inflation-adjusted), with a maximum annual penalty exceeding $2.1 million for violations of an identical provision. The original statutory amounts under HITECH were $100–$50,000 per violation with a $1.5 million annual cap. Criminal charges can also apply.',
    howISeeWavesSupports: [
      'End-to-end encryption for PHI data',
      'Strict access control and identity management',
      'Comprehensive audit logging and monitoring',
      'HIPAA Security Rule risk assessments',
      'Secure communication and data transfer solutions'
    ]
  },
  {
    id: 'irdai',
    title: 'IRDAI',
    fullName: 'IRDAI Information and Cyber Security Guidelines',
    authority: 'Insurance Regulatory and Development Authority of India',
    authorityLink: 'https://irdai.gov.in/',
    year: '2023',
    purpose: 'To establish a robust cyber security framework for the insurance sector in India to mitigate cyber risks and protect policyholder data.',
    definition: 'The IRDAI Information and Cyber Security Guidelines (Circular Ref: IRDAI/SDD/CIR/MISC/068/03/2023) require all regulated entities to appoint a Chief Information Security Officer (CISO) with a direct reporting line to the Board, maintain a Board-approved Information Security Policy, conduct bi-annual Vulnerability Assessment and Penetration Testing (VAPT) by CERT-In empanelled auditors, implement a Cyber Crisis Management Plan (CCMP), and report cyber incidents to IRDAI within a mandatory 6-hour window — aligning with CERT-In\'s mandatory incident reporting directions of 2022.',
    role: 'It ensures the resilience of the Indian insurance sector against cyber threats, safeguarding sensitive financial and personal data of policyholders.',
    benefits: [
      'Enhanced protection of policyholder data',
      'Standardized security practices across the insurance sector',
      'Improved cyber resilience and incident response',
      'Board-level accountability for cybersecurity',
      'Trust and stability in the insurance market'
    ],
    keyRules: [
      'Formulate a Board-approved Information Security Policy',
      'Appoint a Chief Information Security Officer (CISO)',
      'Conduct regular vulnerability assessments and penetration testing (VAPT)',
      'Implement data loss prevention (DLP) mechanisms',
      'Report cyber incidents to IRDAI within 6 hours'
    ],
    whoMustComply: [
      'Insurance companies',
      'Insurance intermediaries',
      'Third-party administrators (TPAs)',
      'Other entities regulated by IRDAI'
    ],
    requirements: [
      'Information Security Governance framework',
      'Endpoint security and mobile device management',
      'Cloud security controls',
      'Cyber Crisis Management Plan (CCMP)',
      'Information security audits by CERT-In empanelled auditors'
    ],
    penalties: 'Non-compliance can result in regulatory action, financial penalties, restrictions on business operations, and reputational damage.',
    howISeeWavesSupports: [
      'Implementation of IRDAI-mandated security controls',
      'VAPT and continuous vulnerability management',
      'Data Loss Prevention (DLP) deployment',
      'Automated 6-hour incident reporting workflows',
      'Cloud security posture management (CSPM)'
    ]
  },
  {
    id: 'pcfp-pakistan',
    title: 'PCFP Pakistan',
    fullName: 'Payment Card Framework Pakistan',
    authority: 'State Bank of Pakistan (SBP)',
    authorityLink: 'https://www.sbp.org.pk/',
    year: '2020',
    purpose: 'To secure the payment card ecosystem in Pakistan and protect cardholder data from fraud and breaches.',
    definition: 'The PCFP establishes security guidelines and requirements for banks and payment service providers in Pakistan, heavily aligning with international standards like PCI DSS.',
    role: 'It ensures the integrity and security of electronic payments in Pakistan, fostering trust in digital financial services.',
    benefits: [
      'Reduced payment card fraud in Pakistan',
      'Protection of sensitive cardholder data',
      'Alignment with international payment security standards',
      'Increased consumer confidence in digital payments',
      'Standardized security for payment infrastructure'
    ],
    keyRules: [
      'Mandatory compliance with PCI DSS for all card processing entities',
      'Implementation of EMV (Chip and PIN) technology',
      'Strong customer authentication for online transactions (3D Secure)',
      'Continuous monitoring of payment networks for fraud',
      'Immediate reporting of payment security breaches to SBP'
    ],
    whoMustComply: [
      'Commercial banks issuing payment cards',
      'Acquiring banks and payment gateways',
      'Payment System Operators (PSOs) and Payment Service Providers (PSPs)',
      'Merchants handling card data'
    ],
    requirements: [
      'PCI DSS certification',
      'End-to-end encryption of payment data',
      'Fraud monitoring and detection systems',
      'Regular security audits and penetration testing',
      'Secure application development for payment apps'
    ],
    penalties: 'Non-compliance can result in severe penalties from the SBP, including fines, suspension of card issuance or acquiring privileges, and reputational damage.',
    howISeeWavesSupports: [
      'PCI DSS readiness and compliance implementation',
      'Deployment of fraud detection and monitoring systems',
      'Payment application security testing',
      'Encryption and tokenization of cardholder data',
      'Continuous compliance monitoring'
    ]
  },
  {
    id: 'iso-27001',
    title: 'ISO 27001',
    fullName: 'ISO/IEC 27001 Information Security Management',
    authority: 'International Organization for Standardization',
    authorityLink: 'https://www.iso.org/isoiec-27001-information-security.html',
    year: '2022',
    purpose: 'To provide a framework for establishing, implementing, maintaining, and continually improving an information security management system (ISMS).',
    definition: 'ISO 27001 is the world\'s best-known standard for information security management systems (ISMS). It defines requirements an ISMS must meet to ensure data confidentiality, integrity, and availability.',
    role: 'It serves as a globally recognized benchmark for security, helping organizations manage the security of assets such as financial information, intellectual property, and employee details.',
    benefits: [
      'Global recognition of security maturity',
      'Systematic approach to managing sensitive company information',
      'Reduced likelihood of security breaches',
      'Competitive advantage in vendor selection processes',
      'Continuous improvement of security posture'
    ],
    keyRules: [
      'Establish an Information Security Management System (ISMS)',
      'Conduct comprehensive risk assessments',
      'Implement appropriate risk treatment plans',
      'Define clear security policies and objectives',
      'Perform regular internal audits and management reviews'
    ],
    whoMustComply: [
      'Any organization seeking to formalize its security posture',
      'IT service providers and data centers',
      'SaaS companies and cloud providers',
      'Organizations required by clients to prove security maturity'
    ],
    requirements: [
      'Context of the organization and leadership commitment',
      'Information security risk assessment and treatment',
      'Implementation of Annex A controls (e.g., access control, cryptography)',
      'Performance evaluation and monitoring',
      'Continuous improvement and corrective actions'
    ],
    penalties: 'ISO 27001 is a voluntary standard, so there are no legal fines for non-compliance. However, failing an audit means losing certification, which can lead to lost business and contract breaches.',
    howISeeWavesSupports: [
      'ISMS design and implementation',
      'Automated risk assessment workflows',
      'Implementation of Annex A technical controls',
      'Continuous monitoring for audit readiness',
      'Evidence collection for certification audits'
    ]
  },
  {
    id: 'lgpd',
    title: 'LGPD',
    fullName: 'Lei Geral de Proteção de Dados Pessoais',
    authority: 'National Data Protection Authority (ANPD)',
    authorityLink: 'https://www.gov.br/anpd/pt-br',
    year: '2018',
    purpose: 'To protect the fundamental rights of freedom and privacy and the free development of the personality of the natural person in Brazil.',
    definition: 'The LGPD is Brazil\'s comprehensive data protection law, heavily inspired by the GDPR, regulating the processing of personal data of individuals located in Brazil.',
    role: 'It unifies over 40 different Brazilian statutes that previously governed personal data, creating a single, clear regulatory framework.',
    benefits: [
      'Enhanced privacy rights for Brazilian citizens',
      'Legal certainty for companies operating in Brazil',
      'Alignment with global data protection standards',
      'Clear rules for international data transfers',
      'Fostering a secure digital economy'
    ],
    keyRules: [
      'Processing must be based on one of 10 legal bases (including consent)',
      'Respect the 10 principles of data processing (e.g., purpose, necessity)',
      'Appoint a Data Protection Officer (Encarregado)',
      'Report security incidents to the ANPD and data subjects',
      'Ensure security and secrecy of data'
    ],
    whoMustComply: [
      'Organizations processing data within Brazil',
      'Organizations offering goods/services to individuals in Brazil',
      'Organizations processing data collected in Brazil',
      'Both public and private sectors'
    ],
    requirements: [
      'Records of processing activities',
      'Data Protection Impact Assessments (Relatório de Impacto)',
      'Implementation of security, technical, and administrative measures',
      'Mechanisms for data subjects to exercise their rights',
      'Incident response and notification procedures'
    ],
    penalties: 'Fines can reach up to 2% of a private legal entity\'s, group\'s, or conglomerate\'s revenue in Brazil in its last fiscal year, up to a maximum of 50 million reais (approx. $10 million USD) per infraction.',
    howISeeWavesSupports: [
      'Data mapping and classification for Brazilian data',
      'Implementation of technical security measures',
      'Incident detection and ANPD reporting workflows',
      'Data Subject Access Request (DSAR) automation',
      'Encryption and anonymization solutions'
    ]
  },
  {
    id: 'nca-ecc',
    title: 'NCA ECC',
    fullName: 'Essential Cybersecurity Controls',
    authority: 'National Cybersecurity Authority (NCA)',
    authorityLink: 'https://nca.gov.sa/en/legislation?item=144',
    year: '2018',
    purpose: 'To set the minimum cybersecurity requirements for organizations in Saudi Arabia to protect their information assets.',
    definition: 'The ECC-1:2018 comprises 114 cybersecurity sub-controls organized under 29 main controls across five mandatory domains: Cybersecurity Governance, Cybersecurity Defense (covering asset management, identity & access management, and cryptography), Cybersecurity Resilience (incident management and business continuity), Third-Party and Cloud Computing Cybersecurity, and Industrial Control Systems (ICS) Cybersecurity. It anchors a broader NCA framework suite that also includes the Cloud Cybersecurity Controls (CCC-1:2020) and the Telework Cybersecurity Controls (TCC-1:2020).',
    role: 'It acts as the foundational cybersecurity standard in the Kingdom, driving the national cybersecurity strategy and protecting critical assets from cyber threats.',
    benefits: [
      'Protection of national critical infrastructure',
      'Standardized cybersecurity practices across the Kingdom',
      'Improved resilience against cyber attacks',
      'Clear governance and accountability',
      'Alignment with Saudi Vision 2030 digital goals'
    ],
    keyRules: [
      'Establish cybersecurity governance and leadership',
      'Implement robust defense-in-depth architecture',
      'Ensure continuous cybersecurity monitoring',
      'Manage third-party and supply chain risks',
      'Conduct regular cybersecurity training and awareness'
    ],
    whoMustComply: [
      'Government agencies in Saudi Arabia',
      'Critical national infrastructure organizations',
      'Private sector entities owning/operating critical infrastructure',
      'Entities requested by the NCA to comply'
    ],
    requirements: [
      'Cybersecurity Governance (strategy, policies, roles)',
      'Cybersecurity Defense (asset management, IAM, crypto)',
      'Cybersecurity Resilience (incident management, BCM)',
      'Third-Party and Cloud Computing Cybersecurity',
      'Industrial Control Systems (ICS) Cybersecurity (if applicable)'
    ],
    penalties: 'Non-compliance can result in regulatory sanctions, operational restrictions, and significant reputational damage within the Kingdom.',
    howISeeWavesSupports: [
      'ECC compliance gap analysis and remediation',
      'Implementation of defense-in-depth technical controls',
      'Continuous monitoring and SOC services',
      'Third-party risk management solutions',
      'ICS/OT security implementation'
    ]
  },
  {
    id: 'nis2',
    title: 'NIS2',
    fullName: 'Network and Information Security Directive 2',
    authority: 'European Union',
    authorityLink: 'https://digital-strategy.ec.europa.eu/en/policies/nis2-directive',
    year: '2023',
    purpose: 'To achieve a high common level of cybersecurity across the Member States of the European Union.',
    definition: 'NIS2 is an EU-wide legislation that expands the scope of the original NIS Directive, imposing stricter cybersecurity risk management and reporting obligations on a wider range of critical sectors.',
    role: 'It modernizes the EU\'s legal framework for cybersecurity, addressing supply chain security, streamlining reporting obligations, and introducing more stringent supervisory measures.',
    benefits: [
      'Enhanced cybersecurity across critical EU sectors',
      'Improved supply chain security',
      'Harmonized incident reporting across member states',
      'Increased management accountability',
      'Stronger collective response to cyber threats'
    ],
    keyRules: [
      'Implement comprehensive risk management measures',
      'Report significant incidents within 24 hours (early warning)',
      'Ensure management bodies approve and oversee cybersecurity measures',
      'Secure the supply chain and third-party relationships',
      'Use cryptography and encryption effectively'
    ],
    whoMustComply: [
      'Essential entities (energy, transport, banking, health, water, digital infrastructure)',
      'Important entities (postal, waste management, chemicals, food, manufacturing)',
      'Digital providers (search engines, cloud services)',
      'Public administration entities'
    ],
    requirements: [
      'Risk analysis and information system security policies',
      'Incident handling and crisis management',
      'Supply chain security',
      'Basic computer hygiene practices and training',
      'Policies on cryptography and encryption'
    ],
    penalties: 'Fines for essential entities can reach up to €10 million or 2% of total worldwide annual turnover. For important entities, up to €7 million or 1.4% of turnover. Management can also be held personally liable.',
    howISeeWavesSupports: [
      'Risk management framework implementation',
      '24-hour early warning incident reporting automation',
      'Supply chain security assessments',
      'Implementation of advanced cryptography',
      'Management dashboards for cybersecurity oversight'
    ]
  },
  {
    id: 'pci-dss',
    title: 'PCI DSS',
    fullName: 'Payment Card Industry Data Security Standard',
    authority: 'PCI Security Standards Council',
    authorityLink: 'https://www.pcisecuritystandards.org/',
    year: '2004',
    purpose: 'To secure credit and debit card transactions against data theft and fraud.',
    definition: 'PCI DSS is a set of security standards designed to ensure that all companies that accept, process, store, or transmit credit card information maintain a secure environment.',
    role: 'It is the global standard for payment security, protecting cardholder data (CHD) and sensitive authentication data (SAD) across the entire payment ecosystem.',
    benefits: [
      'Prevention of credit card fraud and data breaches',
      'Increased customer confidence in payment systems',
      'Avoidance of costly fines and legal liabilities',
      'Improved overall IT security posture',
      'Global standard recognized by all major card brands'
    ],
    keyRules: [
      'Build and maintain a secure network and systems',
      'Protect cardholder data (encryption at rest and in transit)',
      'Maintain a vulnerability management program',
      'Implement strong access control measures',
      'Regularly monitor and test networks'
    ],
    whoMustComply: [
      'Merchants accepting card payments',
      'Payment processors and gateways',
      'Acquiring banks',
      'Service providers that impact the security of cardholder data'
    ],
    requirements: [
      'Install and maintain network security controls (firewalls)',
      'Do not use vendor-supplied defaults for passwords',
      'Protect stored cardholder data',
      'Encrypt transmission of cardholder data across open networks',
      'Track and monitor all access to network resources and cardholder data'
    ],
    penalties: 'Fines range from $5,000 to $100,000 per month for compliance violations. Additionally, banks may terminate relationships, preventing the business from accepting card payments.',
    howISeeWavesSupports: [
      'Network segmentation and firewall management',
      'Cardholder data encryption and tokenization',
      'Continuous vulnerability scanning and penetration testing',
      'Access control and multi-factor authentication (MFA)',
      'Log monitoring and SIEM integration'
    ]
  },
  {
    id: 'pdpl-saudi-arabia',
    title: 'PDPL Saudi Arabia',
    fullName: 'Personal Data Protection Law',
    authority: 'Saudi Data & AI Authority (SDAIA)',
    authorityLink: 'https://sdaia.gov.sa/',
    year: '2021',
    purpose: 'To protect personal data, ensure privacy, and regulate the collection, processing, and storage of personal data in Saudi Arabia.',
    definition: 'The PDPL is Saudi Arabia\'s first comprehensive national data protection law, establishing strict rules for processing personal data and granting rights to data subjects.',
    role: 'It aligns Saudi Arabia with global data protection standards, fostering trust in the digital economy and supporting the goals of Vision 2030.',
    benefits: [
      'Protection of individual privacy rights in KSA',
      'Clear guidelines for data processing and cross-border transfers',
      'Increased consumer trust in digital services',
      'Standardization of data protection practices',
      'Support for a secure digital economy'
    ],
    keyRules: [
      'Process data lawfully, fairly, and transparently (primarily via consent)',
      'Limit data collection to specific, clear, and legitimate purposes',
      'Ensure data accuracy and relevance',
      'Implement necessary organizational and technical security measures',
      'Notify SDAIA of data breaches within 72 hours'
    ],
    whoMustComply: [
      'Any entity processing personal data within Saudi Arabia',
      'Entities outside KSA processing data of individuals residing in KSA',
      'Both public and private sector organizations'
    ],
    requirements: [
      'Registration with SDAIA (for certain controllers)',
      'Privacy impact assessments',
      'Strict controls on cross-border data transfers',
      'Mechanisms for data subjects to exercise rights (access, correction, destruction)',
      'Maintenance of processing records'
    ],
    penalties: 'Violations can result in imprisonment for up to 2 years and/or fines up to SAR 3 million (approx. $800,000 USD) for unauthorized disclosure of sensitive data. Other violations carry fines up to SAR 5 million.',
    howISeeWavesSupports: [
      'Data discovery and classification for KSA residents',
      'Implementation of technical security controls',
      'Automated breach detection and SDAIA reporting',
      'Data localization and cross-border transfer compliance',
      'Consent management and DSAR fulfillment'
    ]
  },
  {
    id: 'pisf-pakistan-2025',
    title: 'PISF Pakistan 2025',
    fullName: 'Pakistan Information Security Framework 2025',
    authority: 'Ministry of IT & Telecom',
    authorityLink: 'https://moitt.gov.pk/',
    year: '2025',
    purpose: 'To establish a unified, national baseline for information security across public and private sectors in Pakistan.',
    definition: 'PISF 2025 is Pakistan\'s first unified national information security framework, mandated by the Ministry of IT & Telecom, requiring covered entities to adopt a risk-based approach aligned with ISO 27001:2022 and NIST CSF. It prescribes minimum security baselines across governance, asset management, access control, incident management, and business continuity, with sector-specific overlays for telecommunications, financial services, and energy. Compliance is verified through mandatory periodic audits by national cybersecurity authorities designated under the Ministry of IT & Telecom, applying to both government departments and Critical Information Infrastructure (CII) operators.',
    role: 'It serves as the primary standard for organizational cybersecurity in Pakistan, bridging the gap between international standards (like ISO 27001) and local regulatory needs.',
    benefits: [
      'Enhanced national cybersecurity posture',
      'Standardized security controls across industries',
      'Improved protection of citizen data',
      'Clear guidelines for incident response and reporting',
      'Fostering a secure digital ecosystem in Pakistan'
    ],
    keyRules: [
      'Implement a risk-based approach to information security',
      'Establish strong access controls and identity management',
      'Ensure data protection at rest and in transit',
      'Maintain continuous monitoring and logging',
      'Develop and test incident response and business continuity plans'
    ],
    whoMustComply: [
      'Federal and provincial government departments',
      'Critical Information Infrastructure (CII) operators',
      'Telecommunication companies',
      'Financial institutions and IT service providers'
    ],
    requirements: [
      'Information Security Governance',
      'Asset Management and Classification',
      'Vulnerability and Patch Management',
      'Network and Endpoint Security',
      'Security Awareness and Training'
    ],
    penalties: 'Non-compliance can lead to regulatory actions, operational restrictions, and mandatory audits by national cybersecurity authorities.',
    howISeeWavesSupports: [
      'PISF 2025 gap analysis and compliance roadmap',
      'Implementation of localized security controls',
      'Continuous monitoring and threat detection',
      'Incident response planning and execution',
      'Security awareness training for employees'
    ]
  },
  {
    id: 'sama',
    title: 'SAMA',
    fullName: 'SAMA Cyber Security Framework',
    authority: 'Saudi Central Bank (SAMA)',
    authorityLink: 'https://www.sama.gov.sa/',
    year: '2017',
    purpose: 'To ensure that SAMA-regulated entities maintain a robust cybersecurity posture to protect the financial sector of Saudi Arabia.',
    definition: 'The SAMA CSF (Version 1.0, 2017) is structured around four mandatory domains — Cyber Security Leadership and Governance, Cyber Security Risk Management and Compliance, Cyber Security Operations and Technology, and Third-Party Cyber Security — each subdivided into specific subdomains with defined principles, objectives, and numbered control considerations. It employs a six-level maturity model (Level 0–5), requiring all Member Organizations to achieve a minimum of Level 3. Built on NIST CSF, ISO 27001/27002, PCI DSS, BASEL, and ISF standards, it supersedes all prior SAMA cybersecurity circulars and mandates annual compliance self-assessments submitted directly to SAMA.',
    role: 'It is the cornerstone of financial cybersecurity in Saudi Arabia, ensuring the stability and security of the banking, insurance, and financing sectors.',
    benefits: [
      'Protection of the Saudi financial ecosystem',
      'Standardized security practices across financial institutions',
      'Enhanced resilience against targeted financial cyber attacks',
      'Clear governance and board-level accountability',
      'Improved customer trust in financial services'
    ],
    keyRules: [
      'Establish a dedicated cybersecurity function independent of IT',
      'Implement a risk-based cybersecurity strategy',
      'Ensure robust identity and access management (IAM)',
      'Conduct regular penetration testing and vulnerability assessments',
      'Report cyber incidents to SAMA immediately'
    ],
    whoMustComply: [
      'Banks operating in Saudi Arabia',
      'Insurance and reinsurance companies',
      'Financing companies',
      'Credit bureaus and financial market infrastructure'
    ],
    requirements: [
      'Cybersecurity Governance and Leadership',
      'Cybersecurity Risk Management',
      'Cybersecurity Operations and Technology',
      'Third-Party Cybersecurity',
      'Periodic compliance self-assessments and independent audits'
    ],
    penalties: 'Non-compliance can result in severe regulatory sanctions, financial penalties, suspension of licenses, and reputational damage.',
    howISeeWavesSupports: [
      'SAMA CSF compliance assessments and remediation',
      'Implementation of advanced SOC and SIEM capabilities',
      'Third-party risk management for financial supply chains',
      'Automated incident reporting to SAMA',
      'Independent cybersecurity audits and testing'
    ]
  },
  {
    id: 'sebi',
    title: 'SEBI',
    fullName: 'SEBI Cybersecurity and Cyber Resilience Framework',
    authority: 'Securities and Exchange Board of India',
    authorityLink: 'https://www.sebi.gov.in/',
    year: '2015',
    purpose: 'To ensure the cyber resilience of the Indian securities market and protect the integrity of financial data and transactions.',
    definition: 'SEBI\'s Cybersecurity and Cyber Resilience Framework (CSCRF), issued August 20, 2024, supersedes all prior SEBI cybersecurity circulars. It adopts five cyber resiliency goals from CERT-In\'s CCMP — Anticipate, Withstand, Contain, Recover, and Evolve — mapped to six NIST CSF-aligned cybersecurity functions: Governance, Identify, Protect, Detect, Respond, and Recover. All regulated entities are classified into five tiers (Market Infrastructure Institutions, Qualified REs, Mid-size REs, Small REs, and Self-Certification REs), with mandatory ISO 27001 certification, SOC establishment, Cyber Capability Index (CCI) assessments, and CERT-In audit obligations scaled proportionally to each tier\'s systemic risk.',
    role: 'It protects the Indian capital markets from cyber threats, ensuring continuous availability of trading platforms and safeguarding investor data.',
    benefits: [
      'Protection of investor data and financial assets',
      'High availability and resilience of trading systems',
      'Standardized security across market participants',
      'Rapid response to cyber incidents',
      'Maintained trust in the Indian capital markets'
    ],
    keyRules: [
      'Implement a comprehensive Cyber Security and Cyber Resilience policy',
      'Identify and classify critical assets',
      'Deploy strong access controls and multi-factor authentication',
      'Conduct regular Vulnerability Assessment and Penetration Testing (VAPT)',
      'Report cyber attacks and breaches to SEBI within 6 hours'
    ],
    whoMustComply: [
      'Stock Brokers and Depository Participants',
      'Mutual Funds and Asset Management Companies',
      'Stock Exchanges and Clearing Corporations',
      'KYC Registration Agencies (KRAs)'
    ],
    requirements: [
      'Governance structure with a designated CISO',
      'Network segmentation and perimeter security',
      'Endpoint security and data loss prevention (DLP)',
      'Comprehensive incident response and recovery plans',
      'Periodic comprehensive cybersecurity audits'
    ],
    penalties: 'Non-compliance can lead to regulatory action, financial penalties, suspension of trading terminals, and cancellation of registration.',
    howISeeWavesSupports: [
      'Implementation of SEBI-mandated security controls',
      'Continuous VAPT and vulnerability management',
      'Automated 6-hour incident reporting workflows',
      'Data Loss Prevention (DLP) and endpoint security',
      'Preparation for SEBI cybersecurity audits'
    ]
  },
  {
    id: 'ncsp-2021-pakistan',
    title: 'NCSP Pakistan',
    fullName: 'National Cyber Security Policy 2021',
    authority: 'Government of Pakistan',
    authorityLink: 'https://moitt.gov.pk/',
    year: '2021',
    purpose: 'To secure Pakistan\'s cyberspace, protect critical information infrastructure, and foster a robust digital economy.',
    definition: 'The NCSP 2021 is Pakistan\'s first-ever national cybersecurity policy, organized around 10 focus areas: institutional framework, protection and information sharing, infrastructure security, audit and compliance, ICT product integrity screening, trust in digital transitions, capacity building, indigenization and R&D, cybercrime prevention, and international collaboration. It mandates a three-tier CERT ecosystem — National (nCERT, under NTISB), Sectoral (covering Defense, Telecom, Banking, Power, and Government), and Organizational — governed by a Cyber Governance Policy Committee (CGPC) responsible for drafting a new Cybersecurity Act and sector-specific security standards.',
    role: 'It provides the strategic direction for all cybersecurity initiatives in the country, mandating the creation of a national response framework and sector-specific CERTs.',
    benefits: [
      'Unified national approach to cybersecurity',
      'Protection of Critical Information Infrastructure (CII)',
      'Development of local cybersecurity expertise and industry',
      'Enhanced national resilience against cyber warfare',
      'Improved public-private partnerships in cybersecurity'
    ],
    keyRules: [
      'Establishment of a Cyber Governance structure (Cyber Security Evaluation Committee)',
      'Mandatory security audits for government and CII entities',
      'Data localization for critical and sensitive data',
      'Development of Sectoral Computer Emergency Response Teams (CERTs)',
      'Promotion of indigenous cybersecurity solutions'
    ],
    whoMustComply: [
      'Federal and Provincial Governments',
      'Critical Information Infrastructure (CII) operators',
      'Telecom and Internet Service Providers',
      'Financial institutions and energy sector'
    ],
    requirements: [
      'Implementation of baseline security standards',
      'Integration with national and sectoral CERTs',
      'Compliance with data localization directives',
      'Regular cybersecurity capacity building and training',
      'Incident reporting to relevant authorities'
    ],
    penalties: 'While a policy document rather than a penal law, non-compliance by government entities or CII operators leads to administrative actions, loss of operating licenses, and intervention by national security agencies.',
    howISeeWavesSupports: [
      'Alignment of organizational strategy with NCSP 2021',
      'Critical Information Infrastructure (CII) protection implementation',
      'Data localization and secure sovereign cloud architecture',
      'Integration with sectoral CERTs and automated reporting',
      'Indigenous cybersecurity capacity building and training'
    ]
  }
];
R13FILEEOF_15

mkdir -p "$(dirname "src/data/newsData.ts")"
cat > "src/data/newsData.ts" << 'R13FILEEOF_16'
export interface ReportItem {
  title: string;
  date: string;
  type: string;
  desc: string;
  report: string;
}

export const allReports: ReportItem[] = [
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
];
R13FILEEOF_16

mkdir -p "$(dirname "src/data/servicesData.ts")"
cat > "src/data/servicesData.ts" << 'R13FILEEOF_17'
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
R13FILEEOF_17

mkdir -p "$(dirname "src/data/trainingData.ts")"
cat > "src/data/trainingData.ts" << 'R13FILEEOF_18'
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
R13FILEEOF_18

mkdir -p "$(dirname "src/hooks/useSubmitForm.ts")"
cat > "src/hooks/useSubmitForm.ts" << 'R13FILEEOF_19'
import { useState, useCallback } from 'react';
import type { FormEvent } from 'react';
import { submitForm } from '../lib/submitForm';

export type SubmitStatus = 'idle' | 'sending' | 'success' | 'error';

export function useSubmitForm(extraFields?: Record<string, string>) {
  const [status, setStatus] = useState<SubmitStatus>('idle');

  const handleSubmit = useCallback(
    async (e: FormEvent<HTMLFormElement>) => {
      e.preventDefault();
      const form = e.currentTarget;
      setStatus('sending');
      const data = Object.fromEntries(new FormData(form).entries()) as Record<string, string>;
      const ok = await submitForm({ ...data, ...extraFields });
      if (ok) {
        setStatus('success');
        form.reset();
        setTimeout(() => setStatus('idle'), 5000);
      } else {
        setStatus('error');
      }
    },
    [extraFields]
  );

  return { status, handleSubmit };
}
R13FILEEOF_19

mkdir -p "$(dirname "src/index.css")"
cat > "src/index.css" << 'R13FILEEOF_20'
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap');
@import "tailwindcss";

@theme {
  --font-sans: "Inter", ui-sans-serif, system-ui, sans-serif;
  --font-mono: "JetBrains Mono", ui-monospace, SFMono-Regular, monospace;

  --color-teal-50: #e6faf8;
  --color-teal-100: #ccf4f0;
  --color-teal-200: #99e9e1;
  --color-teal-300: #66ddd2;
  --color-teal-400: #33d2c3;
  --color-teal-500: #00B3A6;
  --color-teal-600: #009488;
  --color-teal-700: #00756c;
  --color-teal-800: #005650;
  --color-teal-900: #003733;

  --color-navy-50: #e8ecf1;
  --color-navy-100: #c4cede;
  --color-navy-200: #93a3bd;
  --color-navy-300: #5f7594;
  --color-navy-400: #2c4a71;
  --color-navy-500: #0B2545;
  --color-navy-600: #091d38;
  --color-navy-700: #07152a;
  --color-navy-800: #040e1c;
  --color-navy-900: #02070e;

  --color-electric-50: #e6faf3;
  --color-electric-100: #ccf5e6;
  --color-electric-400: #33cea6;
  --color-electric-500: #00C08B;
  --color-electric-600: #009d72;

  --color-charcoal-50: #eef0f4;
  --color-charcoal-100: #d3d8e2;
  --color-charcoal-300: #8993ac;
  --color-charcoal-400: #5c6786;
  --color-charcoal-500: #2E3A59;
  --color-charcoal-600: #252e47;
  --color-charcoal-700: #1c2335;
}

body {
  background-color: #F6F8FB;
  color: #2E3A59;
  overflow-x: hidden;
  font-family: var(--font-sans);
}

.glass-panel {
  background: rgba(255, 255, 255, 0.75);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  border: 1px solid rgba(11, 37, 69, 0.08);
  box-shadow: 0 8px 32px 0 rgba(11, 37, 69, 0.08);
}

.glass-card {
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.95), rgba(255, 255, 255, 0.8));
  backdrop-filter: blur(16px);
  -webkit-backdrop-filter: blur(16px);
  border: 1px solid rgba(11, 37, 69, 0.08);
  border-top: 1px solid rgba(11, 37, 69, 0.12);
  border-left: 1px solid rgba(11, 37, 69, 0.12);
  box-shadow: 0 8px 32px 0 rgba(11, 37, 69, 0.06);
  transition: transform 0.3s ease, background 0.3s ease, border 0.3s ease, box-shadow 0.3s ease;
}

.glass-card:hover {
  background: linear-gradient(135deg, rgba(255, 255, 255, 1), rgba(255, 255, 255, 0.9));
  border: 1px solid rgba(0, 179, 166, 0.25);
  border-top: 1px solid rgba(0, 179, 166, 0.35);
  border-left: 1px solid rgba(0, 179, 166, 0.35);
  transform: translateY(-5px);
  box-shadow: 0 12px 40px 0 rgba(11, 37, 69, 0.1);
}

.glass-button {
  background: linear-gradient(135deg, rgba(11, 37, 69, 0.06), rgba(11, 37, 69, 0.02));
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
  border: 1px solid rgba(11, 37, 69, 0.1);
  border-top: 1px solid rgba(11, 37, 69, 0.15);
  box-shadow: 0 4px 15px rgba(11, 37, 69, 0.05), inset 0 1px 0 rgba(255, 255, 255, 0.5);
  transition: all 0.3s ease;
}

.glass-button:hover {
  background: linear-gradient(135deg, rgba(11, 37, 69, 0.1), rgba(11, 37, 69, 0.04));
  box-shadow: 0 6px 20px rgba(11, 37, 69, 0.08), inset 0 1px 0 rgba(255, 255, 255, 0.6);
  transform: translateY(-2px);
}

.glass-button:active {
  transform: translateY(1px);
  box-shadow: 0 2px 10px rgba(11, 37, 69, 0.08), inset 0 2px 5px rgba(11, 37, 69, 0.05);
}

.glass-icon {
  background: linear-gradient(135deg, rgba(0, 179, 166, 0.12), rgba(0, 179, 166, 0.04));
  backdrop-filter: blur(10px);
  border: 1px solid rgba(0, 179, 166, 0.15);
  border-top: 1px solid rgba(0, 179, 166, 0.25);
  box-shadow: 0 4px 15px rgba(11, 37, 69, 0.05);
}

.bg-gradient-radial {
  background-image: radial-gradient(circle at center, var(--tw-gradient-stops));
}

@keyframes marquee {
  0% { transform: translateX(0); }
  100% { transform: translateX(-50%); }
}

.animate-marquee {
  animation: marquee 20s linear infinite;
  width: max-content;
}

.animate-marquee:hover {
  animation-play-state: paused;
}

/* Custom Scrollbar */
::-webkit-scrollbar {
  width: 8px;
}
::-webkit-scrollbar-track {
  background: #050505;
}
::-webkit-scrollbar-thumb {
  background: rgba(255, 255, 255, 0.2);
  border-radius: 4px;
}
::-webkit-scrollbar-thumb:hover {
  background: rgba(255, 255, 255, 0.4);
}
R13FILEEOF_20

mkdir -p "$(dirname "src/lib/submitForm.ts")"
cat > "src/lib/submitForm.ts" << 'R13FILEEOF_21'
// All site forms submit through this single function instead of using mailto:,
// so submitting never opens the visitor's email app and never requires them
// to manually hit "send" - it happens automatically and silently.
//
// This uses EmailJS (https://www.emailjs.com), a free email-sending API that
// works entirely from the browser - no server to build, host, or run.
// Connected to info@iseewaves.pk via Custom SMTP (StackMail). The public key
// below is meant to be embedded in frontend code - that's how EmailJS is
// designed to work, unlike an SMTP password, which should never be exposed.

const EMAILJS_SERVICE_ID = 'service_02hshiz';
const EMAILJS_TEMPLATE_ID = 'template_krdd38g';
const EMAILJS_PUBLIC_KEY = 'FarJBgNzPecdA-FZ5';

const EMAILJS_ENDPOINT = 'https://api.emailjs.com/api/v1.0/email/send';

export async function submitForm(data: Record<string, string>): Promise<boolean> {
  try {
    const res = await fetch(EMAILJS_ENDPOINT, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        service_id: EMAILJS_SERVICE_ID,
        template_id: EMAILJS_TEMPLATE_ID,
        user_id: EMAILJS_PUBLIC_KEY,
        template_params: data,
      }),
    });
    return res.ok;
  } catch (err) {
    console.error('Form submission failed:', err);
    return false;
  }
}
R13FILEEOF_21

mkdir -p "$(dirname "src/main.tsx")"
cat > "src/main.tsx" << 'R13FILEEOF_22'
import {StrictMode} from 'react';
import {createRoot} from 'react-dom/client';
import App from './App.tsx';
import './index.css';

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <App />
  </StrictMode>,
);
R13FILEEOF_22

mkdir -p "$(dirname "src/pages/AboutPage.tsx")"
cat > "src/pages/AboutPage.tsx" << 'R13FILEEOF_23'
import { ArrowLeft } from 'lucide-react';
import { Link } from 'react-router-dom';
import AboutContent from '../components/AboutContent';

export default function AboutPage() {
  return (
    <div className="pt-24">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-8">
        <Link to="/" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
          <ArrowLeft className="w-4 h-4" />
          <span>Back to Home</span>
        </Link>
      </div>
      <AboutContent />
    </div>
  );
}
R13FILEEOF_23

mkdir -p "$(dirname "src/pages/AllReportsPage.tsx")"
cat > "src/pages/AllReportsPage.tsx" << 'R13FILEEOF_24'
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
          <Link to="/" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <div className="text-center mb-16">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-full glass-card border-teal-500/30 text-teal-400 text-sm font-medium mb-6"
          >
            <FileText className="w-4 h-4" />
            <span>Research & Reports</span>
          </motion.div>
          <motion.h1
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.1 }}
            className="text-4xl md:text-6xl font-bold text-[#0B2545] mb-6"
          >
            All <span className="text-teal-400">Reports</span>
          </motion.h1>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.2 }}
            className="text-lg text-gray-600 max-w-2xl mx-auto"
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
              className="glass-card p-6 rounded-2xl group hover:border-teal-500/50 transition-colors"
            >
              <div className="flex justify-between items-start mb-3">
                <span className="text-xs font-mono text-teal-400 bg-teal-400/10 px-2 py-1 rounded-full">
                  {report.type}
                </span>
                <span className="text-sm text-gray-600">{report.date}</span>
              </div>
              <h4 className="text-xl font-bold text-[#0B2545] mb-2 group-hover:text-teal-400 transition-colors">
                {report.title}
              </h4>
              <p className="text-gray-600 mb-4">{report.desc}</p>
              <a href={report.report} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-2 text-teal-400 hover:text-teal-300 font-medium text-sm">
                Read Full Report <ExternalLink className="w-4 h-4" />
              </a>
            </motion.div>
          ))}
        </div>
      </div>
    </div>
  );
}
R13FILEEOF_24

mkdir -p "$(dirname "src/pages/CareersPage.tsx")"
cat > "src/pages/CareersPage.tsx" << 'R13FILEEOF_25'
import { motion } from 'motion/react';
import { ArrowLeft, Send, Briefcase, Loader2 } from 'lucide-react';
import { Link } from 'react-router-dom';
import { useSubmitForm } from '../hooks/useSubmitForm';
import FormToast from '../components/FormToast';

export default function CareersPage() {
  const { status, handleSubmit } = useSubmitForm({ subject: 'Career Application' });

  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="text-center mb-14">
          <div className="w-14 h-14 rounded-xl bg-blue-400/10 flex items-center justify-center mx-auto mb-6">
            <Briefcase className="w-7 h-7 text-blue-400" />
          </div>
          <span className="text-blue-400 text-sm font-bold tracking-widest uppercase">Careers</span>
          <h1 className="text-3xl md:text-5xl font-bold text-[#0B2545] mt-4 mb-4">Join the Team</h1>
          <p className="text-lg text-gray-600 max-w-xl mx-auto">
            We're always looking for people who care about doing security work properly. Tell us about yourself.
          </p>
        </motion.div>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.1 }}
          className="glass-card p-8 md:p-12 rounded-3xl"
        >
          <form onSubmit={handleSubmit} className="space-y-6">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Full Name</label>
                <input
                  type="text"
                  name="name"
                  required
                  className="w-full bg-white border border-gray-200 rounded-xl px-4 py-3 text-[#0B2545] focus:outline-none focus:border-teal-500 transition-colors"
                  placeholder="John Doe"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Email Address</label>
                <input
                  type="email"
                  name="email"
                  required
                  className="w-full bg-white border border-gray-200 rounded-xl px-4 py-3 text-[#0B2545] focus:outline-none focus:border-teal-500 transition-colors"
                  placeholder="john@example.com"
                />
              </div>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Position Applied For</label>
              <select
                name="position"
                className="w-full bg-white border border-gray-200 rounded-xl px-4 py-3 text-[#0B2545] focus:outline-none focus:border-teal-500 transition-colors"
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
              <label className="block text-sm font-medium text-gray-700 mb-2">LinkedIn / Portfolio (optional)</label>
              <input
                type="text"
                name="portfolio"
                className="w-full bg-white border border-gray-200 rounded-xl px-4 py-3 text-[#0B2545] focus:outline-none focus:border-teal-500 transition-colors"
                placeholder="https://"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Cover Letter / Experience</label>
              <textarea
                name="message"
                required
                rows={6}
                className="w-full bg-white border border-gray-200 rounded-xl px-4 py-3 text-[#0B2545] focus:outline-none focus:border-teal-500 transition-colors resize-none"
                placeholder="Tell us about yourself and why you'd be a good fit..."
              ></textarea>
            </div>

            <button
              type="submit"
              disabled={status === 'sending'}
              className="w-full flex items-center justify-center gap-2 py-4 rounded-xl font-bold text-white bg-blue-500 hover:bg-blue-600 transition-all hover:scale-[1.02] disabled:opacity-60 disabled:hover:scale-100"
            >
              {status === 'sending' ? <Loader2 className="w-5 h-5 animate-spin" /> : <Send className="w-5 h-5" />}
              {status === 'sending' ? 'Sending...' : 'Submit Application'}
            </button>
          </form>
        </motion.div>
      </div>
      <FormToast status={status} />
    </div>
  );
}
R13FILEEOF_25

mkdir -p "$(dirname "src/pages/CompliancePage.tsx")"
cat > "src/pages/CompliancePage.tsx" << 'R13FILEEOF_26'
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
                className={`inline-flex items-center gap-2 px-4 py-2 rounded-full glass-card border-teal-500/30 text-teal-400 text-sm font-medium mb-6 ${!showForm && 'mx-auto'}`}
              >
                <Shield className="w-4 h-4" />
                <span>Compliance Framework</span>
              </motion.div>
              
              <motion.h1
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: 0.1 }}
                className="text-5xl md:text-7xl font-bold text-[#0B2545] mb-6"
              >
                {compliance.title}
              </motion.h1>
              
              <motion.div
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: 0.2 }}
                className="text-xl text-gray-700 mb-8"
              >
                <p className="font-semibold text-teal-400 mb-2">{compliance.fullName}</p>
                <p className="text-base text-gray-600">
                  Established by <a href={compliance.authorityLink} target="_blank" rel="noopener noreferrer" className="text-blue-400 hover:underline inline-flex items-center gap-1">{compliance.authority} <ExternalLink className="w-3 h-3" /></a> in {compliance.year}.
                </p>
                <p className="text-base text-gray-600 mt-2">{compliance.purpose}</p>
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
                    className="flex items-center justify-center gap-2 px-8 py-4 rounded-full bg-teal-500 text-white font-semibold hover:bg-teal-600 transition-all hover:scale-105"
                  >
                    Free Trial
                  </button>
                )}
                <Link
                  to="/contact"
                  className="flex items-center justify-center gap-2 px-8 py-4 rounded-full glass-card text-[#0B2545] font-semibold hover:bg-gray-100 transition-all hover:scale-105"
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
                  <div className="glass-card p-8 rounded-3xl border-teal-500/30 relative">
                    <button 
                      onClick={() => setShowForm(false)}
                      className="absolute top-4 right-4 text-gray-600 hover:text-[#0B2545] transition-colors"
                    >
                      <X className="w-5 h-5" />
                    </button>
                    <h3 className="text-2xl font-bold text-[#0B2545] mb-2">Try iSeeWaves Services</h3>
                    <p className="text-gray-600 text-sm mb-6">Start your free trial today for {compliance.title} compliance.</p>
                    
                    <form onSubmit={handleSubmit} className="space-y-4">
                      <div className="grid grid-cols-2 gap-4">
                        <div>
                          <label className="block text-sm font-medium text-gray-700 mb-1">First Name *</label>
                          <input required type="text" name="firstName" value={formData.firstName} onChange={handleInputChange} className="w-full bg-white border border-gray-200 rounded-lg px-4 py-2 text-[#0B2545] focus:outline-none focus:border-teal-500 transition-colors" />
                        </div>
                        <div>
                          <label className="block text-sm font-medium text-gray-700 mb-1">Last Name *</label>
                          <input required type="text" name="lastName" value={formData.lastName} onChange={handleInputChange} className="w-full bg-white border border-gray-200 rounded-lg px-4 py-2 text-[#0B2545] focus:outline-none focus:border-teal-500 transition-colors" />
                        </div>
                      </div>
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-1">Email Address *</label>
                        <input required type="email" name="email" value={formData.email} onChange={handleInputChange} className="w-full bg-white border border-gray-200 rounded-lg px-4 py-2 text-[#0B2545] focus:outline-none focus:border-teal-500 transition-colors" />
                      </div>
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-1">Company *</label>
                        <input required type="text" name="company" value={formData.company} onChange={handleInputChange} className="w-full bg-white border border-gray-200 rounded-lg px-4 py-2 text-[#0B2545] focus:outline-none focus:border-teal-500 transition-colors" />
                      </div>
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-1">Location</label>
                        <input type="text" name="location" value={formData.location} onChange={handleInputChange} className="w-full bg-white border border-gray-200 rounded-lg px-4 py-2 text-[#0B2545] focus:outline-none focus:border-teal-500 transition-colors" />
                      </div>
                      <button type="submit" className="w-full py-3 px-4 bg-teal-500 hover:bg-teal-600 text-white font-bold rounded-lg transition-colors mt-4">
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
              <h3 className="text-2xl font-bold text-[#0B2545] mb-4">What is {compliance.title}?</h3>
              <p className="text-gray-600 leading-relaxed">{compliance.definition}</p>
            </div>
            <div className="glass-card p-8 rounded-3xl">
              <h3 className="text-2xl font-bold text-[#0B2545] mb-4">Role & Importance</h3>
              <p className="text-gray-600 leading-relaxed">{compliance.role}</p>
            </div>
          </div>

          {/* Benefits & Key Rules */}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            <div className="glass-card p-8 rounded-3xl border-teal-500/20">
              <h3 className="text-2xl font-bold text-[#0B2545] mb-6">Key Benefits</h3>
              <ul className="space-y-4">
                {compliance.benefits.map((item, idx) => (
                  <li key={idx} className="flex items-start gap-3">
                    <CheckCircle className="w-5 h-5 text-teal-400 flex-shrink-0 mt-0.5" />
                    <span className="text-gray-700">{item}</span>
                  </li>
                ))}
              </ul>
            </div>
            <div className="glass-card p-8 rounded-3xl border-blue-500/20">
              <h3 className="text-2xl font-bold text-[#0B2545] mb-6">Key Rules</h3>
              <ul className="space-y-4">
                {compliance.keyRules.map((item, idx) => (
                  <li key={idx} className="flex items-start gap-3">
                    <ArrowRight className="w-5 h-5 text-blue-400 flex-shrink-0 mt-0.5" />
                    <span className="text-gray-700">{item}</span>
                  </li>
                ))}
              </ul>
            </div>
          </div>

          {/* Who Must Comply & Requirements */}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            <div className="glass-card p-8 rounded-3xl">
              <h3 className="text-2xl font-bold text-[#0B2545] mb-6">Who Must Comply?</h3>
              <ul className="space-y-4">
                {compliance.whoMustComply.map((item, idx) => (
                  <li key={idx} className="flex items-center gap-3">
                    <div className="w-2 h-2 rounded-full bg-gray-500" />
                    <span className="text-gray-700">{item}</span>
                  </li>
                ))}
              </ul>
            </div>
            <div className="glass-card p-8 rounded-3xl">
              <h3 className="text-2xl font-bold text-[#0B2545] mb-6">Compliance Requirements</h3>
              <ul className="space-y-4">
                {compliance.requirements.map((item, idx) => (
                  <li key={idx} className="flex items-center gap-3">
                    <div className="w-2 h-2 rounded-full bg-gray-500" />
                    <span className="text-gray-700">{item}</span>
                  </li>
                ))}
              </ul>
            </div>
          </div>

          {/* Penalties */}
          <div className="glass-card p-8 rounded-3xl border-red-500/30 bg-red-500/5">
            <div className="flex items-center gap-3 mb-4">
              <AlertTriangle className="w-8 h-8 text-red-400" />
              <h3 className="text-2xl font-bold text-[#0B2545]">Penalties for Non-Compliance</h3>
            </div>
            <p className="text-gray-700 leading-relaxed">{compliance.penalties}</p>
          </div>

          {/* How iSeeWaves Supports */}
          <div className="glass-card p-10 rounded-3xl border-teal-500/40 relative overflow-hidden">
            <div className="absolute top-0 right-0 w-64 h-64 bg-teal-500/10 rounded-full mix-blend-screen filter blur-[50px]" />
            <h3 className="text-3xl font-bold text-[#0B2545] mb-8 relative z-10">How iSeeWaves Supports {compliance.title} Compliance</h3>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6 relative z-10">
              {compliance.howISeeWavesSupports.map((item, idx) => (
                <div key={idx} className="flex items-start gap-4 bg-navy-500/5 p-4 rounded-xl">
                  <Shield className="w-6 h-6 text-teal-400 flex-shrink-0" />
                  <span className="text-gray-200 font-medium">{item}</span>
                </div>
              ))}
            </div>
          </div>

          {/* CTA */}
          <div className="text-center pt-8">
            <h3 className="text-3xl font-bold text-[#0B2545] mb-6">Stay Compliant with {compliance.title}</h3>
            <p className="text-gray-600 mb-8 max-w-2xl mx-auto">Don't let compliance complexities slow down your business. Partner with iSeeWaves to ensure continuous adherence and robust security.</p>
            <button
              onClick={() => {
                window.scrollTo({ top: 0, behavior: 'smooth' });
                setShowForm(true);
              }}
              className="inline-flex items-center gap-2 px-8 py-4 rounded-full bg-teal-500 text-white font-semibold hover:bg-teal-600 transition-all hover:scale-105"
            >
              Start Free Trial Now
            </button>
          </div>

        </motion.div>
      </div>
    </div>
  );
}
R13FILEEOF_26

mkdir -p "$(dirname "src/pages/ContactPage.tsx")"
cat > "src/pages/ContactPage.tsx" << 'R13FILEEOF_27'
import { ArrowLeft } from 'lucide-react';
import { Link } from 'react-router-dom';
import ContactHiring from '../components/ContactHiring';

export default function ContactPage() {
  return (
    <div className="pt-24">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-8">
        <Link to="/" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
          <ArrowLeft className="w-4 h-4" />
          <span>Back to Home</span>
        </Link>
      </div>
      <ContactHiring />
    </div>
  );
}
R13FILEEOF_27

mkdir -p "$(dirname "src/pages/CookiePolicyPage.tsx")"
cat > "src/pages/CookiePolicyPage.tsx" << 'R13FILEEOF_28'
import { motion } from 'motion/react';
import { Shield } from 'lucide-react';

export default function CookiePolicyPage() {
  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-16">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-full glass-card border-teal-500/30 text-teal-400 text-sm font-medium mb-6"
          >
            <Shield className="w-4 h-4" />
            <span>Cookie Policy</span>
          </motion.div>
          <motion.h1
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.1 }}
            className="text-4xl md:text-6xl font-bold text-[#0B2545] mb-6"
          >
            Cookie <span className="text-teal-400">Policy</span>
          </motion.h1>
          <p className="text-gray-600">Last updated: February 24, 2026</p>
        </div>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.2 }}
          className="glass-card p-8 md:p-12 rounded-3xl prose prose-invert prose-teal max-w-none"
        >
          <h2>1. What Are Cookies</h2>
          <p>
            As is common practice with almost all professional websites, this site uses cookies, which are tiny files that are downloaded to your computer, to improve your experience. This page describes what information they gather, how we use it and why we sometimes need to store these cookies. We will also share how you can prevent these cookies from being stored however this may downgrade or 'break' certain elements of the sites functionality.
          </p>

          <h2>2. How We Use Cookies</h2>
          <p>
            We use cookies for a variety of reasons detailed below. Unfortunately, in most cases, there are no industry standard options for disabling cookies without completely disabling the functionality and features they add to this site. It is recommended that you leave on all cookies if you are not sure whether you need them or not in case they are used to provide a service that you use.
          </p>

          <h2>3. Disabling Cookies</h2>
          <p>
            You can prevent the setting of cookies by adjusting the settings on your browser (see your browser Help for how to do this). Be aware that disabling cookies will affect the functionality of this and many other websites that you visit. Disabling cookies will usually result in also disabling certain functionality and features of this site. Therefore it is recommended that you do not disable cookies.
          </p>

          <h2>4. The Cookies We Set</h2>
          <h3>Account related cookies</h3>
          <p>
            If you create an account with us then we will use cookies for the management of the signup process and general administration. These cookies will usually be deleted when you log out however in some cases they may remain afterwards to remember your site preferences when logged out.
          </p>

          <h3>Login related cookies</h3>
          <p>
            We use cookies when you are logged in so that we can remember this fact. This prevents you from having to log in every single time you visit a new page. These cookies are typically removed or cleared when you log out to ensure that you can only access restricted features and areas when logged in.
          </p>

          <h3>Site preferences cookies</h3>
          <p>
            In order to provide you with a great experience on this site we provide the functionality to set your preferences for how this site runs when you use it. In order to remember your preferences we need to set cookies so that this information can be called whenever you interact with a page is affected by your preferences.
          </p>

          <h2>5. Third Party Cookies</h2>
          <p>
            In some special cases we also use cookies provided by trusted third parties. The following section details which third party cookies you might encounter through this site.
          </p>
          <ul>
            <li>This site uses Google Analytics which is one of the most widespread and trusted analytics solutions on the web for helping us to understand how you use the site and ways that we can improve your experience. These cookies may track things such as how long you spend on the site and the pages that you visit so we can continue to produce engaging content.</li>
            <li>From time to time we test new features and make subtle changes to the way that the site is delivered. When we are still testing new features these cookies may be used to ensure that you receive a consistent experience whilst on the site whilst ensuring we understand which optimisations our users appreciate the most.</li>
          </ul>

          <h2>6. More Information</h2>
          <p>
            Hopefully that has clarified things for you and as was previously mentioned if there is something that you aren't sure whether you need or not it's usually safer to leave cookies enabled in case it does interact with one of the features you use on our site.
          </p>
          <p>
            For more information, please contact us at: cookies@iseewaves.com
          </p>
        </motion.div>
      </div>
    </div>
  );
}
R13FILEEOF_28

mkdir -p "$(dirname "src/pages/DemoPage.tsx")"
cat > "src/pages/DemoPage.tsx" << 'R13FILEEOF_29'
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
          <Link to="/#product" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Product</span>
          </Link>
        </div>

        <div className="text-center mb-16">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-full glass-card border-teal-500/30 text-teal-400 text-sm font-medium mb-6"
          >
            <Shield className="w-4 h-4" />
            <span>MyESI Platform</span>
          </motion.div>
          <motion.h1
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.1 }}
            className="text-4xl md:text-6xl font-bold text-[#0B2545] mb-6"
          >
            Watch <span className="text-teal-400">Demo</span>
          </motion.h1>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.2 }}
            className="text-lg text-gray-600 max-w-2xl mx-auto"
          >
            See how MyESI secures your code by uncovering hidden vulnerabilities in modules, third-party frameworks, and APIs.
          </motion.p>
        </div>

        <motion.div
          initial={{ opacity: 0, scale: 0.95 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ delay: 0.3 }}
          className="glass-card rounded-3xl overflow-hidden border-teal-500/30 relative aspect-video w-full flex items-center justify-center group cursor-pointer"
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
              <div className="absolute inset-0 bg-gradient-to-br from-teal-900/20 to-black/80 z-10" />
              <div className="relative z-20 flex flex-col items-center">
                <div className="w-20 h-20 rounded-full bg-teal-500/20 backdrop-blur-md flex items-center justify-center mb-4 group-hover:scale-110 group-hover:bg-teal-500/40 transition-all duration-300 border border-teal-400/30">
                  <Play className="w-8 h-8 text-teal-400 ml-1" />
                </div>
                <p className="text-[#0B2545] font-medium tracking-wide">Click to Play Video</p>
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
          <div className="glass-card p-6 rounded-2xl border-gray-100">
            <h3 className="text-xl font-bold text-[#0B2545] mb-3">Line-by-Line Validation</h3>
            <p className="text-gray-600 text-sm">Watch how MyESI validates the SSDLC process line-by-line, going beyond simple library checks.</p>
          </div>
          <div className="glass-card p-6 rounded-2xl border-gray-100">
            <h3 className="text-xl font-bold text-[#0B2545] mb-3">Real-time Heatmaps</h3>
            <p className="text-gray-600 text-sm">See the automated evidence collection for SBP or PCI-DSS audits in action.</p>
          </div>
          <div className="glass-card p-6 rounded-2xl border-gray-100">
            <h3 className="text-xl font-bold text-[#0B2545] mb-3">SBOM Generation</h3>
            <p className="text-gray-600 text-sm">Learn how to generate verifiable SBOMs and security attestations with a single click.</p>
          </div>
        </motion.div>
      </div>
    </div>
  );
}
R13FILEEOF_29

mkdir -p "$(dirname "src/pages/FeaturesPage.tsx")"
cat > "src/pages/FeaturesPage.tsx" << 'R13FILEEOF_30'
import { Navigate } from 'react-router-dom';

export default function FeaturesPage() {
  return <Navigate to="/myesi#features" replace />;
}
R13FILEEOF_30

mkdir -p "$(dirname "src/pages/LegalPage.tsx")"
cat > "src/pages/LegalPage.tsx" << 'R13FILEEOF_31'
import { motion } from 'motion/react';
import { Shield } from 'lucide-react';

export default function LegalPage() {
  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-16">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-full glass-card border-teal-500/30 text-teal-400 text-sm font-medium mb-6"
          >
            <Shield className="w-4 h-4" />
            <span>Legal Information</span>
          </motion.div>
          <motion.h1
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.1 }}
            className="text-4xl md:text-6xl font-bold text-[#0B2545] mb-6"
          >
            Legal <span className="text-teal-400">Notice</span>
          </motion.h1>
        </div>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.2 }}
          className="glass-card p-8 md:p-12 rounded-3xl prose prose-invert prose-teal max-w-none"
        >
          <h2>Company Information</h2>
          <p>
            iSeeWaves is a registered cybersecurity firm dedicated to providing enterprise-grade security solutions.
          </p>
          
          <h3>Registered Office</h3>
          <p>
            123 Security Boulevard<br />
            Cyber City, CC 10101<br />
            United States
          </p>

          <h3>Contact Details</h3>
          <p>
            Email: legal@iseewaves.com<br />
            Phone: +1 (555) 012-3456
          </p>

          <h2>Intellectual Property</h2>
          <p>
            All content on this website, including but not limited to text, graphics, logos, icons, images, audio clips, digital downloads, data compilations, and software, is the property of iSeeWaves or its content suppliers and protected by international copyright laws.
          </p>

          <h2>Disclaimer</h2>
          <p>
            The information provided on this website is for general informational purposes only. While we strive to keep the information up to date and correct, we make no representations or warranties of any kind, express or implied, about the completeness, accuracy, reliability, suitability, or availability with respect to the website or the information, products, services, or related graphics contained on the website for any purpose.
          </p>
        </motion.div>
      </div>
    </div>
  );
}
R13FILEEOF_31

mkdir -p "$(dirname "src/pages/MyesiLoginPage.tsx")"
cat > "src/pages/MyesiLoginPage.tsx" << 'R13FILEEOF_32'
import { motion } from 'motion/react';
import { ArrowLeft, LogIn, Loader2, Send } from 'lucide-react';
import { Link } from 'react-router-dom';
import { useSubmitForm } from '../hooks/useSubmitForm';
import FormToast from '../components/FormToast';

export default function MyesiLoginPage() {
  const { status, handleSubmit } = useSubmitForm({ subject: 'Portal Access Request' });

  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10 flex items-center justify-center">
      <div className="max-w-md w-full px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          className="glass-card rounded-2xl border border-gray-200 p-8"
        >
          <div className="w-12 h-12 rounded-xl bg-teal-400/10 flex items-center justify-center mb-6">
            <LogIn className="w-6 h-6 text-teal-400" />
          </div>
          <h1 className="text-2xl font-bold text-[#0B2545] mb-2">Customer Portal Access</h1>
          <p className="text-sm text-gray-600 mb-8">
            Our customer portal is currently invite-based. Enter your email and our team will send you sign-in
            instructions.
          </p>

          {status === 'success' ? (
            <div className="text-teal-500 font-medium text-sm">
              Request sent. We'll email you portal access instructions shortly.
            </div>
          ) : (
            <form onSubmit={handleSubmit} className="space-y-5">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Email Address</label>
                <input required name="email" type="email" className="w-full px-4 py-3 rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
              </div>
              <button
                type="submit"
                disabled={status === 'sending'}
                className="w-full flex items-center justify-center gap-2 px-6 py-3 rounded-full bg-teal-500 hover:bg-teal-600 text-white font-semibold transition-all disabled:opacity-60"
              >
                {status === 'sending' ? 'Sending...' : 'Request Access'}
                {status === 'sending' ? <Loader2 className="w-4 h-4 animate-spin" /> : <Send className="w-4 h-4" />}
              </button>
            </form>
          )}

          <p className="text-sm text-gray-600 mt-6 text-center">
            Don't have an account?{' '}
            <Link to="/#support" className="text-teal-400 hover:underline">Register for a free trial</Link>
          </p>
        </motion.div>
      </div>
      <FormToast status={status} />
    </div>
  );
}
R13FILEEOF_32

mkdir -p "$(dirname "src/pages/PCAPage.tsx")"
cat > "src/pages/PCAPage.tsx" << 'R13FILEEOF_33'
import { useState } from 'react';
import { motion, AnimatePresence } from 'motion/react';
import {
  ArrowLeft,
  Users,
  Calendar,
  BookOpen,
  Handshake,
  ArrowRight,
  MapPin,
  CalendarDays,
  FileText,
  Linkedin,
  Facebook,
  Instagram,
  MessageCircle,
  X,
} from 'lucide-react';
import { Link } from 'react-router-dom';

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
    body: "Collaborations with government bodies, industry leaders, and academic institutions to strengthen Pakistan's cybersecurity ecosystem.",
  },
];

const contributors = [
  { name: 'iSeeWaves', logo: '/images/iSeeWaves.png' },
  { name: 'National Incubation Center for Aerospace Technologies', logo: '/images/nicat.png' },
  { name: 'P@SHA Startup Hub', logo: '/images/pasha-startup-hub.png' },
  { name: 'National CERT', logo: '/images/ncert.png' },
  { name: 'Ignite National Technology Fund', logo: '/images/ignite-logo.png' },
  { name: 'International Islamic University Islamabad', logo: '/images/IIUI-logos-2.jpg' },
];
const loopContributors = [...contributors, ...contributors];

interface Speaker {
  name: string;
  designation: string;
  photo?: string;
}

interface Episode {
  number: number;
  title: string;
  info: string;
  date: string;
  venue: string;
  speakers: Speaker[];
  gallery: string[];
}

const EP1_DIR = '/images/PCA/Threat-Horizon-Pakistan1';
const EP2_DIR = '/images/PCA/Threat-Horizon-Pakistan2';

const episodes: Episode[] = [
  {
    number: 1,
    title: 'Threat Horizon Pakistan - Episode 1',
    info: "The inaugural edition of Threat Horizon Pakistan, bringing together government, industry, and academia to discuss the country's evolving cyber threat landscape.",
    date: 'Details to be published',
    venue: 'Islamabad, Pakistan',
    speakers: [
      { name: 'Abdullah Nasir', designation: 'Founder & CEO, iSeeWaves / Organizer, PCA', photo: `${EP1_DIR}/PCA-Speakers/abdullah_nasir_keynote.jpg` },
      { name: 'Dr. Shah Nazir', designation: 'Speaker', photo: `${EP1_DIR}/PCA-Speakers/dr_shah_nazir.jpg` },
      { name: 'Quratulain Chaudhary', designation: 'Speaker', photo: `${EP1_DIR}/PCA-Speakers/quratulain_chaudhary.jpg` },
      { name: 'Fizza Malik', designation: 'Speaker', photo: `${EP1_DIR}/PCA-Speakers/fizza_malik.jpg` },
      { name: 'Charles Jeremiah', designation: 'Speaker', photo: `${EP1_DIR}/PCA-Speakers/charles_jeremiah.jpg` },
      { name: 'Salman Dar', designation: 'Speaker', photo: `${EP1_DIR}/PCA-Speakers/salman_dar.jpg` },
    ],
    gallery: ['1', '2', '3', '4', '5', '6', '8', '10', '11', '12', '13', '14', '15', '16', '21', '26', '28', '32', '33', '39', '49', '50'].map(
      (n) => `${EP1_DIR}/Event-Pictures/${n}.jpg`
    ).concat([`${EP1_DIR}/Event-Pictures/37.JPG`]),
  },
  {
    number: 2,
    title: 'Threat Horizon Pakistan - Episode 2',
    info: 'The second edition continues the conversation on national cybersecurity readiness, featuring deeper technical sessions and expanded institutional participation.',
    date: 'Details to be published',
    venue: 'Islamabad, Pakistan',
    speakers: [
      { name: 'Abdullah Nasir', designation: 'Founder & CEO, iSeeWaves / Organizer, PCA', photo: `${EP2_DIR}/PCA-Speakers/Abdullah-Nasir.jpg` },
      { name: 'Dr. Sidrah Khan', designation: 'Speaker', photo: `${EP2_DIR}/PCA-Speakers/Dr-Sidrah-Khan.jpg` },
      { name: 'Dr. Muhammad Usman', designation: 'Speaker', photo: `${EP2_DIR}/PCA-Speakers/Dr-Muhammad-Usman.jpg` },
      { name: 'Zubair Elahi', designation: 'Speaker', photo: `${EP2_DIR}/PCA-Speakers/Zubair-Elahi.jpg` },
      { name: 'Aizaz Mohammad', designation: 'Speaker', photo: `${EP2_DIR}/PCA-Speakers/Aizaz-Mohammad.jpg` },
      { name: 'Tariq Mahmood', designation: 'Speaker', photo: `${EP2_DIR}/PCA-Speakers/Tariq-mahmood.jpg` },
      { name: 'Talat Ahmed Bhutta', designation: 'Speaker', photo: `${EP2_DIR}/PCA-Speakers/Talat-Ahmed-Bhutta.jpg` },
      { name: 'Fahd Shahab Kakakhel', designation: 'Speaker', photo: `${EP2_DIR}/PCA-Speakers/Fahd-Shahab-Kakakhel.jpg` },
      { name: 'Masoom Raza', designation: 'Speaker', photo: `${EP2_DIR}/PCA-Speakers/Masoom-Raza.jpg` },
      { name: 'Zunaira Omar', designation: 'Speaker', photo: `${EP2_DIR}/PCA-Speakers/Zunaira-Omar.jpg` },
      { name: 'Huzaifa Arif', designation: 'Speaker', photo: `${EP2_DIR}/PCA-Speakers/Huzaifa-Arif.jpg` },
    ],
    gallery: ['IMG_0400', 'IMG_0405', 'IMG_0407', 'IMG_0412', 'IMG_0418', 'IMG_0424', 'IMG_0431', 'IMG_0433', 'IMG_0441', 'IMG_0447', 'IMG_0456', 'IMG_0459', 'IMG_0464'].map(
      (n) => `${EP2_DIR}/Event-Pictures/${n}.jpg`
    ),
  },
];

export default function PCAPage() {
  const [lightboxImg, setLightboxImg] = useState<string | null>(null);

  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        {/* Logo + Header */}
        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="text-center mb-14">
          <div className="w-40 h-40 flex items-center justify-center mx-auto mb-2">
            <img src="/images/PCA.png" alt="PCA Logo" className="w-full h-full object-contain" />
          </div>
          <span className="text-teal-500 text-sm font-bold tracking-widest uppercase">Community Initiative</span>
          <h1 className="text-4xl md:text-6xl font-bold text-[#0B2545] mt-4 mb-6">
            Pakistan Cybersecurity <span className="text-teal-500">Alliance</span>
          </h1>
          <p className="text-lg text-gray-600 max-w-2xl mx-auto mb-6">
            A community platform connecting cybersecurity professionals, students, and institutions across Pakistan,
            founded and led by the iSeeWaves team.
          </p>
          <div className="flex items-center justify-center gap-3">
            <a
              href="https://www.linkedin.com/showcase/iseewaves-pca"
              target="_blank"
              rel="noopener noreferrer"
              className="w-10 h-10 rounded-full glass-card flex items-center justify-center text-gray-600 hover:text-blue-600 transition-colors"
              aria-label="PCA on LinkedIn"
            >
              <Linkedin className="w-5 h-5" />
            </a>
            <a
              href="https://web.facebook.com/iseewaves.pca/"
              target="_blank"
              rel="noopener noreferrer"
              className="w-10 h-10 rounded-full glass-card flex items-center justify-center text-gray-600 hover:text-blue-500 transition-colors"
              aria-label="PCA on Facebook"
            >
              <Facebook className="w-5 h-5" />
            </a>
            <a
              href="https://www.instagram.com/pk_cybersecurity_alliance/"
              target="_blank"
              rel="noopener noreferrer"
              className="w-10 h-10 rounded-full glass-card flex items-center justify-center text-gray-600 hover:text-pink-500 transition-colors"
              aria-label="PCA on Instagram"
            >
              <Instagram className="w-5 h-5" />
            </a>
          </div>
        </motion.div>

        {/* Pillars */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-16">
          {pillars.map((p, idx) => (
            <motion.div
              key={p.title}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: idx * 0.1 }}
              className="glass-card rounded-2xl border border-gray-200 p-8"
            >
              <div className="w-12 h-12 rounded-xl bg-teal-400/10 flex items-center justify-center mb-5">
                <p.icon className="w-6 h-6 text-teal-500" />
              </div>
              <h3 className="text-xl font-bold text-[#0B2545] mb-2">{p.title}</h3>
              <p className="text-gray-600 leading-relaxed">{p.body}</p>
            </motion.div>
          ))}
        </div>

        {/* Get Involved */}
        <div className="glass-card rounded-2xl border border-teal-500/20 p-10 text-center mb-20">
          <h2 className="text-2xl font-bold text-[#0B2545] mb-3">Get Involved</h2>
          <p className="text-gray-600 max-w-xl mx-auto mb-8">
            Whether you are a student, a practitioner, or an institution, there is a place for you in PCA.
          </p>
          <div className="flex flex-wrap items-center justify-center gap-4">
            <a
              href="https://chat.whatsapp.com/L2E27bvy7MwKVPSOtnSMB5"
              target="_blank"
              rel="noopener noreferrer"
              className="flex items-center gap-2 px-8 py-4 rounded-full bg-teal-500 hover:bg-teal-600 text-white font-semibold transition-all hover:scale-105"
            >
              <MessageCircle className="w-4 h-4" />
              Join the Community
              <ArrowRight className="w-4 h-4" />
            </a>
            <a
              href="mailto:info@iseewaves.pk?subject=PCA%20Events"
              className="flex items-center gap-2 px-8 py-4 rounded-full glass-card text-[#0B2545] font-semibold hover:bg-gray-100 transition-all"
            >
              Upcoming Events
            </a>
            <a
              href="mailto:info@iseewaves.pk?subject=Partner%20with%20PCA"
              className="flex items-center gap-2 px-8 py-4 rounded-full glass-card text-[#0B2545] font-semibold hover:bg-gray-100 transition-all"
            >
              Partner with PCA
            </a>
          </div>
        </div>

        {/* Threat Horizon Pakistan Episodes */}
        <div className="mb-10 text-center">
          <span className="text-teal-500 text-sm font-bold tracking-widest uppercase">Flagship Event Series</span>
          <h2 className="text-3xl md:text-4xl font-bold text-[#0B2545] mt-3">Threat Horizon Pakistan</h2>
        </div>

        <div className="space-y-10 mb-20">
          {episodes.map((ep, idx) => (
            <motion.div
              key={ep.number}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: idx * 0.1 }}
              className="glass-card rounded-2xl border border-gray-200 p-8 md:p-10"
            >
              <h3 className="text-xl md:text-2xl font-bold text-[#0B2545] mb-3">{ep.title}</h3>
              <p className="text-gray-600 leading-relaxed mb-6">{ep.info}</p>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                <div className="flex items-start gap-3">
                  <CalendarDays className="w-5 h-5 text-teal-500 mt-0.5 shrink-0" />
                  <div>
                    <div className="text-xs text-gray-500 uppercase tracking-wide">Date</div>
                    <div className="text-sm text-[#0B2545] font-medium">{ep.date}</div>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <MapPin className="w-5 h-5 text-teal-500 mt-0.5 shrink-0" />
                  <div>
                    <div className="text-xs text-gray-500 uppercase tracking-wide">Venue</div>
                    <div className="text-sm text-[#0B2545] font-medium">{ep.venue}</div>
                  </div>
                </div>
              </div>

              {/* Speakers */}
              <div className="mb-8">
                <div className="text-xs text-gray-500 uppercase tracking-wide mb-3">Speakers</div>
                <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4">
                  {ep.speakers.map((s) => (
                    <div key={s.name} className="flex items-center gap-3">
                      <div className="w-11 h-11 rounded-full overflow-hidden shrink-0 border border-gray-200 bg-gradient-to-br from-teal-400/30 to-[#00C08B]/30">
                        {s.photo ? (
                          <img src={s.photo} alt={s.name} className="w-full h-full object-cover" />
                        ) : (
                          <div className="w-full h-full flex items-center justify-center">
                            <span className="text-xs font-bold text-[#0B2545]">
                              {s.name.split(' ').map((n) => n[0]).join('').slice(0, 2)}
                            </span>
                          </div>
                        )}
                      </div>
                      <div className="min-w-0">
                        <div className="text-sm font-semibold text-[#0B2545] leading-tight truncate">{s.name}</div>
                        <div className="text-xs text-gray-500 leading-tight truncate">{s.designation}</div>
                      </div>
                    </div>
                  ))}
                </div>
              </div>

              {/* Event gallery */}
              {ep.gallery.length > 0 && (
                <div className="mb-6">
                  <div className="text-xs text-gray-500 uppercase tracking-wide mb-3">Event Photos</div>
                  <div className="grid grid-cols-3 sm:grid-cols-4 md:grid-cols-6 gap-2">
                    {ep.gallery.map((img) => (
                      <button
                        key={img}
                        onClick={() => setLightboxImg(img)}
                        className="aspect-square rounded-lg overflow-hidden border border-gray-200 hover:opacity-80 transition-opacity"
                      >
                        <img src={img} alt="Event" className="w-full h-full object-cover" loading="lazy" />
                      </button>
                    ))}
                  </div>
                </div>
              )}

              <div className="flex flex-wrap items-center gap-4 pt-4 border-t border-gray-100">
                <a
                  href="mailto:info@iseewaves.pk?subject=Threat%20Horizon%20Pakistan%20Whitepaper%20Request"
                  className="inline-flex items-center gap-2 text-sm font-medium text-teal-500 hover:underline"
                >
                  <FileText className="w-4 h-4" />
                  Request Event Whitepaper (PDF)
                </a>
              </div>
            </motion.div>
          ))}

          <motion.div
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="glass-card rounded-2xl border border-dashed border-gray-300 p-10 text-center"
          >
            <h3 className="text-xl font-bold text-[#0B2545] mb-2">Threat Horizon Pakistan - Episode 3</h3>
            <p className="text-gray-600">Coming soon.</p>
          </motion.div>
        </div>

        {/* Contributors slider */}
        <div className="text-center mb-8">
          <span className="text-gray-500 text-sm font-semibold tracking-widest uppercase">Contributors</span>
        </div>
      </div>

      <div className="relative w-full overflow-hidden">
        <div className="absolute left-0 top-0 bottom-0 w-24 bg-gradient-to-r from-[#F6F8FB] to-transparent z-10 pointer-events-none" />
        <div className="absolute right-0 top-0 bottom-0 w-24 bg-gradient-to-l from-[#F6F8FB] to-transparent z-10 pointer-events-none" />
        <div className="pca-marquee-track flex items-center gap-6 w-max">
          {loopContributors.map((c, idx) => (
            <div
              key={`${c.name}-${idx}`}
              title={c.name}
              className="glass-card rounded-xl border border-gray-200 px-8 py-5 flex items-center justify-center shrink-0 grayscale hover:grayscale-0 opacity-70 hover:opacity-100 transition-all h-20 w-40"
            >
              <img src={c.logo} alt={c.name} className="max-h-12 max-w-full object-contain" />
            </div>
          ))}
        </div>
      </div>

      {/* Lightbox */}
      <AnimatePresence>
        {lightboxImg && (
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            onClick={() => setLightboxImg(null)}
            className="fixed inset-0 z-[300] bg-black/80 flex items-center justify-center p-4 cursor-zoom-out"
          >
            <button
              onClick={() => setLightboxImg(null)}
              className="absolute top-6 right-6 w-10 h-10 rounded-full bg-white/10 hover:bg-white/20 flex items-center justify-center text-white"
            >
              <X className="w-5 h-5" />
            </button>
            <img src={lightboxImg} alt="Event" className="max-w-full max-h-full rounded-lg object-contain" />
          </motion.div>
        )}
      </AnimatePresence>

      <style>{`
        .pca-marquee-track {
          animation: pca-marquee 26s linear infinite;
        }
        @keyframes pca-marquee {
          0% { transform: translateX(0); }
          100% { transform: translateX(-50%); }
        }
      `}</style>
    </div>
  );
}
R13FILEEOF_33

mkdir -p "$(dirname "src/pages/PackagesPage.tsx")"
cat > "src/pages/PackagesPage.tsx" << 'R13FILEEOF_34'
import { Navigate } from 'react-router-dom';

export default function PackagesPage() {
  return <Navigate to="/myesi#packages" replace />;
}
R13FILEEOF_34

mkdir -p "$(dirname "src/pages/PrivacyPolicyPage.tsx")"
cat > "src/pages/PrivacyPolicyPage.tsx" << 'R13FILEEOF_35'
import { motion } from 'motion/react';
import { Shield } from 'lucide-react';

export default function PrivacyPolicyPage() {
  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-16">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-full glass-card border-teal-500/30 text-teal-400 text-sm font-medium mb-6"
          >
            <Shield className="w-4 h-4" />
            <span>Privacy Policy</span>
          </motion.div>
          <motion.h1
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.1 }}
            className="text-4xl md:text-6xl font-bold text-[#0B2545] mb-6"
          >
            Privacy <span className="text-teal-400">Policy</span>
          </motion.h1>
          <p className="text-gray-600">Last updated: February 24, 2026</p>
        </div>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.2 }}
          className="glass-card p-8 md:p-12 rounded-3xl prose prose-invert prose-teal max-w-none"
        >
          <h2>1. Introduction</h2>
          <p>
            At iSeeWaves, we take your privacy seriously. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you visit our website or use our services.
          </p>

          <h2>2. Information We Collect</h2>
          <h3>Personal Information</h3>
          <p>
            We may collect personal information that you voluntarily provide to us when you:
          </p>
          <ul>
            <li>Register for an account</li>
            <li>Sign up for our newsletter</li>
            <li>Request a consultation or demo</li>
            <li>Contact our support team</li>
          </ul>

          <h3>Automatically Collected Information</h3>
          <p>
            When you visit our website, our servers automatically record information that your browser sends. This may include:
          </p>
          <ul>
            <li>Your IP address</li>
            <li>Browser type and version</li>
            <li>Operating system</li>
            <li>Pages you view and links you click</li>
          </ul>

          <h2>3. How We Use Your Information</h2>
          <p>We use the information we collect to:</p>
          <ul>
            <li>Provide, operate, and maintain our services</li>
            <li>Improve, personalize, and expand our services</li>
            <li>Understand and analyze how you use our services</li>
            <li>Develop new products, services, features, and functionality</li>
            <li>Communicate with you for customer service, updates, and marketing</li>
            <li>Find and prevent fraud</li>
          </ul>

          <h2>4. Data Security</h2>
          <p>
            We use administrative, technical, and physical security measures to help protect your personal information. While we have taken reasonable steps to secure the personal information you provide to us, please be aware that despite our efforts, no security measures are perfect or impenetrable.
          </p>

          <h2>5. Your Data Protection Rights</h2>
          <p>Depending on your location, you may have the following rights:</p>
          <ul>
            <li>The right to access, update, or delete the information we have on you</li>
            <li>The right of rectification</li>
            <li>The right to object</li>
            <li>The right of restriction</li>
            <li>The right to data portability</li>
            <li>The right to withdraw consent</li>
          </ul>

          <h2>6. Contact Us</h2>
          <p>
            If you have questions or comments about this Privacy Policy, please contact us at:
            <br />
            Email: privacy@iseewaves.com
          </p>
        </motion.div>
      </div>
    </div>
  );
}
R13FILEEOF_35

mkdir -p "$(dirname "src/pages/ProductPage.tsx")"
cat > "src/pages/ProductPage.tsx" << 'R13FILEEOF_36'
import { ArrowLeft } from 'lucide-react';
import { Link } from 'react-router-dom';
import Product from '../components/Product';
import AuditFeatures from '../components/AuditFeatures';
import Packages from '../components/Packages';
import SupportSection from '../components/SupportSection';

export default function ProductPage() {
  return (
    <div className="pt-24">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-8">
        <Link to="/" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
          <ArrowLeft className="w-4 h-4" />
          <span>Back to Home</span>
        </Link>
      </div>
      <Product />
      <AuditFeatures />
      <Packages />
      <SupportSection />
    </div>
  );
}
R13FILEEOF_36

mkdir -p "$(dirname "src/pages/ServiceDetailPage.tsx")"
cat > "src/pages/ServiceDetailPage.tsx" << 'R13FILEEOF_37'
import { motion } from 'motion/react';
import { ArrowLeft, Send, CheckCircle2, Loader2 } from 'lucide-react';
import { Link, useParams, Navigate } from 'react-router-dom';
import { getServiceBySlug } from '../data/servicesData';
import { useSubmitForm } from '../hooks/useSubmitForm';
import FormToast from '../components/FormToast';

export default function ServiceDetailPage() {
  const { slug } = useParams<{ slug: string }>();
  const service = slug ? getServiceBySlug(slug) : undefined;
  const { status, handleSubmit } = useSubmitForm(
    service ? { subject: `Service Request: ${service.title}`, service: service.title } : undefined
  );

  if (!service) {
    return <Navigate to="/services" replace />;
  }

  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/services" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Services</span>
          </Link>
        </div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="mb-12">
          <span className="text-teal-400 text-sm font-bold tracking-widest uppercase">{service.category}</span>
          <h1 className="text-3xl md:text-5xl font-bold text-[#0B2545] mt-4 mb-4">{service.title}</h1>
          <p className="text-lg text-gray-600 max-w-2xl">{service.summary}</p>
        </motion.div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8 mb-16">
          <div className="lg:col-span-2 space-y-8">
            <div className="glass-card rounded-2xl border border-gray-200 p-8">
              <h2 className="text-xl font-bold text-[#0B2545] mb-3">Overview</h2>
              <p className="text-gray-600 leading-relaxed">{service.description}</p>
            </div>
            <div className="glass-card rounded-2xl border border-gray-200 p-8">
              <h2 className="text-xl font-bold text-[#0B2545] mb-4">What We Do</h2>
              <ul className="space-y-3">
                {service.whatWeDo.map((item) => (
                  <li key={item} className="flex items-start gap-3 text-gray-700 text-sm">
                    <CheckCircle2 className="w-4 h-4 text-teal-400 mt-0.5 shrink-0" />
                    {item}
                  </li>
                ))}
              </ul>
            </div>
            <div className="glass-card rounded-2xl border border-gray-200 p-8">
              <h2 className="text-xl font-bold text-[#0B2545] mb-4">Deliverables</h2>
              <ul className="space-y-3">
                {service.deliverables.map((item) => (
                  <li key={item} className="flex items-start gap-3 text-gray-700 text-sm">
                    <CheckCircle2 className="w-4 h-4 text-blue-400 mt-0.5 shrink-0" />
                    {item}
                  </li>
                ))}
              </ul>
            </div>
          </div>

          <div className="lg:col-span-1">
            <div className="glass-card rounded-2xl border border-teal-500/20 p-6 sticky top-28">
              <h2 className="text-lg font-bold text-[#0B2545] mb-2">Request This Service</h2>
              <p className="text-sm text-gray-600 mb-6">
                Tell us about your environment and requirements. We'll follow up by email.
              </p>
              <form
                onSubmit={handleSubmit}
                className="space-y-4"
              >
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Full Name</label>
                  <input required name="name" type="text" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Company</label>
                  <input required name="company" type="text" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Work Email</label>
                  <input required name="email" type="email" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Phone</label>
                  <input name="phone" type="tel" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Environment Size (e.g. team, assets, scope)</label>
                  <input name="environment" type="text" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Preferred Timeline</label>
                  <input name="timeline" type="text" placeholder="e.g. within 2 weeks" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Requirements</label>
                  <textarea name="requirements" rows={4} className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <button
                  type="submit"
                  disabled={status === 'sending'}
                  className="w-full flex items-center justify-center gap-2 px-6 py-3 rounded-full bg-teal-500 hover:bg-teal-600 text-white font-semibold transition-all disabled:opacity-60"
                >
                  {status === 'sending' ? 'Sending...' : 'Send Request'}
                  {status === 'sending' ? <Loader2 className="w-4 h-4 animate-spin" /> : <Send className="w-4 h-4" />}
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
      <FormToast status={status} />
    </div>
  );
}
R13FILEEOF_37

mkdir -p "$(dirname "src/pages/ServicesPage.tsx")"
cat > "src/pages/ServicesPage.tsx" << 'R13FILEEOF_38'
import { motion } from 'motion/react';
import { ShieldAlert, ShieldCheck, FileCheck, Cloud, UserCog, ArrowLeft, ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';
import { servicesData } from '../data/servicesData';

const categoryMeta: Record<string, { icon: any; color: string; bg: string; border: string }> = {
  'Offensive Security': { icon: ShieldAlert, color: 'text-red-400', bg: 'bg-red-400/10', border: 'border-red-400/20' },
  'Defensive Security': { icon: ShieldCheck, color: 'text-blue-400', bg: 'bg-blue-400/10', border: 'border-blue-400/20' },
  'vCISO': { icon: UserCog, color: 'text-amber-400', bg: 'bg-amber-400/10', border: 'border-amber-400/20' },
  'Compliance & GRC': { icon: FileCheck, color: 'text-purple-400', bg: 'bg-purple-400/10', border: 'border-purple-400/20' },
  'Cloud & AI Security': { icon: Cloud, color: 'text-teal-400', bg: 'bg-teal-400/10', border: 'border-teal-400/20' },
};

export default function ServicesPage() {
  const categories = Array.from(new Set(servicesData.map((s) => s.category)));

  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <div className="text-center mb-16">
          <motion.h1
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            className="text-4xl md:text-6xl font-bold text-[#0B2545] mb-4"
          >
            Our <span className="text-teal-400">Services</span>
          </motion.h1>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.1 }}
            className="text-lg text-gray-600 max-w-2xl mx-auto"
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
                  <h2 className="text-2xl font-bold text-[#0B2545]">{category}</h2>
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
                        <h3 className="text-lg font-bold text-[#0B2545] mb-2">{item.title}</h3>
                        <p className="text-sm text-gray-600 mb-4">{item.summary}</p>
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
            className="inline-flex items-center gap-2 px-8 py-4 rounded-full bg-teal-500 hover:bg-teal-600 text-white font-semibold transition-all hover:scale-105"
          >
            Discuss a Service
          </Link>
        </div>
      </div>
    </div>
  );
}
R13FILEEOF_38

mkdir -p "$(dirname "src/pages/SimplePage.tsx")"
cat > "src/pages/SimplePage.tsx" << 'R13FILEEOF_39'
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
          <Link to="/" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="mb-12">
          <div className="w-14 h-14 rounded-xl bg-teal-400/10 flex items-center justify-center mb-6">
            <Icon className="w-7 h-7 text-teal-400" />
          </div>
          <span className="text-teal-400 text-sm font-bold tracking-widest uppercase">{eyebrow}</span>
          <h1 className="text-3xl md:text-5xl font-bold text-[#0B2545] mt-4 mb-4">{title}</h1>
          <p className="text-lg text-gray-600 max-w-2xl">{subtitle}</p>
        </motion.div>

        <div className="space-y-10">
          {sections.map((s, idx) => (
            <motion.div
              key={idx}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              className="glass-card rounded-2xl border border-gray-200 p-8"
            >
              <h2 className="text-xl font-bold text-[#0B2545] mb-3">{s.heading}</h2>
              <p className="text-gray-600 leading-relaxed">{s.body}</p>
            </motion.div>
          ))}
        </div>

        {(ctaLabel && ctaHref) || (secondaryCtaLabel && secondaryCtaHref) ? (
          <div className="mt-12 text-center flex flex-wrap items-center justify-center gap-4">
            {ctaLabel && ctaHref && (
              <a
                href={ctaHref}
                className="inline-flex items-center gap-2 px-8 py-4 rounded-full bg-teal-500 hover:bg-teal-600 text-white font-semibold transition-all hover:scale-105"
              >
                {ctaLabel}
              </a>
            )}
            {secondaryCtaLabel && secondaryCtaHref && (
              <a
                href={secondaryCtaHref}
                className="inline-flex items-center gap-2 px-8 py-4 rounded-full glass-card text-[#0B2545] font-semibold hover:bg-gray-100 transition-all hover:scale-105"
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
R13FILEEOF_39

mkdir -p "$(dirname "src/pages/SupportPage.tsx")"
cat > "src/pages/SupportPage.tsx" << 'R13FILEEOF_40'
import { Navigate } from 'react-router-dom';

export default function SupportPage() {
  return <Navigate to="/myesi#support" replace />;
}
R13FILEEOF_40

mkdir -p "$(dirname "src/pages/TermsOfServicePage.tsx")"
cat > "src/pages/TermsOfServicePage.tsx" << 'R13FILEEOF_41'
import { motion } from 'motion/react';
import { Shield } from 'lucide-react';

export default function TermsOfServicePage() {
  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-16">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-full glass-card border-teal-500/30 text-teal-400 text-sm font-medium mb-6"
          >
            <Shield className="w-4 h-4" />
            <span>Terms of Service</span>
          </motion.div>
          <motion.h1
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.1 }}
            className="text-4xl md:text-6xl font-bold text-[#0B2545] mb-6"
          >
            Terms of <span className="text-teal-400">Service</span>
          </motion.h1>
          <p className="text-gray-600">Last updated: February 24, 2026</p>
        </div>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.2 }}
          className="glass-card p-8 md:p-12 rounded-3xl prose prose-invert prose-teal max-w-none"
        >
          <h2>1. Agreement to Terms</h2>
          <p>
            By accessing or using our website and services, you agree to be bound by these Terms of Service and all applicable laws and regulations. If you do not agree with any of these terms, you are prohibited from using or accessing this site.
          </p>

          <h2>2. Use License</h2>
          <p>
            Permission is granted to temporarily download one copy of the materials (information or software) on iSeeWaves's website for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license you may not:
          </p>
          <ul>
            <li>modify or copy the materials;</li>
            <li>use the materials for any commercial purpose, or for any public display (commercial or non-commercial);</li>
            <li>attempt to decompile or reverse engineer any software contained on iSeeWaves's website;</li>
            <li>remove any copyright or other proprietary notations from the materials; or</li>
            <li>transfer the materials to another person or "mirror" the materials on any other server.</li>
          </ul>

          <h2>3. Disclaimer</h2>
          <p>
            The materials on iSeeWaves's website are provided on an 'as is' basis. iSeeWaves makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties including, without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.
          </p>

          <h2>4. Limitations</h2>
          <p>
            In no event shall iSeeWaves or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use the materials on iSeeWaves's website, even if iSeeWaves or a iSeeWaves authorized representative has been notified orally or in writing of the possibility of such damage.
          </p>

          <h2>5. Accuracy of Materials</h2>
          <p>
            The materials appearing on iSeeWaves's website could include technical, typographical, or photographic errors. iSeeWaves does not warrant that any of the materials on its website are accurate, complete or current. iSeeWaves may make changes to the materials contained on its website at any time without notice.
          </p>

          <h2>6. Links</h2>
          <p>
            iSeeWaves has not reviewed all of the sites linked to its website and is not responsible for the contents of any such linked site. The inclusion of any link does not imply endorsement by iSeeWaves of the site. Use of any such linked website is at the user's own risk.
          </p>

          <h2>7. Modifications</h2>
          <p>
            iSeeWaves may revise these terms of service for its website at any time without notice. By using this website you are agreeing to be bound by the then current version of these terms of service.
          </p>

          <h2>8. Governing Law</h2>
          <p>
            These terms and conditions are governed by and construed in accordance with the laws and you irrevocably submit to the exclusive jurisdiction of the courts in that State or location.
          </p>
        </motion.div>
      </div>
    </div>
  );
}
R13FILEEOF_41

mkdir -p "$(dirname "src/pages/TrainingDetailPage.tsx")"
cat > "src/pages/TrainingDetailPage.tsx" << 'R13FILEEOF_42'
import { motion } from 'motion/react';
import { ArrowLeft, Send, CheckCircle2, Loader2 } from 'lucide-react';
import { Link, useParams, Navigate } from 'react-router-dom';
import { getTrainingBySlug } from '../data/trainingData';
import { useSubmitForm } from '../hooks/useSubmitForm';
import FormToast from '../components/FormToast';

export default function TrainingDetailPage() {
  const { slug } = useParams<{ slug: string }>();
  const training = slug ? getTrainingBySlug(slug) : undefined;
  const { status, handleSubmit } = useSubmitForm(
    training ? { subject: `Training Booking: ${training.title}`, training: training.title } : undefined
  );

  if (!training) {
    return <Navigate to="/resources/training" replace />;
  }

  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/resources/training" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Training</span>
          </Link>
        </div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="mb-12">
          <span className="text-teal-400 text-sm font-bold tracking-widest uppercase">Training Program</span>
          <h1 className="text-3xl md:text-5xl font-bold text-[#0B2545] mt-4 mb-4">{training.title}</h1>
          <p className="text-lg text-gray-600 max-w-2xl">{training.summary}</p>
        </motion.div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          <div className="lg:col-span-2 space-y-8">
            <div className="glass-card rounded-2xl border border-gray-200 p-8">
              <h2 className="text-xl font-bold text-[#0B2545] mb-3">Overview</h2>
              <p className="text-gray-600 leading-relaxed">{training.description}</p>
            </div>
            <div className="glass-card rounded-2xl border border-gray-200 p-8">
              <h2 className="text-xl font-bold text-[#0B2545] mb-4">What's Covered</h2>
              <ul className="space-y-3">
                {training.topics.map((topic) => (
                  <li key={topic} className="flex items-start gap-3 text-gray-700 text-sm">
                    <CheckCircle2 className="w-4 h-4 text-teal-400 mt-0.5 shrink-0" />
                    {topic}
                  </li>
                ))}
              </ul>
            </div>
            <div className="glass-card rounded-2xl border border-gray-200 p-8">
              <h2 className="text-xl font-bold text-[#0B2545] mb-2">Format</h2>
              <p className="text-gray-600 text-sm">{training.format}</p>
            </div>
          </div>

          <div className="lg:col-span-1">
            <div className="glass-card rounded-2xl border border-teal-500/20 p-6 sticky top-28">
              <h2 className="text-lg font-bold text-[#0B2545] mb-2">Book This Training</h2>
              <p className="text-sm text-gray-600 mb-6">
                Tell us about your team and goals, we'll follow up to schedule.
              </p>
              <form
                onSubmit={handleSubmit}
                className="space-y-4"
              >
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Full Name</label>
                  <input required name="name" type="text" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Organization</label>
                  <input required name="company" type="text" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Work Email</label>
                  <input required name="email" type="email" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Phone</label>
                  <input name="phone" type="tel" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Number of Participants</label>
                  <input name="participants" type="text" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Preferred Dates</label>
                  <input name="dates" type="text" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Goals / Notes</label>
                  <textarea name="notes" rows={4} className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <button
                  type="submit"
                  disabled={status === 'sending'}
                  className="w-full flex items-center justify-center gap-2 px-6 py-3 rounded-full bg-teal-500 hover:bg-teal-600 text-white font-semibold transition-all disabled:opacity-60"
                >
                  {status === 'sending' ? 'Sending...' : 'Request Booking'}
                  {status === 'sending' ? <Loader2 className="w-4 h-4 animate-spin" /> : <Send className="w-4 h-4" />}
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
      <FormToast status={status} />
    </div>
  );
}
R13FILEEOF_42

mkdir -p "$(dirname "src/pages/company/ExecutiveTeamPage.tsx")"
cat > "src/pages/company/ExecutiveTeamPage.tsx" << 'R13FILEEOF_43'
import { motion } from 'motion/react';
import { ArrowLeft, Quote, Users } from 'lucide-react';
import { Link } from 'react-router-dom';

export default function ExecutiveTeamPage() {
  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="mb-14">
          <div className="w-14 h-14 rounded-xl bg-teal-400/10 flex items-center justify-center mb-6">
            <Users className="w-7 h-7 text-teal-400" />
          </div>
          <span className="text-teal-400 text-sm font-bold tracking-widest uppercase">Company</span>
          <h1 className="text-3xl md:text-5xl font-bold text-[#0B2545] mt-4 mb-4">Executive Team</h1>
          <p className="text-lg text-gray-600 max-w-2xl">The people leading iSeeWaves and building our platform.</p>
        </motion.div>

        {/* CEO Profile */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="glass-card rounded-3xl border border-gray-200 p-8 md:p-10 mb-10"
        >
          <div className="flex flex-col md:flex-row gap-8 items-start">
            <div className="w-32 h-32 rounded-2xl bg-gradient-to-br from-teal-500/30 to-blue-500/30 flex items-center justify-center shrink-0 border border-gray-200 mx-auto md:mx-0">
              <img src="/images/Founder.jpeg" alt="Founder" className="w-full h-full object-cover rounded-2xl" />
            </div>
            <div className="flex-1">
              <h2 className="text-2xl font-bold text-[#0B2545] mb-1">Abdullah Nasir</h2>
              <p className="text-teal-400 text-sm font-semibold mb-4">Founder & CEO, iSeeWaves</p>
              <p className="text-gray-600 leading-relaxed mb-4">
                Abdullah founded iSeeWaves after previously building and exiting a cybersecurity and AI company. He
                leads product and company strategy, with hands-on experience spanning offensive security, AI
                systems, and software supply chain security. He also founded and leads the Pakistan Cybersecurity
                Alliance, a community platform connecting cybersecurity professionals, students, and institutions
                across Pakistan.
              </p>
              <p className="text-gray-600 leading-relaxed mb-4">
                He holds certifications including CEH (EC-Council), AWS Certified Cloud Practitioner, CRPO (ICTTF),
                and NIST CSF 2.0 Audit Practitioner, and was selected among the 100 Young Leaders of Pakistan
                (NLIS 2026).
              </p>
            </div>
          </div>

          <div className="mt-8 pt-8 border-t border-gray-200 relative">
            <Quote className="w-8 h-8 text-teal-400/40 absolute -top-4 left-0" />
            <p className="text-gray-700 italic leading-relaxed pl-10">
              "We started iSeeWaves because too many organizations only find out what's actually running in their
              software after something has already gone wrong. Our job is to make that visibility automatic,
              defensible, and available before the incident, not after it. Everything we build, from our platform to
              our services to the Pakistan Cybersecurity Alliance, comes back to that one idea: security that people
              can actually trust and verify."
            </p>
            <p className="text-sm text-gray-600 mt-3 pl-10">— Abdullah Nasir, Founder & CEO</p>
          </div>
        </motion.div>

        {/* Leadership Approach - detailed */}
        <motion.article
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="glass-card rounded-3xl border border-gray-200 p-8 md:p-10"
        >
          <span className="text-blue-400 text-xs font-bold tracking-widest uppercase">Leadership Approach</span>
          <h2 className="text-2xl md:text-3xl font-bold text-[#0B2545] mt-3 mb-6">How We Lead</h2>

          <div className="prose-invert space-y-6 text-gray-600 leading-relaxed">
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
R13FILEEOF_43

mkdir -p "$(dirname "src/pages/company/InvestorRelationsPage.tsx")"
cat > "src/pages/company/InvestorRelationsPage.tsx" << 'R13FILEEOF_44'
import { motion } from 'motion/react';
import { ArrowLeft, TrendingUp, Target, Building2, Rocket, ShieldCheck, Send, Loader2 } from 'lucide-react';
import { Link } from 'react-router-dom';
import { useSubmitForm } from '../../hooks/useSubmitForm';
import FormToast from '../../components/FormToast';

export default function InvestorRelationsPage() {
  const { status, handleSubmit } = useSubmitForm({ subject: 'Investor Relations Inquiry' });

  const highlights = [
    { icon: Building2, label: "Pakistan's First", detail: 'Secure software development company' },
    { icon: ShieldCheck, label: 'SECP Registered', detail: 'Formally incorporated and compliant' },
    { icon: Rocket, label: 'NICAT Incubated', detail: 'National Incubation Center for Aerospace Technologies' },
    { icon: Target, label: 'Founded 2025', detail: 'Building since our first year' },
  ];

  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="mb-14">
          <div className="w-14 h-14 rounded-xl bg-teal-400/10 flex items-center justify-center mb-6">
            <TrendingUp className="w-7 h-7 text-teal-500" />
          </div>
          <span className="text-teal-500 text-sm font-bold tracking-widest uppercase">Company</span>
          <h1 className="text-3xl md:text-5xl font-bold text-[#0B2545] mt-4 mb-4">Investor Relations</h1>
          <p className="text-lg text-gray-600 max-w-2xl">
            iSeeWaves builds MyESI, an automated software supply chain security and DevSecOps platform, for
            enterprise and regulated customers across a growing cybersecurity market.
          </p>
        </motion.div>

        <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-14">
          {highlights.map((h) => (
            <motion.div
              key={h.label}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              className="glass-card rounded-2xl border border-gray-200 p-5 text-center"
            >
              <h.icon className="w-6 h-6 text-teal-500 mx-auto mb-3" />
              <div className="text-sm font-bold text-[#0B2545]">{h.label}</div>
              <div className="text-xs text-gray-600 mt-1 leading-snug">{h.detail}</div>
            </motion.div>
          ))}
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          <div className="lg:col-span-2 space-y-8">
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              className="glass-card rounded-2xl border border-gray-200 p-8"
            >
              <h2 className="text-xl font-bold text-[#0B2545] mb-3">Market Opportunity</h2>
              <p className="text-gray-600 leading-relaxed">
                Software supply chain attacks and regulatory pressure around SBOM disclosure, secure development
                lifecycle, and compliance evidence are pushing organizations of every size to adopt automated
                security tooling. MyESI consolidates what has traditionally required eight or more separate tools,
                SBOM generation, secure coding testing, SCA, SAST, DAST, API security, secrets detection, and
                compliance mapping, into a single automated platform, positioning us at the center of a fast-growing
                category.
              </p>
            </motion.div>

            <motion.div
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              className="glass-card rounded-2xl border border-gray-200 p-8"
            >
              <h2 className="text-xl font-bold text-[#0B2545] mb-3">Company Milestones</h2>
              <ul className="space-y-3 text-sm text-gray-600">
                <li className="flex gap-3">
                  <span className="text-teal-500 font-bold shrink-0">2025</span>
                  Founded iSeeWaves; registered with SECP; incubated at the National Incubation Center for Aerospace
                  Technologies (NICAT).
                </li>
                <li className="flex gap-3">
                  <span className="text-teal-500 font-bold shrink-0">2025</span>
                  Received funding and program support from Ignite National Technology Fund and the Ministry of IT
                  &amp; Telecom, Pakistan.
                </li>
                <li className="flex gap-3">
                  <span className="text-teal-500 font-bold shrink-0">2026</span>
                  Launched MyESI's automated 8-audit platform; grew services engagements across offensive security,
                  compliance, and cloud security; founded the Pakistan Cybersecurity Alliance community initiative.
                </li>
              </ul>
            </motion.div>

            <motion.div
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              className="glass-card rounded-2xl border border-gray-200 p-8"
            >
              <h2 className="text-xl font-bold text-[#0B2545] mb-3">Revenue Model</h2>
              <p className="text-gray-600 leading-relaxed">
                We generate revenue through tiered MyESI subscriptions (Starter, Business, Enterprise, including
                on-premises deployment for regulated customers), alongside professional services engagements
                (penetration testing, vCISO, GRC, cloud and AI security) and training programs. This combination
                gives us both recurring platform revenue and higher-touch services revenue from the same customer
                base.
              </p>
            </motion.div>

            <motion.div
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              className="glass-card rounded-2xl border border-gray-200 p-8"
            >
              <h2 className="text-xl font-bold text-[#0B2545] mb-3">Why iSeeWaves</h2>
              <ul className="space-y-2 text-sm text-gray-600 list-disc list-inside">
                <li>Founder-led team with hands-on offensive security and AI experience</li>
                <li>Product built from real client engagements, not built in isolation from the market</li>
                <li>Backed and supported by Ignite and the Ministry of IT &amp; Telecom, Pakistan</li>
                <li>Community presence through the Pakistan Cybersecurity Alliance, extending brand reach and talent pipeline</li>
                <li>Dual revenue engine: recurring platform subscriptions plus services and training</li>
              </ul>
            </motion.div>
          </div>

          <div className="lg:col-span-1">
            <div className="glass-card rounded-2xl border border-teal-500/20 p-6 sticky top-28">
              <h2 className="text-lg font-bold text-[#0B2545] mb-2">Request Investor Materials</h2>
              <p className="text-sm text-gray-600 mb-6">
                Tell us a bit about your fund or firm and we'll follow up with our deck and financials.
              </p>
              {status === 'success' ? (
                <div className="text-teal-500 font-medium text-sm">
                  Thanks, your request has been sent. We'll follow up shortly.
                </div>
              ) : (
                <form onSubmit={handleSubmit} className="space-y-4">
                  <div>
                    <label className="block text-xs font-medium text-gray-600 mb-1.5">Full Name</label>
                    <input required name="name" type="text" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                  </div>
                  <div>
                    <label className="block text-xs font-medium text-gray-600 mb-1.5">Firm / Fund</label>
                    <input required name="company" type="text" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                  </div>
                  <div>
                    <label className="block text-xs font-medium text-gray-600 mb-1.5">Email</label>
                    <input required name="email" type="email" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                  </div>
                  <div>
                    <label className="block text-xs font-medium text-gray-600 mb-1.5">Notes</label>
                    <textarea name="notes" rows={4} className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                  </div>
                  <button
                    type="submit"
                    disabled={status === 'sending'}
                    className="w-full flex items-center justify-center gap-2 px-6 py-3 rounded-full bg-teal-500 hover:bg-teal-600 text-white font-semibold transition-all disabled:opacity-60"
                  >
                    {status === 'sending' ? 'Sending...' : 'Send Request'}
                    {status === 'sending' ? <Loader2 className="w-4 h-4 animate-spin" /> : <Send className="w-4 h-4" />}
                  </button>
                </form>
              )}
            </div>
          </div>
        </div>
      </div>
      <FormToast status={status} />
    </div>
  );
}
R13FILEEOF_44

mkdir -p "$(dirname "src/pages/partners/BecomePartnerPage.tsx")"
cat > "src/pages/partners/BecomePartnerPage.tsx" << 'R13FILEEOF_45'
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
R13FILEEOF_45

mkdir -p "$(dirname "src/pages/partners/ComparePlansPage.tsx")"
cat > "src/pages/partners/ComparePlansPage.tsx" << 'R13FILEEOF_46'
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
          <Link to="/partners/programs" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Partner Programs</span>
          </Link>
        </div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="text-center mb-14">
          <span className="text-teal-400 text-sm font-bold tracking-widest uppercase">Partners</span>
          <h1 className="text-3xl md:text-5xl font-bold text-[#0B2545] mt-4 mb-4">Compare Partner Plans</h1>
          <p className="text-lg text-gray-600 max-w-2xl mx-auto">
            Choose the partnership track that fits how you want to work with us.
          </p>
        </motion.div>

        <div className="overflow-x-auto">
          <table className="w-full min-w-[640px] border-collapse">
            <thead>
              <tr>
                <th className="text-left p-4 text-gray-600 text-sm font-medium"></th>
                {plans.map((p) => (
                  <th key={p.key} className="p-4 text-center">
                    <div className="text-[#0B2545] font-bold text-lg">{p.name}</div>
                    <div className="text-gray-600 text-xs font-normal mt-1">{p.desc}</div>
                  </th>
                ))}
              </tr>
            </thead>
            <tbody>
              {rows.map((row, idx) => (
                <tr key={row.label} className={idx % 2 === 0 ? 'bg-white/[0.02]' : ''}>
                  <td className="p-4 text-sm text-gray-700 border-t border-gray-100">{row.label}</td>
                  {(['referral', 'reseller', 'implementation'] as const).map((key) => (
                    <td key={key} className="p-4 text-center border-t border-gray-100">
                      {row[key] ? (
                        <Check className="w-5 h-5 text-teal-400 mx-auto" />
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
            className="inline-flex items-center gap-2 px-8 py-4 rounded-full bg-teal-500 hover:bg-teal-600 text-white font-semibold transition-all hover:scale-105"
          >
            Apply to a Program
          </a>
        </div>
      </div>
    </div>
  );
}
R13FILEEOF_46

mkdir -p "$(dirname "src/pages/partners/FindPartnerPage.tsx")"
cat > "src/pages/partners/FindPartnerPage.tsx" << 'R13FILEEOF_47'
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
R13FILEEOF_47

mkdir -p "$(dirname "src/pages/partners/PartnerPortalPage.tsx")"
cat > "src/pages/partners/PartnerPortalPage.tsx" << 'R13FILEEOF_48'
import { motion } from 'motion/react';
import { ArrowLeft, LayoutDashboard, Loader2, Send } from 'lucide-react';
import { Link } from 'react-router-dom';
import { useSubmitForm } from '../../hooks/useSubmitForm';
import FormToast from '../../components/FormToast';

export default function PartnerPortalPage() {
  const { status, handleSubmit } = useSubmitForm({ subject: 'Partner Portal Access Request' });

  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10 flex items-center justify-center">
      <div className="max-w-md w-full px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          className="glass-card rounded-2xl border border-gray-200 p-8"
        >
          <div className="w-12 h-12 rounded-xl bg-teal-400/10 flex items-center justify-center mb-6">
            <LayoutDashboard className="w-6 h-6 text-teal-400" />
          </div>
          <h1 className="text-2xl font-bold text-[#0B2545] mb-2">Partner Portal Access</h1>
          <p className="text-sm text-gray-600 mb-8">
            The partner portal is invite-based. Enter your partner email and our team will send you access.
          </p>

          {status === 'success' ? (
            <div className="text-teal-500 font-medium text-sm">
              Request sent. We'll email you portal access shortly.
            </div>
          ) : (
            <form onSubmit={handleSubmit} className="space-y-5">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Partner Email</label>
                <input required name="email" type="email" className="w-full px-4 py-3 rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
              </div>
              <button
                type="submit"
                disabled={status === 'sending'}
                className="w-full flex items-center justify-center gap-2 px-6 py-3 rounded-full bg-teal-500 hover:bg-teal-600 text-white font-semibold transition-all disabled:opacity-60"
              >
                {status === 'sending' ? 'Sending...' : 'Request Access'}
                {status === 'sending' ? <Loader2 className="w-4 h-4 animate-spin" /> : <Send className="w-4 h-4" />}
              </button>
            </form>
          )}

          <p className="text-sm text-gray-600 mt-6 text-center">
            Not a partner yet?{' '}
            <Link to="/partners/become-a-partner" className="text-teal-400 hover:underline">Become a partner</Link>
          </p>
        </motion.div>
      </div>
      <FormToast status={status} />
    </div>
  );
}
R13FILEEOF_48

mkdir -p "$(dirname "src/pages/partners/PartnerProgramsPage.tsx")"
cat > "src/pages/partners/PartnerProgramsPage.tsx" << 'R13FILEEOF_49'
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
R13FILEEOF_49

mkdir -p "$(dirname "src/pages/resources/CommunityPage.tsx")"
cat > "src/pages/resources/CommunityPage.tsx" << 'R13FILEEOF_50'
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
R13FILEEOF_50

mkdir -p "$(dirname "src/pages/resources/DocumentationPage.tsx")"
cat > "src/pages/resources/DocumentationPage.tsx" << 'R13FILEEOF_51'
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
R13FILEEOF_51

mkdir -p "$(dirname "src/pages/resources/TrainingPage.tsx")"
cat > "src/pages/resources/TrainingPage.tsx" << 'R13FILEEOF_52'
import { motion } from 'motion/react';
import { GraduationCap, ArrowLeft, ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';
import { trainingData } from '../../data/trainingData';

export default function TrainingPage() {
  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="mb-12">
          <div className="w-14 h-14 rounded-xl bg-teal-400/10 flex items-center justify-center mb-6">
            <GraduationCap className="w-7 h-7 text-teal-400" />
          </div>
          <span className="text-teal-400 text-sm font-bold tracking-widest uppercase">Resources</span>
          <h1 className="text-3xl md:text-5xl font-bold text-[#0B2545] mt-4 mb-4">Training and Certifications</h1>
          <p className="text-lg text-gray-600 max-w-2xl">
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
                className="group block glass-card rounded-2xl border border-gray-200 hover:border-teal-500/40 p-6 h-full transition-all"
              >
                <h3 className="text-lg font-bold text-[#0B2545] mb-2">{t.title}</h3>
                <p className="text-sm text-gray-600 mb-4">{t.summary}</p>
                <span className="inline-flex items-center gap-1 text-sm font-medium text-teal-400">
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
R13FILEEOF_52

mkdir -p "$(dirname "src/pages/resources/TrustPage.tsx")"
cat > "src/pages/resources/TrustPage.tsx" << 'R13FILEEOF_53'
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
R13FILEEOF_53

mkdir -p "$(dirname "src/vite-env.d.ts")"
cat > "src/vite-env.d.ts" << 'R13FILEEOF_54'
/// <reference types="vite/client" />
R13FILEEOF_54

echo "Done. Now run: npm run build && npm run dev to verify."