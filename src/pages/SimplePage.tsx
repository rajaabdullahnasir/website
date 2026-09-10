import { motion } from 'motion/react';
import { ArrowLeft, LucideIcon } from 'lucide-react';
import { Link } from 'react-router-dom';

interface SimplePageProps {
  eyebrow: string;
  title: string;
  subtitle: string;
  icon: LucideIcon;
  sections: { heading: string; body: string }[];
  ctaLabel?: string;
  ctaHref?: string;
  secondaryCtaLabel?: string;
  secondaryCtaHref?: string;
}

export default function SimplePage({ eyebrow, title, subtitle, icon: Icon, sections, ctaLabel, ctaHref, secondaryCtaLabel, secondaryCtaHref }: SimplePageProps) {
  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="mb-12">
          <div className="w-14 h-14 rounded-xl bg-teal-400/10 flex items-center justify-center mb-6">
            <Icon className="w-7 h-7 text-teal-400" />
          </div>
          <span className="text-teal-400 text-sm font-bold tracking-widest uppercase">{eyebrow}</span>
          <h1 className="text-3xl md:text-5xl font-bold text-[#0B2545] mt-4 mb-4">{title}</h1>
          <p className="text-lg text-gray-600 max-w-2xl">{subtitle}</p>
        </motion.div>

        <div className="space-y-10">
          {sections.map((s, idx) => (
            <motion.div
              key={idx}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              className="glass-card rounded-2xl border border-gray-200 p-8"
            >
              <h2 className="text-xl font-bold text-[#0B2545] mb-3">{s.heading}</h2>
              <p className="text-gray-600 leading-relaxed">{s.body}</p>
            </motion.div>
          ))}
        </div>

        {(ctaLabel && ctaHref) || (secondaryCtaLabel && secondaryCtaHref) ? (
          <div className="mt-12 text-center flex flex-wrap items-center justify-center gap-4">
            {ctaLabel && ctaHref && (
              <a
                href={ctaHref}
                className="inline-flex items-center gap-2 px-8 py-4 rounded-full bg-teal-500 hover:bg-teal-600 text-white font-semibold transition-all hover:scale-105"
              >
                {ctaLabel}
              </a>
            )}
            {secondaryCtaLabel && secondaryCtaHref && (
              <a
                href={secondaryCtaHref}
                className="inline-flex items-center gap-2 px-8 py-4 rounded-full glass-card text-[#0B2545] font-semibold hover:bg-gray-100 transition-all hover:scale-105"
              >
                {secondaryCtaLabel}
              </a>
            )}
          </div>
        ) : null}
      </div>
    </div>
  );
}
