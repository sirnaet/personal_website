import { useState } from 'react';
import {
  FaGithub,
  FaLinkedinIn,
  FaInstagram,
  FaTiktok,
  FaWhatsapp,
  FaBars,
  FaTimes,
} from 'react-icons/fa';
import { MdEmail } from 'react-icons/md';
import heroImage from '../../assets/images/sanaet.jpg';
import logoImage from '../../assets/images/Sirnaet-logo.png';

const cvDownloadUrl = `${import.meta.env.BASE_URL}cv/MemusiSanaetCV.pdf`;

// Custom X Brand Icon (Exact Geometry)
const XIcon = ({ className }: { className?: string }) => (
  <svg
    role="img"
    viewBox="0 0 24 24"
    xmlns="http://www.w3.org/2000/svg"
    fill="currentColor"
    className={className}
    width="22"
    height="22"
  >
    <title>X</title>
    <path d="M18.901 1.153h3.68l-8.04 9.19L24 22.846h-7.406l-5.8-7.584-6.638 7.584H.474l8.6-9.83L0 1.154h7.594l5.243 6.932ZM17.61 20.644h2.039L6.486 3.24H4.298Z" />
  </svg>
);

type Project = {
  title: string;
  description: string;
  tech: string[];
  linkLabel: string;
  linkUrl: string;
  duration: string;
};

const projects: Project[] = [
  {
    title: 'School Bloom',
    description:
      'A subscription based school management system tailored to the Kenyan CBE curriculum. It offers role based access to the different stakeholders in education (School Admins, Teachers, Parents) and staff (Bursar and Librarian)',
    tech: ['TypeScript', 'Tailwind CSS', 'React', 'Supabase', 'nodeMailer', 'Vite', 'Safaricom Daraja API'],
    linkLabel: 'School Bloom',
    linkUrl: '/',
    duration: 'Jan 2026 - Present',
  },
  {
    title: 'Love Notes',
    description:
      'A small static web app that displays random love notes, lets users filter by vibe, and download a styled shareable card image..',
    tech: ['html', 'css', 'Laravel', 'JavaScript'],
    linkLabel: 'Love Notes',
    linkUrl: 'https://github.com/sirnaet/valentine',
    duration: 'Jan 2026 - Feb 2026',
  },
  {
    title: 'Personal Portfolio Website',
    description:
      'A responsive portfolio website showcasing my projects and skills.',
    tech: ['React', 'TypeScript', 'Tailwind CSS', 'Flutter'],
    linkLabel: 'Deployed Project',
    linkUrl: '/',
    duration: 'Ongoing',
  },
  {
    title: 'FedhaSmart',
    description:
      'A financial system for individuals to track their income, expenses, budgets, and savings goals with a simple and intuitive interface.',
    tech: ['React', 'Tailwind CSS', 'Supabase', 'Vite', 'TypeScript', 'shadcn/ui'],
    linkLabel: 'FedhaSmart',
    linkUrl: 'https://github.com/sirnaet/Fedha-Smart',
    duration: 'August 2025 - November 2025',
  },
];

const experience = [
  {
    role: 'Engineering Collaborator',
    company: 'Finesy Enterprises - Hackeric Labs',
    period: '2026 – Present',
    summary:
      'Contributing to engineering-focused projects within a collaborative R&D environment, supporting the design, development, and testing of innovative technology solutions.',
  },
  {
    role: 'Teaching Assistant',
    company: 'Entarara Mixed Secondary School',
    period: 'Jan 2026 – March 2026',
    summary:
      'Helping in teaching Computer Studies and Mathematics to high school students, assisting with lesson planning, grading, and providing support during class activities.',
  },
  {
    role: 'Informatics & Computer Science Student',
    company: 'Strathmore University',
    period: '2024 – 2028 (expected)',
    summary:
      'Developing strong foundations in software engineering, cybersecurity, and computer systems through hands-on projects, technical problem-solving, and applied coursework.',
  },
];

