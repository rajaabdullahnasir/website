import { motion } from 'motion/react';
import {
  ArrowLeft,
  Users,
  Calendar,
  BookOpen,
  Handshake,
  ArrowRight,
  MapPin,
  CalendarDays,
  FileText,
  Linkedin,
  Facebook,
  Instagram,
  MessageCircle,
} from 'lucide-react';
import { Link } from 'react-router-dom';

const pillars = [
  {
    icon: Users,
    title: 'Community',
    body: 'A network connecting cybersecurity professionals, students, and institutions across Pakistan to learn from and support one another.',
  },
  {
    icon: Calendar,
    title: 'Events',
    body: 'Meetups, workshops, and flagship events like Threat Horizons Pakistan, bringing together government, industry, and academia.',
  },
  {
    icon: BookOpen,
    title: 'Knowledge Sharing',
    body: 'Whitepapers, research, and speaker sessions from practitioners working across offensive security, defense, and compliance.',
  },
  {
    icon: Handshake,
    title: 'Partnerships',
    body: "Collaborations with government bodies, industry leaders, and academic institutions to strengthen Pakistan's cybersecurity ecosystem.",
  },
];

const contributors = ['iSeeWaves', 'Omnitell Tech Pakistan', 'NICAT', 'P@SHA', 'National CERT', 'Ignite'];
const loopContributors = [...contributors, ...contributors];

interface Speaker {
  name: string;
  designation: string;
}

interface Episode {
  number: number;
  title: string;
  info: string;
  date: string;
  venue: string;
  speakers: Speaker[];
}

const episodes: Episode[] = [
  {
    number: 1,
    title: 'Threat Horizon Pakistan - Episode 1',
    info: "The inaugural edition of Threat Horizon Pakistan, bringing together government, industry, and academia to discuss the country's evolving cyber threat landscape.",
    date: 'Details to be published',
    venue: 'Islamabad, Pakistan',
    speakers: [
      { name: 'Abdullah Nasir', designation: 'Founder & CEO, iSeeWaves / Organizer, PCA' },
      { name: 'Speaker TBA', designation: 'Industry Representative' },
      { name: 'Speaker TBA', designation: 'Government Representative' },
    ],
  },
  {
    number: 2,
    title: 'Threat Horizon Pakistan - Episode 2',
    info: 'The second edition continues the conversation on national cybersecurity readiness, featuring deeper technical sessions and expanded institutional participation.',
    date: 'Details to be published',
    venue: 'Islamabad, Pakistan',
    speakers: [
      { name: 'Abdullah Nasir', designation: 'Founder & CEO, iSeeWaves / Organizer, PCA' },
      { name: 'Speaker TBA', designation: 'Industry Representative' },
    ],
  },
];

