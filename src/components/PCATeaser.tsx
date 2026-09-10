import { motion } from 'motion/react';
import { Users, ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';

export default function PCATeaser() {
  return (
    <section id="pca" className="py-24 relative z-10">
      <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="glass-card rounded-2xl border border-gray-200 p-8 md:p-12 flex flex-col md:flex-row items-center gap-8"
        >
          <div className="w-16 h-16 shrink-0 rounded-2xl bg-teal-400/10 flex items-center justify-center">
            <Users className="w-8 h-8 text-teal-400" />
          </div>
          <div className="flex-1 text-center md:text-left">
            <span className="text-teal-400 text-xs font-bold tracking-widest uppercase">Community Initiative</span>
            <h3 className="text-2xl md:text-3xl font-bold text-[#0B2545] mt-2 mb-2">Pakistan Cybersecurity Alliance</h3>
            <p className="text-gray-600 max-w-xl">
              A community platform connecting cybersecurity professionals, students, and institutions across Pakistan.
            </p>
          </div>
          <div className="flex flex-col sm:flex-row gap-3">
            <Link
              to="/pca"
              className="flex items-center justify-center gap-2 px-6 py-3 rounded-full bg-teal-500 hover:bg-teal-600 text-white font-semibold transition-all hover:scale-105 whitespace-nowrap"
            >
              Explore PCA
              <ArrowRight className="w-4 h-4" />
            </Link>
            <a
              href="https://chat.whatsapp.com/L2E27bvy7MwKVPSOtnSMB5" target="_blank" rel="noopener noreferrer"
              className="flex items-center justify-center gap-2 px-6 py-3 rounded-full glass-card text-[#0B2545] font-semibold hover:bg-gray-100 transition-all whitespace-nowrap"
            >
              Join Us
            </a>
          </div>
        </motion.div>
      </div>
    </section>
  );
}
