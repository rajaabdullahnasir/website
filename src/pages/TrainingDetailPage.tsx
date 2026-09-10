import { motion } from 'motion/react';
import { ArrowLeft, Send, CheckCircle2, Loader2 } from 'lucide-react';
import { Link, useParams, Navigate } from 'react-router-dom';
import { getTrainingBySlug } from '../data/trainingData';
import { useSubmitForm } from '../hooks/useSubmitForm';
import FormToast from '../components/FormToast';

export default function TrainingDetailPage() {
  const { slug } = useParams<{ slug: string }>();
  const training = slug ? getTrainingBySlug(slug) : undefined;
  const { status, handleSubmit } = useSubmitForm(
    training ? { subject: `Training Booking: ${training.title}`, training: training.title } : undefined
  );

  if (!training) {
    return <Navigate to="/resources/training" replace />;
  }

  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/resources/training" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Training</span>
          </Link>
        </div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="mb-12">
          <span className="text-teal-400 text-sm font-bold tracking-widest uppercase">Training Program</span>
          <h1 className="text-3xl md:text-5xl font-bold text-[#0B2545] mt-4 mb-4">{training.title}</h1>
          <p className="text-lg text-gray-600 max-w-2xl">{training.summary}</p>
        </motion.div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          <div className="lg:col-span-2 space-y-8">
            <div className="glass-card rounded-2xl border border-gray-200 p-8">
              <h2 className="text-xl font-bold text-[#0B2545] mb-3">Overview</h2>
              <p className="text-gray-600 leading-relaxed">{training.description}</p>
            </div>
            <div className="glass-card rounded-2xl border border-gray-200 p-8">
              <h2 className="text-xl font-bold text-[#0B2545] mb-4">What's Covered</h2>
              <ul className="space-y-3">
                {training.topics.map((topic) => (
                  <li key={topic} className="flex items-start gap-3 text-gray-700 text-sm">
                    <CheckCircle2 className="w-4 h-4 text-teal-400 mt-0.5 shrink-0" />
                    {topic}
                  </li>
                ))}
              </ul>
            </div>
            <div className="glass-card rounded-2xl border border-gray-200 p-8">
              <h2 className="text-xl font-bold text-[#0B2545] mb-2">Format</h2>
              <p className="text-gray-600 text-sm">{training.format}</p>
            </div>
          </div>

          <div className="lg:col-span-1">
            <div className="glass-card rounded-2xl border border-teal-500/20 p-6 sticky top-28">
              <h2 className="text-lg font-bold text-[#0B2545] mb-2">Book This Training</h2>
              <p className="text-sm text-gray-600 mb-6">
                Tell us about your team and goals, we'll follow up to schedule.
              </p>
              <form
                onSubmit={handleSubmit}
                className="space-y-4"
              >
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Full Name</label>
                  <input required name="name" type="text" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Organization</label>
                  <input required name="company" type="text" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Work Email</label>
                  <input required name="email" type="email" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Phone</label>
                  <input name="phone" type="tel" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Number of Participants</label>
                  <input name="participants" type="text" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Preferred Dates</label>
                  <input name="dates" type="text" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Goals / Notes</label>
                  <textarea name="notes" rows={4} className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <button
                  type="submit"
                  disabled={status === 'sending'}
                  className="w-full flex items-center justify-center gap-2 px-6 py-3 rounded-full bg-teal-500 hover:bg-teal-600 text-white font-semibold transition-all disabled:opacity-60"
                >
                  {status === 'sending' ? 'Sending...' : 'Request Booking'}
                  {status === 'sending' ? <Loader2 className="w-4 h-4 animate-spin" /> : <Send className="w-4 h-4" />}
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
      <FormToast status={status} />
    </div>
  );
}
