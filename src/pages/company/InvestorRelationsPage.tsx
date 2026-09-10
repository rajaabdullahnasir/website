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
