import { motion } from 'motion/react';
import { ArrowLeft, Quote, Users } from 'lucide-react';
import { Link } from 'react-router-dom';

export default function ExecutiveTeamPage() {
  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Home</span>
          </Link>
        </div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="mb-14">
          <div className="w-14 h-14 rounded-xl bg-teal-400/10 flex items-center justify-center mb-6">
            <Users className="w-7 h-7 text-teal-400" />
          </div>
          <span className="text-teal-400 text-sm font-bold tracking-widest uppercase">Company</span>
          <h1 className="text-3xl md:text-5xl font-bold text-[#0B2545] mt-4 mb-4">Executive Team</h1>
          <p className="text-lg text-gray-600 max-w-2xl">The people leading iSeeWaves and building our platform.</p>
        </motion.div>

        {/* CEO Profile */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="glass-card rounded-3xl border border-gray-200 p-8 md:p-10 mb-10"
        >
          <div className="flex flex-col md:flex-row gap-8 items-start">
            <div className="w-32 h-32 rounded-2xl bg-gradient-to-br from-teal-500/30 to-blue-500/30 flex items-center justify-center shrink-0 border border-gray-200 mx-auto md:mx-0">
              <span className="text-4xl font-black text-[#0B2545]">AN</span>
            </div>
            <div className="flex-1">
              <h2 className="text-2xl font-bold text-[#0B2545] mb-1">Abdullah Nasir</h2>
              <p className="text-teal-400 text-sm font-semibold mb-4">Founder & CEO, iSeeWaves</p>
              <p className="text-gray-600 leading-relaxed mb-4">
                Abdullah founded iSeeWaves after previously building and exiting a cybersecurity and AI company. He
                leads product and company strategy, with hands-on experience spanning offensive security, AI
                systems, and software supply chain security. He also founded and leads the Pakistan Cybersecurity
                Alliance, a community platform connecting cybersecurity professionals, students, and institutions
                across Pakistan.
              </p>
              <p className="text-gray-600 leading-relaxed mb-4">
                He holds certifications including CEH (EC-Council), AWS Certified Cloud Practitioner, CRPO (ICTTF),
                and NIST CSF 2.0 Audit Practitioner, and was selected among the 100 Young Leaders of Pakistan
                (NLIS 2026).
              </p>
            </div>
          </div>

          <div className="mt-8 pt-8 border-t border-gray-200 relative">
            <Quote className="w-8 h-8 text-teal-400/40 absolute -top-4 left-0" />
            <p className="text-gray-700 italic leading-relaxed pl-10">
              "We started iSeeWaves because too many organizations only find out what's actually running in their
              software after something has already gone wrong. Our job is to make that visibility automatic,
              defensible, and available before the incident, not after it. Everything we build, from our platform to
              our services to the Pakistan Cybersecurity Alliance, comes back to that one idea: security that people
              can actually trust and verify."
            </p>
            <p className="text-sm text-gray-600 mt-3 pl-10">— Abdullah Nasir, Founder & CEO</p>
          </div>
        </motion.div>

        {/* Leadership Approach - detailed */}
        <motion.article
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="glass-card rounded-3xl border border-gray-200 p-8 md:p-10"
        >
          <span className="text-blue-400 text-xs font-bold tracking-widest uppercase">Leadership Approach</span>
          <h2 className="text-2xl md:text-3xl font-bold text-[#0B2545] mt-3 mb-6">How We Lead</h2>

          <div className="prose-invert space-y-6 text-gray-600 leading-relaxed">
            <p>
              Leadership at iSeeWaves is deliberately close to the work. Rather than running strategy from a distance,
              our leadership team stays hands-on with the product, with client engagements, and with the security
              research that shapes both. That closeness means decisions about roadmap, pricing, and priorities are
              made by people who have personally run the audits, written the reports, and sat across the table from
              the customers those decisions affect.
            </p>
            <p>
              We treat engineering, security research, and go-to-market as a single team rather than three competing
              functions. A finding from a penetration test can directly influence a product feature. A pattern seen
              across client compliance reviews can reshape how we prioritize our roadmap. This tight feedback loop is
              only possible because leadership does not sit above the work, it sits inside it.
            </p>
            <p>
              We also believe accountability has to be specific. Every engagement, whether it is a platform audit, a
              services deliverable, or a training program, has a named owner who is reachable, not a support queue.
              When something goes wrong, and in security work something eventually will, our approach is to say so
              plainly, explain what we are doing about it, and follow through, rather than managing the message.
            </p>
            <p>
              Finally, we see leadership as a responsibility that extends beyond the company. Through the Pakistan
              Cybersecurity Alliance, our leadership team invests time in growing the broader security community in
              Pakistan, mentoring students, sharing research, and working alongside government and industry partners.
              We think a stronger ecosystem around us makes the work we do for our customers stronger too.
            </p>
          </div>
        </motion.article>
      </div>
    </div>
  );
}
