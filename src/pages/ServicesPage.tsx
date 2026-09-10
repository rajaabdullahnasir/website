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
