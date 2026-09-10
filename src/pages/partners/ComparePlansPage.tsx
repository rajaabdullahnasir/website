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
