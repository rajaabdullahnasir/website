export interface ReportItem {
  title: string;
  date: string;
  type: string;
  desc: string;
  report: string;
}

export const allReports: ReportItem[] = [
  {
    title: 'The BBC AI Incident: Open-Source Blind Spots',
    date: 'Feb 24, 2026',
    type: 'Briefing',
    desc: 'Our latest threat brief decomposes how "Shadow Code" in open-source AI libraries compromised professional workflows at the BBC. With a 742% increase in supply chain attacks, traditional firewalls are no longer enough.',
    report: '/Reserches-Report/The AI Supply Chain Crisis.pdf'
  },
  {
    title: 'Bluetooth Patch Accountability: Securing Consumer Wireless Devices Against Real-World Attacks',
    date: 'Jan 28, 2026',
    type: 'Research Report',
    desc: 'Consumer Bluetooth devices often suffer from vendor abandonment, leaving millions of users vulnerable to eavesdropping and tracking long after support ends. We propose the Bluetooth Security Health Descriptor (BSHD), a novel framework that shifts security enforcement from the peripheral to the host OS. This introduces accountability and risk-enforced security to the wireless ecosystem.',
    report: '/Reserches-Report/bt.pdf'
  },
  {
    title: 'Pakistan\u2019s First SBOM Driven Vulnerability Intelligence Platform',
    date: 'Nov 10, 2025',
    type: 'Product Report',
    desc: 'We are proud to introduce myESI (My Enterprise Security Intelligence). Pakistan\u2019s first SBOM-powered vulnerability intelligence platform, designed to make software security measurable, automated and compliant with modern standards.',
    report: '/Reserches-Report/myesi.pdf'
  },
];