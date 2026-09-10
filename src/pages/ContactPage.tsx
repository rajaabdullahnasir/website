import { ArrowLeft } from 'lucide-react';
import { Link } from 'react-router-dom';
import ContactHiring from '../components/ContactHiring';

export default function ContactPage() {
  return (
    <div className="pt-24">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-8">
        <Link to="/" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
          <ArrowLeft className="w-4 h-4" />
          <span>Back to Home</span>
        </Link>
      </div>
      <ContactHiring />
    </div>
  );
}
