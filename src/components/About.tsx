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

  const credentials = ['SECP', 'NICAT', 'Ignite', 'MOITT'];

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
                <span
                  key={c}
                  className="text-xl md:text-2xl font-black text-[#0B2545] tracking-tight grayscale hover:grayscale-0 opacity-60 hover:opacity-100 transition-all"
                >
                  {c}
                </span>
              ))}
            </div>
          </div>
        </motion.div>
      </div>
    </section>
  );
}
