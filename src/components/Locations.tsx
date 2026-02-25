import { motion } from 'motion/react';
import { MapPin, Phone, Mail } from 'lucide-react';

export default function Locations() {
  const locations = [
    {
      city: 'Abbottabad',
      address: 'Banda Phagwarian, Abbottabad, KP, Pakistan',
      phone: '+92 314 1966547',
      email: 'abbottabad@iseewaves.com',
    },
    {
      city: 'Islamabad',
      address: 'NICAT, Islamabad, Pakistan',
      phone: '+92 314 1966547',
      email: 'islamabad@iseewaves.com',
    },
  ];

  return (
    <section className="py-24 relative overflow-hidden bg-white/5">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="text-center mb-16">
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-5xl font-bold text-white mb-4"
          >
            Our <span className="text-emerald-400">Locations</span>
          </motion.h2>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.2 }}
            className="text-lg text-gray-400 max-w-3xl mx-auto"
          >
            Find us at our offices in Pakistan. We are always ready to assist you.
          </motion.p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
          {locations.map((loc, idx) => (
            <motion.div
              key={idx}
              initial={{ opacity: 0, x: idx % 2 === 0 ? -20 : 20 }}
              whileInView={{ opacity: 1, x: 0 }}
              viewport={{ once: true }}
              className="glass-card p-8 rounded-3xl flex flex-col items-center text-center hover:border-emerald-500/30 transition-colors"
            >
              <div className="w-16 h-16 rounded-full bg-emerald-500/20 flex items-center justify-center mb-6">
                <MapPin className="w-8 h-8 text-emerald-400" />
              </div>
              <h3 className="text-2xl font-bold text-white mb-4">{loc.city}</h3>
              <p className="text-gray-400 mb-6">{loc.address}</p>
              <div className="space-y-3 w-full">
                <div className="flex items-center justify-center gap-3 text-gray-300">
                  <Phone className="w-5 h-5 text-emerald-400" />
                  <span>{loc.phone}</span>
                </div>
                <div className="flex items-center justify-center gap-3 text-gray-300">
                  <Mail className="w-5 h-5 text-emerald-400" />
                  <span>{loc.email}</span>
                </div>
              </div>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
