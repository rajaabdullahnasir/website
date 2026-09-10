export interface ServiceDetail {
  slug: string;
  category: string;
  title: string;
  summary: string;
  description: string;
  whatWeDo: string[];
  deliverables: string[];
}

export const servicesData: ServiceDetail[] = [
  // Offensive Security
  {
    slug: 'penetration-testing',
    category: 'Offensive Security',
    title: 'Penetration Testing',
    summary: 'Simulated real-world attacks against your applications, networks, and infrastructure.',
    description:
      'Our penetration testing engagements go beyond automated scans, combining manual testing techniques with real attacker methodology to uncover exploitable weaknesses across web, mobile, network, and cloud environments before adversaries do.',
    whatWeDo: [
      'Web, mobile, API, and network penetration testing',
      'Manual exploitation, not just automated scanning',
      'Business-logic and access-control testing',
      'Retesting after remediation',
    ],
    deliverables: ['Detailed technical report', 'Executive summary', 'Risk-ranked findings with remediation guidance'],
  },
  {
    slug: 'red-teaming',
    category: 'Offensive Security',
    title: 'Red Teaming',
    summary: 'Full-scope adversary simulation to test detection and response, not just prevention.',
    description:
      'We simulate a determined, real-world adversary across your people, processes, and technology, working to achieve defined objectives without triggering alarms, so you know exactly how your organization performs under real attack conditions.',
    whatWeDo: [
      'Objective-based, multi-stage adversary simulation',
      'Testing of detection and incident response capability',
      'Physical, technical, and social attack vectors as scoped',
      'Coordinated debrief with your blue team',
    ],
    deliverables: ['Attack narrative and timeline', 'Detection gap analysis', 'Purple team recommendations'],
  },
  {
    slug: 'social-engineering',
    category: 'Offensive Security',
    title: 'Social Engineering',
    summary: 'Testing the human layer of your security through realistic phishing and pretexting.',
    description:
      'People remain the most targeted attack surface. We run controlled social engineering campaigns, from phishing to phone-based pretexting, to measure real susceptibility and strengthen your human firewall.',
    whatWeDo: [
      'Phishing and spear-phishing simulations',
      'Vishing (phone-based) and pretexting exercises',
      'Physical access and tailgating tests as scoped',
      'Awareness metrics and reporting',
    ],
    deliverables: ['Campaign results and click/report rates', 'Risk-by-department breakdown', 'Awareness recommendations'],
  },
  // Defensive Security
  {
    slug: 'ransomware-protection',
    category: 'Defensive Security',
    title: 'Ransomware Protection',
    summary: 'Hardening your environment against ransomware and validating your recovery plan.',
    description:
      'We assess your exposure to ransomware across endpoints, backups, and network segmentation, then help you close the gaps that turn a single compromised machine into an organization-wide incident.',
    whatWeDo: [
      'Ransomware exposure and attack-path assessment',
      'Backup and recovery validation',
      'Endpoint and network segmentation hardening',
      'Incident response playbook development',
    ],
    deliverables: ['Exposure assessment report', 'Hardening roadmap', 'Tested recovery plan'],
  },
  {
    slug: 'network-security',
    category: 'Defensive Security',
    title: 'Network Security',
    summary: 'Architecture review and hardening of your network perimeter and internal segmentation.',
    description:
      'We review your network architecture end to end, from perimeter firewalls to internal segmentation, identifying misconfigurations and design weaknesses that could let an attacker move freely once inside.',
    whatWeDo: [
      'Firewall and network architecture review',
      'Segmentation and access control assessment',
      'Configuration hardening for network devices',
      'VPN and remote access security review',
    ],
    deliverables: ['Architecture review report', 'Hardening checklist', 'Prioritized remediation plan'],
  },
  {
    slug: 'endpoint-hardening',
    category: 'Defensive Security',
    title: 'Endpoint Hardening',
    summary: 'Locking down laptops, servers, and workstations against common attack techniques.',
    description:
      'Endpoints are usually the first foothold an attacker gets. We harden operating system configurations, review your EDR coverage, and close off the techniques most commonly used for initial access and persistence.',
    whatWeDo: [
      'OS and configuration hardening baselines',
      'EDR/antivirus coverage review',
      'Privilege and local admin rights review',
      'Patch and update management review',
    ],
    deliverables: ['Hardening baseline document', 'Endpoint risk report', 'Implementation support'],
  },
  // vCISO
  {
    slug: 'security-strategy',
    category: 'vCISO',
    title: 'Security Strategy',
    summary: 'Executive-level security leadership without the cost of a full-time hire.',
    description:
      'Our vCISO service gives you access to experienced security leadership to define strategy, prioritize investment, and align security with business objectives, on a schedule that fits your organization.',
    whatWeDo: [
      'Security roadmap and strategy development',
      'Risk-based investment prioritization',
      'Security program maturity assessment',
      'Ongoing advisory and leadership support',
    ],
    deliverables: ['Security strategy document', 'Prioritized roadmap', 'Quarterly review cadence'],
  },
  {
    slug: 'board-level-reporting',
    category: 'vCISO',
    title: 'Board-Level Reporting',
    summary: 'Translating security posture into language your board and executives can act on.',
    description:
      'We prepare and present security posture, risk, and investment updates in a format built for board and executive audiences, so security stays visible and understood at the leadership level.',
    whatWeDo: [
      'Board-ready security posture reporting',
      'Risk register and heat-map presentation',
      'Incident and audit summary briefings',
      'Ongoing executive advisory sessions',
    ],
    deliverables: ['Board report template and cadence', 'Executive briefing sessions', 'Risk visualization materials'],
  },
  {
    slug: 'risk-governance',
    category: 'vCISO',
    title: 'Risk Governance',
    summary: 'Building the governance structure that keeps security decisions accountable.',
    description:
      'We help you establish the policies, ownership, and review cadence needed to manage security risk as a continuous governance function, not a one-time project.',
    whatWeDo: [
      'Risk register setup and ownership assignment',
      'Governance policy and framework development',
      'Risk acceptance and exception processes',
      'Periodic governance review facilitation',
    ],
    deliverables: ['Risk governance framework', 'Policy documentation', 'Review cadence and templates'],
  },
  // Compliance & GRC
  {
    slug: 'grc',
    category: 'Compliance & GRC',
    title: 'GRC',
    summary: 'Governance, risk, and compliance programs built to fit how your organization actually works.',
    description:
      'We design and implement GRC programs that map controls to the frameworks that matter to you, without burying your team in process for its own sake.',
    whatWeDo: [
      'GRC program design and implementation',
      'Control mapping to relevant frameworks',
      'Third-party and vendor risk assessment',
      'Ongoing GRC program management support',
    ],
    deliverables: ['GRC program documentation', 'Control matrix', 'Implementation support'],
  },
  {
    slug: 'policy-documentation',
    category: 'Compliance & GRC',
    title: 'Policy Documentation',
    summary: 'Clear, audit-ready security policies tailored to your organization.',
    description:
      'We write and structure the security policies and procedures your organization needs for audits, certifications, and day-to-day operations, in language your teams will actually follow.',
    whatWeDo: [
      'Security policy suite development',
      'Procedure and standard documentation',
      'Policy gap analysis against target frameworks',
      'Periodic policy review and updates',
    ],
    deliverables: ['Complete policy suite', 'Gap analysis report', 'Review and update schedule'],
  },
  {
    slug: 'risk-reports',
    category: 'Compliance & GRC',
    title: 'Risk Reports',
    summary: 'Regular, structured risk reporting for compliance and internal visibility.',
    description:
      'We produce structured risk reports that give you a clear, current picture of your risk posture, formatted for the auditors, regulators, or leadership who need to see it.',
    whatWeDo: [
      'Periodic risk assessment and reporting',
      'Framework-mapped risk documentation',
      'Audit-ready evidence packaging',
      'Trend reporting across review cycles',
    ],
    deliverables: ['Structured risk reports', 'Audit evidence package', 'Trend dashboards'],
  },
  // Cloud & AI Security
  {
    slug: 'cloud-security-audits',
    category: 'Cloud & AI Security',
    title: 'Cloud Security Audits',
    summary: 'Configuration and architecture review across AWS, Azure, and GCP environments.',
    description:
      'We audit your cloud environment against best-practice benchmarks and real attacker techniques, identifying misconfigurations, excessive permissions, and exposed resources before they become incidents.',
    whatWeDo: [
      'Cloud configuration review (AWS/Azure/GCP)',
      'IAM and permissions audit',
      'Exposed resource and storage review',
      'Cloud architecture security assessment',
    ],
    deliverables: ['Cloud audit report', 'Prioritized remediation plan', 'Benchmark compliance summary'],
  },
  {
    slug: 'ai-security',
    category: 'Cloud & AI Security',
    title: 'AI Security',
    summary: 'Security assessment for AI and machine learning systems and pipelines.',
    description:
      'As AI systems move into production, they bring new attack surfaces. We assess model pipelines, data handling, and integration points for the security risks specific to AI-driven systems.',
    whatWeDo: [
      'AI/ML pipeline security assessment',
      'Model and data exposure review',
      'Prompt injection and abuse testing for LLM integrations',
      'Secure AI deployment recommendations',
    ],
    deliverables: ['AI security assessment report', 'Risk-ranked findings', 'Secure deployment guidance'],
  },
  {
    slug: 'devsecops',
    category: 'Cloud & AI Security',
    title: 'DevSecOps',
    summary: 'Embedding security directly into your development and deployment pipelines.',
    description:
      'We help you integrate security tooling and practices directly into your CI/CD pipeline, so vulnerabilities are caught before release instead of after, without slowing your teams down.',
    whatWeDo: [
      'CI/CD pipeline security integration',
      'Automated security tooling setup (SAST/DAST/SCA)',
      'Secure development workflow design',
      'Developer security training',
    ],
    deliverables: ['Pipeline integration', 'Tooling configuration', 'Team enablement session'],
  },
];

export function getServiceBySlug(slug: string) {
  return servicesData.find((s) => s.slug === slug);
}
