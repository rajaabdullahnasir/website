import { motion } from 'motion/react';
import { ArrowLeft, LogIn, Loader2, Send } from 'lucide-react';
import { Link } from 'react-router-dom';
import { useSubmitForm } from '../hooks/useSubmitForm';
import FormToast from '../components/FormToast';

export default function MyesiLoginPage() {
  const { status, handleSubmit } = useSubmitForm({ subject: 'Portal Access Request' });

  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10 flex items-center justify-center">
      <div className="max-w-md w-full px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          className="glass-card rounded-2xl border border-gray-200 p-8"
        >
          <div className="w-12 h-12 rounded-xl bg-teal-400/10 flex items-center justify-center mb-6">
            <LogIn className="w-6 h-6 text-teal-400" />
          </div>
          <h1 className="text-2xl font-bold text-[#0B2545] mb-2">Customer Portal Access</h1>
          <p className="text-sm text-gray-600 mb-8">
            Our customer portal is currently invite-based. Enter your email and our team will send you sign-in
            instructions.
          </p>

          {status === 'success' ? (
            <div className="text-teal-500 font-medium text-sm">
              Request sent. We'll email you portal access instructions shortly.
            </div>
          ) : (
            <form onSubmit={handleSubmit} className="space-y-5">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Email Address</label>
                <input required name="email" type="email" className="w-full px-4 py-3 rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
              </div>
              <button
                type="submit"
                disabled={status === 'sending'}
                className="w-full flex items-center justify-center gap-2 px-6 py-3 rounded-full bg-teal-500 hover:bg-teal-600 text-white font-semibold transition-all disabled:opacity-60"
              >
                {status === 'sending' ? 'Sending...' : 'Request Access'}
                {status === 'sending' ? <Loader2 className="w-4 h-4 animate-spin" /> : <Send className="w-4 h-4" />}
              </button>
            </form>
          )}

          <p className="text-sm text-gray-600 mt-6 text-center">
            Don't have an account?{' '}
            <Link to="/#support" className="text-teal-400 hover:underline">Register for a free trial</Link>
          </p>
        </motion.div>
      </div>
      <FormToast status={status} />
    </div>
  );
}
