#!/bin/bash
set -e
echo "Applying round 17: HTTPS enforcement, cookie consent, custom 404, per-page meta titles, alt text audit, honeypot spam protection, GA4 analytics..."

mkdir -p "$(dirname "index.html")"
cat > "index.html" << 'R17FILEEOF_1'
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0" />

    <!-- Google Analytics 4 — replace G-XXXXXXXXXX with your real Measurement ID from analytics.google.com -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
      gtag('config', 'G-XXXXXXXXXX');
    </script>

    <!-- ===================== PRIMARY SEO ===================== -->
    <title>iSeeWaves | Cybersecurity & IT Services</title>
    <meta name="description" content="iSeeWaves is a leading cybersecurity and IT services provider delivering vulnerability management, penetration testing, digital forensics, and audit-ready compliance frameworks to protect businesses from evolving cyber threats." />
    <meta name="keywords" content="iSeeWaves, Cybersecurity, IT Services, myESI, SBOM, Penetration Testing, Vulnerability Management, Digital Forensics, GRC, Cloud Security, AI Security, Pakistan" />
    <meta name="author" content="ISEEWAVES (PRIVATE) LIMITED" />
    <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1" />
    <meta name="referrer" content="origin-when-cross-origin" />
    <link rel="canonical" href="https://iseewaves.pk" />

    <!-- ===================== OPEN GRAPH (Facebook, LinkedIn, WhatsApp) ===================== -->
    <meta property="og:type" content="website" />
    <meta property="og:url" content="https://iseewaves.pk" />
    <meta property="og:title" content="iSeeWaves | Cybersecurity & IT Services" />
    <meta property="og:description" content="iSeeWaves delivers enterprise-grade cybersecurity solutions — from penetration testing and vulnerability management to digital forensics and compliance frameworks." />
    <meta property="og:image" content="/images/iSeeWaves.png" />
    <meta property="og:image:width" content="1200" />
    <meta property="og:image:height" content="630" />
    <meta property="og:image:alt" content="iSeeWaves - Cybersecurity & IT Services" />
    <meta property="og:site_name" content="iSeeWaves (Private) Limited" />
    <meta property="og:locale" content="en_PK" />

    <!-- ===================== TWITTER / X CARD ===================== -->
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:url" content="https://iseewaves.pk" />
    <meta name="twitter:title" content="iSeeWaves | Cybersecurity & IT Services" />
    <meta name="twitter:description" content="iSeeWaves delivers enterprise-grade cybersecurity solutions — from penetration testing and vulnerability management to digital forensics and compliance frameworks." />
    <meta name="twitter:image" content="https://iseewaves.pk/og-image.png" />
    <meta name="twitter:image:alt" content="iSeeWaves - Cybersecurity & IT Services" />

    <!-- ===================== THEME & APP META ===================== -->
    <meta name="theme-color" content="#0a0f1e" />
    <meta name="color-scheme" content="dark" />
    <meta name="application-name" content="iSeeWaves" />
    <meta name="generator" content="iSeeWaves" />

    <!-- ===================== FAVICONS ===================== -->
    <link rel="icon" type="image/svg+xml" href="/favicon.svg" />
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png" />
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png" />
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png" />
    <link rel="manifest" href="/site.webmanifest" />

    <!-- ===================== PERFORMANCE: PRECONNECT ===================== -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

    <!-- ===================== STRUCTURED DATA (JSON-LD) ===================== -->
    <script type="application/ld+json">
      {
        "@context": "https://schema.org",
        "@type": "Organization",
        "name": "ISEEWAVES (PRIVATE) LIMITED",
        "url": "https://iseewaves.pk",
        "logo": "/images/iSeeWaves.png",
        "description": "iSeeWaves is a leading cybersecurity and IT services provider delivering vulnerability management, penetration testing, digital forensics, and audit-ready compliance frameworks.",
        "foundingDate": "2025",
        "address": {
          "@type": "PostalAddress",
          "addressCountry": "PK"
        },
        "sameAs": [
          "https://www.linkedin.com/company/iseewaves",
          "https://x.com/iseewaves_"
        ],
        "contactPoint": {
          "@type": "ContactPoint",
          "contactType": "customer support",
          "email": "info@iseewaves.pk",
          "availableLanguage": ["English", "Urdu"]
        },
        "offers": [
          { "@type": "Offer", "name": "Penetration Testing" },
          { "@type": "Offer", "name": "Vulnerability Management" },
          { "@type": "Offer", "name": "Digital Forensics" },
          { "@type": "Offer", "name": "GRC & Compliance" },
          { "@type": "Offer", "name": "SBOM / myESI" }
          { "@type": "Offer", "name": "vCISO" },
        ]
      }
    </script>
  </head>

  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.tsx"></script>
  </body>
