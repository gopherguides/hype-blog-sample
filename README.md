# Hype Blog Sample

A sample blog demonstrating the [hype](https://github.com/gopherguides/hype) static site generator.

## Quick Start

1. Install hype:
   ```bash
   go install github.com/gopherguides/hype/cmd/hype@latest
   ```

2. Clone this repository:
   ```bash
   git clone https://github.com/gopherguides/hype-blog-sample.git
   cd hype-blog-sample
   ```

3. Build the site:
   ```bash
   hype blog build
   ```

4. Preview locally:
   ```bash
   cd public && python3 -m http.server 8080
   ```

5. Open http://localhost:8080 in your browser

## Project Structure

```
hype-blog-sample/
├── config.yaml              # Site configuration
├── content/                 # Blog articles
│   ├── go-rest-api/        # Go article with source code
│   ├── ruby-automation/    # Ruby article with scripts
│   ├── bash-oneliners/     # Bash examples
│   └── tech-documentation/ # Non-technical article
├── static/                  # Static assets
│   └── images/
└── .github/workflows/       # GitHub Actions deployment
    └── deploy.yml
```

## Creating New Articles

```bash
hype blog new my-article-slug
```

This creates:
- `content/my-article-slug/module.md` - Article content
- `content/my-article-slug/src/` - Source code directory

## Article Format

Articles use hype's markdown format with metadata in `<details>` tags:

```markdown
# Article Title

<details>
slug: my-article
published: 01/25/2026
author: Your Name
seo_description: Description for search engines (150-160 chars)
tags: tag1, tag2, tag3
</details>

Your content here...

<code src="src/example.go"></code>
```

## Features

- **SEO**: OpenGraph, Twitter Cards, JSON-LD structured data
- **Syntax Highlighting**: Chroma with monokai theme
- **RSS Feed**: Available at `/rss.xml`
- **Sitemap**: Generated at `/sitemap.xml`
- **Dark Mode**: Automatic based on system preference
- **Mobile Responsive**: Tailwind CSS design

## Deployment

This repository includes a GitHub Actions workflow that automatically builds and deploys to GitHub Pages when you push to `main`.

To enable:
1. Go to repository Settings > Pages
2. Set Source to "GitHub Actions"
3. Push to `main` branch

## License

MIT
