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
