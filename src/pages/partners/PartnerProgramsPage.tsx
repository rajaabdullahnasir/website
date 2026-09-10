import { Layers } from 'lucide-react';
import SimplePage from '../SimplePage';

export default function PartnerProgramsPage() {
  return (
    <SimplePage
      eyebrow="Partners"
      title="Partner Programs"
      subtitle="Choose the partner track that fits how you work with your customers."
      icon={Layers}
      sections={[
        { heading: "Referral Partners", body: "Introduce MyESI to your network and earn a commission on closed deals, with no technical delivery obligation." },
        { heading: "Reseller Partners", body: "Resell MyESI under your own commercial relationship with your customers, backed by partner pricing and enablement." },
        { heading: "Implementation Partners", body: "Deliver MyESI onboarding, integration, and on-premises deployments for customers as a certified technical partner." }
      ]}
      ctaLabel="Compare Plans"
      ctaHref="/partners/compare-plans"
      secondaryCtaLabel="Apply Now"
      secondaryCtaHref="mailto:info@iseewaves.pk?subject=Partner%20Programs"
    />
  );
}
