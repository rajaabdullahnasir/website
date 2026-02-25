import { useState } from 'react';
import { motion } from 'motion/react';
import { Send, Briefcase, MessageSquare } from 'lucide-react';

export default function ContactHiring() {
  const [activeTab, setActiveTab] = useState<'contact' | 'hiring'>('contact');

  return (
    <section id="contact" className="py-24 relative overflow-hidden bg-white/5">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="text-center mb-16">
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-5xl font-bold text-white mb-4"
          >
            Get in <span className="text-emerald-400">Touch</span>
          </motion.h2>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.2 }}
            className="text-lg text-gray-400 max-w-3xl mx-auto"
          >
            Whether you have a security challenge or want to join our team, we'd love to hear from you.
          </motion.p>
        </div>

        <div className="max-w-3xl mx-auto">
          {/* Tabs */}
          <div className="flex justify-center gap-4 mb-10">
            <button
              onClick={() => setActiveTab('contact')}
              className={`flex items-center gap-2 px-6 py-3 rounded-full font-medium transition-all ${
                activeTab === 'contact'
                  ? 'bg-emerald-500 text-white'
                  : 'glass-card text-gray-400 hover:text-white'
              }`}
            >
              <MessageSquare className="w-5 h-5" />
              Contact Us
            </button>
            <button
              onClick={() => setActiveTab('hiring')}
              className={`flex items-center gap-2 px-6 py-3 rounded-full font-medium transition-all ${
                activeTab === 'hiring'
                  ? 'bg-blue-500 text-white'
                  : 'glass-card text-gray-400 hover:text-white'
              }`}
            >
              <Briefcase className="w-5 h-5" />
              Join the Team
            </button>
          </div>

          {/* Forms */}
          <motion.div
            key={activeTab}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.4 }}
            className="glass-card p-8 md:p-12 rounded-3xl"
          >
            <form
              action="mailto:info@iseewaves.pk"
              method="POST"
              encType="text/plain"
              className="space-y-6"
            >
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                  <label className="block text-sm font-medium text-gray-300 mb-2">Full Name</label>
                  <input
                    type="text"
                    name="name"
                    required
                    className="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-emerald-500 transition-colors"
                    placeholder="John Doe"
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-300 mb-2">Email Address</label>
                  <input
                    type="email"
                    name="email"
                    required
                    className="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-emerald-500 transition-colors"
                    placeholder="john@example.com"
                  />
                </div>
              </div>

              {activeTab === 'hiring' && (
                <div>
                  <label className="block text-sm font-medium text-gray-300 mb-2">Position Applied For</label>
                  <select
                    name="position"
                    className="w-full bg-[#1a1a1a] border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-blue-500 transition-colors"
                  >
                    <option value="penetration-tester">Penetration Tester</option>
                    <option value="software-engineer">AI Developer</option>
                    <option value="soc-analyst">SOC Analyst</option>
                    <option value="security-engineer">Security Engineer</option>
                    <option value="grc-consultant">GRC Consultant</option>
                    <option value="software-engineer">Software Engineer</option>
                    <option value="business-developer">Business Developer</option>
                    <option value="marketing-specialist">Marketing Specialist</option>
                    <option value="grc-consultant">Inter</option>
                    <option value="other">Other</option>
                  </select>
                </div>
              )}

              <div>
                <label className="block text-sm font-medium text-gray-300 mb-2">
                  {activeTab === 'contact' ? 'Message / Inquiry' : 'Cover Letter / Experience'}
                </label>
                <textarea
                  name="message"
                  required
                  rows={5}
                  className="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-emerald-500 transition-colors resize-none"
                  placeholder="Tell us about your requirements..."
                ></textarea>
              </div>

              <button
                type="submit"
                className={`w-full flex items-center justify-center gap-2 py-4 rounded-xl font-bold text-white transition-all hover:scale-[1.02] ${
                  activeTab === 'contact' ? 'bg-emerald-500 hover:bg-emerald-600' : 'bg-blue-500 hover:bg-blue-600'
                }`}
              >
                <Send className="w-5 h-5" />
                {activeTab === 'contact' ? 'Send Message' : 'Submit Application'}
              </button>
            </form>
          </motion.div>
        </div>
      </div>
    </section>
  );
}
