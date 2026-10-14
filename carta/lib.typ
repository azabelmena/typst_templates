#let day = datetime.today().display("[day padding:none]")
#let month = datetime.today().display("[month repr:long]")
#let year = datetime.today().display("[year repr:full]")


#let heading_title_font = 14pt
#let title_font = 24pt
#let font_size = 12pt

#let from(
  date: [#day.#month.#year],
  address: [Some address],
  office: [WEED---420],
  email: `john.doe@email.com`
) = {
  align(
    right+top,
    grid(
      columns: (1fr),
      align: bottom,
      v(0.5em),
      stack(dir: ttb, spacing: 0.5em,
      text( font_size, date ),v(1em),
      smallcaps(address),
      text(font_size, style: "italic", "Office: ")+text(font_size, office),
      text(font_size, style: "italic", "Email Address: ")+
      text(font_size, email)
    )
  )
)
}

#let to(
  name: [Some person, or organization],
  address: [Some Address]
) = {
  align(
    left,
    grid(
      columns: (1fr),
      stack( dir: ttb, spacing: 0.5em,
        text( font_size, smallcaps(name)),
        text( font_size, smallcaps( address ) )
      )
    )
  )
}

#let signature(
  name: [Name],
  degree: [Degree(optional)],
  position: [Position]
) = {
  grid(
    columns: (1fr),
    align: bottom,
    v(5em),
    line( length: 35%, stroke: 0.5pt ),
    v(0.5em),
    stack(dir: ttb, spacing: 0.5em,
      if( degree != none ){
        text( font_size, name+", "+degree )
      }else{
        text( font_size, name )
      },
      text( font_size, position )
    )
  )
}

#let posdata(body) = {
  set heading()
  show heading: it => {
    v(1em)
    align(center, text(font_size, smallcaps[#it]))
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

#let carta(
  title: none,
  organization: none,
  committee: none,
  institution: none,
  faculty: none,
  logo_left: none,
  logo_right: none,
  doc
) = {
  set page(
    paper: "us-letter",
    margin: ( x: 1in, y: 1.5in ),
    columns: 1,
    header-ascent: 0%,
    header: {
      v(1em)
      grid(
        columns: (1fr, 4fr, 1fr),
        align: center+bottom,
        if( logo_left != none ){
          align( left, image( logo_left ) )
        },
        stack(dir: ttb, spacing: 0.5em,
          text( heading_title_font, weight: "bold", organization ),
          text( font_size, committee ),
          text( font_size, institution ),
          text( font_size, faculty),v(0.5em),
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
align( center, text( title_font, title ) )

show heading: set text(20pt, weight: "regular")

doc
}