export default function PersonalWebsite() {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  const scrollToSection = (sectionId: string) => {
    const section = document.getElementById(sectionId);
    if (!section) {
      return;
    }

    section.scrollIntoView({
      behavior: 'smooth',
      block: 'start',
    });

    window.history.replaceState(null, '', `#${sectionId}`);
  };

  const handleSectionLinkClick =
    (sectionId: string) => (event: React.MouseEvent<HTMLAnchorElement>) => {
      event.preventDefault();
      scrollToSection(sectionId);
    };

  return (
    <main className="min-h-screen bg-black text-white relative overflow-hidden">
      <div
        aria-hidden="true"
        className="pointer-events-none fixed inset-0 z-[1] flex items-center justify-center"
      >
        <img
          src={logoImage}
          alt=""
          className="h-auto w-[78vw] max-w-[960px] object-contain"
          loading="lazy"
          fetchPriority="low"
          style={{ opacity: 0.15 }}
        />
      </div>
      <div className="relative z-10 flex flex-col min-h-screen">
      {/* Sticky nav */}
      <header className="sticky top-0 z-40 border-b border-white/10 bg-black/80 backdrop-blur-md">
        <nav className="mx-auto flex max-w-6xl items-center justify-between px-6 py-4 md:px-10">
          <a
            href="#top"
            className="text-xs sm:text-sm font-semibold tracking-[0.2em] sm:tracking-[0.25em] uppercase text-white/70 hover:text-white transition-colors duration-200"
            onClick={handleSectionLinkClick('top')}
          >
            <span className="hidden xs:inline sm:inline">BRIAN SANAET MEMUSI</span>
            <span className="xs:hidden sm:hidden">BRIAN S. MEMUSI</span>
          </a>
          
          {/* Desktop Nav Links */}
          <div className="hidden md:flex items-center justify-end gap-6 text-sm text-white/70">
            <a href="#about" className="hover:text-white transition-colors duration-200" onClick={handleSectionLinkClick('about')}>
              About
            </a>
            <a href="#skills" className="hover:text-white transition-colors duration-200" onClick={handleSectionLinkClick('skills')}>
              Skills
            </a>
            <a href="#projects" className="hover:text-white transition-colors duration-200" onClick={handleSectionLinkClick('projects')}>
              Projects
            </a>
            <a href="#experience" className="hover:text-white transition-colors duration-200" onClick={handleSectionLinkClick('experience')}>
              Experience
            </a>
            <a href="#cv" className="hover:text-white transition-colors duration-200" onClick={handleSectionLinkClick('cv')}>
              CV
            </a>
            <a href="#contact" className="hover:text-white transition-colors duration-200" onClick={handleSectionLinkClick('contact')}>
              Contact
            </a>
          </div>

          {/* Mobile Menu Button */}
          <button
            onClick={() => setIsMenuOpen(!isMenuOpen)}
            className="md:hidden flex items-center justify-center p-2 text-white/70 hover:text-white focus:outline-none transition-colors duration-200"
            aria-label="Toggle menu"
          >
            {isMenuOpen ? <FaTimes size={20} /> : <FaBars size={20} />}
          </button>
        </nav>

        {/* Mobile Navigation Dropdown */}
        {isMenuOpen && (
          <div className="md:hidden border-t border-white/10 bg-black/95 backdrop-blur-md px-6 py-4 flex flex-col gap-4 text-sm text-white/70">
            <a
              href="#about"
              className="hover:text-white transition-colors duration-200 py-1"
              onClick={(e) => {
                handleSectionLinkClick('about')(e);
                setIsMenuOpen(false);
              }}
            >
              About
            </a>
            <a
              href="#skills"
              className="hover:text-white transition-colors duration-200 py-1"
              onClick={(e) => {
                handleSectionLinkClick('skills')(e);
                setIsMenuOpen(false);
              }}
            >
              Skills
            </a>
            <a
              href="#projects"
              className="hover:text-white transition-colors duration-200 py-1"
              onClick={(e) => {
                handleSectionLinkClick('projects')(e);
                setIsMenuOpen(false);
              }}
            >
              Projects
            </a>
            <a
              href="#experience"
              className="hover:text-white transition-colors duration-200 py-1"
              onClick={(e) => {
                handleSectionLinkClick('experience')(e);
                setIsMenuOpen(false);
              }}
            >
              Experience
            </a>
            <a
              href="#cv"
              className="hover:text-white transition-colors duration-200 py-1"
              onClick={(e) => {
                handleSectionLinkClick('cv')(e);
                setIsMenuOpen(false);
              }}
            >
              CV
            </a>
            <a
              href="#contact"
              className="hover:text-white transition-colors duration-200 py-1"
              onClick={(e) => {
                handleSectionLinkClick('contact')(e);
                setIsMenuOpen(false);
              }}
            >
              Contact
            </a>
          </div>
        )}
      </header>

      {/* Hero */}
      <section
        id="top"
        className="scroll-mt-24 mx-auto flex min-h-[calc(100vh-80px)] max-w-6xl flex-col justify-center px-6 py-10 sm:py-16 md:px-10"
      >
        <div className="grid items-center gap-8 md:gap-12 md:grid-cols-[minmax(0,2fr)_minmax(0,1.4fr)]">
          {/* Portrait Image (Ordered first on mobile, last on desktop) */}
          <div className="flex justify-center md:justify-end order-first md:order-last">
            <div className="relative h-40 w-40 sm:h-48 sm:w-48 md:h-56 md:w-56 overflow-hidden rounded-full border border-white/20 bg-white/5 shadow-[0_0_40px_rgba(0,0,0,0.6)]">
              <img
                src={heroImage}
                alt="Portrait of Brian Sanaet Memusi"
                className="h-full w-full object-cover"
                fetchPriority="high"
              />
              <div className="pointer-events-none absolute inset-0 rounded-full border border-white/40">
                {/* subtle overlay ring */}
              </div>
            </div>
          </div>

          <div>
            <p className="mb-4 text-xs sm:text-sm uppercase tracking-[0.25em] sm:tracking-[0.3em] text-white/60">
              Personal Website
            </p>
            <h1 className="text-3xl sm:text-4xl font-semibold leading-tight md:text-6xl">
              Hi, I’m Brian Sanaet Memusi.
              <span className="mt-2 block text-xl sm:text-2xl md:text-4xl text-white/70 font-medium">
                Developer • Cybersecurity Enthusiast • Student
              </span>
            </h1>
            <p className="mt-6 max-w-2xl text-sm sm:text-base leading-7 text-white/70 md:text-lg">
              I build clean digital experiences, explore new technologies, and create products
              that solve real problems — with a focus on security, performance, and thoughtful
              user experience.
            </p>

            <div className="mt-8 flex flex-col sm:flex-row gap-3 sm:gap-4">
              <a
                href="#projects"
                className="rounded-2xl bg-white px-5 py-3 text-sm font-medium text-black transition hover:opacity-90 text-center"
                onClick={handleSectionLinkClick('projects')}
              >
                View Projects
              </a>
              <a
                href="#contact"
                className="rounded-2xl border border-white/20 px-5 py-3 text-sm font-medium text-white transition hover:border-white/50 text-center"
                onClick={handleSectionLinkClick('contact')}
              >
                Contact Me
              </a>
              <a
                href="#cv"
                className="rounded-2xl border border-white/20 px-5 py-3 text-sm font-medium text-white transition hover:border-white/50 text-center"
                onClick={handleSectionLinkClick('cv')}
              >
                View CV
              </a>
            </div>

            <p className="mt-6 text-[10px] sm:text-xs uppercase tracking-[0.2em] sm:tracking-[0.3em] text-white/40">
              Based in Nairobi • Available for remote work & collaborations
            </p>
          </div>
        </div>
      </section>

      {/* About + Skills summary */}
      <section
        id="about"
        className="scroll-mt-24 mx-auto max-w-6xl px-6 py-16 md:py-24 md:px-10"
      >
        <div className="grid gap-8 md:grid-cols-2">
          <div className="rounded-3xl border border-white/10 bg-white/5 p-6 sm:p-8">
            <h2 className="text-2xl font-semibold">About Me</h2>
            <p className="mt-4 text-sm sm:text-base leading-6 text-white/70">
            Hi, I’m Brian Sanaet Memusi, a Computer Science and Informatics student at Strathmore University with a strong interest in computer networks, cybersecurity, and emerging technologies. 
            I enjoy building practical systems that solve real problems, from web applications to tech-driven platforms that connect people and ideas.
            </p>
            <p className="mt-4 text-sm sm:text-base leading-6 text-white/70">
            Beyond the classroom, I spend time exploring networking technologies, learning through hands-on projects, and keeping up with developments in cybersecurity and AI. 
            My goal is to grow into a skilled technologist who not only understands systems deeply but can also build solutions that make an impact.
            </p>
          </div>

          <div
            id="skills"
            className="rounded-3xl border border-white/10 bg-white/5 p-6 sm:p-8"
          >
            <h2 className="text-2xl font-semibold">Skills</h2>
            <p className="mt-3 text-sm text-white/60">
              A snapshot of the technologies and areas I’m most comfortable with:
            </p>
            <div className="mt-4 flex flex-wrap gap-2 text-sm text-white/80">
              {[
                'React',
                'Next.js',
                'TypeScript',
                'Flutter',
                'Node.js',
                'Python',
                'Network Security',
                'Linux',
                'Docker',
                'Git',
                'Java',
                'C++',
                'Postgresql',
                'MariaDB',
                'Supabase',
                'Tailwind CSS',
                'Vite',
                'shadcn/ui',
                'Laravel',
                'HTML/CSS',
                'JavaScript',
              ].map((skill) => (
                <span
                  key={skill}
                  className="rounded-full border border-white/15 px-3 py-1.5 text-xs sm:text-sm hover:border-white/40 hover:bg-white/5 transition-all duration-200"
                >
                  {skill}
                </span>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Projects */}
      <section
        id="projects"
        className="scroll-mt-24 mx-auto max-w-6xl px-6 py-16 md:py-24 md:px-10"
      >
        <div className="mb-8 flex items-end justify-between gap-4">
          <div>
            <p className="text-sm uppercase tracking-[0.25em] text-white/50">Portfolio</p>
            <h2 className="mt-2 text-3xl font-semibold">Featured Projects</h2>
            <p className="mt-3 max-w-2xl text-sm text-white/60">
              A selection of work that reflects how I think about problem‑solving, design, and
              implementation.
            </p>
          </div>
        </div>

        <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
          {projects.map((project) => (
            <article
              key={project.title}
              className="flex flex-col justify-between rounded-3xl border border-white/10 bg-white/5 p-6 transition-all duration-300 hover:-translate-y-1 hover:border-white/20 hover:bg-white/10"
            >
              <div>
                <div className={`h-40 rounded-2xl bg-gradient-to-br ${
                  project.title === 'School Bloom' ? 'from-emerald-600/30 to-teal-900/10' :
                  project.title === 'Love Notes' ? 'from-pink-600/30 to-rose-900/10' :
                  project.title === 'Personal Portfolio Website' ? 'from-indigo-600/30 to-violet-900/10' :
                  'from-amber-600/30 to-orange-900/10'
                } flex items-center justify-center border border-white/5 relative overflow-hidden group`}>
                  <div className="absolute inset-0 bg-grid-white/[0.02] [mask-image:linear-gradient(0deg,transparent,black)]" />
                  <span className="text-3xl font-extrabold tracking-wider text-white/30 group-hover:text-white/50 transition-colors duration-300 select-none">
                    {project.title.split(' ').map(w => w[0]).join('')}
                  </span>
                </div>
                <h3 className="mt-5 text-xl font-medium">{project.title}</h3>
                <p className="mt-3 text-sm leading-6 text-white/70">
                  {project.description}
                </p>
              </div>
              
              <div>
                <div className="mt-6 space-y-3 text-sm text-white/70">
                  <p className="text-xs text-white/50">
                    Duration: <span className="text-white font-medium">{project.duration}</span>
                  </p>
                  <a
                    href={project.linkUrl}
                    target={project.linkUrl.startsWith('http') ? '_blank' : undefined}
                    rel={project.linkUrl.startsWith('http') ? 'noreferrer' : undefined}
                    className="inline-flex w-full items-center justify-center rounded-xl bg-white px-4 py-2 text-sm font-semibold text-black transition hover:opacity-90"
                  >
                    {project.linkLabel || 'View Project'}
                  </a>
                </div>
                <div className="mt-4 flex flex-wrap gap-1.5 text-[10px] sm:text-xs text-white/60">
                  {project.tech.map((t) => (
                    <span
                      key={t}
                      className="rounded-full border border-white/10 bg-white/5 px-2.5 py-0.5"
                    >
                      {t}
                    </span>
                  ))}
                </div>
              </div>
            </article>
          ))}
        </div>
      </section>

      {/* Experience */}
      <section
        id="experience"
        className="scroll-mt-24 mx-auto max-w-6xl px-6 py-16 md:py-24 md:px-10"
      >
        <div className="mb-8">
          <p className="text-sm uppercase tracking-[0.25em] text-white/50">Experience</p>
          <h2 className="mt-2 text-3xl font-semibold">What I’ve been working on</h2>
        </div>
        <div className="space-y-6">
          {experience.map((item) => (
            <div
              key={item.role}
              className="rounded-3xl border border-white/10 bg-white/5 p-5 sm:p-6 md:p-8 hover:border-white/20 transition-all duration-300"
            >
              <div className="flex flex-col sm:flex-row sm:items-baseline justify-between gap-2 sm:gap-3">
                <div>
                  <h3 className="text-lg font-semibold">{item.role}</h3>
                  <p className="text-sm text-white/60">{item.company}</p>
                </div>
                <p className="text-[10px] sm:text-xs uppercase tracking-[0.2em] text-white/50">
                  {item.period}
                </p>
              </div>
              <p className="mt-4 text-sm leading-6 text-white/70">{item.summary}</p>
            </div>
          ))}
        </div>
      </section>

      {/* CV / Resume */}
      <section
        id="cv"
        className="scroll-mt-24 mx-auto max-w-6xl px-6 py-16 md:py-24 md:px-10"
      >
        <div className="rounded-3xl border border-white/10 bg-white/5 p-6 sm:p-8 md:p-10">
          <h2 className="text-2xl sm:text-3xl font-semibold">CV / Resume</h2>
          <p className="mt-4 max-w-2xl text-sm sm:text-base text-white/70">
            Want a quick overview of my background, skills, and experience? You can download my
            CV and keep it on hand for future roles, collaborations, or referrals.
          </p>

          <div className="mt-6 flex flex-wrap gap-4">
            <a
              href={cvDownloadUrl}
              download="MemusiSanaetCV.pdf"
              className="w-full sm:w-auto rounded-2xl bg-white px-5 py-3 text-sm font-medium text-black transition hover:opacity-90 text-center"
            >
              Download CV
            </a>
          </div>
        </div>
      </section>

      {/* Contact + Socials */}
      <section
        id="contact"
        className="scroll-mt-24 mx-auto max-w-6xl px-6 py-16 md:py-24 md:px-10"
      >
        <div className="rounded-3xl border border-white/10 bg-white/5 p-6 sm:p-8 md:p-10">
          <h2 className="text-2xl sm:text-3xl font-semibold">Let’s work together</h2>
          <p className="mt-4 max-w-2xl text-sm sm:text-base text-white/70">
            I’m open to internships, part-time roles, freelance work, and interesting side
            projects. The fastest way to reach me is by email, but you can also find me across
            the platforms below.
          </p>

          {/* Social icons only */}
          <div className="mt-8 flex flex-wrap gap-3 sm:gap-4 justify-center sm:justify-start">
            <a
              href="mailto:brian.smemusi@gmail.com"
              aria-label="Email Brian"
              className="flex h-11 w-11 items-center justify-center rounded-full border border-white/30 text-lg text-white transition hover:border-white/70 hover:bg-white/5"
            >
              <MdEmail />
            </a>
            <a
              href="https://github.com/sirnaet"
              target="_blank"
              rel="noreferrer"
              aria-label="GitHub profile"
              className="flex h-11 w-11 items-center justify-center rounded-full border border-white/30 text-lg text-white transition hover:border-white/70 hover:bg-white/5"
            >
              <FaGithub />
            </a>
            <a
              href="https://www.linkedin.com/in/sanaet-memusi-a491692ab"
              target="_blank"
              rel="noreferrer"
              aria-label="LinkedIn profile"
              className="flex h-11 w-11 items-center justify-center rounded-full border border-white/30 text-lg text-white transition hover:border-white/70 hover:bg-white/5"
            >
              <FaLinkedinIn />
            </a>
            <a
              href="https://instagram.com/sir_naet"
              target="_blank"
              rel="noreferrer"
              aria-label="Instagram profile"
              className="flex h-11 w-11 items-center justify-center rounded-full border border-white/30 text-lg text-white transition hover:border-white/70 hover:bg-white/5"
            >
              <FaInstagram />
            </a>
            <a
              href="https://x.com/Sir__naet"
              target="_blank"
              rel="noreferrer"
              aria-label="X (Twitter) profile"
              className="flex h-11 w-11 items-center justify-center rounded-full border border-white/30 text-lg text-white transition hover:border-white/70 hover:bg-white/5"
            >
              <XIcon />
            </a>
            <a
              href="https://www.tiktok.com/sir_naet"
              target="_blank"
              rel="noreferrer"
              aria-label="TikTok profile"
              className="flex h-11 w-11 items-center justify-center rounded-full border border-white/30 text-lg text-white transition hover:border-white/70 hover:bg-white/5"
            >
              <FaTiktok />
            </a>
            <a
              href="https://wa.me/254798131855"
              target="_blank"
              rel="noreferrer"
              aria-label="WhatsApp"
              className="flex h-11 w-11 items-center justify-center rounded-full border border-white/30 text-lg text-white transition hover:border-white/70 hover:bg-white/5"
            >
              <FaWhatsapp />
            </a>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="border-t border-white/10 py-6 text-xs text-white/50 mt-auto">
        <div className="mx-auto flex max-w-6xl flex-wrap items-center justify-between gap-3 px-6 md:px-10">
          <p>© {new Date().getFullYear()} Brian Sanaet Memusi. All rights reserved.</p>
          <p className="text-white/40">Built with React & Tailwind CSS.</p>
        </div>
      </footer>
      </div>
    </main>
  );
}
