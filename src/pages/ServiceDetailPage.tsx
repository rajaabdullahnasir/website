import { motion } from 'motion/react';
import { ArrowLeft, Send, CheckCircle2, Loader2 } from 'lucide-react';
import { Link, useParams, Navigate } from 'react-router-dom';
import { getServiceBySlug } from '../data/servicesData';
import { useSubmitForm } from '../hooks/useSubmitForm';
import FormToast from '../components/FormToast';

export default function ServiceDetailPage() {
  const { slug } = useParams<{ slug: string }>();
  const service = slug ? getServiceBySlug(slug) : undefined;
  const { status, handleSubmit } = useSubmitForm(
    service ? { subject: `Service Request: ${service.title}`, service: service.title } : undefined
  );

  if (!service) {
    return <Navigate to="/services" replace />;
  }

  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/services" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Services</span>
          </Link>
        </div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="mb-12">
          <span className="text-teal-400 text-sm font-bold tracking-widest uppercase">{service.category}</span>
          <h1 className="text-3xl md:text-5xl font-bold text-[#0B2545] mt-4 mb-4">{service.title}</h1>
          <p className="text-lg text-gray-600 max-w-2xl">{service.summary}</p>
        </motion.div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8 mb-16">
          <div className="lg:col-span-2 space-y-8">
            <div className="glass-card rounded-2xl border border-gray-200 p-8">
              <h2 className="text-xl font-bold text-[#0B2545] mb-3">Overview</h2>
              <p className="text-gray-600 leading-relaxed">{service.description}</p>
            </div>
            <div className="glass-card rounded-2xl border border-gray-200 p-8">
              <h2 className="text-xl font-bold text-[#0B2545] mb-4">What We Do</h2>
              <ul className="space-y-3">
                {service.whatWeDo.map((item) => (
                  <li key={item} className="flex items-start gap-3 text-gray-700 text-sm">
                    <CheckCircle2 className="w-4 h-4 text-teal-400 mt-0.5 shrink-0" />
                    {item}
                  </li>
                ))}
              </ul>
            </div>
            <div className="glass-card rounded-2xl border border-gray-200 p-8">
              <h2 className="text-xl font-bold text-[#0B2545] mb-4">Deliverables</h2>
              <ul className="space-y-3">
                {service.deliverables.map((item) => (
                  <li key={item} className="flex items-start gap-3 text-gray-700 text-sm">
                    <CheckCircle2 className="w-4 h-4 text-blue-400 mt-0.5 shrink-0" />
                    {item}
                  </li>
                ))}
              </ul>
            </div>
          </div>

          <div className="lg:col-span-1">
            <div className="glass-card rounded-2xl border border-teal-500/20 p-6 sticky top-28">
              <h2 className="text-lg font-bold text-[#0B2545] mb-2">Request This Service</h2>
              <p className="text-sm text-gray-600 mb-6">
                Tell us about your environment and requirements. We'll follow up by email.
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
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Company</label>
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
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Environment Size (e.g. team, assets, scope)</label>
                  <input name="environment" type="text" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Preferred Timeline</label>
                  <input name="timeline" type="text" placeholder="e.g. within 2 weeks" className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1.5">Requirements</label>
                  <textarea name="requirements" rows={4} className="w-full px-3 py-2.5 text-sm rounded-lg bg-white border border-gray-200 text-[#0B2545] focus:outline-none focus:border-teal-500" />
                </div>
                <button
                  type="submit"
                  disabled={status === 'sending'}
                  className="w-full flex items-center justify-center gap-2 px-6 py-3 rounded-full bg-teal-500 hover:bg-teal-600 text-white font-semibold transition-all disabled:opacity-60"
                >
                  {status === 'sending' ? 'Sending...' : 'Send Request'}
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
