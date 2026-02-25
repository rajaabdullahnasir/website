export interface ComplianceData {
  id: string;
  title: string;
  fullName: string;
  authority: string;
  authorityLink: string;
  year: string;
  purpose: string;
  definition: string;
  role: string;
  benefits: string[];
  keyRules: string[];
  whoMustComply: string[];
  requirements: string[];
  penalties: string;
  howISeeWavesSupports: string[];
}

export const complianceData: ComplianceData[] = [
  {
    id: 'cmmc',
    title: 'CMMC',
    fullName: 'Cybersecurity Maturity Model Certification',
    authority: 'Department of Defense (DoD)',
    authorityLink: 'https://dodcio.defense.gov/CMMC/',
    year: '2020',
    purpose: 'To protect Federal Contract Information (FCI) and Controlled Unclassified Information (CUI) within the Defense Industrial Base (DIB).',
    definition: 'CMMC is a unified cybersecurity standard for future DoD acquisitions, designed to ensure that contractors have appropriate cybersecurity practices and processes in place to protect sensitive data.',
    role: 'It standardizes cybersecurity requirements across the DoD supply chain, moving away from self-certification to third-party assessments for higher levels of data sensitivity.',
    benefits: [
      'Eligibility to bid on DoD contracts',
      'Enhanced protection against advanced persistent threats (APTs)',
      'Improved overall cybersecurity posture',
      'Standardized security expectations across the supply chain',
      'Competitive advantage in the defense sector'
    ],
    keyRules: [
      'Implement controls based on NIST SP 800-171',
      'Undergo third-party assessments (for Level 2 and above)',
      'Maintain continuous compliance and reporting',
      'Ensure flow-down of requirements to subcontractors',
      'Protect CUI and FCI across all systems'
    ],
    whoMustComply: [
      'DoD prime contractors',
      'DoD subcontractors',
      'Suppliers in the Defense Industrial Base (DIB)',
      'Organizations handling FCI or CUI'
    ],
    requirements: [
      'Access Control and Identity Management',
      'Incident Response Planning',
      'System and Information Integrity',
      'Risk Management and Assessment',
      'Security Assessment and Authorization'
    ],
    penalties: 'Failure to comply results in the inability to bid on, win, or participate in DoD contracts, effectively locking organizations out of the defense supply chain.',
    howISeeWavesSupports: [
      'CMMC readiness assessments and gap analysis',
      'Implementation of NIST SP 800-171 controls',
      'Continuous monitoring for CUI environments',
      'Preparation for C3PAO audits',
      'Automated compliance reporting and evidence collection'
    ]
  },
  {
    id: 'cmmi',
    title: 'CMMI',
    fullName: 'Capability Maturity Model Integration',
    authority: 'ISACA',
    authorityLink: 'https://www.isaca.org/enterprise/cmmi-performance-solutions',
    year: '2002',
    purpose: 'To improve organizational performance and process maturity across software engineering and system development.',
    definition: 'CMMI v2.0 (managed by ISACA since 2016) is a process improvement framework that evaluates organizational capability across five maturity levels—Level 1 (Initial), Level 2 (Managed), Level 3 (Defined), Level 4 (Quantitatively Managed), and Level 5 (Optimizing). It consolidates the formerly separate CMMI-DEV, CMMI-SVC, and CMMI-ACQ models into one unified framework organized across 25 Practice Areas, covering software development, service delivery, and supply chain management within a single appraisal system.',
    role: 'It provides a framework for evaluating and improving the maturity of an organization\'s processes, moving from ad-hoc activities to optimized, measurable processes.',
    benefits: [
      'Increased productivity and efficiency',
      'Higher quality of products and services',
      'Reduced costs and rework',
      'Improved risk management and predictability',
      'Enhanced customer satisfaction'
    ],
    keyRules: [
      'Define clear organizational processes',
      'Measure and analyze process performance',
      'Implement continuous process improvement',
      'Ensure alignment with business objectives',
      'Conduct regular appraisals and audits'
    ],
    whoMustComply: [
      'Software development companies',
      'System engineering firms',
      'IT service providers',
      'Government contractors requiring CMMI appraisal'
    ],
    requirements: [
      'Process Management',
      'Project Management',
      'Engineering Processes',
      'Support Processes',
      'Quantitative Management'
    ],
    penalties: 'While not a regulatory law with fines, lack of CMMI maturity can result in lost contracts, especially in government and defense sectors where specific maturity levels are required.',
    howISeeWavesSupports: [
      'Process mapping and maturity assessments',
      'Integration of security into CMMI processes (DevSecOps)',
      'Automated metrics collection and reporting',
      'Continuous improvement tracking',
      'Audit preparation for CMMI appraisals'
    ]
  },
  {
    id: 'peca-pakistan',
    title: 'PECA Pakistan',
    fullName: 'Prevention of Electronic Crimes Act',
    authority: 'Government of Pakistan / FIA',
    authorityLink: 'https://na.gov.pk/',
    year: '2016',
    purpose: 'To prevent unauthorized acts with respect to information systems and provide for related offenses and penalties.',
    definition: 'PECA is Pakistan\'s primary cybercrime legislation, criminalizing various acts such as unauthorized access, data damage, electronic fraud, and cyber terrorism.',
    role: 'It provides the legal framework for investigating and prosecuting cybercrimes in Pakistan, empowering the Federal Investigation Agency (FIA) to take action.',
    benefits: [
      'Legal recourse against cybercriminals',
      'Protection of critical information infrastructure',
      'Deterrence against electronic fraud and forgery',
      'Framework for international cooperation in cybercrime',
      'Protection of citizens against cyber harassment'
    ],
    keyRules: [
      'Prohibits unauthorized access to information systems or data',
      'Criminalizes interference with critical infrastructure',
      'Mandates retention of traffic data by service providers for a minimum of one year',
      'Prohibits electronic forgery and fraud',
      'Regulates the issuance of warrants for search and seizure of data'
    ],
    whoMustComply: [
      'All citizens and residents of Pakistan',
      'Service providers (ISPs, telecom operators)',
      'Organizations operating information systems in Pakistan'
    ],
    requirements: [
      'Service providers must retain specified traffic data',
      'Organizations must cooperate with law enforcement during investigations',
      'Implementation of security measures to prevent unauthorized access (best practice)',
      'Reporting of cybercrimes to the FIA'
    ],
    penalties: 'Penalties range from fines of tens of thousands of rupees to imprisonment for up to 14 years, depending on the severity of the crime (e.g., cyber terrorism carries the highest penalties).',
    howISeeWavesSupports: [
      'Forensic readiness and evidence preservation',
      'Implementation of access controls to prevent unauthorized access',
      'Log management to support investigations',
      'Incident response and coordination with law enforcement',
      'Security awareness to prevent electronic fraud'
    ]
  },
  {
    id: 'dfars',
    title: 'DFARS',
    fullName: 'Defense Federal Acquisition Regulation Supplement',
    authority: 'Department of Defense (DoD)',
    authorityLink: 'https://www.acquisition.gov/dfars',
    year: '2015',
    purpose: 'To safeguard Covered Defense Information (CDI) and report cyber incidents rapidly.',
    definition: 'DFARS Clause 252.204-7012 requires DoD contractors to implement NIST SP 800-171 security requirements to protect sensitive defense information residing on their internal IT systems.',
    role: 'It mandates baseline cybersecurity standards for defense contractors and establishes strict protocols for reporting cyber incidents to the DoD.',
    benefits: [
      'Continued eligibility for DoD contracts',
      'Protection of sensitive defense technology',
      'Clear incident response protocols',
      'Improved supply chain security',
      'Alignment with federal security standards'
    ],
    keyRules: [
      'Implement NIST SP 800-171 controls',
      'Report cyber incidents to the DoD within 72 hours',
      'Submit malicious software to the DoD Cyber Crime Center',
      'Preserve and protect images of affected systems',
      'Flow down requirements to subcontractors'
    ],
    whoMustComply: [
      'DoD prime contractors',
      'DoD subcontractors',
      'Any organization handling Covered Defense Information (CDI)'
    ],
    requirements: [
      'Adequate security on all covered contractor information systems',
      'Rapid cyber incident reporting',
      'System Security Plan (SSP) creation',
      'Plan of Action and Milestones (POA&M) tracking',
      'Media protection and physical security'
    ],
    penalties: 'Non-compliance can lead to breach of contract, termination of DoD contracts, financial damages, and potential prosecution under the False Claims Act.',
    howISeeWavesSupports: [
      'NIST SP 800-171 compliance implementation',
      '72-hour incident response and reporting capabilities',
      'System Security Plan (SSP) generation',
      'Continuous monitoring of CDI environments',
      'Forensic data preservation for DoD reporting'
    ]
  },
  {
    id: 'dora',
    title: 'DORA',
    fullName: 'Digital Operational Resilience Act',
    authority: 'European Union',
    authorityLink: 'https://www.eiopa.europa.eu/digital-operational-resilience-act-dora_en',
    year: '2023',
    purpose: 'To ensure the financial sector in Europe is resilient against severe operational disruptions and cyber threats.',
    definition: 'DORA is an EU regulation that creates a binding, comprehensive information and communication technology (ICT) risk management framework for the EU financial sector.',
    role: 'It shifts the focus from financial resilience to operational resilience, ensuring financial entities can withstand, respond to, and recover from all types of ICT-related disruptions.',
    benefits: [
      'Enhanced resilience against cyber attacks',
      'Harmonized ICT risk management across the EU',
      'Better oversight of critical third-party providers',
      'Streamlined incident reporting',
      'Increased consumer trust in financial systems'
    ],
    keyRules: [
      'Establish a comprehensive ICT risk management framework',
      'Classify and report major ICT-related incidents',
      'Conduct regular digital operational resilience testing',
      'Manage ICT third-party risk effectively',
      'Share cyber threat information and intelligence'
    ],
    whoMustComply: [
      'Banks and credit institutions',
      'Insurance companies',
      'Investment firms',
      'Crypto-asset service providers',
      'Critical ICT third-party service providers (e.g., cloud providers)'
    ],
    requirements: [
      'ICT Risk Management Framework',
      'Incident Management and Reporting',
      'Resilience Testing (including Threat-Led Penetration Testing)',
      'Third-Party Risk Management Strategy',
      'Information Sharing Arrangements'
    ],
    penalties: 'Fines can reach up to 1% of the average daily worldwide turnover of the critical ICT third-party service provider in the preceding business year, applied daily for up to six months.',
    howISeeWavesSupports: [
      'ICT risk management framework design',
      'Threat-Led Penetration Testing (TLPT)',
      'Third-party risk assessment and monitoring',
      'Automated incident classification and reporting',
      'Continuous operational resilience monitoring'
    ]
  },
  {
    id: 'dpa-philippines',
    title: 'DPA Philippines',
    fullName: 'Data Privacy Act of 2012 (Republic Act No. 10173)',
    authority: 'National Privacy Commission (NPC)',
    authorityLink: 'https://www.privacy.gov.ph/data-privacy-act/',
    year: '2012',
    purpose: 'To protect the fundamental human right of privacy of communication while ensuring free flow of information to promote innovation and growth.',
    definition: 'The DPA is a comprehensive privacy law in the Philippines that regulates the processing of personal information and sensitive personal information by public and private entities.',
    role: 'It establishes the rules for data collection, processing, and storage, and mandates the appointment of a Data Protection Officer (DPO) for organizations.',
    benefits: [
      'Protection of citizens\' personal data',
      'Alignment with international data privacy standards',
      'Increased consumer trust',
      'Clear guidelines for data breach management',
      'Fostering a secure digital economy'
    ],
    keyRules: [
      'Obtain explicit consent before processing personal data',
      'Implement reasonable and appropriate security measures',
      'Appoint a Data Protection Officer (DPO)',
      'Report data breaches to the NPC within 72 hours',
      'Respect data subjects\' rights (access, correction, erasure)'
    ],
    whoMustComply: [
      'Any individual or entity processing personal data in the Philippines',
      'Foreign entities processing data of Philippine citizens',
      'Government agencies',
      'Private corporations and businesses'
    ],
    requirements: [
      'Privacy Impact Assessments (PIA)',
      'Data sharing agreements',
      'Breach response procedures',
      'Registration of data processing systems with the NPC',
      'Organizational, physical, and technical security measures'
    ],
    penalties: 'Violations can result in imprisonment ranging from 1 to 6 years and fines from PHP 500,000 to PHP 5,000,000, depending on the nature of the offense.',
    howISeeWavesSupports: [
      'Data discovery and classification',
      'Implementation of technical security controls',
      'Automated breach detection and 72-hour reporting support',
      'Privacy Impact Assessment (PIA) facilitation',
      'Data encryption and access management'
    ]
  },
  {
    id: 'dpdpa-india',
    title: 'DPDPA India',
    fullName: 'Digital Personal Data Protection Act',
    authority: 'Data Protection Board of India',
    authorityLink: 'https://www.meity.gov.in/data-protection-framework',
    year: '2023',
    purpose: 'To provide for the processing of digital personal data in a manner that recognizes both the right of individuals to protect their personal data and the need to process such data for lawful purposes.',
    definition: 'The DPDPA is India\'s comprehensive data protection legislation, focusing on digital personal data and establishing the obligations of Data Fiduciaries and the rights of Data Principals.',
    role: 'It modernizes India\'s privacy landscape, replacing older IT rules with a robust framework that emphasizes consent, purpose limitation, and significant penalties for breaches.',
    benefits: [
      'Empowerment of Data Principals (citizens)',
      'Clear regulatory framework for businesses',
      'Facilitation of cross-border data transfers',
      'Enhanced cybersecurity posture across industries',
      'Establishment of the Data Protection Board'
    ],
    keyRules: [
      'Process data only for lawful purposes with consent',
      'Provide clear notices in multiple languages',
      'Protect personal data with reasonable security safeguards',
      'Report personal data breaches to the Board and affected individuals',
      'Special protections for children\'s data'
    ],
    whoMustComply: [
      'Data Fiduciaries processing digital personal data in India',
      'Entities processing data outside India if offering goods/services to individuals in India',
      'Significant Data Fiduciaries (subject to stricter rules)',
      'Consent Managers'
    ],
    requirements: [
      'Notice and Consent mechanisms',
      'Data breach notification protocols',
      'Appointment of a Data Protection Officer (for Significant Fiduciaries)',
      'Data Protection Impact Assessments',
      'Grievance redressal mechanisms'
    ],
    penalties: 'Fines can be substantial, reaching up to ₹250 crore (approx. $30 million USD) for failure to take reasonable security safeguards to prevent personal data breaches.',
    howISeeWavesSupports: [
      'Implementation of reasonable security safeguards',
      'Data breach detection and rapid notification workflows',
      'Data lifecycle management and secure erasure',
      'Consent management technical integration',
      'Continuous security posture monitoring'
    ]
  },
  {
    id: 'gdpr',
    title: 'GDPR',
    fullName: 'General Data Protection Regulation',
    authority: 'European Union Data Protection Authorities',
    authorityLink: 'https://gdpr.eu/',
    year: '2018',
    purpose: 'To protect the privacy and personal data of European Union citizens and reshape the way organizations across the region approach data privacy.',
    definition: 'The GDPR is a comprehensive privacy and security law that imposes strict rules on organizations anywhere in the world, so long as they target or collect data related to people in the EU.',
    role: 'It introduced extra-territorial jurisdiction under Article 3, applying to any organization worldwide that targets or monitors EU residents, and replaced 28 divergent national data protection laws with a single harmonized regulation. The "one-stop-shop" mechanism (Articles 56–60) allows multi-country organizations to deal with a single Lead Supervisory Authority. It grants data subjects enforceable rights including access (Article 15), rectification (Article 16), erasure/right to be forgotten (Article 17), and data portability (Article 20).',
    benefits: [
      'Strong protection of individual privacy rights',
      'Unified data protection rules across the EU',
      'Increased transparency in data processing',
      'Enhanced organizational cybersecurity',
      'Global influence on privacy legislation'
    ],
    keyRules: [
      'Lawfulness, fairness, and transparency in processing',
      'Purpose limitation and data minimization',
      'Accuracy and storage limitation',
      'Integrity and confidentiality (security)',
      'Accountability of the data controller'
    ],
    whoMustComply: [
      'Any organization operating within the EU',
      'Organizations outside the EU that offer goods/services to EU residents',
      'Organizations that monitor the behavior of EU residents',
      'Data controllers and data processors'
    ],
    requirements: [
      'Explicit consent for data collection',
      'Appointment of a Data Protection Officer (DPO) in certain cases',
      'Data Protection Impact Assessments (DPIA)',
      '72-hour data breach notification',
      'Implementation of Privacy by Design and Default'
    ],
    penalties: 'Fines can reach up to €20 million or 4% of the firm\'s worldwide annual revenue from the preceding financial year, whichever amount is higher.',
    howISeeWavesSupports: [
      'Data discovery and mapping for EU citizen data',
      'Implementation of Privacy by Design technical controls',
      'Automated 72-hour breach detection and reporting',
      'Data encryption and pseudonymization',
      'Right to erasure (Data Subject Access Request) technical fulfillment'
    ]
  },
  {
    id: 'hipaa',
    title: 'HIPAA',
    fullName: 'Health Insurance Portability and Accountability Act',
    authority: 'Department of Health and Human Services (HHS)',
    authorityLink: 'https://www.hhs.gov/hipaa/index.html',
    year: '1996',
    purpose: 'To protect sensitive patient health information from being disclosed without the patient\'s consent or knowledge.',
    definition: 'HIPAA is a US federal law that establishes national standards to protect individuals\' medical records and other personal health information (PHI).',
    role: 'It partitions compliance obligations between Covered Entities (healthcare providers, health plans, clearinghouses) and Business Associates (third-party vendors handling PHI), requiring mandatory Business Associate Agreements (BAAs) to extend liability down the supply chain. The HITECH Act of 2009 significantly strengthened HIPAA by making Business Associates directly and independently liable for violations, and introduced a tiered civil monetary penalty structure scaled by culpability—from unknowing violations to willful neglect.',
    benefits: [
      'Protection of sensitive health information (PHI)',
      'Patient control over health data',
      'Standardization of electronic healthcare transactions',
      'Prevention of healthcare fraud and abuse',
      'Secure transition to electronic health records (EHR)'
    ],
    keyRules: [
      'Privacy Rule: Protects PHI and sets limits on uses and disclosures',
      'Security Rule: Requires administrative, physical, and technical safeguards',
      'Breach Notification Rule: Mandates reporting of PHI breaches',
      'Minimum Necessary Standard: Limit access to what is needed',
      'Business Associate Agreements (BAA) requirement'
    ],
    whoMustComply: [
      'Healthcare providers (doctors, clinics, hospitals)',
      'Health plans (insurance companies)',
      'Healthcare clearinghouses',
      'Business Associates (vendors handling PHI)'
    ],
    requirements: [
      'Access controls and unique user identification',
      'Encryption of PHI at rest and in transit',
      'Audit controls and activity tracking',
      'Facility access controls (physical security)',
      'Regular risk analyses and management'
    ],
    penalties: 'Fines range from $141 to $71,162 per violation (inflation-adjusted), with a maximum annual penalty exceeding $2.1 million for violations of an identical provision. The original statutory amounts under HITECH were $100–$50,000 per violation with a $1.5 million annual cap. Criminal charges can also apply.',
    howISeeWavesSupports: [
      'End-to-end encryption for PHI data',
      'Strict access control and identity management',
      'Comprehensive audit logging and monitoring',
      'HIPAA Security Rule risk assessments',
      'Secure communication and data transfer solutions'
    ]
  },
  {
    id: 'irdai',
    title: 'IRDAI',
    fullName: 'IRDAI Information and Cyber Security Guidelines',
    authority: 'Insurance Regulatory and Development Authority of India',
    authorityLink: 'https://irdai.gov.in/',
    year: '2023',
    purpose: 'To establish a robust cyber security framework for the insurance sector in India to mitigate cyber risks and protect policyholder data.',
    definition: 'The IRDAI Information and Cyber Security Guidelines (Circular Ref: IRDAI/SDD/CIR/MISC/068/03/2023) require all regulated entities to appoint a Chief Information Security Officer (CISO) with a direct reporting line to the Board, maintain a Board-approved Information Security Policy, conduct bi-annual Vulnerability Assessment and Penetration Testing (VAPT) by CERT-In empanelled auditors, implement a Cyber Crisis Management Plan (CCMP), and report cyber incidents to IRDAI within a mandatory 6-hour window — aligning with CERT-In\'s mandatory incident reporting directions of 2022.',
    role: 'It ensures the resilience of the Indian insurance sector against cyber threats, safeguarding sensitive financial and personal data of policyholders.',
    benefits: [
      'Enhanced protection of policyholder data',
      'Standardized security practices across the insurance sector',
      'Improved cyber resilience and incident response',
      'Board-level accountability for cybersecurity',
      'Trust and stability in the insurance market'
    ],
    keyRules: [
      'Formulate a Board-approved Information Security Policy',
      'Appoint a Chief Information Security Officer (CISO)',
      'Conduct regular vulnerability assessments and penetration testing (VAPT)',
      'Implement data loss prevention (DLP) mechanisms',
      'Report cyber incidents to IRDAI within 6 hours'
    ],
    whoMustComply: [
      'Insurance companies',
      'Insurance intermediaries',
      'Third-party administrators (TPAs)',
      'Other entities regulated by IRDAI'
    ],
    requirements: [
      'Information Security Governance framework',
      'Endpoint security and mobile device management',
      'Cloud security controls',
      'Cyber Crisis Management Plan (CCMP)',
      'Information security audits by CERT-In empanelled auditors'
    ],
    penalties: 'Non-compliance can result in regulatory action, financial penalties, restrictions on business operations, and reputational damage.',
    howISeeWavesSupports: [
      'Implementation of IRDAI-mandated security controls',
      'VAPT and continuous vulnerability management',
      'Data Loss Prevention (DLP) deployment',
      'Automated 6-hour incident reporting workflows',
      'Cloud security posture management (CSPM)'
    ]
  },
  {
    id: 'pcfp-pakistan',
    title: 'PCFP Pakistan',
    fullName: 'Payment Card Framework Pakistan',
    authority: 'State Bank of Pakistan (SBP)',
    authorityLink: 'https://www.sbp.org.pk/',
    year: '2020',
    purpose: 'To secure the payment card ecosystem in Pakistan and protect cardholder data from fraud and breaches.',
    definition: 'The PCFP establishes security guidelines and requirements for banks and payment service providers in Pakistan, heavily aligning with international standards like PCI DSS.',
    role: 'It ensures the integrity and security of electronic payments in Pakistan, fostering trust in digital financial services.',
    benefits: [
      'Reduced payment card fraud in Pakistan',
      'Protection of sensitive cardholder data',
      'Alignment with international payment security standards',
      'Increased consumer confidence in digital payments',
      'Standardized security for payment infrastructure'
    ],
    keyRules: [
      'Mandatory compliance with PCI DSS for all card processing entities',
      'Implementation of EMV (Chip and PIN) technology',
      'Strong customer authentication for online transactions (3D Secure)',
      'Continuous monitoring of payment networks for fraud',
      'Immediate reporting of payment security breaches to SBP'
    ],
    whoMustComply: [
      'Commercial banks issuing payment cards',
      'Acquiring banks and payment gateways',
      'Payment System Operators (PSOs) and Payment Service Providers (PSPs)',
      'Merchants handling card data'
    ],
    requirements: [
      'PCI DSS certification',
      'End-to-end encryption of payment data',
      'Fraud monitoring and detection systems',
      'Regular security audits and penetration testing',
      'Secure application development for payment apps'
    ],
    penalties: 'Non-compliance can result in severe penalties from the SBP, including fines, suspension of card issuance or acquiring privileges, and reputational damage.',
    howISeeWavesSupports: [
      'PCI DSS readiness and compliance implementation',
      'Deployment of fraud detection and monitoring systems',
      'Payment application security testing',
      'Encryption and tokenization of cardholder data',
      'Continuous compliance monitoring'
    ]
  },
  {
    id: 'iso-27001',
    title: 'ISO 27001',
    fullName: 'ISO/IEC 27001 Information Security Management',
    authority: 'International Organization for Standardization',
    authorityLink: 'https://www.iso.org/isoiec-27001-information-security.html',
    year: '2022',
    purpose: 'To provide a framework for establishing, implementing, maintaining, and continually improving an information security management system (ISMS).',
    definition: 'ISO 27001 is the world\'s best-known standard for information security management systems (ISMS). It defines requirements an ISMS must meet to ensure data confidentiality, integrity, and availability.',
    role: 'It serves as a globally recognized benchmark for security, helping organizations manage the security of assets such as financial information, intellectual property, and employee details.',
    benefits: [
      'Global recognition of security maturity',
      'Systematic approach to managing sensitive company information',
      'Reduced likelihood of security breaches',
      'Competitive advantage in vendor selection processes',
      'Continuous improvement of security posture'
    ],
    keyRules: [
      'Establish an Information Security Management System (ISMS)',
      'Conduct comprehensive risk assessments',
      'Implement appropriate risk treatment plans',
      'Define clear security policies and objectives',
      'Perform regular internal audits and management reviews'
    ],
    whoMustComply: [
      'Any organization seeking to formalize its security posture',
      'IT service providers and data centers',
      'SaaS companies and cloud providers',
      'Organizations required by clients to prove security maturity'
    ],
    requirements: [
      'Context of the organization and leadership commitment',
      'Information security risk assessment and treatment',
      'Implementation of Annex A controls (e.g., access control, cryptography)',
      'Performance evaluation and monitoring',
      'Continuous improvement and corrective actions'
    ],
    penalties: 'ISO 27001 is a voluntary standard, so there are no legal fines for non-compliance. However, failing an audit means losing certification, which can lead to lost business and contract breaches.',
    howISeeWavesSupports: [
      'ISMS design and implementation',
      'Automated risk assessment workflows',
      'Implementation of Annex A technical controls',
      'Continuous monitoring for audit readiness',
      'Evidence collection for certification audits'
    ]
  },
  {
    id: 'lgpd',
    title: 'LGPD',
    fullName: 'Lei Geral de Proteção de Dados Pessoais',
    authority: 'National Data Protection Authority (ANPD)',
    authorityLink: 'https://www.gov.br/anpd/pt-br',
    year: '2018',
    purpose: 'To protect the fundamental rights of freedom and privacy and the free development of the personality of the natural person in Brazil.',
    definition: 'The LGPD is Brazil\'s comprehensive data protection law, heavily inspired by the GDPR, regulating the processing of personal data of individuals located in Brazil.',
    role: 'It unifies over 40 different Brazilian statutes that previously governed personal data, creating a single, clear regulatory framework.',
    benefits: [
      'Enhanced privacy rights for Brazilian citizens',
      'Legal certainty for companies operating in Brazil',
      'Alignment with global data protection standards',
      'Clear rules for international data transfers',
      'Fostering a secure digital economy'
    ],
    keyRules: [
      'Processing must be based on one of 10 legal bases (including consent)',
      'Respect the 10 principles of data processing (e.g., purpose, necessity)',
      'Appoint a Data Protection Officer (Encarregado)',
      'Report security incidents to the ANPD and data subjects',
      'Ensure security and secrecy of data'
    ],
    whoMustComply: [
      'Organizations processing data within Brazil',
      'Organizations offering goods/services to individuals in Brazil',
      'Organizations processing data collected in Brazil',
      'Both public and private sectors'
    ],
    requirements: [
      'Records of processing activities',
      'Data Protection Impact Assessments (Relatório de Impacto)',
      'Implementation of security, technical, and administrative measures',
      'Mechanisms for data subjects to exercise their rights',
      'Incident response and notification procedures'
    ],
    penalties: 'Fines can reach up to 2% of a private legal entity\'s, group\'s, or conglomerate\'s revenue in Brazil in its last fiscal year, up to a maximum of 50 million reais (approx. $10 million USD) per infraction.',
    howISeeWavesSupports: [
      'Data mapping and classification for Brazilian data',
      'Implementation of technical security measures',
      'Incident detection and ANPD reporting workflows',
      'Data Subject Access Request (DSAR) automation',
      'Encryption and anonymization solutions'
    ]
  },
  {
    id: 'nca-ecc',
    title: 'NCA ECC',
    fullName: 'Essential Cybersecurity Controls',
    authority: 'National Cybersecurity Authority (NCA)',
    authorityLink: 'https://nca.gov.sa/en/legislation?item=144',
    year: '2018',
    purpose: 'To set the minimum cybersecurity requirements for organizations in Saudi Arabia to protect their information assets.',
    definition: 'The ECC-1:2018 comprises 114 cybersecurity sub-controls organized under 29 main controls across five mandatory domains: Cybersecurity Governance, Cybersecurity Defense (covering asset management, identity & access management, and cryptography), Cybersecurity Resilience (incident management and business continuity), Third-Party and Cloud Computing Cybersecurity, and Industrial Control Systems (ICS) Cybersecurity. It anchors a broader NCA framework suite that also includes the Cloud Cybersecurity Controls (CCC-1:2020) and the Telework Cybersecurity Controls (TCC-1:2020).',
    role: 'It acts as the foundational cybersecurity standard in the Kingdom, driving the national cybersecurity strategy and protecting critical assets from cyber threats.',
    benefits: [
      'Protection of national critical infrastructure',
      'Standardized cybersecurity practices across the Kingdom',
      'Improved resilience against cyber attacks',
      'Clear governance and accountability',
      'Alignment with Saudi Vision 2030 digital goals'
    ],
    keyRules: [
      'Establish cybersecurity governance and leadership',
      'Implement robust defense-in-depth architecture',
      'Ensure continuous cybersecurity monitoring',
      'Manage third-party and supply chain risks',
      'Conduct regular cybersecurity training and awareness'
    ],
    whoMustComply: [
      'Government agencies in Saudi Arabia',
      'Critical national infrastructure organizations',
      'Private sector entities owning/operating critical infrastructure',
      'Entities requested by the NCA to comply'
    ],
    requirements: [
      'Cybersecurity Governance (strategy, policies, roles)',
      'Cybersecurity Defense (asset management, IAM, crypto)',
      'Cybersecurity Resilience (incident management, BCM)',
      'Third-Party and Cloud Computing Cybersecurity',
      'Industrial Control Systems (ICS) Cybersecurity (if applicable)'
    ],
    penalties: 'Non-compliance can result in regulatory sanctions, operational restrictions, and significant reputational damage within the Kingdom.',
    howISeeWavesSupports: [
      'ECC compliance gap analysis and remediation',
      'Implementation of defense-in-depth technical controls',
      'Continuous monitoring and SOC services',
      'Third-party risk management solutions',
      'ICS/OT security implementation'
    ]
  },
  {
    id: 'nis2',
    title: 'NIS2',
    fullName: 'Network and Information Security Directive 2',
    authority: 'European Union',
    authorityLink: 'https://digital-strategy.ec.europa.eu/en/policies/nis2-directive',
    year: '2023',
    purpose: 'To achieve a high common level of cybersecurity across the Member States of the European Union.',
    definition: 'NIS2 is an EU-wide legislation that expands the scope of the original NIS Directive, imposing stricter cybersecurity risk management and reporting obligations on a wider range of critical sectors.',
    role: 'It modernizes the EU\'s legal framework for cybersecurity, addressing supply chain security, streamlining reporting obligations, and introducing more stringent supervisory measures.',
    benefits: [
      'Enhanced cybersecurity across critical EU sectors',
      'Improved supply chain security',
      'Harmonized incident reporting across member states',
      'Increased management accountability',
      'Stronger collective response to cyber threats'
    ],
    keyRules: [
      'Implement comprehensive risk management measures',
      'Report significant incidents within 24 hours (early warning)',
      'Ensure management bodies approve and oversee cybersecurity measures',
      'Secure the supply chain and third-party relationships',
      'Use cryptography and encryption effectively'
    ],
    whoMustComply: [
      'Essential entities (energy, transport, banking, health, water, digital infrastructure)',
      'Important entities (postal, waste management, chemicals, food, manufacturing)',
      'Digital providers (search engines, cloud services)',
      'Public administration entities'
    ],
    requirements: [
      'Risk analysis and information system security policies',
      'Incident handling and crisis management',
      'Supply chain security',
      'Basic computer hygiene practices and training',
      'Policies on cryptography and encryption'
    ],
    penalties: 'Fines for essential entities can reach up to €10 million or 2% of total worldwide annual turnover. For important entities, up to €7 million or 1.4% of turnover. Management can also be held personally liable.',
    howISeeWavesSupports: [
      'Risk management framework implementation',
      '24-hour early warning incident reporting automation',
      'Supply chain security assessments',
      'Implementation of advanced cryptography',
      'Management dashboards for cybersecurity oversight'
    ]
  },
  {
    id: 'pci-dss',
    title: 'PCI DSS',
    fullName: 'Payment Card Industry Data Security Standard',
    authority: 'PCI Security Standards Council',
    authorityLink: 'https://www.pcisecuritystandards.org/',
    year: '2004',
    purpose: 'To secure credit and debit card transactions against data theft and fraud.',
    definition: 'PCI DSS is a set of security standards designed to ensure that all companies that accept, process, store, or transmit credit card information maintain a secure environment.',
    role: 'It is the global standard for payment security, protecting cardholder data (CHD) and sensitive authentication data (SAD) across the entire payment ecosystem.',
    benefits: [
      'Prevention of credit card fraud and data breaches',
      'Increased customer confidence in payment systems',
      'Avoidance of costly fines and legal liabilities',
      'Improved overall IT security posture',
      'Global standard recognized by all major card brands'
    ],
    keyRules: [
      'Build and maintain a secure network and systems',
      'Protect cardholder data (encryption at rest and in transit)',
      'Maintain a vulnerability management program',
      'Implement strong access control measures',
      'Regularly monitor and test networks'
    ],
    whoMustComply: [
      'Merchants accepting card payments',
      'Payment processors and gateways',
      'Acquiring banks',
      'Service providers that impact the security of cardholder data'
    ],
    requirements: [
      'Install and maintain network security controls (firewalls)',
      'Do not use vendor-supplied defaults for passwords',
      'Protect stored cardholder data',
      'Encrypt transmission of cardholder data across open networks',
      'Track and monitor all access to network resources and cardholder data'
    ],
    penalties: 'Fines range from $5,000 to $100,000 per month for compliance violations. Additionally, banks may terminate relationships, preventing the business from accepting card payments.',
    howISeeWavesSupports: [
      'Network segmentation and firewall management',
      'Cardholder data encryption and tokenization',
      'Continuous vulnerability scanning and penetration testing',
      'Access control and multi-factor authentication (MFA)',
      'Log monitoring and SIEM integration'
    ]
  },
  {
    id: 'pdpl-saudi-arabia',
    title: 'PDPL Saudi Arabia',
    fullName: 'Personal Data Protection Law',
    authority: 'Saudi Data & AI Authority (SDAIA)',
    authorityLink: 'https://sdaia.gov.sa/',
    year: '2021',
    purpose: 'To protect personal data, ensure privacy, and regulate the collection, processing, and storage of personal data in Saudi Arabia.',
    definition: 'The PDPL is Saudi Arabia\'s first comprehensive national data protection law, establishing strict rules for processing personal data and granting rights to data subjects.',
    role: 'It aligns Saudi Arabia with global data protection standards, fostering trust in the digital economy and supporting the goals of Vision 2030.',
    benefits: [
      'Protection of individual privacy rights in KSA',
      'Clear guidelines for data processing and cross-border transfers',
      'Increased consumer trust in digital services',
      'Standardization of data protection practices',
      'Support for a secure digital economy'
    ],
    keyRules: [
      'Process data lawfully, fairly, and transparently (primarily via consent)',
      'Limit data collection to specific, clear, and legitimate purposes',
      'Ensure data accuracy and relevance',
      'Implement necessary organizational and technical security measures',
      'Notify SDAIA of data breaches within 72 hours'
    ],
    whoMustComply: [
      'Any entity processing personal data within Saudi Arabia',
      'Entities outside KSA processing data of individuals residing in KSA',
      'Both public and private sector organizations'
    ],
    requirements: [
      'Registration with SDAIA (for certain controllers)',
      'Privacy impact assessments',
      'Strict controls on cross-border data transfers',
      'Mechanisms for data subjects to exercise rights (access, correction, destruction)',
      'Maintenance of processing records'
    ],
    penalties: 'Violations can result in imprisonment for up to 2 years and/or fines up to SAR 3 million (approx. $800,000 USD) for unauthorized disclosure of sensitive data. Other violations carry fines up to SAR 5 million.',
    howISeeWavesSupports: [
      'Data discovery and classification for KSA residents',
      'Implementation of technical security controls',
      'Automated breach detection and SDAIA reporting',
      'Data localization and cross-border transfer compliance',
      'Consent management and DSAR fulfillment'
    ]
  },
  {
    id: 'pisf-pakistan-2025',
    title: 'PISF Pakistan 2025',
    fullName: 'Pakistan Information Security Framework 2025',
    authority: 'Ministry of IT & Telecom',
    authorityLink: 'https://moitt.gov.pk/',
    year: '2025',
    purpose: 'To establish a unified, national baseline for information security across public and private sectors in Pakistan.',
    definition: 'PISF 2025 is Pakistan\'s first unified national information security framework, mandated by the Ministry of IT & Telecom, requiring covered entities to adopt a risk-based approach aligned with ISO 27001:2022 and NIST CSF. It prescribes minimum security baselines across governance, asset management, access control, incident management, and business continuity, with sector-specific overlays for telecommunications, financial services, and energy. Compliance is verified through mandatory periodic audits by national cybersecurity authorities designated under the Ministry of IT & Telecom, applying to both government departments and Critical Information Infrastructure (CII) operators.',
    role: 'It serves as the primary standard for organizational cybersecurity in Pakistan, bridging the gap between international standards (like ISO 27001) and local regulatory needs.',
    benefits: [
      'Enhanced national cybersecurity posture',
      'Standardized security controls across industries',
      'Improved protection of citizen data',
      'Clear guidelines for incident response and reporting',
      'Fostering a secure digital ecosystem in Pakistan'
    ],
    keyRules: [
      'Implement a risk-based approach to information security',
      'Establish strong access controls and identity management',
      'Ensure data protection at rest and in transit',
      'Maintain continuous monitoring and logging',
      'Develop and test incident response and business continuity plans'
    ],
    whoMustComply: [
      'Federal and provincial government departments',
      'Critical Information Infrastructure (CII) operators',
      'Telecommunication companies',
      'Financial institutions and IT service providers'
    ],
    requirements: [
      'Information Security Governance',
      'Asset Management and Classification',
      'Vulnerability and Patch Management',
      'Network and Endpoint Security',
      'Security Awareness and Training'
    ],
    penalties: 'Non-compliance can lead to regulatory actions, operational restrictions, and mandatory audits by national cybersecurity authorities.',
    howISeeWavesSupports: [
      'PISF 2025 gap analysis and compliance roadmap',
      'Implementation of localized security controls',
      'Continuous monitoring and threat detection',
      'Incident response planning and execution',
      'Security awareness training for employees'
    ]
  },
  {
    id: 'sama',
    title: 'SAMA',
    fullName: 'SAMA Cyber Security Framework',
    authority: 'Saudi Central Bank (SAMA)',
    authorityLink: 'https://www.sama.gov.sa/',
    year: '2017',
    purpose: 'To ensure that SAMA-regulated entities maintain a robust cybersecurity posture to protect the financial sector of Saudi Arabia.',
    definition: 'The SAMA CSF (Version 1.0, 2017) is structured around four mandatory domains — Cyber Security Leadership and Governance, Cyber Security Risk Management and Compliance, Cyber Security Operations and Technology, and Third-Party Cyber Security — each subdivided into specific subdomains with defined principles, objectives, and numbered control considerations. It employs a six-level maturity model (Level 0–5), requiring all Member Organizations to achieve a minimum of Level 3. Built on NIST CSF, ISO 27001/27002, PCI DSS, BASEL, and ISF standards, it supersedes all prior SAMA cybersecurity circulars and mandates annual compliance self-assessments submitted directly to SAMA.',
    role: 'It is the cornerstone of financial cybersecurity in Saudi Arabia, ensuring the stability and security of the banking, insurance, and financing sectors.',
    benefits: [
      'Protection of the Saudi financial ecosystem',
      'Standardized security practices across financial institutions',
      'Enhanced resilience against targeted financial cyber attacks',
      'Clear governance and board-level accountability',
      'Improved customer trust in financial services'
    ],
    keyRules: [
      'Establish a dedicated cybersecurity function independent of IT',
      'Implement a risk-based cybersecurity strategy',
      'Ensure robust identity and access management (IAM)',
      'Conduct regular penetration testing and vulnerability assessments',
      'Report cyber incidents to SAMA immediately'
    ],
    whoMustComply: [
      'Banks operating in Saudi Arabia',
      'Insurance and reinsurance companies',
      'Financing companies',
      'Credit bureaus and financial market infrastructure'
    ],
    requirements: [
      'Cybersecurity Governance and Leadership',
      'Cybersecurity Risk Management',
      'Cybersecurity Operations and Technology',
      'Third-Party Cybersecurity',
      'Periodic compliance self-assessments and independent audits'
    ],
    penalties: 'Non-compliance can result in severe regulatory sanctions, financial penalties, suspension of licenses, and reputational damage.',
    howISeeWavesSupports: [
      'SAMA CSF compliance assessments and remediation',
      'Implementation of advanced SOC and SIEM capabilities',
      'Third-party risk management for financial supply chains',
      'Automated incident reporting to SAMA',
      'Independent cybersecurity audits and testing'
    ]
  },
  {
    id: 'sebi',
    title: 'SEBI',
    fullName: 'SEBI Cybersecurity and Cyber Resilience Framework',
    authority: 'Securities and Exchange Board of India',
    authorityLink: 'https://www.sebi.gov.in/',
    year: '2015',
    purpose: 'To ensure the cyber resilience of the Indian securities market and protect the integrity of financial data and transactions.',
    definition: 'SEBI\'s Cybersecurity and Cyber Resilience Framework (CSCRF), issued August 20, 2024, supersedes all prior SEBI cybersecurity circulars. It adopts five cyber resiliency goals from CERT-In\'s CCMP — Anticipate, Withstand, Contain, Recover, and Evolve — mapped to six NIST CSF-aligned cybersecurity functions: Governance, Identify, Protect, Detect, Respond, and Recover. All regulated entities are classified into five tiers (Market Infrastructure Institutions, Qualified REs, Mid-size REs, Small REs, and Self-Certification REs), with mandatory ISO 27001 certification, SOC establishment, Cyber Capability Index (CCI) assessments, and CERT-In audit obligations scaled proportionally to each tier\'s systemic risk.',
    role: 'It protects the Indian capital markets from cyber threats, ensuring continuous availability of trading platforms and safeguarding investor data.',
    benefits: [
      'Protection of investor data and financial assets',
      'High availability and resilience of trading systems',
      'Standardized security across market participants',
      'Rapid response to cyber incidents',
      'Maintained trust in the Indian capital markets'
    ],
    keyRules: [
      'Implement a comprehensive Cyber Security and Cyber Resilience policy',
      'Identify and classify critical assets',
      'Deploy strong access controls and multi-factor authentication',
      'Conduct regular Vulnerability Assessment and Penetration Testing (VAPT)',
      'Report cyber attacks and breaches to SEBI within 6 hours'
    ],
    whoMustComply: [
      'Stock Brokers and Depository Participants',
      'Mutual Funds and Asset Management Companies',
      'Stock Exchanges and Clearing Corporations',
      'KYC Registration Agencies (KRAs)'
    ],
    requirements: [
      'Governance structure with a designated CISO',
      'Network segmentation and perimeter security',
      'Endpoint security and data loss prevention (DLP)',
      'Comprehensive incident response and recovery plans',
      'Periodic comprehensive cybersecurity audits'
    ],
    penalties: 'Non-compliance can lead to regulatory action, financial penalties, suspension of trading terminals, and cancellation of registration.',
    howISeeWavesSupports: [
      'Implementation of SEBI-mandated security controls',
      'Continuous VAPT and vulnerability management',
      'Automated 6-hour incident reporting workflows',
      'Data Loss Prevention (DLP) and endpoint security',
      'Preparation for SEBI cybersecurity audits'
    ]
  },
  {
    id: 'ncsp-2021-pakistan',
    title: 'NCSP Pakistan',
    fullName: 'National Cyber Security Policy 2021',
    authority: 'Government of Pakistan',
    authorityLink: 'https://moitt.gov.pk/',
    year: '2021',
    purpose: 'To secure Pakistan\'s cyberspace, protect critical information infrastructure, and foster a robust digital economy.',
    definition: 'The NCSP 2021 is Pakistan\'s first-ever national cybersecurity policy, organized around 10 focus areas: institutional framework, protection and information sharing, infrastructure security, audit and compliance, ICT product integrity screening, trust in digital transitions, capacity building, indigenization and R&D, cybercrime prevention, and international collaboration. It mandates a three-tier CERT ecosystem — National (nCERT, under NTISB), Sectoral (covering Defense, Telecom, Banking, Power, and Government), and Organizational — governed by a Cyber Governance Policy Committee (CGPC) responsible for drafting a new Cybersecurity Act and sector-specific security standards.',
    role: 'It provides the strategic direction for all cybersecurity initiatives in the country, mandating the creation of a national response framework and sector-specific CERTs.',
    benefits: [
      'Unified national approach to cybersecurity',
      'Protection of Critical Information Infrastructure (CII)',
      'Development of local cybersecurity expertise and industry',
      'Enhanced national resilience against cyber warfare',
      'Improved public-private partnerships in cybersecurity'
    ],
    keyRules: [
      'Establishment of a Cyber Governance structure (Cyber Security Evaluation Committee)',
      'Mandatory security audits for government and CII entities',
      'Data localization for critical and sensitive data',
      'Development of Sectoral Computer Emergency Response Teams (CERTs)',
      'Promotion of indigenous cybersecurity solutions'
    ],
    whoMustComply: [
      'Federal and Provincial Governments',
      'Critical Information Infrastructure (CII) operators',
      'Telecom and Internet Service Providers',
      'Financial institutions and energy sector'
    ],
    requirements: [
      'Implementation of baseline security standards',
      'Integration with national and sectoral CERTs',
      'Compliance with data localization directives',
      'Regular cybersecurity capacity building and training',
      'Incident reporting to relevant authorities'
    ],
    penalties: 'While a policy document rather than a penal law, non-compliance by government entities or CII operators leads to administrative actions, loss of operating licenses, and intervention by national security agencies.',
    howISeeWavesSupports: [
      'Alignment of organizational strategy with NCSP 2021',
      'Critical Information Infrastructure (CII) protection implementation',
      'Data localization and secure sovereign cloud architecture',
      'Integration with sectoral CERTs and automated reporting',
      'Indigenous cybersecurity capacity building and training'
    ]
  }
];
