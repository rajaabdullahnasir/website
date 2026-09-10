import { motion } from 'motion/react';
import { GraduationCap, ArrowLeft, ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';
import { trainingData } from '../../data/trainingData';

export default function TrainingPage() {
  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="mb-12">
          <div className="w-14 h-14 rounded-xl bg-teal-400/10 flex items-center justify-center mb-6">
            <GraduationCap className="w-7 h-7 text-teal-400" />
          </div>
          <span className="text-teal-400 text-sm font-bold tracking-widest uppercase">Resources</span>
          <h1 className="text-3xl md:text-5xl font-bold text-[#0B2545] mt-4 mb-4">Training and Certifications</h1>
          <p className="text-lg text-gray-600 max-w-2xl">
            We provide corporate trainings, phishing and social engineering awareness programs, ethical hacking and
            digital forensics training, and fully specialized, personalized training built around your team.
          </p>
        </motion.div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {trainingData.map((t, idx) => (
            <motion.div
              key={t.slug}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: idx * 0.08 }}
            >
              <Link
                to={`/resources/training/${t.slug}`}
                className="group block glass-card rounded-2xl border border-gray-200 hover:border-teal-500/40 p-6 h-full transition-all"
              >
                <h3 className="text-lg font-bold text-[#0B2545] mb-2">{t.title}</h3>
                <p className="text-sm text-gray-600 mb-4">{t.summary}</p>
                <span className="inline-flex items-center gap-1 text-sm font-medium text-teal-400">
                  View & Book
                  <ArrowRight className="w-3.5 h-3.5 group-hover:translate-x-1 transition-transform" />
                </span>
              </Link>
            </motion.div>
          ))}
        </div>
      </div>
    </div>
  );
}
