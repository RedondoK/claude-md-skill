# Visual Assets for Social Media Promotion

This directory contains professionally designed data visualizations for promoting the Claude Markdown Skill across social media platforms.

## Available Assets

### 1. violation-breakdown.png

**Dimensions:** 3000 x 2400 pixels (10" x 8" @ 300 DPI)
**File Size:** ~212 KB
**Type:** Pie chart

**Content:** Shows the breakdown of AI-generated markdown violations:

- 90% - Missing blank lines around lists (MD032)
- 3% - Missing blank lines around headings (MD022)
- 2% - Missing blank lines around code blocks (MD031)
- 5% - Other violations

**Best Used For:**

- LinkedIn posts highlighting the problem
- Twitter threads explaining the core issue
- Blog article hero image
- Presentation opening slide

**Key Message:** "The Big Three violations account for 95% of all errors"

### 2. before-after-comparison.png

**Dimensions:** 4200 x 1800 pixels (14" x 6" @ 300 DPI)
**File Size:** ~148 KB
**Type:** Side-by-side bar charts

**Content:** Comparison showing:

- Left chart: Before (10 violations, 10 min cleanup) vs After (0 violations, 0 min)
- Right chart: Success metrics (100% compatibility, 100% production-ready, 0 errors)

**Best Used For:**

- LinkedIn article header
- Reddit post thumbnail
- Email newsletter header
- Conference presentation slides

**Key Message:** "Real, measurable results"

### 3. development-timeline.png

**Dimensions:** 3600 x 1800 pixels (12" x 6" @ 300 DPI)
**File Size:** ~128 KB
**Type:** Process flow diagram

**Content:** Six-phase development methodology:

1. Research & Requirements
2. Test Suite Creation
3. Fine Tuning
4. Documentation
5. Quality Assurance
6. Packaging

**Best Used For:**

- Technical blog posts
- Development process documentation
- Engineering team presentations
- Methodology discussions

**Key Message:** "Systematic approach to quality"

### 4. results-dashboard.png

**Dimensions:** 3600 x 3000 pixels (12" x 10" @ 300 DPI)
**File Size:** ~255 KB
**Type:** Multi-panel dashboard

**Content:** Four-panel metrics display:

- Panel 1: Violation reduction (8-12 → 0)
- Panel 2: Time savings (10 min → 0 sec)
- Panel 3: Success rate (100% pie chart)
- Panel 4: Rule coverage (100% across all categories)

**Best Used For:**

- LinkedIn main post image
- Portfolio case study
- Executive summary presentations
- Impact reporting

**Key Message:** "Production-ready metrics"

### 5. blocks-concept-diagram.png

**Dimensions:** 3000 x 3600 pixels (10" x 12" @ 300 DPI)
**File Size:** ~279 KB
**Type:** Conceptual diagram

**Content:** Visual representation of the "blocks with mandatory spacing" mental model:

- Shows block structure with blank line transitions
- Lists common block types
- Emphasizes the core principle

**Best Used For:**

- Tutorial content
- Educational posts
- Documentation
- Training materials

**Key Message:** "Think in blocks with mandatory spacing"

## Usage Guidelines

### Platform-Specific Recommendations

**LinkedIn:**

- Primary: results-dashboard.png (eye-catching, professional)
- Secondary: before-after-comparison.png (clear ROI)
- Tertiary: violation-breakdown.png (problem statement)

**Twitter/X:**

- Primary: violation-breakdown.png (simple, clear message)
- Secondary: before-after-comparison.png (shows value quickly)
- Use with threads for maximum engagement

**Reddit:**

- Primary: results-dashboard.png (comprehensive data)
- Secondary: blocks-concept-diagram.png (technical audience)
- Include in r/programming, r/MachineLearning posts

**Blog/Article:**

- Hero: before-after-comparison.png
- Inline: violation-breakdown.png (problem section)
- Inline: development-timeline.png (methodology section)
- Inline: blocks-concept-diagram.png (how it works section)

