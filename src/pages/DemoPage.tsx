import { motion } from 'motion/react';
import { Shield, Play, ArrowLeft } from 'lucide-react';
import { Link } from 'react-router-dom';
import { useRef, useState } from 'react';

export default function DemoPage() {
  const videoRef = useRef<HTMLVideoElement>(null);
  const [playing, setPlaying] = useState(false);

  const handlePlay = () => {
    if (videoRef.current) {
      videoRef.current.play();
      setPlaying(true);
    }
  };

  return (
    <div className="min-h-screen pt-32 pb-24 relative z-10">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <Link to="/#product" className="inline-flex items-center gap-2 text-gray-600 hover:text-teal-400 transition-colors">
            <ArrowLeft className="w-4 h-4" />
            <span>Back to Product</span>
          </Link>
        </div>

        <div className="text-center mb-16">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-full glass-card border-teal-500/30 text-teal-400 text-sm font-medium mb-6"
          >
            <Shield className="w-4 h-4" />
            <span>MyESI Platform</span>
          </motion.div>
          <motion.h1
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.1 }}
            className="text-4xl md:text-6xl font-bold text-[#0B2545] mb-6"
          >
            Watch <span className="text-teal-400">Demo</span>
          </motion.h1>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.2 }}
            className="text-lg text-gray-600 max-w-2xl mx-auto"
          >
            See how MyESI secures your code by uncovering hidden vulnerabilities in modules, third-party frameworks, and APIs.
          </motion.p>
        </div>

        <motion.div
          initial={{ opacity: 0, scale: 0.95 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ delay: 0.3 }}
          className="glass-card rounded-3xl overflow-hidden border-teal-500/30 relative aspect-video w-full flex items-center justify-center group cursor-pointer"
          onClick={handlePlay}
        >
          {/* Actual video */}
          <video
            ref={videoRef}
            className="absolute inset-0 w-full h-full object-cover"
            loop
            playsInline
            onPlay={() => setPlaying(true)}
            onPause={() => setPlaying(false)}
          >
            <source src="/Demo/Demo.mp4" type="video/mp4" />
          </video>

          {/* Overlay — hidden once playing */}
          {!playing && (
            <>
              <div className="absolute inset-0 bg-gradient-to-br from-teal-900/20 to-black/80 z-10" />
              <div className="relative z-20 flex flex-col items-center">
                <div className="w-20 h-20 rounded-full bg-teal-500/20 backdrop-blur-md flex items-center justify-center mb-4 group-hover:scale-110 group-hover:bg-teal-500/40 transition-all duration-300 border border-teal-400/30">
                  <Play className="w-8 h-8 text-teal-400 ml-1" />
                </div>
                <p className="text-[#0B2545] font-medium tracking-wide">Click to Play Video</p>
              </div>
            </>
          )}
        </motion.div>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.4 }}
          className="mt-16 grid grid-cols-1 md:grid-cols-3 gap-8"
        >
          <div className="glass-card p-6 rounded-2xl border-gray-100">
            <h3 className="text-xl font-bold text-[#0B2545] mb-3">Line-by-Line Validation</h3>
            <p className="text-gray-600 text-sm">Watch how MyESI validates the SSDLC process line-by-line, going beyond simple library checks.</p>
          </div>
          <div className="glass-card p-6 rounded-2xl border-gray-100">
            <h3 className="text-xl font-bold text-[#0B2545] mb-3">Real-time Heatmaps</h3>
            <p className="text-gray-600 text-sm">See the automated evidence collection for SBP or PCI-DSS audits in action.</p>
          </div>
          <div className="glass-card p-6 rounded-2xl border-gray-100">
            <h3 className="text-xl font-bold text-[#0B2545] mb-3">SBOM Generation</h3>
            <p className="text-gray-600 text-sm">Learn how to generate verifiable SBOMs and security attestations with a single click.</p>
          </div>
        </motion.div>
      </div>
    </div>
  );
}
