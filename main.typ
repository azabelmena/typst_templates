#import "lib.typ": *

#show: doc => actas(
  title: "Title Here",
  organization: "Your Organization Here",
  committee: "Your Committee",
  institution: "Your Institution",
  faculty: "Your Faculty",
  date: today.display( "[day] de [month repr:long] de [year]" ),
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
