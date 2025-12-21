# AxeBench Matrix UI - Design System

## Theme Concept
The interface draws inspiration from classic cyberpunk aesthetics, specifically the Matrix digital world and Gridrunner arcade games. The design emphasizes high-tech visualization, real-time data streams, and a futuristic command center feel.

## Color Palette

### Primary Colors
- **Matrix Green**: `#00ff41` - Primary accent, data displays, success states
- **Neon Cyan**: `#00ffff` - Secondary accent, highlights, interactive elements
- **Electric Blue**: `#0080ff` - Tertiary accent, links, information

### Background Colors
- **Deep Black**: `#000000` - Primary background
- **Dark Gray**: `#0a0a0a` - Secondary background, cards
- **Grid Gray**: `#1a1a1a` - Tertiary background, panels

### Status Colors
- **Success Green**: `#00ff41` - Operational, online, success
- **Warning Amber**: `#ffaa00` - Warnings, caution states
- **Error Red**: `#ff0040` - Errors, critical alerts, offline
- **Info Cyan**: `#00ffff` - Information, neutral states

### Text Colors
- **Primary Text**: `#00ff41` - Main content, headings
- **Secondary Text**: `#00ffff` - Subheadings, labels
- **Muted Text**: `#808080` - Disabled, placeholder text
- **Bright White**: `#ffffff` - High emphasis, critical data

## Typography

### Font Families
- **Primary**: `'Courier New', 'Courier', monospace` - All UI text for terminal aesthetic
- **Data Display**: `'Monaco', 'Menlo', 'Consolas', monospace` - Numeric data, stats
- **Headings**: `'Share Tech Mono', monospace` - Section headers (via Google Fonts)

### Font Sizes
- **Display**: 48px - Hero text, main dashboard title
- **H1**: 32px - Page headings
- **H2**: 24px - Section headings
- **H3**: 20px - Subsection headings
- **Body**: 16px - Standard text
- **Small**: 14px - Labels, captions
- **Tiny**: 12px - Metadata, timestamps

### Font Weights
- **Bold**: 700 - Headings, emphasis
- **Normal**: 400 - Body text
- **Light**: 300 - Secondary information

## Visual Effects

### Glow Effects
- **Text Glow**: `text-shadow: 0 0 10px currentColor, 0 0 20px currentColor`
- **Box Glow**: `box-shadow: 0 0 20px rgba(0, 255, 65, 0.3), inset 0 0 20px rgba(0, 255, 65, 0.1)`
- **Border Glow**: `box-shadow: 0 0 10px rgba(0, 255, 255, 0.5)`

### Animations
- **Pulse**: Subtle pulsing for active elements (1.5s ease-in-out infinite)
- **Flicker**: Occasional flicker effect for terminal authenticity
- **Scan Line**: Horizontal scanning line animation
- **Digital Rain**: Falling characters background effect
- **Grid Movement**: Animated perspective grid

### Borders
- **Thin**: 1px solid with glow
- **Medium**: 2px solid with stronger glow
- **Thick**: 3px solid for emphasis
- **Corner Brackets**: L-shaped corners for tech aesthetic

## Component Patterns

### Cards
- Dark background with subtle border glow
- Corner bracket decorations
- Hover state: increased glow intensity
- Padding: 20px

### Buttons
- Transparent background with border
- Glow on hover
- Text color matches border
- Active state: filled with color

### Data Panels
- Monospace font for all data
- Label in cyan, value in green
- Separator lines between items
- Real-time update animations

### Status Indicators
- Circular or square badges
- Pulsing animation when active
- Color-coded by status
- Optional numeric overlay

### Charts & Graphs
- Line graphs with glow effects
- Grid lines in dark gray
- Data points highlighted
- Animated drawing on load

## Layout Principles

### Grid System
- 12-column responsive grid
- 20px gutter spacing
- Breakpoints: 640px, 768px, 1024px, 1280px

### Spacing Scale
- xs: 4px
- sm: 8px
- md: 16px
- lg: 24px
- xl: 32px
- 2xl: 48px

### Container Widths
- Mobile: 100%
- Tablet: 768px
- Desktop: 1280px
- Wide: 1536px

## Interactive States

### Hover
- Increased glow intensity
- Slight scale transform (1.02)
- Color shift to brighter variant

### Active/Focus
- Full color fill
- Maximum glow
- Border thickness increase

### Disabled
- Reduced opacity (0.5)
- Muted color
- No glow effect
- Cursor: not-allowed

## Accessibility

### Contrast Ratios
- Primary text on dark background: 15:1 (exceeds WCAG AAA)
- Secondary text: 7:1 (exceeds WCAG AA)
- Interactive elements: minimum 4.5:1

### Focus Indicators
- Visible focus rings with glow
- Keyboard navigation support
- Skip links for screen readers

## Responsive Behavior

### Mobile (< 768px)
- Single column layout
- Stacked navigation
- Simplified animations
- Touch-friendly targets (44px minimum)

### Tablet (768px - 1024px)
- Two-column grid
- Side navigation drawer
- Moderate animations

### Desktop (> 1024px)
- Multi-column layouts
- Persistent navigation
- Full animation suite
- Hover interactions
