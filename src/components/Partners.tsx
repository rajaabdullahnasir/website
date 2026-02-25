import { motion } from 'motion/react';

export default function Partners() {
  const partners = [
    { name: 'International Islamic University Islamabad', logo: 'images/IIUI-logos-2.jpg' },
    { name: 'PISA CERT', logo: 'images/pisa-cert.png' },
    { name: 'Sahiba-Writing Squad', logo: 'images/SWS.jpg' },
    { name: 'Resecurity', logo: 'images/Resecurity.png' },
    //{ name: 'Partner 4', logo: 'https://picsum.photos/seed/p4/200/100?blur=2' },
    //{ name: 'Partner 5', logo: 'https://picsum.photos/seed/p5/200/100?blur=2' },
  ];

  return (
    <section className="py-24 relative overflow-hidden">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="text-center mb-16">
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-5xl font-bold text-white mb-4"
          >
            Our <span className="text-emerald-400">Partners</span>
          </motion.h2>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.2 }}
            className="text-lg text-gray-400 max-w-3xl mx-auto"
          >
            Collaborating with industry leaders to deliver unparalleled security solutions.
          </motion.p>
        </div>

        <div className="flex flex-wrap justify-center gap-8 items-center">
          {partners.map((partner, idx) => (
            <motion.div
              key={idx}
              initial={{ opacity: 0, scale: 0.8 }}
              whileInView={{ opacity: 1, scale: 1 }}
              viewport={{ once: true }}
              transition={{ delay: idx * 0.1 }}
              className="glass-card p-6 rounded-2xl flex items-center justify-center w-48 h-24 grayscale hover:grayscale-0 transition-all duration-300"
            >
              <img
                src={partner.logo}
                alt={partner.name}
                className="max-h-12 object-contain opacity-70 hover:opacity-100 transition-opacity"
                referrerPolicy="no-referrer"
              />
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
