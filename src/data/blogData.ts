export interface BlogPost {
  id: string;
  title: string;
  excerpt: string;
  content: string[];
  author: string;
  date: string;
  readTime: string;
  image: string;
  category: string;
}

export const blogPosts: BlogPost[] = [
  {
    id: 'First-Software-Bill-of-Materials-PK-Framework',
    title: 'How iSeeWaves is Building the Nation’s First Software Bill of Materials (SBOM) Framework "myESI"',
    excerpt: 'iSeeWaves has officially developed Pakistan’s first indigenous Software Bill of Materials (SBOM) framework "myESI", a landmark step toward software transparency, digital trust, and national cybersecurity resilience.',
    content: [
      'A New Chapter for Pakistan’s Tech Future Every great transformation starts with a realization that the future won’t wait for anyone. For decades, Pakistan’s technology ecosystem has excelled in software development, freelancing, and IT exports but deep-tech innovation, especially in cybersecurity and AI, remained largely unexplored. That’s where iSeeWaves Pvt. Ltd. comes in. Founded with a mission to bridge the gap between research, innovation, and real-world cybersecurity, iSeeWaves has become a movement of young technologists dedicated to building solutions that protect trust, privacy, and digital sovereignty. And now, we’ve taken a historic step forward by developing myESI (My Enterprise Security Intelligence), Pakistan’s first-ever Software Bill of Materials (SBOM) framework.',
      'Understanding the Problem:', 'Modern software isn’t built from scratch it’s assembled using hundreds of open-source libraries, APIs, and third-party components. While this speeds up innovation, it also introduces invisible risks. A single vulnerable dependency in a software stack can compromise entire organizations as seen in global incidents like SolarWinds and Log4j. Unfortunately, most organizations in Pakistan don’t even know what’s inside their own software. Without transparency, there can be no trust and without trust, there can be no security. That’s the gap we set out to close.',
      'The Solution:', 
      'An SBOM (Software Bill of Materials) is a structured record of all the components, dependencies, and licenses that make up a software system essentially, its digital “ingredient list.” International cybersecurity bodies like: Cybersecurity and Infrastructure Security Agency – USA, European Union Agency for Cybersecurity, and National Institute of Standards and Technology are already pushing SBOM adoption across the global tech industry. However, Pakistan had no local SBOM framework, no open initiative, and no structured tool designed for its ecosystem. That’s when we at iSeeWaves decided to take the lead.',
      '',
      'What Makes iSeeWaves’ SBOM Unique?',
      'Our SBOM system "myESI" is designed with AI assistance, automated vulnerability mapping, and privacy-first principles. It allows developers, security analysts, and organizations to: Generate and visualize software inventories in real time, Detect high-risk components before deployment, Ensure compliance with international cybersecurity standards and Protect digital supply chains across critical sectors like finance, healthcare, and defense',
      'What makes this milestone extraordinary isn’t just the technology it’s who built it.',
      'With the vision of Abdullah Nasir SBOM framework was developed by a nationwide network of students and early-career engineers working under ISEEWAVES (PRIVATE) LIMITED. They come from different universities, backgrounds, and cities yet share one purpose:',
      'To make Pakistan a creator of global technology.',
      'Every commit, every test, every late-night debugging session was powered by passion, curiosity, and a shared vision of national progress. This is proof that when Pakistan’s youth are given direction and purpose, they can create solutions that meet and even exceed international standards.',
      'Collaboration Over Competition',
      'We believe innovation flourishes through collaboration. That’s why iSeeWaves is open to partnerships with Universities, Tech Companies and Government institutions to build a unified digital trust framework for Pakistan. Our goal is not just to create technology, but to create an ecosystem where every Pakistani software product is transparent, traceable, and trusted globally.',
      'The Road to 2026:',
      'The launch of the myESI (My Enterprise Security Intelligence) SBOM system marks the beginning, not the end. Over the next year, iSeeWaves aims to expand partnerships with research institutions and cybersecurity agencies, launch an open-source collaboration initiative for developers nationwide, empower 500+ young innovators through training and incubation programs and position Pakistan as a regional hub for AI-driven cybersecurity innovation. We’re not waiting for the world to notice us, we’re building something so meaningful, it can’t be ignored.',
    ],
    author: 'Abdullah',
    date: 'November 1, 2025',
    readTime: '5 min read',
    image: '/images/blog/blog1.jpeg',
    category: 'Technology'
  },
];
