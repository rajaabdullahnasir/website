import { motion } from 'motion/react';
import { FileText, ExternalLink, ArrowLeft } from 'lucide-react';
import { Link } from 'react-router-dom';

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
  {
    title: 'iSeeWaves and BetaCodes (Formerly Forbmax) Strategic Insight Session to Strengthen “MyESI - My Enterprise Security Intelligence” platform with Industry Experts',
    date: 'Dec 12, 2025',
    type: 'Insight Report',
    desc: 'This session with Zubair Elahi, CCO BetaCodes focused on a shared vision to strengthen the "MyESI - My Enterprise Security Intelligence" platform, moving beyond traditional digital defense toward an intelligent, self-learning future.',
    report: '/Reserches-Report/forbmax.pdf'
  },
  {
    title: 'The Future of Spatial Awareness: Wi-Fi Signals as a New Lens',
    date: 'Sep 8, 2025',
    type: 'Whitepaper',
    desc: 'A pioneering Wi-Fi-based human presence detection system designed to function without cameras. Developed in Pakistan by a multidisciplinary team of young innovators, it is built to support emergency response, secure zones, smart homes, and industrial safety.',
    report: '/Reserches-Report/whitepaper.pdf'
  },
];

export default function AllReportsPage() {
  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <div className="text-center mb-16">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-full glass-card border-teal-500/30 text-teal-400 text-sm font-medium mb-6"
          >
            <FileText className="w-4 h-4" />
            <span>Research & Reports</span>
          </motion.div>
          <motion.h1
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.1 }}
            className="text-4xl md:text-6xl font-bold text-[#0B2545] mb-6"
          >
            All <span className="text-teal-400">Reports</span>
          </motion.h1>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.2 }}
            className="text-lg text-gray-600 max-w-2xl mx-auto"
          >
            Browse our full library of whitepapers, research reports, and security guides.
          </motion.p>
        </div>

        <div className="space-y-6">
          {reports.map((report, idx) => (
            <motion.div
              key={idx}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: idx * 0.1 + 0.3 }}
              className="glass-card p-6 rounded-2xl group hover:border-teal-500/50 transition-colors"
            >
              <div className="flex justify-between items-start mb-3">
                <span className="text-xs font-mono text-teal-400 bg-teal-400/10 px-2 py-1 rounded-full">
                  {report.type}
                </span>
                <span className="text-sm text-gray-600">{report.date}</span>
              </div>
              <h4 className="text-xl font-bold text-[#0B2545] mb-2 group-hover:text-teal-400 transition-colors">
                {report.title}
              </h4>
              <p className="text-gray-600 mb-4">{report.desc}</p>
              <a href={report.report} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-2 text-teal-400 hover:text-teal-300 font-medium text-sm">
                Read Full Report <ExternalLink className="w-4 h-4" />
              </a>
            </motion.div>
          ))}
        </div>
      </div>
    </div>
  );
}