</html>

R17FILEEOF_1

mkdir -p "$(dirname "public/.htaccess")"
cat > "public/.htaccess" << 'R17FILEEOF_2'
# This file tells Apache to send every request to index.html, so React Router
# can handle the URL itself. Without this, visiting a page directly (e.g.
# yoursite.com/about) or refreshing while on one shows a 404, because there is
# no real "about" file on the server - only index.html, which loads the app
# that then reads the URL and shows the right page.

# Force HTTPS. The X-Forwarded-Proto check avoids redirect loops on hosting
# setups where Apache sits behind a proxy/load balancer that already
# terminates TLS (in which case %{HTTPS} looks "off" even though the visitor
# is on https://).
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteCond %{HTTPS} off
  RewriteCond %{HTTP:X-Forwarded-Proto} !https
  RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]
</IfModule>

<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /

  # If the request is for a real file or folder that exists, serve it directly
  # (this lets actual assets like /images/logo.png and /assets/app.js through)
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d

  # Otherwise, hand it to index.html and let React Router take over
  RewriteRule . /index.html [L]
</IfModule>

R17FILEEOF_2

mkdir -p "$(dirname "src/App.tsx")"
cat > "src/App.tsx" << 'R17FILEEOF_3'
/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

import { Suspense, lazy, useEffect } from 'react';
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
import CookieConsent from './components/CookieConsent';

// Every page below is loaded on demand (code-split) instead of all at once,
// so visiting the homepage doesn't download the code for every other page
// on the site. This is what fixes the "chunk larger than 500kB" build warning.
const AboutPage = lazy(() => import('./pages/AboutPage'));
const ContactPage = lazy(() => import('./pages/ContactPage'));
const PCAPage = lazy(() => import('./pages/PCAPage'));
const MyesiLoginPage = lazy(() => import('./pages/MyesiLoginPage'));
const LegalPage = lazy(() => import('./pages/LegalPage'));
const PrivacyPolicyPage = lazy(() => import('./pages/PrivacyPolicyPage'));
const TermsOfServicePage = lazy(() => import('./pages/TermsOfServicePage'));
const CookiePolicyPage = lazy(() => import('./pages/CookiePolicyPage'));
const DemoPage = lazy(() => import('./pages/DemoPage'));
const AllReportsPage = lazy(() => import('./pages/AllReportsPage'));
const CompliancePage = lazy(() => import('./pages/CompliancePage'));
const ServicesPage = lazy(() => import('./pages/ServicesPage'));
const BecomePartnerPage = lazy(() => import('./pages/partners/BecomePartnerPage'));
const FindPartnerPage = lazy(() => import('./pages/partners/FindPartnerPage'));
const PartnerPortalPage = lazy(() => import('./pages/partners/PartnerPortalPage'));
const PartnerProgramsPage = lazy(() => import('./pages/partners/PartnerProgramsPage'));
const TrainingPage = lazy(() => import('./pages/resources/TrainingPage'));
const DocumentationPage = lazy(() => import('./pages/resources/DocumentationPage'));
const CommunityPage = lazy(() => import('./pages/resources/CommunityPage'));
const TrustPage = lazy(() => import('./pages/resources/TrustPage'));
const ExecutiveTeamPage = lazy(() => import('./pages/company/ExecutiveTeamPage'));
const InvestorRelationsPage = lazy(() => import('./pages/company/InvestorRelationsPage'));
const CareersPage = lazy(() => import('./pages/CareersPage'));
const ServiceDetailPage = lazy(() => import('./pages/ServiceDetailPage'));
const TrainingDetailPage = lazy(() => import('./pages/TrainingDetailPage'));
const ComparePlansPage = lazy(() => import('./pages/partners/ComparePlansPage'));
const NotFoundPage = lazy(() => import('./pages/NotFoundPage'));

function PageLoader() {
  return (
    <div className="min-h-screen flex items-center justify-center">
      <div className="w-8 h-8 border-3 border-teal-500 border-t-transparent rounded-full animate-spin" />
    </div>
  );
}

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
            <Suspense fallback={<PageLoader />}>
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
                <Route path="*" element={<NotFoundPage />} />
              </Routes>
            </Suspense>
          </main>
          <Footer />
          <CookieConsent />
        </div>
      </div>
    </Router>
  );
}

