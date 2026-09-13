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
              </Routes>
            </Suspense>
          </main>
          <Footer />
        </div>
      </div>
    </Router>
  );
}
