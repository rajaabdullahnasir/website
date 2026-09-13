import { motion } from 'motion/react';

const trustedBy = [
  { short: 'MOITT', full: 'Ministry of IT & Telecom', logo: '/images/moitt-logo.png' },
  { short: 'Ignite', full: 'Ignite National Technology Fund', logo: '/images/ignite-logo.png', large: true },
  { short: 'NICAT', full: 'National Incubation Center for Aerospace Technologies', logo: '/images/nicat.png', large: true },
  { short: 'NACK', full: 'NACK', logo: '/images/nack.png', large: true },
  { short: 'NCERT', full: 'National CERT', logo: '/images/ncert.png' },
  { short: 'IIUI', full: 'International Islamic University Islamabad', logo: '/images/IIUI-logos-2.jpg' },
  { short: 'P@SHA', full: 'P@SHA Startup Hub.', logo: '/images/pasha-startup-hub.png' },
  { short: 'PSEB', full: 'Pakistan Software Export Board', logo: '/images/pseb.png' },
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
              className="flex items-center justify-center grayscale hover:grayscale-0 opacity-60 hover:opacity-100 transition-all duration-300"
              title={org.full}
            >
              <img src={org.logo} alt={org.full} className={org.large ? 'h-24 w-auto object-contain' : 'h-16 w-auto object-contain'} />
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