R17FILEEOF_3

mkdir -p "$(dirname "src/components/AboutContent.tsx")"
cat > "src/components/AboutContent.tsx" << 'R17FILEEOF_4'
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
                <img src="/images/Founder.jpeg" alt="Portrait of the iSeeWaves Founder and CEO" className="w-full h-full object-cover rounded-2xl" />
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

R17FILEEOF_4

mkdir -p "$(dirname "src/components/ContactHiring.tsx")"
cat > "src/components/ContactHiring.tsx" << 'R17FILEEOF_5'
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
              <input type="text" name="website_hp" style={{ position: 'absolute', left: '-9999px', opacity: 0 }} tabIndex={-1} autoComplete="off" aria-hidden="true" />
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

R17FILEEOF_5

mkdir -p "$(dirname "src/components/Footer.tsx")"
cat > "src/components/Footer.tsx" << 'R17FILEEOF_6'
import { Linkedin, Twitter, Facebook, Instagram, ChevronDown, ChevronUp, MapPin, Mail } from 'lucide-react';
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
            <img src="/images/iSeeWaves.png" alt="iSeeWaves logo" className="h-8 w-auto" />
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

R17FILEEOF_6

mkdir -p "$(dirname "src/components/Navbar.tsx")"
cat > "src/components/Navbar.tsx" << 'R17FILEEOF_7'
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
            <img src="/images/iSeeWaves.png" alt="iSeeWaves logo" className="md:h-8 w-auto" />
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

R17FILEEOF_7

mkdir -p "$(dirname "src/hooks/useSubmitForm.ts")"
cat > "src/hooks/useSubmitForm.ts" << 'R17FILEEOF_8'
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
      // Honeypot: real visitors never see or fill this field, so if it has a
      // value the submission is from a bot. Silently drop it without an
      // error, so the bot gets no signal that it was caught.
      if (data.website_hp) {
        setStatus('idle');
        return;
      }
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

R17FILEEOF_8

mkdir -p "$(dirname "src/pages/AboutPage.tsx")"
cat > "src/pages/AboutPage.tsx" << 'R17FILEEOF_9'
import { ArrowLeft } from 'lucide-react';
import { Link } from 'react-router-dom';
import AboutContent from '../components/AboutContent';
import { useDocumentTitle } from '../hooks/useDocumentTitle';

