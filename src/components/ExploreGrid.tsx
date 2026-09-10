import { motion } from 'motion/react';
import { Link } from 'react-router-dom';
import {
  Info,
  ShieldCheck,
  LayoutGrid,
  Package,
  Headset,
  FileText,
  Mail,
  Wrench,
} from 'lucide-react';

const items = [
  { icon: Info, title: 'About Us', desc: 'Who we are and our mission', to: '/about' },
  { icon: ShieldCheck, title: 'Our Platform', desc: 'Explore what we\'ve built', to: '/myesi' },
  { icon: LayoutGrid, title: '8 Audits', desc: 'One-click supply chain audits', to: '/myesi#features' },
  { icon: Package, title: 'Packages', desc: 'Starter, Business, Enterprise', to: '/myesi#packages' },
  { icon: Headset, title: 'Support', desc: 'Trial, technical support & FAQs', to: '/myesi#support' },
  { icon: Wrench, title: 'Services', desc: 'Hands-on security engagements', to: '/services' },
  { icon: FileText, title: 'Reports', desc: 'Whitepapers and research', to: '/reports' },
  { icon: Mail, title: 'Contact', desc: 'Talk to our team', to: '/contact' },
];

export default function ExploreGrid() {
  return (
    <section id="explore" className="py-24 relative z-10">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-14">
          <motion.span
            initial={{ opacity: 0, y: 10 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-teal-400 text-sm font-bold tracking-widest uppercase"
          >
            Explore
          </motion.span>
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-5xl font-bold text-[#0B2545] mt-4"
          >
            Everything We <span className="text-teal-400">Offer</span>
          </motion.h2>
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          {items.map((item, idx) => (
            <motion.div
              key={item.title}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: idx * 0.05 }}
            >
              <Link
                to={item.to}
                className="group block glass-card rounded-2xl border border-gray-200 hover:border-teal-500/40 p-6 h-full transition-all duration-300"
              >
                <div className="w-11 h-11 rounded-xl bg-teal-400/10 flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
                  <item.icon className="w-5 h-5 text-teal-400" />
                </div>
                <h3 className="text-lg font-bold text-[#0B2545] mb-1">{item.title}</h3>
                <p className="text-sm text-gray-600">{item.desc}</p>
              </Link>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