**Presentation Slides:**

- Opening: violation-breakdown.png
- Problem statement: before-after-comparison.png
- Solution: blocks-concept-diagram.png
- Results: results-dashboard.png
- Process: development-timeline.png

### Image Optimization

All images are provided at 300 DPI for high-quality printing and display. For web use, you may want to:

**For Social Media (faster loading):**

```bash
# Resize to 1200px width (maintains aspect ratio)
convert violation-breakdown.png -resize 1200x violation-breakdown-social.png

# Or use online tools:
# - TinyPNG (https://tinypng.com/)
# - Squoosh (https://squoosh.app/)
```

**For Email (smaller file size):**

```bash
# Resize to 800px width
convert before-after-comparison.png -resize 800x before-after-email.png
```

### Color Scheme

The visualizations use a consistent, professional color palette:

- **Primary Accent:** #4ECDC4 (Turquoise) - Success, after state
- **Warning/Before:** #FF6B6B (Coral) - Before state, problems
- **Supporting 1:** #45B7D1 (Sky Blue) - Process, flow
- **Supporting 2:** #96CEB4 (Sage) - Neutral metrics
- **Highlight:** #FFEAA7 (Soft Yellow) - Emphasis, blank lines

### Accessibility

All visualizations include:

- High contrast text (WCAG AA compliant)
- Large, bold fonts (14pt minimum)
- Color-blind friendly palette
- Clear labels and legends
- Redundant encoding (not color-only information)

## Customization

To customize these assets:

1. **Python/Matplotlib:** Source code is available in the main article generation script
2. **Figma/Canva:** Import PNG and add your branding
3. **PowerPoint:** Insert and add text overlays

### Adding Your Branding

Consider adding:

- Your logo (bottom right corner, 10% opacity watermark)
- Your website URL (subtle footer text)
- Custom color scheme matching your brand
- Your headshot (for LinkedIn articles)

## File Management

### Downloading from Claude

All PNG files are available here:

- [View violation-breakdown.png](computer:///mnt/user-data/outputs/violation-breakdown.png)
- [View before-after-comparison.png](computer:///mnt/user-data/outputs/before-after-comparison.png)
- [View development-timeline.png](computer:///mnt/user-data/outputs/development-timeline.png)
- [View results-dashboard.png](computer:///mnt/user-data/outputs/results-dashboard.png)
- [View blocks-concept-diagram.png](computer:///mnt/user-data/outputs/blocks-concept-diagram.png)

### Copying to Project Directory

To copy these to your local project directory:

```bash
# In Git Bash
cd /c/Users/kgend/Projects/md_skill_md/visual-assets

# Download from Claude's outputs
# Then move to your project directory
```

## Best Practices

### Social Media Posts

1. **Always include alt text** for accessibility:
   - "Pie chart showing 90% of markdown violations are missing blank lines around lists"
   - "Bar chart comparing before (10 errors) and after (0 errors) using the markdown skill"

2. **Add context in captions** - don't let images stand alone

3. **Test on mobile** - ensure text is readable on small screens

4. **Use consistently** - build brand recognition across platforms

### A/B Testing

Consider testing different images for the same post:

- Variation A: results-dashboard.png (metrics-focused)
- Variation B: violation-breakdown.png (problem-focused)

Track which drives more engagement on each platform.

## License

These visual assets are derivatives of the Claude Markdown Skill project and are covered under the same MIT license. You're free to:

- Use commercially
- Modify and customize
- Redistribute with attribution

**Attribution:** "Data visualization by Keith Gendler for Claude Markdown Skill"

## Questions?

For issues or requests:

- GitHub Issues: https://github.com/RedondoK/claude-md-skill/issues
- Email: Contact via GitHub profile

---

**Version:** 1.0.0
**Created:** 2025-10-31
**Format:** PNG (300 DPI, RGB color space)
**Software:** Python matplotlib 3.x
