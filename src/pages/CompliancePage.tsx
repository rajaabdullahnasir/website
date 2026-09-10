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
