import { CheckCircle2, Loader2, XCircle } from 'lucide-react';
import type { SubmitStatus } from '../hooks/useSubmitForm';

export default function FormToast({ status }: { status: SubmitStatus }) {
  if (status === 'idle') return null;

  return (
    <div className="fixed bottom-6 right-6 z-[200] animate-[fadeIn_0.2s_ease]">
      {status === 'sending' && (
        <div className="flex items-center gap-3 px-5 py-4 rounded-xl bg-white shadow-2xl border border-gray-200">
          <Loader2 className="w-5 h-5 text-teal-500 animate-spin" />
          <span className="text-[#0B2545] font-medium text-sm">Sending...</span>
        </div>
      )}
      {status === 'success' && (
        <div className="flex items-center gap-3 px-5 py-4 rounded-xl bg-teal-500 shadow-2xl">
          <CheckCircle2 className="w-5 h-5 text-white" />
          <span className="text-white font-medium text-sm">Message sent successfully</span>
        </div>
      )}
      {status === 'error' && (
        <div className="flex items-center gap-3 px-5 py-4 rounded-xl bg-red-500 shadow-2xl max-w-sm">
          <XCircle className="w-5 h-5 text-white shrink-0" />
          <span className="text-white font-medium text-sm">
            Something went wrong. Please email us directly at info@iseewaves.pk
          </span>
        </div>
      )}
    </div>
  );
}
