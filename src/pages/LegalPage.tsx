import { motion } from 'motion/react';
import { Shield } from 'lucide-react';

export default function LegalPage() {
  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-16">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-full glass-card border-teal-500/30 text-teal-400 text-sm font-medium mb-6"
          >
            <Shield className="w-4 h-4" />
            <span>Legal Information</span>
          </motion.div>
          <motion.h1
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.1 }}
            className="text-4xl md:text-6xl font-bold text-[#0B2545] mb-6"
          >
            Legal <span className="text-teal-400">Notice</span>
          </motion.h1>
        </div>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.2 }}
          className="glass-card p-8 md:p-12 rounded-3xl prose prose-invert prose-teal max-w-none"
        >
          <h2>Company Information</h2>
          <p>
            iSeeWaves is a registered cybersecurity firm dedicated to providing enterprise-grade security solutions.
          </p>
          
          <h3>Registered Office</h3>
          <p>
            123 Security Boulevard<br />
            Cyber City, CC 10101<br />
            United States
          </p>

          <h3>Contact Details</h3>
          <p>
            Email: legal@iseewaves.com<br />
            Phone: +1 (555) 012-3456
          </p>

          <h2>Intellectual Property</h2>
          <p>
            All content on this website, including but not limited to text, graphics, logos, icons, images, audio clips, digital downloads, data compilations, and software, is the property of iSeeWaves or its content suppliers and protected by international copyright laws.
          </p>

          <h2>Disclaimer</h2>
          <p>
            The information provided on this website is for general informational purposes only. While we strive to keep the information up to date and correct, we make no representations or warranties of any kind, express or implied, about the completeness, accuracy, reliability, suitability, or availability with respect to the website or the information, products, services, or related graphics contained on the website for any purpose.
          </p>
        </motion.div>
      </div>
    </div>
  );
}
