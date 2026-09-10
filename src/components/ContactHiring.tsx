import { motion } from 'motion/react';
import { Send, Loader2 } from 'lucide-react';
import { useSubmitForm } from '../hooks/useSubmitForm';
import FormToast from './FormToast';

export default function ContactHiring() {
  const { status, handleSubmit } = useSubmitForm({ subject: 'New Contact Inquiry' });

  return (
    <section id="contact" className="py-24 relative overflow-hidden bg-gray-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="text-center mb-16">
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-5xl font-bold text-[#0B2545] mb-4"
          >
            Get in <span className="text-teal-400">Touch</span>
          </motion.h2>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.2 }}
            className="text-lg text-gray-600 max-w-3xl mx-auto"
          >
            Have a security challenge? We'd love to hear from you.
          </motion.p>
        </div>

        <div className="max-w-3xl mx-auto">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.4 }}
            className="glass-card p-8 md:p-12 rounded-3xl"
          >
            <form
              onSubmit={handleSubmit}
              className="space-y-6"
            >
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
                <label className="block text-sm font-medium text-gray-700 mb-2">Message / Inquiry</label>
                <textarea
                  name="message"
                  required
                  rows={5}
                  className="w-full bg-white border border-gray-200 rounded-xl px-4 py-3 text-[#0B2545] focus:outline-none focus:border-teal-500 transition-colors resize-none"
                  placeholder="Tell us about your requirements..."
                ></textarea>
              </div>

              <button
                type="submit"
                disabled={status === 'sending'}
                className="w-full flex items-center justify-center gap-2 py-4 rounded-xl font-bold text-white bg-teal-500 hover:bg-teal-600 transition-all hover:scale-[1.02] disabled:opacity-60 disabled:hover:scale-100"
              >
                {status === 'sending' ? <Loader2 className="w-5 h-5 animate-spin" /> : <Send className="w-5 h-5" />}
                {status === 'sending' ? 'Sending...' : 'Send Message'}
              </button>
            </form>
          </motion.div>

          <p className="text-center text-gray-600 text-sm mt-6">
            Looking to join our team instead?{' '}
            <a href="/careers" className="text-teal-400 hover:underline">Apply here</a>
          </p>
        </div>
      </div>
      <FormToast status={status} />
    </section>
  );
}
