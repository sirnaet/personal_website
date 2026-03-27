# Personal Portfolio Website

A modern, cyber-themed personal portfolio website built with Flutter Web. Features a clean, professional design with electric cyan accents, smooth animations, and a fully responsive layout.

## Features

- **Single-page scrolling design** - Smooth navigation between sections
- **Dark theme** - Near-black background with electric cyan accents
- **Fully responsive** - Desktop-first design that adapts to mobile devices
- **Modern animations** - Subtle fade and slide transitions on scroll
- **Interactive elements** - Hover effects with soft glows and elevation
- **Sections included:**
  - Hero section with animated background
  - Projects/Portfolio with card-based grid
  - Skills & Tech Stack with modular panels
  - Experience & Highlights timeline
  - Contact form with social links

## Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Chrome or any modern web browser for testing

## Setup

1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

2. **Run the app:**
   ```bash
   flutter run -d chrome
   ```

   Or for web release mode:
   ```bash
   flutter build web
   ```

3. **View the website:**
   - Development: The app will automatically open in Chrome
   - Production: Serve the `build/web` directory with any static web server

## Customization

### Content Updates

The website uses placeholder content that's easy to replace:

1. **Personal Information** (`lib/sections/hero_section.dart`):
   - Update name, role, and tagline in the HeroSection widget

2. **Projects** (`lib/sections/projects_section.dart`):
   - Modify the `projects` list with your actual projects
   - Each project includes: title, description, tech stack, GitHub URL, and optional demo URL

3. **Skills** (`lib/sections/skills_section.dart`):
   - Update the `skillCategories` list with your skills organized by category

4. **Experience** (`lib/sections/experience_section.dart`):
   - Modify the `experiences` list with your work history, education, certifications, etc.

5. **Contact** (`lib/sections/contact_section.dart`):
   - Update email address in `_copyEmail()` method
   - Update GitHub and LinkedIn URLs in `_ContactInfo` widget

### Design Customization

1. **Colors** (`lib/theme/app_theme.dart`):
   - Modify color constants to match your brand
   - Current accent color: Electric cyan (#00ffff)

2. **Typography** (`lib/theme/app_theme.dart`):
   - Adjust font families and sizes in the theme
   - Note: The app uses system fonts (Inter, JetBrains Mono) by default

3. **Animations**:
   - Animation durations and effects are controlled via `flutter_animate` package
   - Adjust delays and durations in individual section files

## Project Structure

```
lib/
├── main.dart                 # Main app entry point
├── theme/
│   └── app_theme.dart       # Design system (colors, typography)
├── sections/
│   ├── hero_section.dart    # Hero section with profile
│   ├── projects_section.dart # Projects grid
│   ├── skills_section.dart   # Skills categories
│   ├── experience_section.dart # Experience timeline
│   └── contact_section.dart  # Contact form and links
└── widgets/
    ├── cyber_button.dart     # Custom button component
    ├── project_card.dart     # Project card component
    └── section_title.dart    # Section heading component
```

## Dependencies

- `flutter_animate`: Smooth animations and transitions
- `url_launcher`: Opening external links (GitHub, LinkedIn, etc.)
- `scrollable_positioned_list`: Enhanced scrolling capabilities

## Browser Support

- Chrome/Edge (recommended)
- Firefox
- Safari
- Mobile browsers (iOS Safari, Chrome Mobile)

## Deployment

### Build for Production

```bash
flutter build web --release
```

The output will be in `build/web/`. Deploy this directory to any static hosting service:

- **Netlify**: Drag and drop the `build/web` folder
- **Vercel**: Connect your repository and set build command to `flutter build web`
- **GitHub Pages**: Copy `build/web` contents to your `gh-pages` branch
- **Firebase Hosting**: Use `firebase deploy` after configuring Firebase

### Performance Tips

- The app is optimized for web with tree-shaking enabled
- Images should be optimized before adding to the project
- Consider adding a service worker for offline support (optional)

## Notes

- Profile photo placeholder is included in the hero section - replace with your actual photo
- All external links (GitHub, LinkedIn) use placeholder URLs - update with your actual profiles
- Form submission currently shows a success message - integrate with your backend/email service as needed
- The grid background is subtle and can be adjusted in `main.dart` (GridPainter class)
- Add your own favicon.png to the `web/` directory (recommended size: 32x32 or 64x64 pixels)

## License

This project is open source and available for personal use.
