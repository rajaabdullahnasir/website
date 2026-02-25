import { motion } from 'motion/react';
import { ShieldAlert, ShieldCheck, FileCheck, Cloud, Headphones, ServerCog, UserCog } from 'lucide-react';

export default function Services() {
  const services = [
    {
      icon: ShieldAlert,
      title: 'Offensive Security',
      items: ['Penetration Testing', 'Red Teaming', 'Social Engineering'],
      color: 'text-red-400',
      bg: 'bg-red-400/10',
      border: 'border-red-400/20',
    },
    {
      icon: ShieldCheck,
      title: 'Defensive Security',
      items: ['SOC/SIEM Monitoring', 'Ransomware Protection', 'Network Security'],
      color: 'text-blue-400',
      bg: 'bg-blue-400/10',
      border: 'border-blue-400/20',
    },
    {
      icon: UserCog,
      title: 'vCISO',
      items: ['Security Strategy', 'Board-Level Reporting', 'Risk Governance'],
      color: 'text-amber-400',
      bg: 'bg-amber-400/10',
      border: 'border-amber-400/20',
    },
    {
      icon: FileCheck,
      title: 'Compliance & GRC',
      items: ['GRC', 'Policy Documentation', 'Risk Reports'],
      color: 'text-purple-400',
      bg: 'bg-purple-400/10',
      border: 'border-purple-400/20',
    },
    {
      icon: Cloud,
      title: 'Cloud & AI Security',
      items: ['Cloud Security Audits', 'AI Security', 'DevSecOps', 'AI Automated Security'],
      color: 'text-emerald-400',
      bg: 'bg-emerald-400/10',
      border: 'border-emerald-400/20',
    },
  ];

  const itSupport = [
    {
      icon: Headphones,
      title: 'Help Desk Support',
      desc: 'Level 1 and Level 2 technical support ensuring seamless client operations, rapid issue resolution, and continuity.',
      tags: ['L1 & L2 Support', 'Ticketing', 'SLA', 'User Support'],
    },
    {
      icon: ServerCog,
      title: 'Managed IT & RMM',
      desc: '24/7 Remote Monitoring & Management to proactively maintain, optimize, and secure IT infrastructure.',
      tags: ['Continuous Monitoring', 'RMM Services', 'Automation'],
    },
  ];

  return (
    <section id="services" className="py-24 relative overflow-hidden">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="text-center mb-16">
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-5xl font-bold text-white mb-4"
          >
            Our <span className="text-emerald-400">Services</span>
          </motion.h2>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.2 }}
            className="text-lg text-gray-400 max-w-3xl mx-auto"
          >
            Comprehensive cybersecurity solutions tailored to protect your digital assets across all vectors.
          </motion.p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-6 mb-16">
          {services.map((service, idx) => (
            <motion.div
              key={idx}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: idx * 0.1 }}
              className={`glass-card p-6 rounded-2xl border ${service.border} hover:scale-105 transition-all duration-300 group relative overflow-hidden`}
            >
              <div className={`absolute inset-0 bg-gradient-to-br from-white/5 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300`} />
              <div className={`w-12 h-12 rounded-xl ${service.bg} flex items-center justify-center mb-6 group-hover:scale-110 transition-transform duration-300 shadow-inner`}>
                <service.icon className={`w-6 h-6 ${service.color}`} />
              </div>
              <h3 className="text-xl font-bold text-white mb-4 relative z-10">{service.title}</h3>
              <ul className="space-y-3 relative z-10">
                {service.items.map((item, i) => (
                  <li key={i} className="flex items-center gap-2 text-gray-400 text-sm group-hover:text-gray-300 transition-colors">
                    <div className={`w-1.5 h-1.5 rounded-full ${service.bg.replace('/10', '')} shadow-[0_0_8px_currentColor]`} />
                    {item}
                  </li>
                ))}
              </ul>
            </motion.div>
          ))}
        </div>

        <div className="mt-20">
          <h3 className="text-3xl font-bold text-white mb-10 text-center">IT Support Services</h3>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            {itSupport.map((support, idx) => (
              <motion.div
                key={idx}
                initial={{ opacity: 0, x: idx % 2 === 0 ? -20 : 20 }}
                whileInView={{ opacity: 1, x: 0 }}
                viewport={{ once: true }}
                className="glass-card p-8 rounded-3xl relative overflow-hidden group hover:border-blue-500/30 transition-colors"
              >
                <div className="absolute top-0 right-0 w-32 h-32 bg-blue-500/10 rounded-full filter blur-3xl group-hover:bg-blue-500/20 transition-colors" />
                <div className="flex items-start gap-6 relative z-10">
                  <div className="w-14 h-14 rounded-2xl bg-blue-500/20 flex items-center justify-center flex-shrink-0 shadow-inner group-hover:scale-110 transition-transform duration-300">
                    <support.icon className="w-7 h-7 text-blue-400" />
                  </div>
                  <div>
                    <h4 className="text-2xl font-bold text-white mb-3">{support.title}</h4>
                    <p className="text-gray-400 mb-6 leading-relaxed">{support.desc}</p>
                    <div className="flex flex-wrap gap-2">
                      {support.tags.map((tag, i) => (
                        <span
                          key={i}
                          className="px-3 py-1 text-xs font-medium text-blue-400 bg-blue-400/10 rounded-full border border-blue-400/20"
                        >
                          {tag}
                        </span>
                      ))}
                    </div>
                  </div>
                </div>
              </motion.div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
