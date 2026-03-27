This folder is used by the `PersonalWebsite.tsx` page to load static assets.

- `profile-brian.jpg` (in this folder) is used as the profile photo in the hero section.
- `cv/Brian_Sanaet_Memusi_CV.pdf` is used as the downloadable CV in the CV section.

To set things up:

1. Replace `profile-brian.jpg` with your actual profile image (keep the same file name).
2. Put your real CV PDF at `public/cv/Brian_Sanaet_Memusi_CV.pdf` (create the `cv` folder if it does not exist).

In React / Next / Vite apps, anything in `public/` is available at the root of your site:

- `public/profile-brian.jpg` → `/profile-brian.jpg`
- `public/cv/Brian_Sanaet_Memusi_CV.pdf` → `/cv/Brian_Sanaet_Memusi_CV.pdf`

