import { motion } from 'motion/react';

const partners = [
  { name: 'International Islamic University Islamabad', logo: '/images/IIUI-logos-2.jpg' },
  { name: 'Pakistan Cybersecurity Alliance', logo: '/images/PCA.png' },
  { name: 'P@SHA Startup Hub', logo: '/images/pasha-startup-hub.png' },
  { name: 'National Incubation Center for Aerospace Technologies', logo: '/images/nicat.png' },
  { name: 'Ignite National Technology Fund', logo: '/images/ignite-logo.png' },
  { name: 'Chamber of Commerce & Industry, Islamabad', logo: '/images/icci.png' },
  { name: 'HerVoice', logo: '/images/HerVoice.png' },
  { name: 'Sahiba Writing Squad - SWS', logo: '/images/SWS.jpg' },
  { name: 'Nas Fist Solutions (Private) Limited', logo: '/images/nas.png' },
  { name: 'TMUC Abbottabad', logo: '/images/TMUC-logo.png' },
  { name: 'National Youth Leadership Programme (NYLP)', logo: '/images/nylp.png' },
  { name: 'Empowerise Her', logo: '/images/Empowerise-Her.png' },
];

const loopPartners = [...partners, ...partners];

export default function PartnersSlider() {
  return (
    <section className="py-20 relative z-10 border-t border-gray-100 overflow-hidden">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <motion.p
          initial={{ opacity: 0, y: 10 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="text-center text-gray-600 text-sm font-semibold tracking-widest uppercase mb-10"
        >
          Our Partners
        </motion.p>
      </div>

      <div className="relative w-full">
        <div className="absolute left-0 top-0 bottom-0 w-24 bg-gradient-to-r from-[#F6F8FB] to-transparent z-10 pointer-events-none" />
        <div className="absolute right-0 top-0 bottom-0 w-24 bg-gradient-to-l from-[#F6F8FB] to-transparent z-10 pointer-events-none" />
        <div className="partner-marquee-track flex items-center gap-6 w-max">
          {loopPartners.map((partner, idx) => (
            <div
              key={`${partner.name}-${idx}`}
              title={partner.name}
              className="glass-card rounded-xl border border-gray-200 px-8 py-5 flex items-center justify-center shrink-0 grayscale hover:grayscale-0 opacity-70 hover:opacity-100 transition-all h-20 w-40"
            >
              <img src={partner.logo} alt={partner.name} className="max-h-12 max-w-full object-contain" />
            </div>
          ))}
        </div>
      </div>

      <style>{`
        .partner-marquee-track {
          animation: partner-marquee 28s linear infinite;
        }
        @keyframes partner-marquee {
          0% { transform: translateX(0); }
          100% { transform: translateX(-50%); }
        }
      `}</style>
    </section>
  );
}
