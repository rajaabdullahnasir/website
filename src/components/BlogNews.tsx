import { motion } from 'motion/react';
import { FileText, ExternalLink } from 'lucide-react';
import { Link } from 'react-router-dom';

export default function BlogNews() {
  const reports = [
    {
      title: 'The BBC AI Incident: Open-Source Blind Spots',
      date: 'Feb 24, 2026',
      type: 'Briefing',
      desc: 'Our latest threat brief decomposes how "Shadow Code" in open-source AI libraries compromised professional workflows at the BBC. With a 742% increase in supply chain attacks, traditional firewalls are no longer enough.',
      report: '/Reserches-Report/The AI Supply Chain Crisis.pdf'
    },
    {
      title: 'Bluetooth Patch Accountability: Securing Consumer Wireless Devices Against Real-World Attacks',
      date: 'Jan 28, 2026',
      type: 'Research Report',
      desc: 'Consumer Bluetooth devices often suffer from vendor abandonment, leaving millions of users vulnerable to eavesdropping and tracking long after support ends. We propose the Bluetooth Security Health Descriptor (BSHD), a novel framework that shifts security enforcement from the peripheral to the host OS. This introduces accountability and risk-enforced security to the wireless ecosystem.',
      report: '/Reserches-Report/bt.pdf'
    },
    {
      title: 'Pakistan\u2019s First SBOM Driven Vulnerability Intelligence Platform',
      date: 'Nov 10, 2025',
      type: 'Product Report',
      desc: 'We are proud to introduce myESI (My Enterprise Security Intelligence). Pakistan\u2019s first SBOM-powered vulnerability intelligence platform, designed to make software security measurable, automated and compliant with modern standards.',
      report: '/Reserches-Report/myesi.pdf'
    },
  ];

  return (
    <section id="news" className="py-24 relative overflow-hidden">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="text-center mb-16">
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-5xl font-bold text-white mb-4"
          >
            Research & <span className="text-emerald-400">Reports</span>
          </motion.h2>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.2 }}
            className="text-lg text-gray-400 max-w-3xl mx-auto"
          >
            Stay updated with our latest research papers and cybersecurity insights.
          </motion.p>
        </div>

        <div className="space-y-6 max-w-4xl mx-auto">
          <h3 className="text-2xl font-bold text-white mb-6 flex items-center gap-2">
            <FileText className="w-6 h-6 text-emerald-400" />
            Latest Reports
          </h3>
          {reports.map((report, idx) => (
            <motion.div
              key={idx}
              initial={{ opacity: 0, x: -20 }}
              whileInView={{ opacity: 1, x: 0 }}
              viewport={{ once: true }}
              transition={{ delay: idx * 0.1 }}
              className="glass-card p-6 rounded-2xl group hover:border-emerald-500/50 transition-colors"
            >
              <div className="flex justify-between items-start mb-3">
                <span className="text-xs font-mono text-emerald-400 bg-emerald-400/10 px-2 py-1 rounded-full">
                  {report.type}
                </span>
                <span className="text-sm text-gray-500">{report.date}</span>
              </div>
              <h4 className="text-xl font-bold text-white mb-2 group-hover:text-emerald-400 transition-colors">
                {report.title}
              </h4>
              <p className="text-gray-400 mb-4">{report.desc}</p>
              <a href={report.report} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-2 text-emerald-400 hover:text-emerald-300 font-medium text-sm">
                Read Full Report <ExternalLink className="w-4 h-4" />
              </a>
            </motion.div>
          ))}
          <div className="text-center pt-4">
            <Link
              to="/reports"
              className="inline-flex items-center gap-2 text-sm font-medium text-gray-400 hover:text-emerald-400 transition-colors"
            >
              View All Reports <ExternalLink className="w-4 h-4" />
            </Link>
          </div>
        </div>
      </div>
    </section>
  );
}