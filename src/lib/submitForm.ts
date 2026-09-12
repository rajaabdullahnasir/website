// All site forms submit through this single function instead of using mailto:,
// so submitting never opens the visitor's email app and never requires them
// to manually hit "send" - it happens automatically and silently.
//
// This uses EmailJS (https://www.emailjs.com), a free email-sending API that
// works entirely from the browser - no server to build, host, or run.
// Connected to info@iseewaves.pk via Custom SMTP (StackMail). The public key
// below is meant to be embedded in frontend code - that's how EmailJS is
// designed to work, unlike an SMTP password, which should never be exposed.

const EMAILJS_SERVICE_ID = 'service_02hshiz';
const EMAILJS_TEMPLATE_ID = 'template_krdd38g';
const EMAILJS_PUBLIC_KEY = 'FarJBgNzPecdA-FZ5';

const EMAILJS_ENDPOINT = 'https://api.emailjs.com/api/v1.0/email/send';

export async function submitForm(data: Record<string, string>): Promise<boolean> {
  try {
    const res = await fetch(EMAILJS_ENDPOINT, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        service_id: EMAILJS_SERVICE_ID,
        template_id: EMAILJS_TEMPLATE_ID,
        user_id: EMAILJS_PUBLIC_KEY,
        template_params: data,
      }),
    });
    return res.ok;
  } catch (err) {
    console.error('Form submission failed:', err);
    return false;
  }
}
