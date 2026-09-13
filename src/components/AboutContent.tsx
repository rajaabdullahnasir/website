import { motion } from 'motion/react';
import { Quote, Gem, ShieldCheck, TrendingUp, Handshake } from 'lucide-react';
import { Link } from 'react-router-dom';
import About from './About';

export default function AboutContent() {
  const values = [
    {
      icon: Gem,
      title: 'Excellence',
      body: 'We hold our work, from a single line of code to a full audit report, to the standard we would want applied to our own systems.',
    },
    {
      icon: ShieldCheck,
      title: 'Integrity',
      body: 'We tell clients what we find, not what is convenient. Trust is the product as much as the platform is.',
    },
    {
      icon: TrendingUp,
      title: 'Innovation',
      body: 'We build MyESI from real engagements, constantly folding what we learn in the field back into the product.',
    },
    {
      icon: Handshake,
      title: 'Partnership',
      body: 'We aim to be a long-term security partner to our clients and to the wider community, not a one-time vendor.',
    },
  ];

  return (
    <>
      <About />

      {/* CEO Message */}
      <section className="py-16 relative z-10">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="glass-card rounded-3xl border border-gray-200 p-8 md:p-10"
          >
            <div className="flex flex-col md:flex-row gap-8 items-start">
              <div className="w-28 h-28 rounded-2xl bg-gradient-to-br from-teal-400/30 to-[#00C08B]/30 flex items-center justify-center shrink-0 border border-gray-200 mx-auto md:mx-0">
                <img src="/images/Founder.jpeg" alt="Founder" className="w-full h-full object-cover rounded-2xl" />
              </div>
              <div className="flex-1">
                <div className="relative">
                  <Quote className="w-8 h-8 text-teal-400/40 absolute -top-2 -left-1" />
                  <p className="text-gray-700 italic leading-relaxed pl-9">
                    "We started iSeeWaves because too many organizations only find out what's actually running in
                    their software after something has already gone wrong. Our job is to make that visibility
                    automatic, defensible, and available before the incident, not after it."
                  </p>
                </div>
                <div className="mt-6">
                  <div className="text-sm font-bold text-[#0B2545]">Founder & CEO</div>
                  <div className="text-xs text-gray-500 mt-0.5">
                    <Link to="/company/executive-team" className="text-teal-500 hover:underline">
                      Read the full message and leadership approach
                    </Link>
                  </div>
                </div>
              </div>
            </div>
          </motion.div>
        </div>
      </section>

      {/* Our Values - professional, corporate close */}
      <section className="py-16 relative z-10">
        <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} className="text-center mb-12">
            <span className="text-teal-500 text-sm font-bold tracking-widest uppercase">What Drives Us</span>
            <h2 className="text-2xl md:text-4xl font-bold text-[#0B2545] mt-3">Our Values</h2>
          </motion.div>
          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6">
            {values.map((v, idx) => (
              <motion.div
                key={v.title}
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                transition={{ delay: idx * 0.08 }}
                className="glass-card rounded-2xl border border-gray-200 p-6"
              >
                <div className="w-11 h-11 rounded-xl bg-teal-400/10 flex items-center justify-center mb-4">
                  <v.icon className="w-5 h-5 text-teal-500" />
                </div>
                <h3 className="text-base font-bold text-[#0B2545] mb-2">{v.title}</h3>
                <p className="text-sm text-gray-600 leading-relaxed">{v.body}</p>
              </motion.div>
            ))}
          </div>
        </div>
      </section>
    </>
  );
}