export default function AboutPage() {
  useDocumentTitle(
    'About Us | iSeeWaves',
    'Learn about iSeeWaves, a Pakistani cybersecurity and AI company delivering enterprise-grade security solutions and the myESI platform.'
  );
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

R17FILEEOF_9

mkdir -p "$(dirname "src/pages/AllReportsPage.tsx")"
cat > "src/pages/AllReportsPage.tsx" << 'R17FILEEOF_10'
import { motion } from 'motion/react';
import { FileText, ExternalLink, ArrowLeft } from 'lucide-react';
import { Link } from 'react-router-dom';
import { useDocumentTitle } from '../hooks/useDocumentTitle';

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
  useDocumentTitle(
    'Security Reports & Briefings | iSeeWaves',
    'Browse iSeeWaves threat briefings and research reports on emerging cybersecurity risks.'
  );
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

R17FILEEOF_10

mkdir -p "$(dirname "src/pages/CareersPage.tsx")"
cat > "src/pages/CareersPage.tsx" << 'R17FILEEOF_11'
import { motion } from 'motion/react';
import { ArrowLeft, Send, Briefcase, Loader2 } from 'lucide-react';
import { Link } from 'react-router-dom';
import { useSubmitForm } from '../hooks/useSubmitForm';
import FormToast from '../components/FormToast';
import { useDocumentTitle } from '../hooks/useDocumentTitle';

export default function CareersPage() {
  useDocumentTitle(
    'Careers | iSeeWaves',
    'Explore open roles at iSeeWaves and apply to join our cybersecurity and AI team.'
  );
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
            <input type="text" name="website_hp" style={{ position: 'absolute', left: '-9999px', opacity: 0 }} tabIndex={-1} autoComplete="off" aria-hidden="true" />
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

R17FILEEOF_11

mkdir -p "$(dirname "src/pages/CompliancePage.tsx")"
cat > "src/pages/CompliancePage.tsx" << 'R17FILEEOF_12'
import React, { useState } from 'react';
import { motion, AnimatePresence } from 'motion/react';
import { Shield, ArrowRight, CheckCircle, AlertTriangle, ExternalLink, X } from 'lucide-react';
import { useParams, Navigate, Link } from 'react-router-dom';
import { complianceData } from '../data/complianceData';
import { useDocumentTitle } from '../hooks/useDocumentTitle';

export default function CompliancePage() {
  const { id } = useParams<{ id: string }>();
  const compliance = complianceData.find(c => c.id === id);

  useDocumentTitle(
    compliance ? `${compliance.title} Compliance | iSeeWaves` : 'Compliance | iSeeWaves',
    compliance ? compliance.purpose : 'Explore iSeeWaves compliance and regulatory support services.'
  );

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
    const form = e.currentTarget as HTMLFormElement;
    const honeypot = (form.elements.namedItem('website_hp') as HTMLInputElement | null)?.value;
    if (honeypot) return;
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
                      <input type="text" name="website_hp" style={{ position: 'absolute', left: '-9999px', opacity: 0 }} tabIndex={-1} autoComplete="off" aria-hidden="true" />
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

R17FILEEOF_12

mkdir -p "$(dirname "src/pages/ContactPage.tsx")"
cat > "src/pages/ContactPage.tsx" << 'R17FILEEOF_13'
import { ArrowLeft } from 'lucide-react';
import { Link } from 'react-router-dom';
import ContactHiring from '../components/ContactHiring';
import { useDocumentTitle } from '../hooks/useDocumentTitle';

export default function ContactPage() {
  useDocumentTitle(
    'Contact Us | iSeeWaves',
    'Get in touch with iSeeWaves for cybersecurity services, partnership inquiries, or general questions.'
  );
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

R17FILEEOF_13

mkdir -p "$(dirname "src/pages/CookiePolicyPage.tsx")"
cat > "src/pages/CookiePolicyPage.tsx" << 'R17FILEEOF_14'
import { motion } from 'motion/react';
import { Shield } from 'lucide-react';
import { useDocumentTitle } from '../hooks/useDocumentTitle';

export default function CookiePolicyPage() {
  useDocumentTitle(
    'Cookie Policy | iSeeWaves',
    'Read how iSeeWaves uses cookies to improve your experience and analyze site traffic.'
  );
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

R17FILEEOF_14

mkdir -p "$(dirname "src/pages/LegalPage.tsx")"
cat > "src/pages/LegalPage.tsx" << 'R17FILEEOF_15'
import { motion } from 'motion/react';
import { Shield } from 'lucide-react';
import { useDocumentTitle } from '../hooks/useDocumentTitle';

export default function LegalPage() {
  useDocumentTitle(
    'Legal Notice | iSeeWaves',
    'Legal and company registration information for iSeeWaves (Private) Limited.'
  );
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

R17FILEEOF_15

mkdir -p "$(dirname "src/pages/MyesiLoginPage.tsx")"
cat > "src/pages/MyesiLoginPage.tsx" << 'R17FILEEOF_16'
import { motion } from 'motion/react';
import { ArrowLeft, LogIn, Loader2, Send } from 'lucide-react';
import { Link } from 'react-router-dom';
import { useSubmitForm } from '../hooks/useSubmitForm';
import FormToast from '../components/FormToast';
import { useDocumentTitle } from '../hooks/useDocumentTitle';

export default function MyesiLoginPage() {
  useDocumentTitle(
    'myESI Portal Login | iSeeWaves',
    'Request access to the myESI portal, iSeeWaves\' automated SBOM-based software supply chain security platform.'
  );
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
              <input type="text" name="website_hp" style={{ position: 'absolute', left: '-9999px', opacity: 0 }} tabIndex={-1} autoComplete="off" aria-hidden="true" />
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

R17FILEEOF_16

mkdir -p "$(dirname "src/pages/PCAPage.tsx")"
cat > "src/pages/PCAPage.tsx" << 'R17FILEEOF_17'
import { useState } from 'react';
import { motion, AnimatePresence } from 'motion/react';
import { useDocumentTitle } from '../hooks/useDocumentTitle';
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
  useDocumentTitle(
    'Pakistan Cybersecurity Alliance | iSeeWaves',
    'Learn about the Pakistan Cybersecurity Alliance (PCA), its community platform, Threat Horizons Pakistan events, and outreach initiatives.'
  );
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
            <img src="/images/PCA.png" alt="Pakistan Cybersecurity Alliance logo" className="w-full h-full object-contain" />
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
                        <img src={img} alt={`Photo from ${ep.title}`} className="w-full h-full object-cover" loading="lazy" />
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
            <img src={lightboxImg} alt="Enlarged PCA event photo" className="max-w-full max-h-full rounded-lg object-contain" />
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

R17FILEEOF_17

mkdir -p "$(dirname "src/pages/PrivacyPolicyPage.tsx")"
cat > "src/pages/PrivacyPolicyPage.tsx" << 'R17FILEEOF_18'
import { motion } from 'motion/react';
import { Shield } from 'lucide-react';
import { useDocumentTitle } from '../hooks/useDocumentTitle';

export default function PrivacyPolicyPage() {
  useDocumentTitle(
    'Privacy Policy | iSeeWaves',
    'Read the iSeeWaves privacy policy to understand how we collect, use, and protect your information.'
  );
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

R17FILEEOF_18

mkdir -p "$(dirname "src/pages/ServiceDetailPage.tsx")"
cat > "src/pages/ServiceDetailPage.tsx" << 'R17FILEEOF_19'
import { motion } from 'motion/react';
import { ArrowLeft, Send, CheckCircle2, Loader2 } from 'lucide-react';
import { Link, useParams, Navigate } from 'react-router-dom';
import { getServiceBySlug } from '../data/servicesData';
import { useSubmitForm } from '../hooks/useSubmitForm';
import FormToast from '../components/FormToast';
import { useDocumentTitle } from '../hooks/useDocumentTitle';

export default function ServiceDetailPage() {
  const { slug } = useParams<{ slug: string }>();
  const service = slug ? getServiceBySlug(slug) : undefined;
  const { status, handleSubmit } = useSubmitForm(
    service ? { subject: `Service Request: ${service.title}`, service: service.title } : undefined
  );

  useDocumentTitle(
    service ? `${service.title} | iSeeWaves` : 'Service | iSeeWaves',
    service ? service.description : 'Explore iSeeWaves cybersecurity services.'
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
                <input type="text" name="website_hp" style={{ position: 'absolute', left: '-9999px', opacity: 0 }} tabIndex={-1} autoComplete="off" aria-hidden="true" />
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

R17FILEEOF_19

mkdir -p "$(dirname "src/pages/ServicesPage.tsx")"
cat > "src/pages/ServicesPage.tsx" << 'R17FILEEOF_20'
import { motion } from 'motion/react';
import { ShieldAlert, ShieldCheck, FileCheck, Cloud, UserCog, ArrowLeft, ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';
import { servicesData } from '../data/servicesData';
import { useDocumentTitle } from '../hooks/useDocumentTitle';

const categoryMeta: Record<string, { icon: any; color: string; bg: string; border: string }> = {
  'Offensive Security': { icon: ShieldAlert, color: 'text-red-400', bg: 'bg-red-400/10', border: 'border-red-400/20' },
  'Defensive Security': { icon: ShieldCheck, color: 'text-blue-400', bg: 'bg-blue-400/10', border: 'border-blue-400/20' },
  'vCISO': { icon: UserCog, color: 'text-amber-400', bg: 'bg-amber-400/10', border: 'border-amber-400/20' },
  'Compliance & GRC': { icon: FileCheck, color: 'text-purple-400', bg: 'bg-purple-400/10', border: 'border-purple-400/20' },
  'Cloud & AI Security': { icon: Cloud, color: 'text-teal-400', bg: 'bg-teal-400/10', border: 'border-teal-400/20' },
};

export default function ServicesPage() {
  useDocumentTitle(
    'Cybersecurity Services | iSeeWaves',
    'Explore iSeeWaves\' full range of cybersecurity services, including offensive security, defensive security, compliance & GRC, and cloud & AI security.'
  );
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

R17FILEEOF_20

mkdir -p "$(dirname "src/pages/TermsOfServicePage.tsx")"
cat > "src/pages/TermsOfServicePage.tsx" << 'R17FILEEOF_21'
import { motion } from 'motion/react';
import { Shield } from 'lucide-react';
import { useDocumentTitle } from '../hooks/useDocumentTitle';

export default function TermsOfServicePage() {
  useDocumentTitle(
    'Terms of Service | iSeeWaves',
    'Read the terms of service governing your use of iSeeWaves products, services, and website.'
  );
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

R17FILEEOF_21

mkdir -p "$(dirname "src/pages/TrainingDetailPage.tsx")"
cat > "src/pages/TrainingDetailPage.tsx" << 'R17FILEEOF_22'
import { motion } from 'motion/react';
import { ArrowLeft, Send, CheckCircle2, Loader2 } from 'lucide-react';
import { Link, useParams, Navigate } from 'react-router-dom';
import { getTrainingBySlug } from '../data/trainingData';
import { useSubmitForm } from '../hooks/useSubmitForm';
import FormToast from '../components/FormToast';
import { useDocumentTitle } from '../hooks/useDocumentTitle';

export default function TrainingDetailPage() {
  const { slug } = useParams<{ slug: string }>();
  const training = slug ? getTrainingBySlug(slug) : undefined;
  const { status, handleSubmit } = useSubmitForm(
    training ? { subject: `Training Booking: ${training.title}`, training: training.title } : undefined
  );

  useDocumentTitle(
    training ? `${training.title} | iSeeWaves` : 'Training | iSeeWaves',
    training ? training.description : 'Explore iSeeWaves cybersecurity training programs.'
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
                <input type="text" name="website_hp" style={{ position: 'absolute', left: '-9999px', opacity: 0 }} tabIndex={-1} autoComplete="off" aria-hidden="true" />
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

R17FILEEOF_22

mkdir -p "$(dirname "src/pages/company/ExecutiveTeamPage.tsx")"
cat > "src/pages/company/ExecutiveTeamPage.tsx" << 'R17FILEEOF_23'
import { motion } from 'motion/react';
import { ArrowLeft, Quote, Users } from 'lucide-react';
import { Link } from 'react-router-dom';
import { useDocumentTitle } from '../../hooks/useDocumentTitle';

export default function ExecutiveTeamPage() {
  useDocumentTitle(
    'Executive Team | iSeeWaves',
    'Meet the executive team leading iSeeWaves\' cybersecurity and AI company.'
  );
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
              <img src="/images/Founder.jpeg" alt="Portrait of the iSeeWaves Founder and CEO" className="w-full h-full object-cover rounded-2xl" />
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

R17FILEEOF_23

mkdir -p "$(dirname "src/pages/company/InvestorRelationsPage.tsx")"
cat > "src/pages/company/InvestorRelationsPage.tsx" << 'R17FILEEOF_24'
import { motion } from 'motion/react';
import { ArrowLeft, TrendingUp, Target, Building2, Rocket, ShieldCheck, Send, Loader2 } from 'lucide-react';
import { Link } from 'react-router-dom';
import { useSubmitForm } from '../../hooks/useSubmitForm';
import FormToast from '../../components/FormToast';
import { useDocumentTitle } from '../../hooks/useDocumentTitle';

export default function InvestorRelationsPage() {
  useDocumentTitle(
    'Investor Relations | iSeeWaves',
    'Investor relations information for iSeeWaves, a NICAT-incubated cybersecurity and AI company.'
  );
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
                  <input type="text" name="website_hp" style={{ position: 'absolute', left: '-9999px', opacity: 0 }} tabIndex={-1} autoComplete="off" aria-hidden="true" />
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

R17FILEEOF_24

mkdir -p "$(dirname "src/pages/partners/BecomePartnerPage.tsx")"
cat > "src/pages/partners/BecomePartnerPage.tsx" << 'R17FILEEOF_25'
import { Handshake } from 'lucide-react';
import SimplePage from '../SimplePage';
import { useDocumentTitle } from '../../hooks/useDocumentTitle';

export default function BecomePartnerPage() {
  useDocumentTitle(
    'Become a Partner | iSeeWaves',
    'Join the iSeeWaves partner network and bring myESI software supply chain security to your customers.'
  );
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

R17FILEEOF_25

mkdir -p "$(dirname "src/pages/partners/ComparePlansPage.tsx")"
cat > "src/pages/partners/ComparePlansPage.tsx" << 'R17FILEEOF_26'
import { motion } from 'motion/react';
import { ArrowLeft, Check, Minus } from 'lucide-react';
import { Link } from 'react-router-dom';
import { useDocumentTitle } from '../../hooks/useDocumentTitle';

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
  useDocumentTitle(
    'Compare Partner Plans | iSeeWaves',
    'Compare iSeeWaves referral, reseller, and implementation partner plans side by side.'
  );
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

R17FILEEOF_26

mkdir -p "$(dirname "src/pages/partners/FindPartnerPage.tsx")"
cat > "src/pages/partners/FindPartnerPage.tsx" << 'R17FILEEOF_27'
import { Search } from 'lucide-react';
import SimplePage from '../SimplePage';
import { useDocumentTitle } from '../../hooks/useDocumentTitle';

export default function FindPartnerPage() {
  useDocumentTitle(
    'Find a Partner | iSeeWaves',
    'Find a certified iSeeWaves partner in your region to deploy and manage myESI.'
  );
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

R17FILEEOF_27

mkdir -p "$(dirname "src/pages/partners/PartnerPortalPage.tsx")"
cat > "src/pages/partners/PartnerPortalPage.tsx" << 'R17FILEEOF_28'
import { motion } from 'motion/react';
import { ArrowLeft, LayoutDashboard, Loader2, Send } from 'lucide-react';
import { Link } from 'react-router-dom';
import { useSubmitForm } from '../../hooks/useSubmitForm';
import FormToast from '../../components/FormToast';
import { useDocumentTitle } from '../../hooks/useDocumentTitle';

export default function PartnerPortalPage() {
  useDocumentTitle(
    'Partner Portal | iSeeWaves',
    'Request access to the iSeeWaves partner portal for deal registration, resources, and support.'
  );
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
              <input type="text" name="website_hp" style={{ position: 'absolute', left: '-9999px', opacity: 0 }} tabIndex={-1} autoComplete="off" aria-hidden="true" />
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

R17FILEEOF_28

mkdir -p "$(dirname "src/pages/partners/PartnerProgramsPage.tsx")"
cat > "src/pages/partners/PartnerProgramsPage.tsx" << 'R17FILEEOF_29'
import { Layers } from 'lucide-react';
import SimplePage from '../SimplePage';
import { useDocumentTitle } from '../../hooks/useDocumentTitle';

export default function PartnerProgramsPage() {
  useDocumentTitle(
    'Partner Programs | iSeeWaves',
    'Compare iSeeWaves partner tracks: referral, reseller, and implementation partner programs.'
  );
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

R17FILEEOF_29

mkdir -p "$(dirname "src/pages/resources/CommunityPage.tsx")"
cat > "src/pages/resources/CommunityPage.tsx" << 'R17FILEEOF_30'
import { Users } from 'lucide-react';
import SimplePage from '../SimplePage';
import { useDocumentTitle } from '../../hooks/useDocumentTitle';

export default function CommunityPage() {
  useDocumentTitle(
    'Customer Community | iSeeWaves',
    'Connect with other myESI customers, share best practices, and shape the product roadmap.'
  );
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

R17FILEEOF_30

mkdir -p "$(dirname "src/pages/resources/DocumentationPage.tsx")"
cat > "src/pages/resources/DocumentationPage.tsx" << 'R17FILEEOF_31'
import { BookOpen } from 'lucide-react';
import SimplePage from '../SimplePage';
import { useDocumentTitle } from '../../hooks/useDocumentTitle';

export default function DocumentationPage() {
  useDocumentTitle(
    'Product Documentation | iSeeWaves',
    'Documentation for setting up, integrating, and operating the myESI platform.'
  );
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

R17FILEEOF_31

mkdir -p "$(dirname "src/pages/resources/TrainingPage.tsx")"
cat > "src/pages/resources/TrainingPage.tsx" << 'R17FILEEOF_32'
import { motion } from 'motion/react';
import { GraduationCap, ArrowLeft, ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';
import { trainingData } from '../../data/trainingData';
import { useDocumentTitle } from '../../hooks/useDocumentTitle';

export default function TrainingPage() {
  useDocumentTitle(
    'Security Training Programs | iSeeWaves',
    'Browse iSeeWaves cybersecurity training programs, from phishing awareness to ethical hacking and digital forensics.'
  );
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

R17FILEEOF_32

mkdir -p "$(dirname "src/pages/resources/TrustPage.tsx")"
cat > "src/pages/resources/TrustPage.tsx" << 'R17FILEEOF_33'
import { ShieldCheck } from 'lucide-react';
import SimplePage from '../SimplePage';
import { useDocumentTitle } from '../../hooks/useDocumentTitle';

export default function TrustPage() {
  useDocumentTitle(
    'myESI Trust | iSeeWaves',
    'How iSeeWaves secures the myESI platform that secures your software supply chain.'
  );
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

R17FILEEOF_33

mkdir -p "$(dirname "src/components/CookieConsent.tsx")"
cat > "src/components/CookieConsent.tsx" << 'R17FILEEOF_34'
import { useEffect, useState } from 'react';
import { AnimatePresence, motion } from 'motion/react';
import { Link } from 'react-router-dom';

const CONSENT_KEY = 'iseewaves_cookie_consent';

export default function CookieConsent() {
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    try {
      if (!localStorage.getItem(CONSENT_KEY)) {
        setVisible(true);
      }
    } catch {
      // localStorage unavailable (private browsing, etc.) - just don't show the banner.
    }
  }, []);

  const accept = () => {
    try {
      localStorage.setItem(CONSENT_KEY, 'accepted');
    } catch {
      // ignore - nothing else to do if storage isn't available
    }
    setVisible(false);
  };

  return (
    <AnimatePresence>
      {visible && (
        <motion.div
          initial={{ opacity: 0, y: 40 }}
          animate={{ opacity: 1, y: 0 }}
          exit={{ opacity: 0, y: 40 }}
          transition={{ duration: 0.3 }}
          className="fixed bottom-0 left-0 right-0 z-50 p-4 sm:p-6"
        >
          <div className="max-w-4xl mx-auto glass-card border border-gray-200 bg-white/95 rounded-2xl shadow-lg px-6 py-5 flex flex-col sm:flex-row items-center gap-4">
            <p className="text-sm text-gray-600 flex-1 text-center sm:text-left">
              We use cookies to improve your experience and analyze site traffic. By continuing to use this site, you agree to our use of cookies. See our{' '}
              <Link to="/privacy" className="text-teal-500 hover:underline font-medium">
                Privacy Policy
              </Link>{' '}
              for details.
            </p>
            <button
              onClick={accept}
              className="shrink-0 px-6 py-2.5 rounded-full bg-teal-500 hover:bg-teal-600 text-white font-semibold text-sm transition-all hover:scale-105"
            >
              Accept
            </button>
          </div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}

R17FILEEOF_34

mkdir -p "$(dirname "src/hooks/useDocumentTitle.ts")"
cat > "src/hooks/useDocumentTitle.ts" << 'R17FILEEOF_35'
import { useEffect } from 'react';

export function useDocumentTitle(title: string, description?: string) {
  useEffect(() => {
    const prevTitle = document.title;
    document.title = title;
    let descTag: HTMLMetaElement | null = null;
    let prevDesc: string | null = null;
    if (description) {
      descTag = document.querySelector('meta[name="description"]');
      if (descTag) {
        prevDesc = descTag.getAttribute('content');
        descTag.setAttribute('content', description);
      }
    }
    return () => {
      document.title = prevTitle;
      if (descTag && prevDesc !== null) descTag.setAttribute('content', prevDesc);
    };
  }, [title, description]);
}

R17FILEEOF_35

mkdir -p "$(dirname "src/pages/NotFoundPage.tsx")"
cat > "src/pages/NotFoundPage.tsx" << 'R17FILEEOF_36'
import { motion } from 'motion/react';
import { ArrowLeft, Compass } from 'lucide-react';
import { Link } from 'react-router-dom';
import { useDocumentTitle } from '../hooks/useDocumentTitle';

export default function NotFoundPage() {
  useDocumentTitle(
    '404 - Page Not Found | iSeeWaves',
    "The page you're looking for doesn't exist or may have moved. Return to the iSeeWaves homepage."
  );

  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-2xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          className="mb-8 flex justify-center"
        >
          <div className="w-16 h-16 rounded-xl bg-teal-400/10 flex items-center justify-center">
            <Compass className="w-8 h-8 text-teal-400" />
          </div>
        </motion.div>

        <motion.h1
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.1 }}
          className="text-4xl md:text-6xl font-bold text-[#0B2545] mb-4"
        >
          404 - Page Not Found
        </motion.h1>

        <motion.p
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.2 }}
          className="text-lg text-gray-600 mb-10"
        >
          The page you're looking for doesn't exist or may have been moved.
        </motion.p>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.3 }}
        >
          <Link
            to="/"
            className="inline-flex items-center gap-2 px-8 py-4 rounded-full bg-teal-500 hover:bg-teal-600 text-white font-semibold transition-all hover:scale-105"
          >
            <ArrowLeft className="w-4 h-4" />
            Back to Home
          </Link>
        </motion.div>
      </div>
    </div>
  );
}

R17FILEEOF_36

echo "All files written. Run npm install (if needed), npx tsc --noEmit, and npm run build to verify."