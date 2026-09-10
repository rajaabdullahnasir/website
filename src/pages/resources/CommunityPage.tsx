import { Users } from 'lucide-react';
import SimplePage from '../SimplePage';

export default function CommunityPage() {
  return (
    <SimplePage
      eyebrow="Resources"
      title="Customer Community"
      subtitle="Connect with other MyESI customers, share best practices, and shape our roadmap."
      icon={Users}
      sections={[
        { heading: "Who It's For", body: "Security engineers, DevSecOps leads, and compliance teams using MyESI in production." },
        { heading: "What Happens There", body: "Peer discussions, early access to new features, and direct feedback channels to our product team." }
      ]}
      ctaLabel="Join the Community"
      ctaHref="mailto:info@iseewaves.pk?subject=Customer%20Community"
    />
  );
}