export default function PCAPage() {
  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        {/* Logo + Header */}
        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="text-center mb-14">
          <div className="w-20 h-20 rounded-2xl bg-gradient-to-br from-teal-500 to-[#00C08B] flex items-center justify-center mx-auto mb-6 shadow-lg">
            <span className="text-white font-black text-2xl tracking-tight">PCA</span>
          </div>
          <span className="text-teal-500 text-sm font-bold tracking-widest uppercase">Community Initiative</span>
          <h1 className="text-4xl md:text-6xl font-bold text-[#0B2545] mt-4 mb-6">
            Pakistan Cybersecurity <span className="text-teal-500">Alliance</span>
          </h1>
          <p className="text-lg text-gray-600 max-w-2xl mx-auto mb-6">
            A community platform connecting cybersecurity professionals, students, and institutions across Pakistan,
            founded and led by the iSeeWaves team.
          </p>
          <div className="flex items-center justify-center gap-3">
            <a
              href="https://www.linkedin.com/showcase/iseewaves-pca"
              target="_blank"
              rel="noopener noreferrer"
              className="w-10 h-10 rounded-full glass-card flex items-center justify-center text-gray-600 hover:text-blue-600 transition-colors"
              aria-label="PCA on LinkedIn"
            >
              <Linkedin className="w-5 h-5" />
            </a>
            <a
              href="https://web.facebook.com/iseewaves.pca/"
              target="_blank"
              rel="noopener noreferrer"
              className="w-10 h-10 rounded-full glass-card flex items-center justify-center text-gray-600 hover:text-blue-500 transition-colors"
              aria-label="PCA on Facebook"
            >
              <Facebook className="w-5 h-5" />
            </a>
            <a
              href="https://www.instagram.com/pk_cybersecurity_alliance/"
              target="_blank"
              rel="noopener noreferrer"
              className="w-10 h-10 rounded-full glass-card flex items-center justify-center text-gray-600 hover:text-pink-500 transition-colors"
              aria-label="PCA on Instagram"
            >
              <Instagram className="w-5 h-5" />
            </a>
          </div>
        </motion.div>

        {/* Pillars */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-16">
          {pillars.map((p, idx) => (
            <motion.div
              key={p.title}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: idx * 0.1 }}
              className="glass-card rounded-2xl border border-gray-200 p-8"
            >
              <div className="w-12 h-12 rounded-xl bg-teal-400/10 flex items-center justify-center mb-5">
                <p.icon className="w-6 h-6 text-teal-500" />
              </div>
              <h3 className="text-xl font-bold text-[#0B2545] mb-2">{p.title}</h3>
              <p className="text-gray-600 leading-relaxed">{p.body}</p>
            </motion.div>
          ))}
        </div>

        {/* Get Involved */}
        <div className="glass-card rounded-2xl border border-teal-500/20 p-10 text-center mb-20">
          <h2 className="text-2xl font-bold text-[#0B2545] mb-3">Get Involved</h2>
          <p className="text-gray-600 max-w-xl mx-auto mb-8">
            Whether you are a student, a practitioner, or an institution, there is a place for you in PCA.
          </p>
          <div className="flex flex-wrap items-center justify-center gap-4">
            <a
              href="https://chat.whatsapp.com/L2E27bvy7MwKVPSOtnSMB5"
              target="_blank"
              rel="noopener noreferrer"
              className="flex items-center gap-2 px-8 py-4 rounded-full bg-teal-500 hover:bg-teal-600 text-white font-semibold transition-all hover:scale-105"
            >
              <MessageCircle className="w-4 h-4" />
              Join the Community
              <ArrowRight className="w-4 h-4" />
            </a>
            <a
              href="mailto:info@iseewaves.pk?subject=PCA%20Events"
              className="flex items-center gap-2 px-8 py-4 rounded-full glass-card text-[#0B2545] font-semibold hover:bg-gray-100 transition-all"
            >
              Upcoming Events
            </a>
            <a
              href="mailto:info@iseewaves.pk?subject=Partner%20with%20PCA"
              className="flex items-center gap-2 px-8 py-4 rounded-full glass-card text-[#0B2545] font-semibold hover:bg-gray-100 transition-all"
            >
              Partner with PCA
            </a>
          </div>
        </div>

        {/* Threat Horizon Pakistan Episodes */}
        <div className="mb-10 text-center">
          <span className="text-teal-500 text-sm font-bold tracking-widest uppercase">Flagship Event Series</span>
          <h2 className="text-3xl md:text-4xl font-bold text-[#0B2545] mt-3">Threat Horizon Pakistan</h2>
        </div>

        <div className="space-y-10 mb-20">
          {episodes.map((ep, idx) => (
            <motion.div
              key={ep.number}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: idx * 0.1 }}
              className="glass-card rounded-2xl border border-gray-200 p-8 md:p-10"
            >
              <h3 className="text-xl md:text-2xl font-bold text-[#0B2545] mb-3">{ep.title}</h3>
              <p className="text-gray-600 leading-relaxed mb-6">{ep.info}</p>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                <div className="flex items-start gap-3">
                  <CalendarDays className="w-5 h-5 text-teal-500 mt-0.5 shrink-0" />
                  <div>
                    <div className="text-xs text-gray-500 uppercase tracking-wide">Date</div>
                    <div className="text-sm text-[#0B2545] font-medium">{ep.date}</div>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <MapPin className="w-5 h-5 text-teal-500 mt-0.5 shrink-0" />
                  <div>
                    <div className="text-xs text-gray-500 uppercase tracking-wide">Venue</div>
                    <div className="text-sm text-[#0B2545] font-medium">{ep.venue}</div>
                  </div>
                </div>
              </div>

              <div className="mb-6">
                <div className="text-xs text-gray-500 uppercase tracking-wide mb-3">Speakers</div>
                <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
                  {ep.speakers.map((s) => (
                    <div key={s.name} className="flex items-center gap-3">
                      <div className="w-11 h-11 rounded-full bg-gradient-to-br from-teal-400/30 to-[#00C08B]/30 flex items-center justify-center shrink-0 border border-gray-200">
                        <span className="text-xs font-bold text-[#0B2545]">
                          {s.name
                            .split(' ')
                            .map((n) => n[0])
                            .join('')
                            .slice(0, 2)}
                        </span>
                      </div>
                      <div>
                        <div className="text-sm font-semibold text-[#0B2545] leading-tight">{s.name}</div>
                        <div className="text-xs text-gray-500 leading-tight">{s.designation}</div>
                      </div>
                    </div>
                  ))}
                </div>
              </div>

              <div className="flex flex-wrap items-center gap-4 pt-4 border-t border-gray-100">
                <a
                  href="mailto:info@iseewaves.pk?subject=Threat%20Horizon%20Pakistan%20Whitepaper%20Request"
                  className="inline-flex items-center gap-2 text-sm font-medium text-teal-500 hover:underline"
                >
                  <FileText className="w-4 h-4" />
                  Request Event Whitepaper (PDF)
                </a>
              </div>
            </motion.div>
          ))}

          <motion.div
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="glass-card rounded-2xl border border-dashed border-gray-300 p-10 text-center"
          >
            <h3 className="text-xl font-bold text-[#0B2545] mb-2">Threat Horizon Pakistan - Episode 3</h3>
            <p className="text-gray-600">Coming soon.</p>
          </motion.div>
        </div>

        {/* Contributors slider */}
        <div className="text-center mb-8">
          <span className="text-gray-500 text-sm font-semibold tracking-widest uppercase">Contributors</span>
        </div>
      </div>

      <div className="relative w-full overflow-hidden">
        <div className="absolute left-0 top-0 bottom-0 w-24 bg-gradient-to-r from-[#F6F8FB] to-transparent z-10 pointer-events-none" />
        <div className="absolute right-0 top-0 bottom-0 w-24 bg-gradient-to-l from-[#F6F8FB] to-transparent z-10 pointer-events-none" />
        <div className="pca-marquee-track flex items-center gap-6 w-max">
          {loopContributors.map((name, idx) => (
            <div
              key={`${name}-${idx}`}
              className="glass-card rounded-xl border border-gray-200 px-8 py-5 flex items-center justify-center shrink-0 grayscale hover:grayscale-0 opacity-70 hover:opacity-100 transition-all"
            >
              <span className="text-[#0B2545] font-semibold whitespace-nowrap text-sm md:text-base">{name}</span>
            </div>
          ))}
        </div>
      </div>

      <style>{`
        .pca-marquee-track {
          animation: pca-marquee 26s linear infinite;
        }
        @keyframes pca-marquee {
          0% { transform: translateX(0); }
          100% { transform: translateX(-50%); }
        }
      `}</style>
    </div>
  );
}
