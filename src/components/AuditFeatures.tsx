import { useState } from 'react';
import { motion } from 'motion/react';
import {
  FileStack,
  ShieldCheck,
  PackageSearch,
  Code2,
  Bug,
  Plug,
  KeyRound,
  ClipboardCheck,
  Plus,
  Minus,
} from 'lucide-react';

const audits = [
  {
    key: 'sbom',
    icon: FileStack,
    title: 'Dynamic SBOM Generation',
    subtitle: 'Software Bill of Materials',
    description:
      'Automatically generates a complete, machine-readable inventory of every component, library, and dependency in your software, kept current as your codebase changes.',
  },
  {
    key: 'secure-coding',
    icon: ShieldCheck,
    title: 'Secure Coding Testing',
    subtitle: 'Secure Development Lifecycle',
    description:
      'Validates that secure coding practices and security controls are enforced at every stage of your development pipeline, from design through release.',
  },
  {
    key: 'sca',
    icon: PackageSearch,
    title: 'Software Composition Analysis',
    subtitle: 'SCA',
    description:
      'Scans open-source and third-party components for known vulnerabilities, license risks, and outdated versions before they reach production.',
  },
  {
    key: 'sast',
    icon: Code2,
    title: 'Static Application Security Testing',
    subtitle: 'SAST',
    description:
      'Analyzes your source code line by line to catch insecure coding patterns, injection flaws, and logic vulnerabilities before you ever run the application.',
  },
  {
    key: 'dast',
    icon: Bug,
    title: 'Dynamic Application Security Testing',
    subtitle: 'DAST',
    description:
      'Tests your running application and compiled binaries the way an attacker would, uncovering runtime vulnerabilities that static analysis alone can miss.',
  },
  {
    key: 'api-security',
    icon: Plug,
    title: 'API Security',
    subtitle: 'API Testing',
    description:
      'Assesses your APIs for broken authentication, excessive data exposure, and misconfigurations, the most common ways modern applications get breached.',
  },
  {
    key: 'secrets-detection',
    icon: KeyRound,
    title: 'Secrets Detection',
    subtitle: 'Credential Scanning',
    description:
      'Scans your repositories and pipelines for exposed API keys, credentials, and tokens before they leak into production or version history.',
  },
  {
    key: 'compliance-controls',
    icon: ClipboardCheck,
    title: 'Compliance Controls',
    subtitle: 'Framework & Regulatory Mapping',
    description:
      'Maps your technical controls directly against the frameworks you are audited on, so compliance evidence is generated automatically instead of assembled by hand.',
  },
];

export default function AuditFeatures() {
  const [openKey, setOpenKey] = useState<string | null>('sbom');

  return (
    <section id="features" className="py-24 relative z-10">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-16">
          <motion.span
            initial={{ opacity: 0, y: 10 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-teal-500 text-sm font-bold tracking-widest uppercase"
          >
            One Platform, Eight Audits
          </motion.span>
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-5xl font-bold text-[#0B2545] mt-4 mb-4"
          >
            8 Different Audits, <span className="text-teal-500">One Click</span>
          </motion.h2>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-gray-600 max-w-2xl mx-auto"
          >
            MyESI runs a full software supply chain audit in a single pass, replacing eight separate tools and reports with one automated workflow.
          </motion.p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {audits.map((audit, idx) => {
            const isOpen = openKey === audit.key;
            return (
              <motion.div
                key={audit.key}
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                transition={{ delay: idx * 0.06 }}
                className="glass-card rounded-2xl border border-gray-200 hover:border-teal-500/40 transition-all duration-300"
              >
                <button
                  onClick={() => setOpenKey(isOpen ? null : audit.key)}
                  className="w-full text-left p-6 flex items-start gap-4"
                >
                  <div className="w-12 h-12 shrink-0 rounded-xl bg-teal-400/10 flex items-center justify-center">
                    <audit.icon className="w-6 h-6 text-teal-500" />
                  </div>
                  <div className="flex-1">
                    <h3 className="text-base font-bold text-[#0B2545] leading-snug">{audit.title}</h3>
                    <p className="text-xs text-gray-500 mt-1">{audit.subtitle}</p>
                  </div>
                  <div className="text-teal-500 mt-2">
                    {isOpen ? <Minus className="w-5 h-5" /> : <Plus className="w-5 h-5" />}
                  </div>
                </button>
                {isOpen && (
                  <motion.div
                    initial={{ opacity: 0, height: 0 }}
                    animate={{ opacity: 1, height: 'auto' }}
                    exit={{ opacity: 0, height: 0 }}
                    className="px-6 pb-6"
                  >
                    <p className="text-sm text-gray-600 leading-relaxed border-t border-gray-200 pt-4">
                      {audit.description}
                    </p>
                  </motion.div>
                )}
              </motion.div>
            );
          })}
        </div>
      </div>
    </section>
  );
}
