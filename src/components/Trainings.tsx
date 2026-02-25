import { motion } from 'motion/react';
import { BookOpen, Users, Award, Shield } from 'lucide-react';

export default function Trainings() {
  const programs = [
    {
      icon: Users,
      title: 'Corporate Awareness',
      desc: 'Educate your workforce on phishing, social engineering, and safe online practices to build a human firewall.',
    },
    {
      icon: BookOpen,
      title: 'Technical Training',
      desc: 'Hands-on training for IT teams in secure coding, incident response, and advanced threat hunting.',
    },
    {
      icon: Award,
      title: 'Certification Prep',
      desc: 'Guided preparation for industry-recognized cybersecurity certifications to upskill your security personnel.',
    },
    {
      icon: Shield,
      title: 'Executive Briefings',
      desc: 'High-level security briefings for C-suite executives focusing on risk management and compliance.',
    },
  ];

  const previousTrainings = [
    '/images/reverse4k/1.jpg',
    '/images/reverse4k/8.jpg',
    '/images/reverse4k/7.jpeg',
    '/images/reverse4k/2.jpg',
    '/images/reverse4k/9.jpg',
    '/images/reverse4k/15.jpeg',
    '/images/reverse4k/3.jpg',
    '/images/reverse4k/10.jpg',
    '/images/reverse4k/4.jpg',
    '/images/reverse4k/5.jpeg',
    '/images/reverse4k/13.jpeg',
    '/images/reverse4k/6.jpeg',
    '/images/reverse4k/11.jpg',
    '/images/reverse4k/14.jpeg',
  ];

  return (
    <section id="trainings" className="py-24 relative overflow-hidden bg-white/5">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="text-center mb-16">
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-5xl font-bold text-white mb-4"
          >
            Trainings & <span className="text-emerald-400">Awareness</span>
          </motion.h2>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.2 }}
            className="text-lg text-gray-400 max-w-3xl mx-auto"
          >
            Empower your team with the knowledge to defend against modern cyber threats. We offer comprehensive training programs tailored to all levels of your organization.
          </motion.p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-24">
          {programs.map((program, idx) => (
            <motion.div
              key={idx}
              initial={{ opacity: 0, scale: 0.95 }}
              whileInView={{ opacity: 1, scale: 1 }}
              viewport={{ once: true }}
              transition={{ delay: idx * 0.1 }}
              className="glass-card p-8 rounded-3xl text-center hover:border-emerald-500/30 transition-colors group"
            >
              <div className="w-16 h-16 mx-auto rounded-2xl bg-emerald-500/20 flex items-center justify-center mb-6 group-hover:scale-110 transition-transform duration-300 shadow-inner">
                <program.icon className="w-8 h-8 text-emerald-400" />
              </div>
              <h3 className="text-xl font-bold text-white mb-4 group-hover:text-emerald-400 transition-colors">{program.title}</h3>
              <p className="text-gray-400 text-sm leading-relaxed">{program.desc}</p>
            </motion.div>
          ))}
        </div>

        {/* Previous Trainings Slider */}
        <div className="text-center mb-10">
          <h3 className="text-2xl font-bold text-white mb-2">Previous Trainings</h3>
          <p className="text-gray-400 text-sm">Glimpses from our recent corporate and technical sessions.</p>
        </div>
        
        <div className="relative w-full overflow-hidden py-4">
          {/* Gradient Masks for smooth fade on edges */}
          <div className="absolute left-0 top-0 bottom-0 w-24 bg-gradient-to-r from-emerald-600/30 to-transparent z-10" />
          <div className="absolute right-0 top-0 bottom-0 w-24 bg-gradient-to-l from-purple-600/20 to-transparent z-10" />
          
          <div className="flex gap-6 animate-marquee">
            {/* Double the array to create seamless loop */}
            {[...previousTrainings, ...previousTrainings].map((img, idx) => (
              <div 
                key={idx} 
                className="flex-shrink-0 w-72 h-48 rounded-2xl overflow-hidden glass-card border-white/10 group"
              >
                <img 
                  src={img} 
                  alt={`Training session ${idx}`} 
                  className="w-full h-full object-cover opacity-80 group-hover:opacity-100 group-hover:scale-110 transition-all duration-500"
                  referrerPolicy="no-referrer"
                />
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
