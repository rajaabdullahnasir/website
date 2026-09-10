import { useState, useCallback } from 'react';
import type { FormEvent } from 'react';
import { submitForm } from '../lib/submitForm';

export type SubmitStatus = 'idle' | 'sending' | 'success' | 'error';

export function useSubmitForm(extraFields?: Record<string, string>) {
  const [status, setStatus] = useState<SubmitStatus>('idle');

  const handleSubmit = useCallback(
    async (e: FormEvent<HTMLFormElement>) => {
      e.preventDefault();
      const form = e.currentTarget;
      setStatus('sending');
      const data = Object.fromEntries(new FormData(form).entries()) as Record<string, string>;
      const ok = await submitForm({ ...data, ...extraFields });
      if (ok) {
        setStatus('success');
        form.reset();
        setTimeout(() => setStatus('idle'), 5000);
      } else {
        setStatus('error');
      }
    },
    [extraFields]
  );

  return { status, handleSubmit };
}
