import { useState } from 'react';
import { motion, AnimatePresence } from 'motion/react';
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
  X,
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

const contributors = [
  { name: 'iSeeWaves', logo: '/images/iSeeWaves.png' },
  { name: 'National Incubation Center for Aerospace Technologies', logo: '/images/nicat.png' },
  { name: 'P@SHA Startup Hub', logo: '/images/pasha-startup-hub.png' },
  { name: 'National CERT', logo: '/images/ncert.png' },
  { name: 'Ignite National Technology Fund', logo: '/images/ignite-logo.png' },
  { name: 'International Islamic University Islamabad', logo: '/images/IIUI-logos-2.jpg' },
];
const loopContributors = [...contributors, ...contributors];

interface Speaker {
  name: string;
  designation: string;
  photo?: string;
}

interface Episode {
  number: number;
  title: string;
  info: string;
  date: string;
  venue: string;
  speakers: Speaker[];
  gallery: string[];
}

const EP1_DIR = '/images/PCA/Threat-Horizon-Pakistan1';
const EP2_DIR = '/images/PCA/Threat-Horizon-Pakistan2';

const episodes: Episode[] = [
  {
    number: 1,
    title: 'Threat Horizon Pakistan - Episode 1',
    info: "The inaugural edition of Threat Horizon Pakistan, bringing together government, industry, and academia to discuss the country's evolving cyber threat landscape.",
    date: 'Details to be published',
    venue: 'Islamabad, Pakistan',
    speakers: [
      { name: 'Abdullah Nasir', designation: 'Founder & CEO, iSeeWaves / Organizer, PCA', photo: `${EP1_DIR}/PCA-Speakers/abdullah_nasir_keynote.jpg` },
      { name: 'Dr. Shah Nazir', designation: 'Speaker', photo: `${EP1_DIR}/PCA-Speakers/dr_shah_nazir.jpg` },
      { name: 'Quratulain Chaudhary', designation: 'Speaker', photo: `${EP1_DIR}/PCA-Speakers/quratulain_chaudhary.jpg` },
      { name: 'Fizza Malik', designation: 'Speaker', photo: `${EP1_DIR}/PCA-Speakers/fizza_malik.jpg` },
      { name: 'Charles Jeremiah', designation: 'Speaker', photo: `${EP1_DIR}/PCA-Speakers/charles_jeremiah.jpg` },
      { name: 'Salman Dar', designation: 'Speaker', photo: `${EP1_DIR}/PCA-Speakers/salman_dar.jpg` },
    ],
    gallery: ['1', '2', '3', '4', '5', '6', '8', '10', '11', '12', '13', '14', '15', '16', '21', '26', '28', '32', '33', '39', '49', '50'].map(
      (n) => `${EP1_DIR}/Event-Pictures/${n}.jpg`
    ).concat([`${EP1_DIR}/Event-Pictures/37.JPG`]),
  },
  {
    number: 2,
    title: 'Threat Horizon Pakistan - Episode 2',
    info: 'The second edition continues the conversation on national cybersecurity readiness, featuring deeper technical sessions and expanded institutional participation.',
    date: 'Details to be published',
    venue: 'Islamabad, Pakistan',
    speakers: [
      { name: 'Abdullah Nasir', designation: 'Founder & CEO, iSeeWaves / Organizer, PCA', photo: `${EP2_DIR}/PCA-Speakers/Abdullah-Nasir.jpg` },
      { name: 'Dr. Sidrah Khan', designation: 'Speaker', photo: `${EP2_DIR}/PCA-Speakers/Dr-Sidrah-Khan.jpg` },
      { name: 'Dr. Muhammad Usman', designation: 'Speaker', photo: `${EP2_DIR}/PCA-Speakers/Dr-Muhammad-Usman.jpg` },
      { name: 'Zubair Elahi', designation: 'Speaker', photo: `${EP2_DIR}/PCA-Speakers/Zubair-Elahi.jpg` },
      { name: 'Aizaz Mohammad', designation: 'Speaker', photo: `${EP2_DIR}/PCA-Speakers/Aizaz-Mohammad.jpg` },
      { name: 'Tariq Mahmood', designation: 'Speaker', photo: `${EP2_DIR}/PCA-Speakers/Tariq-mahmood.jpg` },
      { name: 'Talat Ahmed Bhutta', designation: 'Speaker', photo: `${EP2_DIR}/PCA-Speakers/Talat-Ahmed-Bhutta.jpg` },
      { name: 'Fahd Shahab Kakakhel', designation: 'Speaker', photo: `${EP2_DIR}/PCA-Speakers/Fahd-Shahab-Kakakhel.jpg` },
      { name: 'Masoom Raza', designation: 'Speaker', photo: `${EP2_DIR}/PCA-Speakers/Masoom-Raza.jpg` },
      { name: 'Zunaira Omar', designation: 'Speaker', photo: `${EP2_DIR}/PCA-Speakers/Zunaira-Omar.jpg` },
      { name: 'Huzaifa Arif', designation: 'Speaker', photo: `${EP2_DIR}/PCA-Speakers/Huzaifa-Arif.jpg` },
    ],
    gallery: ['IMG_0400', 'IMG_0405', 'IMG_0407', 'IMG_0412', 'IMG_0418', 'IMG_0424', 'IMG_0431', 'IMG_0433', 'IMG_0441', 'IMG_0447', 'IMG_0456', 'IMG_0459', 'IMG_0464'].map(
      (n) => `${EP2_DIR}/Event-Pictures/${n}.jpg`
    ),
  },
];

