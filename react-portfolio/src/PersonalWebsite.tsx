import {
  FaGithub,
  FaLinkedinIn,
  FaInstagram,
  FaTiktok,
  FaWhatsapp,
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
      <div className="relative z-10">
      {/* Sticky nav */}
      <header className="sticky top-0 z-40 border-b border-white/10 bg-black/80 backdrop-blur">
        <nav className="mx-auto flex max-w-6xl items-center justify-between px-6 py-4 md:px-10">
          <a
            href="#top"
            className="text-sm font-semibold tracking-[0.25em] uppercase text-white/70"
            onClick={handleSectionLinkClick('top')}
          >
            BRIAN SANAET MEMUSI
          </a>
          <div className="flex flex-wrap items-center justify-end gap-4 text-sm text-white/70">
            <a href="#about" className="hover:text-white" onClick={handleSectionLinkClick('about')}>
              About
            </a>
            <a href="#skills" className="hover:text-white" onClick={handleSectionLinkClick('skills')}>
              Skills
            </a>
            <a href="#projects" className="hover:text-white" onClick={handleSectionLinkClick('projects')}>
              Projects
            </a>
            <a href="#experience" className="hover:text-white" onClick={handleSectionLinkClick('experience')}>
              Experience
            </a>
            <a href="#cv" className="hover:text-white" onClick={handleSectionLinkClick('cv')}>
              CV
            </a>
            <a href="#contact" className="hover:text-white" onClick={handleSectionLinkClick('contact')}>
              Contact
            </a>
          </div>
        </nav>
      </header>

      {/* Hero */}
      <section
        id="top"
        className="scroll-mt-24 mx-auto flex min-h-screen max-w-6xl flex-col justify-center px-6 py-16 md:px-10"
      >
        <div className="grid items-center gap-12 md:grid-cols-[minmax(0,2fr)_minmax(0,1.4fr)]">
          <div>
            <p className="mb-4 text-sm uppercase tracking-[0.3em] text-white/60">
              Personal Website
            </p>
            <h1 className="text-4xl font-semibold leading-tight md:text-6xl">
              Hi, I’m Brian Sanaet Memusi.
              <span className="mt-2 block text-white/70">
                Developer • Cybersecurity Enthusiast • Student
              </span>
            </h1>
            <p className="mt-6 max-w-2xl text-base leading-7 text-white/70 md:text-lg">
              I build clean digital experiences, explore new technologies, and create products
              that solve real problems — with a focus on security, performance, and thoughtful
              user experience.
            </p>

            <div className="mt-8 flex flex-wrap gap-4">
              <a
                href="#projects"
                className="rounded-2xl bg-white px-5 py-3 text-sm font-medium text-black transition hover:opacity-90"
                onClick={handleSectionLinkClick('projects')}
              >
                View Projects
              </a>
              <a
                href="#contact"
                className="rounded-2xl border border-white/20 px-5 py-3 text-sm font-medium text-white transition hover:border-white/50"
                onClick={handleSectionLinkClick('contact')}
              >
                Contact Me
              </a>
              <a
                href="#cv"
                className="rounded-2xl border border-white/20 px-5 py-3 text-sm font-medium text-white transition hover:border-white/50"
                onClick={handleSectionLinkClick('cv')}
              >
                View CV
              </a>
            </div>

            <p className="mt-6 text-xs uppercase tracking-[0.3em] text-white/40">
              Based in Nairobi • Available for remote work & collaborations
            </p>
          </div>

          {/* Profile photo */}
          <div className="flex justify-center md:justify-end">
            <div className="relative h-48 w-48 overflow-hidden rounded-full border border-white/20 bg-white/5 shadow-[0_0_40px_rgba(0,0,0,0.6)] md:h-56 md:w-56">
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
        </div>
      </section>

      {/* About + Skills summary */}
      <section
        id="about"
        className="scroll-mt-24 mx-auto max-w-6xl px-6 py-16 md:px-10"
      >
        <div className="grid gap-8 md:grid-cols-2">
          <div className="rounded-3xl border border-white/10 bg-white/5 p-8">
            <h2 className="text-2xl font-semibold">About Me</h2>
            <p className="mt-4 text-white/70">
            Hi, I’m Brian Sanaet Memusi, a Computer Science and Informatics student at Strathmore University with a strong interest in computer networks, cybersecurity, and emerging technologies. 
            I enjoy building practical systems that solve real problems, from web applications to tech-driven platforms that connect people and ideas.
            </p>
            <p className="mt-4 text-white/70">
            Beyond the classroom, I spend time exploring networking technologies, learning through hands-on projects, and keeping up with developments in cybersecurity and AI. 
            My goal is to grow into a skilled technologist who not only understands systems deeply but can also build solutions that make an impact.
            </p>
          </div>

          <div
            id="skills"
            className="rounded-3xl border border-white/10 bg-white/5 p-8"
          >
            <h2 className="text-2xl font-semibold">Skills</h2>
            <p className="mt-3 text-sm text-white/60">
              A snapshot of the technologies and areas I’m most comfortable with:
            </p>
            <div className="mt-4 flex flex-wrap gap-3 text-sm text-white/80">
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
                  className="rounded-full border border-white/15 px-4 py-2 text-xs md:text-sm"
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
        className="scroll-mt-24 mx-auto max-w-6xl px-6 py-16 md:px-10"
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

        <div className="grid gap-6 md:grid-cols-3">
          {projects.map((project) => (
            <article
              key={project.title}
              className="flex flex-col rounded-3xl border border-white/10 bg-white/5 p-6"
            >
              <div className="h-40 rounded-2xl bg-white/10" />
              <h3 className="mt-5 text-xl font-medium">{project.title}</h3>
              <p className="mt-3 text-sm leading-6 text-white/70">
                {project.description}
              </p>
              <div className="mt-4 space-y-2 text-sm text-white/70">
                <p>
                  Duration: <span className="text-white">{project.duration}</span>
                </p>
                <a
                  href={project.linkUrl}
                  target={project.linkUrl.startsWith('http') ? '_blank' : undefined}
                  rel={project.linkUrl.startsWith('http') ? 'noreferrer' : undefined}
                  className="inline-flex items-center rounded-xl bg-white px-4 py-2 text-sm font-semibold text-black transition hover:opacity-90"
                >
                  {project.linkLabel || 'View Project'}
                </a>
              </div>
              <div className="mt-4 flex flex-wrap gap-2 text-xs text-white/60">
                {project.tech.map((t) => (
                  <span
                    key={t}
                    className="rounded-full border border-white/15 px-3 py-1"
                  >
                    {t}
                  </span>
                ))}
              </div>
            </article>
          ))}
        </div>
      </section>

      {/* Experience */}
      <section
        id="experience"
        className="scroll-mt-24 mx-auto max-w-6xl px-6 py-16 md:px-10"
      >
        <div className="mb-8">
          <p className="text-sm uppercase tracking-[0.25em] text-white/50">Experience</p>
          <h2 className="mt-2 text-3xl font-semibold">What I’ve been working on</h2>
        </div>
        <div className="space-y-6">
          {experience.map((item) => (
            <div
              key={item.role}
              className="rounded-3xl border border-white/10 bg-white/5 p-6 md:p-8"
            >
              <div className="flex flex-wrap items-baseline justify-between gap-3">
                <div>
                  <h3 className="text-lg font-semibold">{item.role}</h3>
                  <p className="text-sm text-white/60">{item.company}</p>
                </div>
                <p className="text-xs uppercase tracking-[0.2em] text-white/50">
                  {item.period}
                </p>
              </div>
              <p className="mt-4 text-sm text-white/70">{item.summary}</p>
            </div>
          ))}
        </div>
      </section>

      {/* CV / Resume */}
      <section
        id="cv"
        className="scroll-mt-24 mx-auto max-w-6xl px-6 py-16 md:px-10"
      >
        <div className="rounded-3xl border border-white/10 bg-white/5 p-8 md:p-10">
          <h2 className="text-3xl font-semibold">CV / Resume</h2>
          <p className="mt-4 max-w-2xl text-white/70">
            Want a quick overview of my background, skills, and experience? You can download my
            CV and keep it on hand for future roles, collaborations, or referrals.
          </p>

          <div className="mt-6 flex flex-wrap gap-4">
            <a
              href={cvDownloadUrl}
              download="MemusiSanaetCV.pdf"
              className="rounded-2xl bg-white px-5 py-3 text-sm font-medium text-black transition hover:opacity-90"
            >
              Download CV
            </a>
            <span className="text-xs text-white/50">
            </span>
          </div>

        </div>
      </section>

      {/* Contact + Socials */}
      <section
        id="contact"
        className="scroll-mt-24 mx-auto max-w-6xl px-6 py-16 md:px-10"
      >
        <div className="rounded-3xl border border-white/10 bg-white/5 p-8 md:p-10">
          <h2 className="text-3xl font-semibold">Let’s work together</h2>
          <p className="mt-4 max-w-2xl text-white/70">
            I’m open to internships, part-time roles, freelance work, and interesting side
            projects. The fastest way to reach me is by email, but you can also find me across
            the platforms below.
          </p>

          {/* Social icons only */}
          <div className="mt-8 flex flex-wrap gap-4">
            <a
              href="mailto:brian.smemusi@gmail.com"
              aria-label="Email Brian"
              className="flex h-11 w-11 items-center justify-center rounded-full border border-white/30 text-lg text-white transition hover:border-white/70"
            >
              <MdEmail />
            </a>
            <a
              href="https://github.com/sirnaet"
              target="_blank"
              rel="noreferrer"
              aria-label="GitHub profile"
              className="flex h-11 w-11 items-center justify-center rounded-full border border-white/30 text-lg text-white transition hover:border-white/70"
            >
              <FaGithub />
            </a>
            <a
              href="https://www.linkedin.com/in/sanaet-memusi-a491692ab"
              target="_blank"
              rel="noreferrer"
              aria-label="LinkedIn profile"
              className="flex h-11 w-11 items-center justify-center rounded-full border border-white/30 text-lg text-white transition hover:border-white/70"
            >
              <FaLinkedinIn />
            </a>
            <a
              href="https://instagram.com/sir_naet"
              target="_blank"
              rel="noreferrer"
              aria-label="Instagram profile"
              className="flex h-11 w-11 items-center justify-center rounded-full border border-white/30 text-lg text-white transition hover:border-white/70"
            >
              <FaInstagram />
            </a>
            <a
              href="https://x.com/Sir__naet"
              target="_blank"
              rel="noreferrer"
              aria-label="X (Twitter) profile"
              className="flex h-11 w-11 items-center justify-center rounded-full border border-white/30 text-lg text-white transition hover:border-white/70"
            >
              <XIcon />
            </a>
            <a
              href="https://www.tiktok.com/sir_naet"
              target="_blank"
              rel="noreferrer"
              aria-label="TikTok profile"
              className="flex h-11 w-11 items-center justify-center rounded-full border border-white/30 text-lg text-white transition hover:border-white/70"
            >
              <FaTiktok />
            </a>
            <a
              href="https://wa.me/254798131855"
              target="_blank"
              rel="noreferrer"
              aria-label="WhatsApp"
              className="flex h-11 w-11 items-center justify-center rounded-full border border-white/30 text-lg text-white transition hover:border-white/70"
            >
              <FaWhatsapp />
            </a>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="border-t border-white/10 py-6 text-xs text-white/50">
        <div className="mx-auto flex max-w-6xl flex-wrap items-center justify-between gap-3 px-6 md:px-10">
          <p>© {new Date().getFullYear()} Brian Sanaet Memusi. All rights reserved.</p>
          <p className="text-white/40">Built with React & Tailwind CSS.</p>
        </div>
      </footer>
      </div>
    </main>
  );
}
