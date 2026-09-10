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
