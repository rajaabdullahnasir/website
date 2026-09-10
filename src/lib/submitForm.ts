// All site forms submit through this single function instead of using mailto:,
// so submitting never opens the visitor's email app - it POSTs directly and the
// backend (Formspree) relays the message to info@iseewaves.pk by email.
//
// SETUP REQUIRED: mailto: links cannot send email on their own; only a server can.
// 1. Go to https://formspree.io and create a free account.
// 2. Create a new form with the recipient address set to info@iseewaves.pk.
// 3. Copy the endpoint it gives you, e.g. https://formspree.io/f/abcdwxyz
// 4. Paste it below as FORM_ENDPOINT.
// Until this is set, submissions will fail and show the "Something went wrong" state.

export const FORM_ENDPOINT = 'https://formspree.io/f/REPLACE_WITH_YOUR_FORM_ID';

export async function submitForm(data: Record<string, string>): Promise<boolean> {
  if (FORM_ENDPOINT.includes('REPLACE_WITH_YOUR_FORM_ID')) {
    console.error(
      'Form endpoint not configured. Set FORM_ENDPOINT in src/lib/submitForm.ts to your Formspree (or other) form endpoint.'
    );
    return false;
  }
  try {
    const res = await fetch(FORM_ENDPOINT, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json',
      },
      body: JSON.stringify(data),
    });
    return res.ok;
  } catch (err) {
    console.error('Form submission failed:', err);
    return false;
  }
}
