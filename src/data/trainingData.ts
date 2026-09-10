export interface TrainingDetail {
  slug: string;
  title: string;
  summary: string;
  description: string;
  topics: string[];
  format: string;
}

export const trainingData: TrainingDetail[] = [
  {
    slug: 'corporate-training',
    title: 'Corporate Training',
    summary: 'Organization-wide security awareness and readiness training for your workforce.',
    description:
      'We deliver corporate training programs that build a security-first culture across your organization, covering the everyday risks employees actually face, tailored to your industry and team structure.',
    topics: ['Security awareness fundamentals', 'Password and access hygiene', 'Data handling and privacy basics', 'Incident reporting procedures'],
    format: 'On-site or remote, half-day to multi-day formats available',
  },
  {
    slug: 'phishing-simulation',
    title: 'Phishing & Social Engineering Awareness',
    summary: 'Simulated phishing campaigns paired with training to reduce human-layer risk.',
    description:
      'We run controlled phishing simulations across your organization, then follow up with targeted training for the people and departments who need it most, turning results into measurable improvement over time.',
    topics: ['Simulated phishing campaigns', 'Vishing and pretexting awareness', 'Reporting culture building', 'Before/after risk metrics'],
    format: 'Ongoing campaign-based engagement or one-time assessment',
  },
  {
    slug: 'ethical-hacking',
    title: 'Ethical Hacking Training',
    summary: 'Hands-on offensive security training for aspiring and practicing security professionals.',
    description:
      'A practical, hands-on curriculum covering reconnaissance, exploitation, and reporting, built for students and professionals who want real offensive security skills, not just theory.',
    topics: ['Reconnaissance and OSINT', 'Web and network exploitation', 'Privilege escalation techniques', 'Professional reporting standards'],
    format: 'Cohort-based or individual, in-person or remote',
  },
  {
    slug: 'digital-forensics',
    title: 'Digital Forensics Training',
    summary: 'Investigative training for incident response and digital evidence handling.',
    description:
      'This program covers the fundamentals and practical tooling of digital forensics, from evidence acquisition to analysis and chain-of-custody, for teams building internal incident response capability.',
    topics: ['Evidence acquisition and chain of custody', 'Disk and memory forensics', 'Log and network artifact analysis', 'Forensic tooling (Autopsy, and others)'],
    format: 'Cohort-based or individual, in-person or remote',
  },
  {
    slug: 'specialized-personalized-training',
    title: 'Specialized & Personalized Training',
    summary: 'Custom-built training designed around your team, tools, and specific goals.',
    description:
      'When off-the-shelf training doesn\'t fit, we build a program around your specific stack, threat model, and skill gaps, whether that is one engineer or an entire department.',
    topics: ['Curriculum built around your environment', 'Flexible pacing and depth', 'One-on-one or small group formats', 'Follow-up support after training'],
    format: 'Fully customized, scheduled around your team',
  },
];

export function getTrainingBySlug(slug: string) {
  return trainingData.find((t) => t.slug === slug);
}
