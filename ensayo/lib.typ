#let day = datetime.today().display("[day padding:none]")
#let month = datetime.today().display("[month repr:long]")
#let year = datetime.today().display("[year repr:full]")

#let heading_font = 14pt
#let title_font = 24pt
#let font_size = 12pt

#let info(
  name: [Name],
  degree: [Degree(optional)],
  address: [Some address],
  office: [WEED---420],
  email: `john.doe@email.com`
) = {
  grid(
    columns: (1fr),
    align: bottom,
    v(0.5em),
    stack(dir: ttb, spacing: 0.5em,
      if( degree != none ){
        text( font_size, smallcaps(name)+", "+smallcaps(degree) )
      }else{
        text( font_size, smallcaps(name) )
      },
      smallcaps(address),
      text(font_size, style: "italic", "Office: ")+text(font_size, office),
      text(font_size, style: "italic", "Email Address: ")+
          text(font_size, email)
    )
  )
}

#let appendix(body) = {
  set heading(numbering: "A.1", supplement: [Appendix], outlined: false)
  counter(heading).update(0)
  show heading: it => {
    v(1em)
    [#it.supplement #counter(heading).display():]
    h(0.3em)
    it.body
  }
  body
}

#let errata(body) = {
  set heading(supplement: [], outlined: false)
  show heading: it => {
    v(1em)
    [#it.supplement]
    it.body
  }
  body
}

#let ensayo(
  title: "",
  logo_left: none,
  logo_right: none,
  author: none,
  date: [#day #month #year],
  doc
) = {
  set page(
    paper: "a4",
    margin: ( x: 1in, y: 1.5in ),
    columns: 1,
    header-ascent: 0%,
    header: {
      v(10pt)
      grid(
        columns: (1fr, 4fr, 1fr),
        align: center+bottom,
        if( logo_left != none ){
          align( left, image( logo_left ) )
        },
        stack(dir: ttb, spacing: 0.5em,
        ),
        if( logo_right != none ){
          align( right, image( logo_right ) )
        },
      )
      grid(
        columns: (1fr),
        align: center+horizon,
        line( length: 100%, stroke: 0.5pt ),
      )
      v(1em)
    },
    footer: {
      v(1em)
      info()
    },
    footer-descent: 0%
)
set par(
  justify: false,
  first-line-indent: 0em,
  spacing: 1em
)
set text(
  lang: "es",
  font: "Spectral",
  size: font_size
)

v(15pt)
align( center,
  stack(dir: ttb, spacing: 1em,
    text( title_font, weight: "light", smallcaps(title) ),
    text( heading_font, weight: "light", author ),
  )
)

show heading: set text(20pt, weight: "light")

doc
}
