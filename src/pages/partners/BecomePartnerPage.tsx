import { Handshake } from 'lucide-react';
import SimplePage from '../SimplePage';

export default function BecomePartnerPage() {
  return (
    <SimplePage
      eyebrow="Partners"
      title="Become a Partner"
      subtitle="Join the iSeeWaves partner network and bring MyESI's software supply chain security to your customers."
      icon={Handshake}
      sections={[
        { heading: "Why Partner With Us", body: "iSeeWaves partners get access to MyESI's automated SBOM, SSDLC, SCA, SAST, DAST, and compliance audits to offer as a value-added service, backed by our engineering team." },
        { heading: "Who We Work With", body: "We partner with system integrators, MSSPs, consultancies, and technology resellers serving enterprise and mid-market customers across regulated industries." },
        { heading: "What You Get", body: "Deal registration, partner pricing, co-marketing support, and a dedicated partner manager once you are onboarded." }
      ]}
      ctaLabel="Apply to Partner"
      ctaHref="mailto:info@iseewaves.pk?subject=Partner%20Application"
      secondaryCtaLabel="Partner Portal"
      secondaryCtaHref="/partners/portal"
    />
  );
}
