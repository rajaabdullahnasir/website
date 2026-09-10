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
