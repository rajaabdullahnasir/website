import { motion } from 'motion/react';
import { ArrowLeft, Users, Rocket, Compass } from 'lucide-react';
import { Link } from 'react-router-dom';
import About from '../components/About';

export default function AboutPage() {
  const team = [
    { name: 'Abdullah Nasir', role: 'Founder & CEO' },
    { name: 'Engineering Team', role: 'Product & Platform' },
    { name: 'Security Research Team', role: 'Offensive & Defensive Security' },
    { name: 'Client Success Team', role: 'Services & Delivery' },
  ];

  return (
    <div className="pt-24">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-8">
        <Link to="/" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
          <ArrowLeft className="w-4 h-4" />
          <span>Back to Home</span>
        </Link>
      </div>

      {/* Our Story */}
      <section className="py-16 relative z-10">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }}>
            <div className="flex items-center gap-3 mb-6">
              <div className="w-10 h-10 rounded-xl bg-teal-400/10 flex items-center justify-center">
                <Compass className="w-5 h-5 text-teal-500" />
              </div>
              <h2 className="text-2xl font-bold text-[#0B2545]">Our Story</h2>
            </div>
            <p className="text-gray-600 leading-relaxed mb-4">
              iSeeWaves started in 2025 with a simple observation: most organizations only discover what's actually
              running inside their software after something has gone wrong, a breach, a failed audit, or a
              regulator's question they couldn't answer. We set out to fix that by building MyESI, an automated
              platform that gives organizations a complete, always-current picture of their software supply chain.
            </p>
            <p className="text-gray-600 leading-relaxed mb-4">
              Since our founding, we've registered with SECP, been incubated at the National Incubation Center for
              Aerospace Technologies (NICAT), and received funding and program support from Ignite National
              Technology Fund and the Ministry of IT &amp; Telecom, Pakistan. We've grown from a product idea into a
              company recognized as one of the top Pakistani cybersecurity exporters, while also investing back into
              the local ecosystem through the Pakistan Cybersecurity Alliance.
            </p>
            <p className="text-gray-600 leading-relaxed">
              Today, we split our work between building MyESI and delivering hands-on security services, penetration
              testing, vCISO advisory, compliance, and cloud security, work that in turn feeds directly back into
              how we build the product.
            </p>
          </motion.div>
        </div>
      </section>

      <About />

      {/* Our Team */}
      <section className="py-16 relative z-10">
        <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} className="mb-10">
            <div className="flex items-center gap-3 mb-6">
              <div className="w-10 h-10 rounded-xl bg-teal-400/10 flex items-center justify-center">
                <Users className="w-5 h-5 text-teal-500" />
              </div>
              <h2 className="text-2xl font-bold text-[#0B2545]">Our Team</h2>
            </div>
            <p className="text-gray-600 max-w-2xl">
              We're a small, hands-on team of engineers, security researchers, and client-facing specialists.{' '}
              <Link to="/company/executive-team" className="text-teal-500 hover:underline">
                Meet our founder and read about our leadership approach
              </Link>
              .
            </p>
          </motion.div>
          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6">
            {team.map((member, idx) => (
              <motion.div
                key={member.name}
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                transition={{ delay: idx * 0.08 }}
                className="glass-card rounded-2xl border border-gray-200 p-6 text-center"
              >
                <div className="w-14 h-14 rounded-full bg-gradient-to-br from-teal-400/30 to-[#00C08B]/30 flex items-center justify-center mx-auto mb-4 border border-gray-200">
                  <span className="text-sm font-bold text-[#0B2545]">
                    {member.name
                      .split(' ')
                      .map((n) => n[0])
                      .join('')
                      .slice(0, 2)}
                  </span>
                </div>
                <div className="text-sm font-bold text-[#0B2545]">{member.name}</div>
                <div className="text-xs text-gray-500 mt-1">{member.role}</div>
              </motion.div>
            ))}
          </div>
        </div>
      </section>

      {/* Looking Ahead */}
      <section className="py-16 relative z-10">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="glass-card rounded-2xl border border-teal-500/20 p-8 md:p-10"
          >
            <div className="flex items-center gap-3 mb-6">
              <div className="w-10 h-10 rounded-xl bg-teal-400/10 flex items-center justify-center">
                <Rocket className="w-5 h-5 text-teal-500" />
              </div>
              <h2 className="text-2xl font-bold text-[#0B2545]">Looking Ahead</h2>
            </div>
            <p className="text-gray-600 leading-relaxed">
              We're continuing to expand MyESI's audit coverage, grow our on-premises deployment options for
              regulated customers, and scale the Pakistan Cybersecurity Alliance as a national community platform.
              If you'd like to be part of that, as a customer, partner, or team member, we'd love to hear from you.
            </p>
          </motion.div>
        </div>
      </section>
    </div>
  );
}
