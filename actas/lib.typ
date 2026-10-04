#let today = datetime.today()

#let actas(
  title: "",
  date: none,
  organization: none,
  committee: none,
  institution: none,
  faculty: none,
  logo_left: none,
  logo_right: none,
  agenda: true,
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
        align: center+horizon,
        if( logo_left != none ){
          align( left, image( logo_left ) )
        },
        stack(dir: ttb, spacing: 5pt,
          text( 12pt, weight: "bold", organization ),
          text( 12pt, committee ),
          text( 12pt, institution ),
          text( 12pt, faculty),
          text( 12pt, date),
          line(length: 175%, stroke: 0.5pt),
          v(5pt)
        ),
        if( logo_right != none ){
          align( right, image( logo_right ) )
        },
      )
      //grid(
        //columns: (1fr),
        //align: horizon,
        //line(length: 100%, stroke: 0.5pt)
      //)
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
  size: 12pt
)

v(15pt)
align( center, text( 24pt, title ) )

set heading( numbering: "1." )
if( agenda != false ){
  outline( title: [Agenda] )
}

doc
}
