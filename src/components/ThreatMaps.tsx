import { useState, useEffect } from 'react';
import { motion } from 'motion/react';
import { Globe, ExternalLink, Info, Shield, Activity, AlertTriangle, Crosshair } from 'lucide-react';

export default function ThreatMaps() {
  const map = {
    id: 'kaspersky',
    name: 'Kaspersky Cyberthreat Map',
    desc: 'One of the most detailed 3D maps, showing live data from on-demand scans, web scans, and email antivirus reports.',
    url: 'https://cybermap.kaspersky.com/en/widget/dynamic/dark',
    link: 'https://cybermap.kaspersky.com/',
  };

  const [stats, setStats] = useState({ attacks: 0, countries: 0 });

  useEffect(() => {
    // Mock live stats update
    const interval = setInterval(() => {
      setStats({
        attacks: Math.floor(Math.random() * 5000) + 10000,
        countries: Math.floor(Math.random() * 20) + 120
      });
    }, 3000);
    return () => clearInterval(interval);
  }, []);

  const explanations = [
    {
      id: 'oas',
      title: 'OAS (On-Access Scan)',
      desc: 'Represents real-time malware detection during file access operations (opening, copying, saving). This indicates active attempts by malicious software to execute or spread within a system.',
      icon: Shield,
      color: 'text-blue-400'
    },
    {
      id: 'ods',
      title: 'ODS (On-Demand Scan)',
      desc: 'Shows malware detected during manual or scheduled system scans. High ODS activity often points to dormant threats or infections that bypassed initial real-time defenses.',
      icon: Crosshair,
      color: 'text-emerald-400'
    },
    {
      id: 'wav',
      title: 'WAV (Web Anti-Virus)',
      desc: 'Visualizes threats blocked while users browse the internet or download files. This highlights active malicious websites, drive-by downloads, and web-based exploits.',
      icon: Globe,
      color: 'text-purple-400'
    },
    {
      id: 'mav',
      title: 'MAV (Mail Anti-Virus)',
      desc: 'Displays malicious objects detected in incoming email attachments or links. This is a key indicator of phishing campaigns and targeted email-based malware distribution.',
      icon: AlertTriangle,
      color: 'text-orange-400'
    },
    {
      id: 'ids',
      title: 'IDS (Intrusion Detection)',
      desc: 'Represents network-level attacks detected by Intrusion Detection Systems. This includes port scanning, brute-force attempts, and exploitation of network vulnerabilities.',
      icon: Activity,
      color: 'text-red-400'
    }
  ];

  return (
    <section id="threat-maps" className="py-24 relative overflow-hidden">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="text-center mb-16">
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-5xl font-bold text-white mb-4"
          >
            Global <span className="text-emerald-400">Threat Map</span>
          </motion.h2>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.2 }}
            className="text-lg text-gray-400 max-w-3xl mx-auto"
          >
            Explore real-time cyber threats across the globe. This interactive map visualizes live data from various security systems.
          </motion.p>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-4 gap-8">
          <div className="lg:col-span-3">
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ duration: 0.4 }}
              className="glass-card rounded-3xl overflow-hidden border-emerald-500/30 relative h-[500px] md:h-[700px] w-full flex flex-col"
            >
              <iframe 
                src={map.url} 
                width="100%" 
                height="100%" 
                frameBorder="0"
                title={map.name}
                className="w-full h-full flex-grow pointer-events-auto"
              ></iframe>
                           {/* Overlay Stats */}
              <div className="absolute top-16 left-4 flex gap-4 pointer-events-none">
                <div className="bg-black/60 backdrop-blur-md px-4 py-2 rounded-xl border border-white/10">
                  <div className="text-xs text-gray-400 mb-1">Attacks / sec</div>
                  <div className="text-xl font-mono font-bold text-emerald-400">
                    {stats.attacks > 0 ? stats.attacks.toLocaleString() : '---'}
                  </div>
                </div>
                <div className="bg-black/60 backdrop-blur-md px-4 py-2 rounded-xl border border-white/10">
                  <div className="text-xs text-gray-400 mb-1">Targeted Countries</div>
                  <div className="text-xl font-mono font-bold text-blue-400">
                    {stats.countries > 0 ? stats.countries : '--'}
                  </div>
                </div>
              </div>
            </motion.div>
          </div>

          <div className="lg:col-span-1 flex flex-col gap-4">
            <div className="glass-card p-6 rounded-3xl border-emerald-500/30">
              <h3 className="text-xl font-bold text-white mb-4 flex items-center gap-2">
                <Info className="w-5 h-5 text-emerald-400" />
                Map Legend
              </h3>
              <p className="text-sm text-gray-400 mb-6">
                The map displays different types of cyber threats detected in real-time. Click on the map to interact, rotate, and zoom into specific regions.
              </p>
              
              <div className="space-y-4">
                {explanations.map((item) => (
                  <div key={item.id} className="group">
                    <div className="flex items-start gap-3">
                      <div className={`mt-1 p-2 rounded-lg bg-white/5 border border-white/10 group-hover:bg-white/10 transition-colors`}>
                        <item.icon className={`w-4 h-4 ${item.color}`} />
                      </div>
                      <div>
                        <h4 className="text-sm font-bold text-gray-200 group-hover:text-white transition-colors">{item.title}</h4>
                        <p className="text-xs text-gray-500 mt-1 leading-relaxed">{item.desc}</p>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
