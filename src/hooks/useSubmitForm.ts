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
      // Honeypot: real visitors never see or fill this field, so if it has a
      // value the submission is from a bot. Silently drop it without an
      // error, so the bot gets no signal that it was caught.
      if (data.website_hp) {
        setStatus('idle');
        return;
      }
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

