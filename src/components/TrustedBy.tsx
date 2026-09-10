import { motion } from 'motion/react';

const trustedBy = [
  { short: 'MOITT', full: 'Ministry of IT & Telecom' },
  { short: 'Ignite', full: 'Ignite National Technology Fund' },
  { short: 'NICAT', full: 'National Incubation Center' },
  { short: 'NACK', full: 'NACK' },
  { short: 'NCERT', full: 'National CERT' },
  { short: 'IIUI', full: 'International Islamic University Islamabad' },
];

export default function TrustedBy() {
  return (
    <section id="trusted-by" className="py-20 relative z-10 border-t border-gray-100">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <motion.p
          initial={{ opacity: 0, y: 10 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="text-center text-gray-600 text-sm font-semibold tracking-widest uppercase mb-12"
        >
          Trusted By
        </motion.p>
        <div className="flex flex-wrap items-center justify-center gap-x-14 gap-y-8">
          {trustedBy.map((org, idx) => (
            <motion.div
              key={org.short}
              initial={{ opacity: 0, y: 15 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: idx * 0.05 }}
              className="flex flex-col items-center grayscale hover:grayscale-0 opacity-60 hover:opacity-100 transition-all duration-300"
              title={org.full}
            >
              <span className="text-2xl md:text-3xl font-black text-[#0B2545] tracking-tight">{org.short}</span>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
