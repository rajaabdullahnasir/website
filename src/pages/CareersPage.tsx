import { motion } from 'motion/react';
import { ArrowLeft, Send, Briefcase, Loader2 } from 'lucide-react';
import { Link } from 'react-router-dom';
import { useSubmitForm } from '../hooks/useSubmitForm';
import FormToast from '../components/FormToast';

export default function CareersPage() {
  const { status, handleSubmit } = useSubmitForm({ subject: 'Career Application' });

  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="text-center mb-14">
          <div className="w-14 h-14 rounded-xl bg-blue-400/10 flex items-center justify-center mx-auto mb-6">
            <Briefcase className="w-7 h-7 text-blue-400" />
          </div>
          <span className="text-blue-400 text-sm font-bold tracking-widest uppercase">Careers</span>
          <h1 className="text-3xl md:text-5xl font-bold text-[#0B2545] mt-4 mb-4">Join the Team</h1>
          <p className="text-lg text-gray-600 max-w-xl mx-auto">
            We're always looking for people who care about doing security work properly. Tell us about yourself.
          </p>
        </motion.div>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.1 }}
          className="glass-card p-8 md:p-12 rounded-3xl"
        >
          <form onSubmit={handleSubmit} className="space-y-6">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Full Name</label>
                <input
                  type="text"
                  name="name"
                  required
                  className="w-full bg-white border border-gray-200 rounded-xl px-4 py-3 text-[#0B2545] focus:outline-none focus:border-teal-500 transition-colors"
                  placeholder="John Doe"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Email Address</label>
                <input
                  type="email"
                  name="email"
                  required
                  className="w-full bg-white border border-gray-200 rounded-xl px-4 py-3 text-[#0B2545] focus:outline-none focus:border-teal-500 transition-colors"
                  placeholder="john@example.com"
                />
              </div>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Position Applied For</label>
              <select
                name="position"
                className="w-full bg-white border border-gray-200 rounded-xl px-4 py-3 text-[#0B2545] focus:outline-none focus:border-teal-500 transition-colors"
              >
                <option value="penetration-tester">Penetration Tester</option>
                <option value="ai-developer">AI Developer</option>
                <option value="security-engineer">Security Engineer</option>
                <option value="grc-consultant">GRC Consultant</option>
                <option value="software-engineer">Software Engineer</option>
                <option value="business-developer">Business Developer</option>
                <option value="marketing-specialist">Marketing Specialist</option>
                <option value="intern">Intern</option>
                <option value="other">Other</option>
              </select>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">LinkedIn / Portfolio (optional)</label>
              <input
                type="text"
                name="portfolio"
                className="w-full bg-white border border-gray-200 rounded-xl px-4 py-3 text-[#0B2545] focus:outline-none focus:border-teal-500 transition-colors"
                placeholder="https://"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Cover Letter / Experience</label>
              <textarea
                name="message"
                required
                rows={6}
                className="w-full bg-white border border-gray-200 rounded-xl px-4 py-3 text-[#0B2545] focus:outline-none focus:border-teal-500 transition-colors resize-none"
                placeholder="Tell us about yourself and why you'd be a good fit..."
              ></textarea>
            </div>

            <button
              type="submit"
              disabled={status === 'sending'}
              className="w-full flex items-center justify-center gap-2 py-4 rounded-xl font-bold text-white bg-blue-500 hover:bg-blue-600 transition-all hover:scale-[1.02] disabled:opacity-60 disabled:hover:scale-100"
            >
              {status === 'sending' ? <Loader2 className="w-5 h-5 animate-spin" /> : <Send className="w-5 h-5" />}
              {status === 'sending' ? 'Sending...' : 'Submit Application'}
            </button>
          </form>
        </motion.div>
      </div>
      <FormToast status={status} />
    </div>
  );
}
