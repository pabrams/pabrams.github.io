// Shared CV template. Used by cv-2026-04-30-dev.typ and cv-2026-04-30-devops.typ.

#let accent = rgb("#1f4e79")
#let muted = rgb("#555555")

#let cv(
  name: "Paul Abrams",
  location: "Toronto, Ontario",
  tagline: "",
  contact: (),
  summary: "",
  experience: (),
  education: (),
  certifications: (),
  body
) = {
  set document(title: name + " - CV", author: name)
  set page(
    paper: "us-letter",
    margin: (x: 0.65in, top: 0.6in, bottom: 0.6in),
  )
  set text(font: ("DejaVu Sans", "Liberation Sans"), size: 9.5pt, fallback: true)
  set par(justify: false, leading: 0.7em, spacing: 0.7em)
  set list(spacing: 0.55em, indent: 0.6em, body-indent: 0.4em)
  show link: it => text(fill: accent, it)

  // Header
  grid(
    columns: (1fr, auto),
    align: (left + horizon, right + horizon),
    text(size: 22pt, weight: "bold", name),
    text(size: 11pt, fill: muted, location),
  )
  if tagline != "" {
    v(-0.2em)
    text(size: 10pt, fill: muted, tagline)
  }
  v(0.1em)
  line(length: 100%, stroke: 0.6pt + accent)
  if contact.len() > 0 {
    v(-0.3em)
    text(size: 9pt, contact.join(text(fill: muted, "  |  ")))
  }
  v(0.3em)

  // Summary
  if summary != "" {
    text(size: 13pt, weight: "bold", fill: accent, "Professional Summary")
    line(length: 100%, stroke: 0.4pt + accent)
    v(-0.2em)
    par(summary)
    v(0.2em)
  }

  // Experience
  text(size: 13pt, weight: "bold", fill: accent, "Professional Experience")
  line(length: 100%, stroke: 0.4pt + accent)
  v(-0.2em)
  for role in experience [
    #v(0.6em)
    #grid(
      columns: (1fr, auto),
      align: (left + bottom, right + bottom),
      row-gutter: 0.25em,
      [#text(size: 10.5pt, weight: "bold", role.org) #if role.location != "" { text(size: 9pt, fill: muted, "  " + role.location) }],
      text(size: 9pt, fill: muted, role.dates),
    )
    #v(0.2em)
    #text(size: 10pt, style: "italic", role.title)
    #v(0.15em)
    #if "intro" in role and role.intro != "" {
      par(role.intro)
    }
    #for sub in role.at("subroles", default: ()) {
      v(0.4em)
      grid(
        columns: (1fr, auto),
        align: (left, right),
        text(size: 10pt, style: "italic", sub.title),
        if "dates" in sub { text(size: 9pt, fill: muted, sub.dates) } else { [] }
      )
      v(0.1em)
      list(..sub.bullets.map(b => [#b]))
    }
    #if "bullets" in role {
      list(..role.bullets.map(b => [#b]))
    }
  ]

  // Education
  if education.len() > 0 {
    v(0.3em)
    text(size: 13pt, weight: "bold", fill: accent, "Education")
    line(length: 100%, stroke: 0.4pt + accent)
    v(-0.2em)
    for ed in education [
      #v(0.1em)
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        [#text(weight: "bold", ed.degree) - #ed.school],
        text(size: 9pt, fill: muted, ed.dates),
      )
    ]
  }

  // Certifications
  if certifications.len() > 0 {
    v(0.3em)
    text(size: 13pt, weight: "bold", fill: accent, "Certifications & Awards")
    line(length: 100%, stroke: 0.4pt + accent)
    v(-0.2em)
    par(certifications.join(" · "))
  }

  body
}
