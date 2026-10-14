#import "lib.typ": *

#show: doc => carta(
  title: none,
  organization: "Your Organization Here",
  committee: "Your Committee",
  institution: "Your Institution",
  faculty: "Your Faculty",
  logo_left: "figures/logo.png",
  logo_right: "figures/cat.jpg",
  doc
)

#from()
#to()

#lorem(40)

#lorem(60)

= #lorem(5)

#lorem(100)

#signature()

#show: posdata
= posdata

#lorem(50)

#show: errata
= Errata

#lorem(100)
