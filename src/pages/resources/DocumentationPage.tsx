import { BookOpen } from 'lucide-react';
import SimplePage from '../SimplePage';
import { useDocumentTitle } from '../../hooks/useDocumentTitle';

export default function DocumentationPage() {
  useDocumentTitle(
    'Product Documentation | iSeeWaves',
    'Documentation for setting up, integrating, and operating the myESI platform.'
  );
  return (
    <SimplePage
      eyebrow="Resources"
      title="Product Documentation"
      subtitle="Everything you need to set up, integrate, and operate MyESI."
      icon={BookOpen}
      sections={[
        { heading: "Getting Started", body: "Step-by-step guides for connecting your first repository and running your first audit." },
        { heading: "Integrations", body: "Documentation for CI/CD integration, API access, and webhook configuration." },
        { heading: "On-Premises Deployment", body: "Infrastructure requirements and deployment guides for running MyESI inside your own environment." }
      ]}
      ctaLabel="Request Documentation Access"
      ctaHref="mailto:info@iseewaves.pk?subject=Product%20Documentation"
    />
  );
}

