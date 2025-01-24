#import "datefmt.typ": dateFmtToday

#let declaration-of-authorship(justify, variables-file) = par(justify: true)[
  #import variables-file: *
  #if language == "de" {
    [
      = Eigenständigkeitserklärung
      Ich versichere hiermit, dass ich meine #typeOfPaper mit dem Thema: #topicOfPaper selbstständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe.

      Ich versichere zudem, dass die eingereichte elektronische Fassung mit der gedruckten Fassung übereinstimmt#footnote("falls beide Fassungen gefordert sind").
    ]
  } else if language == "en" {
    [
      = Declaration of authorship
      I hereby certify that I have written my paper on the topic independently and that I have not used any sources and aids other than those specified.

      Furthermore, I attest that the submitted electronic version is identical to the printed version, where both are required.
    ]
  }

  #v(2cm)
  #grid(
    columns: (1fr, 1fr, 1fr),
    [],
    [],
    [
      #set align(center) 
      #line(length: 5cm)
      #text(location + ", " + dateFmtToday(language, false))
    ]
  )
]