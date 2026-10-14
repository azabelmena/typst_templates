#import "lib.typ": *

#show: doc => ensayo(
  title: "Title Here",
  author: [Author Name],
  logo_left: "figures/logo.png",
  logo_right: "figures/cat.jpg",
  doc
)

= #lorem(4)

#lorem(2000)

= #lorem(3)

#lorem(30)

== #lorem(4)

#lorem(50)

= #lorem(1)

#lorem(100)

#show: appendix
= Example Appendix

#show: errata
= Errata