export default function PCAPage() {
  const [lightboxImg, setLightboxImg] = useState<string | null>(null);

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
          <div className="w-40 h-40 flex items-center justify-center mx-auto mb-2">
            <img src="/images/PCA.png" alt="PCA Logo" className="w-full h-full object-contain" />
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

              <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
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

              {/* Speakers */}
              <div className="mb-8">
                <div className="text-xs text-gray-500 uppercase tracking-wide mb-3">Speakers</div>
                <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4">
                  {ep.speakers.map((s) => (
                    <div key={s.name} className="flex items-center gap-3">
                      <div className="w-11 h-11 rounded-full overflow-hidden shrink-0 border border-gray-200 bg-gradient-to-br from-teal-400/30 to-[#00C08B]/30">
                        {s.photo ? (
                          <img src={s.photo} alt={s.name} className="w-full h-full object-cover" />
                        ) : (
                          <div className="w-full h-full flex items-center justify-center">
                            <span className="text-xs font-bold text-[#0B2545]">
                              {s.name.split(' ').map((n) => n[0]).join('').slice(0, 2)}
                            </span>
                          </div>
                        )}
                      </div>
                      <div className="min-w-0">
                        <div className="text-sm font-semibold text-[#0B2545] leading-tight truncate">{s.name}</div>
                        <div className="text-xs text-gray-500 leading-tight truncate">{s.designation}</div>
                      </div>
                    </div>
                  ))}
                </div>
              </div>

              {/* Event gallery */}
              {ep.gallery.length > 0 && (
                <div className="mb-6">
                  <div className="text-xs text-gray-500 uppercase tracking-wide mb-3">Event Photos</div>
                  <div className="grid grid-cols-3 sm:grid-cols-4 md:grid-cols-6 gap-2">
                    {ep.gallery.map((img) => (
                      <button
                        key={img}
                        onClick={() => setLightboxImg(img)}
                        className="aspect-square rounded-lg overflow-hidden border border-gray-200 hover:opacity-80 transition-opacity"
                      >
                        <img src={img} alt="Event" className="w-full h-full object-cover" loading="lazy" />
                      </button>
                    ))}
                  </div>
                </div>
              )}

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
          {loopContributors.map((c, idx) => (
            <div
              key={`${c.name}-${idx}`}
              title={c.name}
              className="glass-card rounded-xl border border-gray-200 px-8 py-5 flex items-center justify-center shrink-0 grayscale hover:grayscale-0 opacity-70 hover:opacity-100 transition-all h-20 w-40"
            >
              <img src={c.logo} alt={c.name} className="max-h-12 max-w-full object-contain" />
            </div>
          ))}
        </div>
      </div>

      {/* Lightbox */}
      <AnimatePresence>
        {lightboxImg && (
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            onClick={() => setLightboxImg(null)}
            className="fixed inset-0 z-[300] bg-black/80 flex items-center justify-center p-4 cursor-zoom-out"
          >
            <button
              onClick={() => setLightboxImg(null)}
              className="absolute top-6 right-6 w-10 h-10 rounded-full bg-white/10 hover:bg-white/20 flex items-center justify-center text-white"
            >
              <X className="w-5 h-5" />
            </button>
            <img src={lightboxImg} alt="Event" className="max-w-full max-h-full rounded-lg object-contain" />
          </motion.div>
        )}
      </AnimatePresence>

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
