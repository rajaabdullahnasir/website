import { motion } from 'motion/react';
import { Target, ShieldCheck, Zap, Globe } from 'lucide-react';

export default function About() {
  const stats = [
    { icon: Globe, label: 'Global Reach', value: 'Worldwide' },
    { icon: Zap, label: 'Response Time', value: '< 4 Hours' },
    { icon: ShieldCheck, label: 'Support', value: '24/7 Remote' },
    { icon: Target, label: 'Focus', value: 'Innovation & Trust' },
  ];

  return (
    <section id="about" className="py-24 relative overflow-hidden">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="text-center mb-16">
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-5xl font-bold text-white mb-4"
          >
            About <span className="text-emerald-400">iSeeWaves</span>
          </motion.h2>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.2 }}
            className="text-lg text-gray-400 max-w-3xl mx-auto"
          >
            Founded by Abdullah, our CEO, we are a global cybersecurity and AI technology company dedicated to securing digital assets for enterprises, governments, and critical infrastructure worldwide.
          </motion.p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
          <motion.div
            initial={{ opacity: 0, x: -50 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            className="glass-card p-8 rounded-3xl"
          >
            <h3 className="text-2xl font-semibold text-white mb-4">Our Mission</h3>
            <p className="text-gray-400 mb-6 leading-relaxed">
              Our mission is to redefine digital security through innovation and trust. We love the feeling of finally figuring out a solution to complex security challenges. We've had the opportunity to work on several critical projects during our journey, ranging from penetration testing to SOC/SIEM implementation.
            </p>
            <p className="text-gray-400 leading-relaxed">
              We're open to partnerships and collaborations where we can contribute, secure, and innovate. If you have a security challenge that matches our expertise, don't hesitate to contact us.
            </p>
          </motion.div>

          <motion.div
            initial={{ opacity: 0, x: 50 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            className="grid grid-cols-2 gap-4"
          >
            {stats.map((stat, index) => (
              <div key={index} className="glass-card p-6 rounded-2xl flex flex-col items-center justify-center text-center">
                <stat.icon className="w-8 h-8 text-emerald-400 mb-3" />
                <div className="text-2xl font-bold text-white mb-1">{stat.value}</div>
                <div className="text-sm text-gray-400 font-medium">{stat.label}</div>
              </div>
            ))}
          </motion.div>
        </div>
      </div>
    </section>
  );
}
