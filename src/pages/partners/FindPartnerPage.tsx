import { Search } from 'lucide-react';
import SimplePage from '../SimplePage';

export default function FindPartnerPage() {
  return (
    <SimplePage
      eyebrow="Partners"
      title="Find a Partner"
      subtitle="Work with a certified iSeeWaves partner in your region to deploy and manage MyESI."
      icon={Search}
      sections={[
        { heading: "Certified Implementation Partners", body: "Our partners are trained on MyESI deployment, CI/CD integration, and on-premises rollouts, and can support your team through onboarding and beyond." },
        { heading: "Get Matched", body: "Tell us about your organization, industry, and region, and we will connect you with the right certified partner for your needs." }
      ]}
      ctaLabel="Request a Partner Match"
      ctaHref="mailto:info@iseewaves.pk?subject=Find%20a%20Partner"
      secondaryCtaLabel="Partner Portal"
      secondaryCtaHref="/partners/portal"
    />
  );
}
