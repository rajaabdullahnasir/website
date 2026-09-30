import { useEffect, useState } from 'react';
import { AnimatePresence, motion } from 'motion/react';
import { Link } from 'react-router-dom';

const CONSENT_KEY = 'iseewaves_cookie_consent';

export default function CookieConsent() {
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    try {
      if (!localStorage.getItem(CONSENT_KEY)) {
        setVisible(true);
      }
    } catch {
      // localStorage unavailable (private browsing, etc.) - just don't show the banner.
    }
  }, []);

  const accept = () => {
    try {
      localStorage.setItem(CONSENT_KEY, 'accepted');
    } catch {
      // ignore - nothing else to do if storage isn't available
    }
    setVisible(false);
  };

  return (
    <AnimatePresence>
      {visible && (
        <motion.div
          initial={{ opacity: 0, y: 40 }}
          animate={{ opacity: 1, y: 0 }}
          exit={{ opacity: 0, y: 40 }}
          transition={{ duration: 0.3 }}
          className="fixed bottom-0 left-0 right-0 z-50 p-4 sm:p-6"
        >
          <div className="max-w-4xl mx-auto glass-card border border-gray-200 bg-white/95 rounded-2xl shadow-lg px-6 py-5 flex flex-col sm:flex-row items-center gap-4">
            <p className="text-sm text-gray-600 flex-1 text-center sm:text-left">
              We use cookies to improve your experience and analyze site traffic. By continuing to use this site, you agree to our use of cookies. See our{' '}
              <Link to="/privacy" className="text-teal-500 hover:underline font-medium">
                Privacy Policy
              </Link>{' '}
              for details.
            </p>
            <button
              onClick={accept}
              className="shrink-0 px-6 py-2.5 rounded-full bg-teal-500 hover:bg-teal-600 text-white font-semibold text-sm transition-all hover:scale-105"
            >
              Accept
            </button>
          </div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}

