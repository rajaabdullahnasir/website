import { motion } from 'motion/react';
import { Shield, AlertTriangle, CheckCircle, FileText, Activity, Server, ExternalLink, Play } from 'lucide-react';
import { Link } from 'react-router-dom';

export default function Product() {
  const problems = [
    { title: 'Problem 1', desc: '90% MODERN APPLICATIONS RELY ON OPEN-SOURCE COMPONENTS' },
    { title: 'Problem 2', desc: '96% APPLICATIONS STILL INCLUDE AT LEAST ONE OPEN-SOURCE DEPENDENCY' },
    { title: 'Problem 3', desc: '30% DEVELOPERS ARE ESTIMATED TO FOLLOW FORMAL SECURE CODING PRACTICES CONSISTENTLY' },
  ];

  const attacks = [
    { 
      name: 'LOG4J Vulnerability', 
      year: '2021/2022', 
      desc: 'The Log4j crisis proved that a single hidden flaw in a \'trusted\' background library can compromise billions of devices, even if your own code is perfect.',
      source: 'CNBC - Dec 17, 2021',
      link: 'https://www.cnbc.com/video/2021/12/16/log4j-vulnerability-the-most-serious-ive-seen-in-my-decades-long-career-says-cisa-director.html',
      image: '/images/news.jpg'
    },
    { 
      name: 'SolarWinds Orion Compromise', 
      year: '2020', 
      desc: 'Malicious code was inserted into SolarWinds Orion updates, affecting thousands of organizations worldwide, including government agencies.',
      source: 'IBM - May 10, 2024',
      link: 'https://www.ibm.com/docs/en/randori?topic=2022-solarwinds-orion-cve-2020-10148',
      image: '/images/3500.webp'
    },
    { 
      name: '3CX Desktop App Supply Chain Attack', 
      year: '2023', 
      desc: 'A multi-stage attack where hackers first compromised a software package from a third-party vendor to pivot into 3CX network and poisoned the build process.',
      source: 'The Hacker News - Mar 8, 2023',
      link: 'https://thehackernews.com/2023/03/3cx-supply-chain-attack-heres-what-we.html',
      image: '/images/3cx.png'
    },
    { 
      name: 'XZ Utils Backdoor', 
      year: '2024', 
      desc: 'A sophisticated operation where an attacker spent over two years earning trust as a maintainer of the open-source XZ Utils compression library, then introduced a backdoor.',
      source: 'Akamai Blog - Sep 23, 2025',
      link: 'https://www.akamai.com/blog/security-research/critical-linux-backdoor-xz-utils-discovered-what-to-know',
      image: '/images/Blog-CVE-2024-3094-v.2_2x-1.png'
    },
    { 
      name: 'Polyfill.io Service Compromise', 
      year: '2024', 
      desc: 'The cdn.polyfill.io domain, used by over 100,000 websites, was sold to a new owner who changed the code to redirect users to malicious sites.',
      source: 'Qualys Blog - Jun 23, 2025',
      link: 'https://blog.qualys.com/vulnerabilities-threat-research/2024/06/28/polyfill-io-supply-chain-attack',
      image: '/images/Horizontal-Blog-Image-Template_Polyfill.io_.png'
    },
    { 
      name: 'Shai-Hulud npm Worm', 
      year: '2025', 
      desc: 'Malicious versions of popular Node.js packages were published to exploit developer environments, steal secrets, and automatically publish more malicious packages.',
      source: 'CISA Alert - Sep 23, 2025',
      link: 'https://www.cisa.gov/news-events/alerts/2025/09/23/widespread-supply-chain-compromise-impacting-npm-ecosystem',
      image: '/images/1758030724-shai-hulud.webp'
    },
  ];

  const purposes = [
    { icon: FileText, title: 'Export Compliance & Licensing', desc: 'Generate verifiable SBOMs and security attestations required to close high-value contracts in US/EU markets.' },
    { icon: CheckCircle, title: 'SSDLC Validation Engine', desc: 'Existing tools only check what libraries you use. MyESI checks how you used them and validates the SSDLC process line-by-line.' },
    { icon: Activity, title: 'Developer Hygiene Monitoring', desc: 'Track SSDLC adherence across teams to ensure security isn\'t sacrificed for speed during rapid development cycles.' },
    { icon: Server, title: 'Banking & OT Infrastructure Audit', desc: 'Automate the evidence collection for SBP or PCI-DSS audits with real-time risk heatmaps.' },
  ];

  return (
    <section id="product" className="py-24 relative overflow-hidden bg-white/5">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="text-center mb-16">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-full glass-card border-emerald-500/30 text-emerald-400 text-sm font-medium mb-6"
          >
            <Shield className="w-4 h-4" />
            <span>Hero Product</span>
          </motion.div>
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.1 }}
            className="text-4xl md:text-6xl font-bold text-white mb-4"
          >
            MyESI
          </motion.h2>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.2 }}
            className="text-xl text-emerald-400 font-medium tracking-widest uppercase mb-8"
          >
            My Enterprise Security Intelligence
          </motion.p>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.3 }}
            className="text-lg text-gray-400 max-w-4xl mx-auto mb-8"
          >
            iSeeWaves has developed MyESI, which secures your code by uncovering hidden vulnerabilities in modules, third-party frameworks, and APIs. It pinpoints risks from outdated versions, misconfigurations, and validates the SSDLC process line-by-line.
          </motion.p>
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.4 }}
            className="flex justify-center"
          >
            <Link 
              to="/demo"
              className="inline-flex items-center gap-2 px-8 py-4 rounded-full bg-emerald-500 hover:bg-emerald-600 text-white font-bold transition-all hover:scale-105 shadow-[0_0_20px_rgba(16,185,129,0.3)]"
            >
              <Play className="w-5 h-5 fill-current" />
              Watch Demo
            </Link>
          </motion.div>
        </div>

        {/* Why MyESI */}
        <div className="mb-20">
          <h3 className="text-3xl font-bold text-white mb-10 text-center">Why MyESI?</h3>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            {problems.map((prob, idx) => (
              <motion.div
                key={idx}
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                transition={{ delay: idx * 0.1 }}
                className="glass-card p-6 rounded-2xl border-red-500/20"
              >
                <div className="flex items-center gap-3 mb-4 text-red-400">
                  <AlertTriangle className="w-6 h-6" />
                  <h4 className="font-bold">{prob.title}</h4>
                </div>
                <p className="text-gray-300 font-medium">{prob.desc}</p>
              </motion.div>
            ))}
          </div>
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="glass-card p-6 rounded-2xl text-center border-emerald-500/30"
          >
            <p className="text-xl text-emerald-400 font-semibold">
              Just 14% of Organizations have reached a high level of "Security Maturity" where security is fully integrated into the development workflow.
            </p>
          </motion.div>
        </div>

        {/* Real World Attacks */}
        <div className="mb-20">
          <h3 className="text-3xl font-bold text-white mb-10 text-center">Real World Attacks On Software Supply Chain</h3>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            {attacks.map((attack, idx) => (
              <motion.div
                key={idx}
                initial={{ opacity: 0, scale: 0.95 }}
                whileInView={{ opacity: 1, scale: 1 }}
                viewport={{ once: true }}
                transition={{ delay: idx * 0.1 }}
                className="glass-card rounded-2xl overflow-hidden hover:border-emerald-500/50 transition-all group flex flex-col"
              >
                <div className="relative h-48 overflow-hidden">
                  <img 
                    src={attack.image} 
                    alt={attack.name} 
                    className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
                    referrerPolicy="no-referrer"
                  />
                  <div className="absolute inset-0 bg-gradient-to-t from-[#050505] to-transparent opacity-80" />
                  <span className="absolute bottom-4 right-4 text-xs font-mono text-emerald-400 bg-emerald-400/10 backdrop-blur-md px-3 py-1.5 rounded-full border border-emerald-500/20">
                    {attack.year}
                  </span>
                </div>
                <div className="p-6 flex flex-col flex-grow">
                  <h4 className="text-lg font-bold text-white mb-3 group-hover:text-emerald-400 transition-colors">{attack.name}</h4>
                  <p className="text-sm text-gray-400 mb-6 flex-grow leading-relaxed">{attack.desc}</p>
                  <div className="pt-4 border-t border-white/10 flex justify-between items-center mt-auto">
                    <span className="text-xs text-gray-500 font-medium">{attack.source}</span>
                    <a 
                      href={attack.link} 
                      target="_blank" 
                      rel="noopener noreferrer"
                      className="text-emerald-400 hover:text-emerald-300 transition-colors"
                      title="Read more"
                    >
                      <ExternalLink className="w-4 h-4" />
                    </a>
                  </div>
                </div>
              </motion.div>
            ))}
          </div>
        </div>

        {/* Primary Purposes */}
        <div>
          <h3 className="text-3xl font-bold text-white mb-10 text-center">Primary Purposes</h3>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            {purposes.map((purpose, idx) => (
              <motion.div
                key={idx}
                initial={{ opacity: 0, x: idx % 2 === 0 ? -20 : 20 }}
                whileInView={{ opacity: 1, x: 0 }}
                viewport={{ once: true }}
                className="glass-card p-8 rounded-3xl flex gap-6"
              >
                <div className="flex-shrink-0">
                  <div className="w-12 h-12 rounded-full bg-emerald-500/20 flex items-center justify-center">
                    <purpose.icon className="w-6 h-6 text-emerald-400" />
                  </div>
                </div>
                <div>
                  <h4 className="text-xl font-bold text-white mb-3">{purpose.title}</h4>
                  <p className="text-gray-400 leading-relaxed">{purpose.desc}</p>
                </div>
              </motion.div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
