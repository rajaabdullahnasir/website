import { ShieldCheck } from 'lucide-react';
import SimplePage from '../SimplePage';

export default function TrustPage() {
  return (
    <SimplePage
      eyebrow="Resources"
      title="myESI Trust"
      subtitle="How we secure the platform that secures your software supply chain."
      icon={ShieldCheck}
      sections={[
        { heading: "Data Handling", body: "Source code and scan data are processed only to run your audits and generate your reports, and are never used to train third-party models." },
        { heading: "Deployment Options", body: "Choose cloud-hosted MyESI or a fully on-premises deployment when your policies require code to stay inside your network." },
        { heading: "Security Practices", body: "MyESI is built by a team with hands-on offensive and defensive security experience, applying the same rigor to our own platform that we apply to your audits." }
      ]}
      ctaLabel="Request Our Trust Documentation"
      ctaHref="mailto:info@iseewaves.pk?subject=myESI%20Trust%20Documentation"
    />
  );
}
